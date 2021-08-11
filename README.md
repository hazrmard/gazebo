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

1. Clone this repository.

```
git clone https://git.isis.vanderbilt.edu/ahmedi/gazebo.git ~/src/gazebo
```

2. Download the VM with gazebo and Matlab gazebo plugin files. **OR** clone and build the gazebo plugin source [here](https://git.isis.vanderbilt.edu/ahmedi/gazeboplugin). You can set the plugin path manually, or use the following steps to have `setup.sh` do it.

```
# Download gazebo plugin (if not using the MATLAB Gazebo Virtual Machine)
git clone https://git.isis.vanderbilt.edu/ahmedi/gazeboplugin.git ~/src/GazeboPlugin
# Build the plugin
cd ~/src/GazeboPlugin
mkdir build
cd build
cmake ..
make
```

3. Optionally, download the to make custom worlds.

```
# Download model database:
git clone https://github.com/osrf/gazebo_models ~/src/
```

4. Set 2 environment variables (in `.bashrc`):

```
export MATLAB_GAZEBO_PLUGIN= 	# Path to GazeboPlugin/export/lib/
export GAZEBO_MODELS=		      # Path to gazebo model database repository
```

5. Call the setup script:

```
source ~/src/gazebo/setup.sh  # or whatever the path is to setup.sh
```

6. Run gazebo

```
# With GUI
gazebo path/to/this/repo's/test.world  # or any world file
# OR without GUI
gzserver path/to/this/repo's/test.world
```

**Note**: The steps 4-5 can be put in the `bashrc` file for automatic setup at startup.

```
# for example
export MATLAB_GAZEBO_PLUGIN=~/GazeboPlugin/export/lib/
export GAZEBO_MODELS=~/src/gazebo_models/
source ~/PATH/TO/setup.sh
```


### SSH

Using an x-server like [vcXsrv](https://sourceforge.net/projects/vcxsrv/). Uncheck the "Use native OpenGL" option. Also unset the `LIBGL_ALWAYS_INDIRECT` variable:

```
unset LIBGL_ALWAYS_INDIRECT
```


## Gazebo docs

These docs apply to the VM. If you are using a custom installation, the paths may vary.

Gazebo variables can be initialized by running `/usr/share/gazebo/setup.sh`. You can add that to your `.bashrc`. Additional variables and plugin paths in this repo can be added to them by running the local [`setup.sh`](./setup.sh) script.

Gazebo worlds located in `/usr/share/gazebo-9/worlds`.

The official gazebo model database is located at: https://github.com/osrf/gazebo_models
