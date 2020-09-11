#include <gazebo/gazebo.hh>
#include <gazebo/physics/physics.hh>
#include <gazebo/common/common.hh>
#include <gazebo/transport/transport.hh>

namespace gazebo
{
  class VelocitySensor : public ModelPlugin
  {
    private:
    physics::WorldPtr world;
    physics::ModelPtr model;
    physics::LinkPtr link;
    event::ConnectionPtr updateConnection;
    transport::NodePtr node;
    transport::PublisherPtr pub;

    public:
    VelocitySensor(): ModelPlugin()
    {

    }
    
    virtual void Load(physics::ModelPtr _parent, sdf::ElementPtr _sdf)
    {
      this->model = _parent;
      this->world = _parent->GetWorld();

      this->node.reset(new transport::Node());
      this->node->Init();
      this->pub = this->node->Advertise<msgs::Vector3d>("~/octocopter/wholebody/velocity");
      
      std::string linkName;

      if (!_sdf->HasElement("linkName"))
      {
        this->link = this->model->GetLink();
        linkName = link->GetName();
      }
      else {
        linkName = _sdf->GetElement("linkName")->GetValue()->GetAsString();
        this->link = this->model->GetLink(linkName);
      }
      
      std::cerr << "Velocity sensor loaded into model:" << this->model->GetScopedName()
                << ", on Element: " << linkName << "\n";
      
      this->updateConnection = event::Events::ConnectWorldUpdateBegin(
          std::bind(&VelocitySensor::OnUpdate, this));
    }

    void OnUpdate()
    {
      ignition::math::v4::Vector3d vel = this->link->WorldLinearVel();
      std::cerr << "Update: " << vel << "\n";
      msgs::Vector3d msg;
      msgs::Set(&msg, vel);
      this->pub->Publish(msg);
    }
  };

  GZ_REGISTER_MODEL_PLUGIN(VelocitySensor)
}