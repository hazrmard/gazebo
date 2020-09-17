source /usr/share/gazebo/setup.sh

# https://stackoverflow.com/a/9107028/4591810
SCRIPTPATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [-z "$MATLAB_GAZEBO_PLUGIN"]
	export MATLAB_GAZEBO_PLUGIN=~/src/GazeboPlugin/export/lib/
fi

if [-z "$GAZEBO_MODEL_REPO"]
	export GAZEBO_MODEL_REPO=~/src/gazebo_models/
fi

plugin_dirs=""
for plugin_dir in $SCRIPTPATH/plugins/*/build/
do
    plugin_dirs=$plugin_dirs:$plugin_dir
done

export GAZEBO_PLUGIN_PATH=${MATLAB_GAZEBO_PLUGIN}:${plugin_dirs}:${GAZEBO_PLUGIN_PATH}
export GAZEBO_MODEL_PATH=${SCRIPTPATH}/models/:${GAZEBO_MODEL_REPO}:${GAZEBO_MODEL_PATH}
