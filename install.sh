#!/bin/sh
# By Hebert F. Barros 2023

main() {
    # Check if apt package manager is installed
    if ! [ -x "$(command -v apt)" ]; then
        echo 'Your system needs the aptitude package manager to run this script...'
        exit 1
    fi

    # check if the package is already installed
    if dpkg -s oracle-instantclient-basic > /dev/null 2>&1; then
        echo "oracle-instantclient-basic is already installed"
        exit 0
    fi

    # check for dependencies
    check_dependencies(){
        echo "Checking for dependencies..."
        missing_dependencies=""
        for package in php build-essential php-pear libaio1 alien; do
            if ! dpkg -s $package > /dev/null 2>&1; then
                missing_dependencies="$missing_dependencies $package"
            fi
        done
        if [ -n "$missing_dependencies" ]; then
            echo "Installing missing dependencies:$missing_dependencies"
            sudo apt-get install -y $missing_dependencies
        fi
    }
    check_dependencies

    # Removing any apt crashes
    removingAptCrashes() {
        echo 'Removing any apt crashes...'
        sudo rm /var/lib/dpkg/lock-frontend
        sudo rm /var/cache/apt/archives/lock
        sudo apt-get update
    }
    removingAptCrashes

    # Download the oracle-instantclient-basic.
    downloadTheOracleInstantClientBasic() {
        echo 'Downloading the oracle-instantclient-basic...'
        wget https://download.oracle.com/otn_software/linux/instantclient/oracle-instantclient-basic-linuxx64.rpm -O oracle-instantclient-basic.rpm
        if [ $? -ne 0 ]; then
            echo "Error: Failed to download oracle-instantclient-basic package"
            exit 1
        fi
    }
    downloadTheOracleInstantClientBasic

    # Converting package .rpm to .deb.
    convertingPackage() {
        echo 'Converting package .rpm to .deb.'
        sudo alien oracle-instantclient-basic.rpm
        if [ $? -ne 0 ]; then
            echo "Error: Failed to convert oracle-instantclient-basic package"
            exit 1
        fi
    }
    convertingPackage

    # Installing oracle-instantclient-basic.deb.
    installingTheOracleInstantClientBasic() {
        echo 'Installing oracle-instantclient-basic.deb.'
        sudo dpkg -i oracle-instantclient-basic*.deb
        if [ $? -ne 0 ]; then
            echo "Error: Failed to install oracle-instantclient-basic package"
            exit 1
        fi
    }
    installingTheOracleInstantClientBasic

    # Removing packages
    removingPackages() {
        echo 'Removing packages.'
        rm -rf oracle-instantclient-basic*.{rpm,deb}
    }
    removingPackages
}

main "$1"
