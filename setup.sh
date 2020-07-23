source /usr/share/gazebo/setup.sh

# https://stackoverflow.com/a/9107028/4591810
SCRIPTPATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/"

export GAZEBO_MODEL_PATH=${SCRIPTPATH}/models/:~/src/gazebo_models/:${GAZEBO_MODEL_PATH}
export GAZEBO_PLUGIN_PATH=~/src/GazeboPlugin/export/lib/:${GAZEBO_PLUGIN_PATH}