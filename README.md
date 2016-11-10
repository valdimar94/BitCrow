# BitCrow
An open source project that makes it easy to setup an Ubuntu Desktop development
machine.

## Getting Started
It's very easy to get started, simply fork the project and get started making
scripts and configuring the project to suit your needs.

Running the setup script:
~~~~
./setup.sh config   // To configure the installers.
./setup.sh install  // Running the installers using configurations.
./setup.sh settings // Open Ubuntu's settings windows for fast configuration.
./setup.sh all      // Run config, install and then settings.
~~~~

## Getting In Touch
If you have any suggestions as to what should be included please add a feature
request in our [issues tracker](https://github.com/IronPeak/BitCrow/issues).

## Example Script
Making an installation script is easy, simply add a folder in the project
directory with the same name as the application you are installing.
~~~~
mkdir exampleapp
~~~~
Then create two scripts called config.sh and install.sh.
~~~~
touch exampleapp/config.sh
touch exampleapp/install.sh
~~~~
Example config.sh file:
~~~~
#!/bin/bash

set -e

# START OF CONFIGURATIONS FOR EXAMPLE APP (Your Code Here)

echo "Here you can ask the user for configuration information?"
read configurationvalue1
echo "$configurationvalue1" > $(dirname $0)/configurationvalue1.config

echo "Here you can ask the user for configuration information?"
read configurationvalue2
echo "$configurationvalue2" > $(dirname $0)/configurationvalue2.config

# END OF CONFIGURATIONS FOR EXAMPLE APP

exit 0
~~~~
Example install.sh file:
~~~~
#!/bin/bash

set -e

# START OF INSTALLATION FOR EXAMPLE APP (Your Code Here)

sudo apt-get -y install exampleapp

configurationvalue1=$(cat $(dirname $0)/configurationvalue1.config)
configurationvalue2=$(cat $(dirname $0)/configurationvalue2.config)

exampleapp config value1 "$configurationvalue1"
exampleapp config value2 "$configurationvalue2"

# END OF INSTALLATION FOR EXAMPLE APP

exit 0
~~~~
Finally add your scripts to the setup.sh file in the project directory.
~~~~
#!/bin/bash

set -e

if [ "$#" -ne 1 ]
  then
    echo "Illegal number of parameters"
    exit 1
fi

if [[ $EUID -eq 0 ]]; then
   echo "This script must not run as root"
   exit 1
fi

if [[ "$1" != "all" && "$1" != "config" && "$1" != "install" ]]
  then
    echo "Invalid parameter"
    echo "Usage: ./setup.sh <all/config/install>"
    exit 1
fi

sudo echo "Starting Script!"

chmod +x $(dirname $0)/base/config.sh
chmod +x $(dirname $0)/base/install.sh

if [ \( "$1" == "config" \) -o \( "$1" == "all" \) ]
  then
    # OTHER APPS

    # START EXAMPLE APP CONFIG (Your Code Here)

    ./$(dirname $0)/base/config.sh exampleapp

    # END EXAMPLE APP CONFIG
fi

if [ \( "$1" == "install" \) -o \( "$1" == "all" \) ]
  then
    sudo apt-get -y update
    sudo apt-get -y upgrade

    # OTHER APPS

    # START EXAMPLE APP INSTALL (Your Code Here)

    ./$(dirname $0)/base/install.sh exampleapp

    # END EXAMPLE APP INSTALL

    sudo apt -y autoremove
fi

echo "Script finished successfully!"

exit 0
~~~~
You can now run the setup.sh script and it should include your application.
If you think other people would find your application useful please make a
pull request to the [BitCrow Repository](http://github.com/IronPeak/BitCrow),
