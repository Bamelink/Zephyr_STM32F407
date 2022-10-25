# Zephyr_STM32F407_ASC

This repository contains a Zephyr example application using MicroRos via USB.

## Getting Started

Before getting started, make sure you have a proper Zephyr development
environment. Zephyr version 3.1.0 and compiler version 0.14.2 is requiered.
Follow [this link](https://docs.zephyrproject.org/3.1.0/develop/getting_started/index.html) to get started. Insted of inistializing Zephyr, you can initialize this Repo with the command below.

### Initialization
#### NOTE: IF YOU ALREADY HAVE A ZEPHYR INSTANCE WITH THE RIGHT VERSION YOU CAN SCIP THIS STEP!
The first step is to initialize the workspace folder (``my-workspace``) where
the ``app`` and all Zephyr modules will be cloned. You can do
that by running:

```shell
# initialize my-workspace for the example-application (main branch)
west init -m https://github.com/Bamelink/Zephyr_STM32F407 --mr main my-workspace
# update Zephyr modules
cd my-workspace
west update
```

### Build & Run
If you have not initialized Zephyr with this Repo but instead used your existing instance, make sure to soure it:
```shell
source ~/zephyrproject/zephyr/zephyr-env.sh
```

To build and run this Demo, a build script is provided. Type ./build.sh -h to get the full command list. The following command will build for the f4 discovery board and directy flash it:

```shell
./build.sh -b stm32f4_disco -f
```