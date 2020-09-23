# gazebo

## Tutorials

* [Gazebo Tutorials](http://gazebosim.org/tutorials)
  * [Overview: components/env variables/plugins](http://gazebosim.org/tutorials?tut=components&cat=get_started)
* Matlab
  * [VM for Gazebo 9, ROS Melodic, Gazebo-ROS plugin](https://www.mathworks.com/ros2_vm_install/v2)
  * [Perform Co-Simulation between Simulink and Gazebo](https://www.mathworks.com/help/robotics/examples/perform-co-simulation-between-simulink-and-gazebo.html)

## Reference

* [Gazebo Simulation Description Format (SDF) specification](http://sdformat.org). This is used to describe model and world files.


## Setup

Download the VM with gazebo and Matlab gazebo plugin files.

Clone this repository.

Download the model database to make custom worlds.

```
# Download model database:
git clone https://github.com/osrf/gazebo_models ~/src/
```

Set 2 environment variables (in `.bashrc`):

```
export MATLAB_GAZEBO_PLUGIN= 	# Path to GazeboPlugin/export/lib/
export GAZEBO_MODELS=		# Path to gazebo model database repository
```

Call the setup script:

```
source setup.sh
```

The last 2 steps can be put in the `bashrc` file.


## Gazebo docs

These docs apply to the VM. If you are using a custom installation, the paths may vary.

Gazebo variables can be initialized by running `/usr/share/gazebo/setup.sh`. You can add that to your `.bashrc`. Additional variables and plugin paths in this repo can be added to them by running the local [`setup.sh`](./setup.sh) script.

Gazebo worlds located in `/usr/share/gazebo-9/worlds`.

The official gazebo model database is located at: https://github.com/osrf/gazebo_models
