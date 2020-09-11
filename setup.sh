source /usr/share/gazebo/setup.sh

# https://stackoverflow.com/a/9107028/4591810
SCRIPTPATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

plugin_dirs=""
for plugin_dir in $SCRIPTPATH/plugins/*/build/
do
    plugin_dirs=$plugin_dirs:$plugin_dir
done

export GAZEBO_PLUGIN_PATH=~/src/GazeboPlugin/export/lib/:${plugin_dirs}:${GAZEBO_PLUGIN_PATH}
export GAZEBO_MODEL_PATH=${SCRIPTPATH}/models/:~/src/gazebo_models/:${GAZEBO_MODEL_PATH}