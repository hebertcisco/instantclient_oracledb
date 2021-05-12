#!/bin/sh
## By Hebert F. Barros 2021

main() {

    noAPT() {
        echo 'Your sistem need the apitude to run this is script...'
        exit
    }

    removingAptCrashes() {
        echo 'Removing any apt crashes...'
        sudo rm /var/lib/dpkg/lock-frontend
        sudo rm /var/cache/apt/archives/lock
        sudo apt-get update
    }

    installRequiredLibraries() {
        # Install some required libraries
        echo 'Installing some required libraries...'
        sudo apt-get install php build-essential php-pear libaio1 alien
    }

    downloadTheOracleInstantClientBasic() {
        # Download the oracle-instantclient-basic.
        echo 'Downloading the oracle-instantclient-basic.'
        wget https://download.oracle.com/otn_software/linux/instantclient/oracle-instantclient-basic-linuxx64.rpm

    }
    convertingPackage() {
        # Converting package .rpm to .deb.
        echo 'Converting package .rpm to .deb.'

        sudo alien oracle-instantclient-basic-linuxx64.rpm && sleep 170
    }
    installingTheOracleInstantClientBasic() {
        # Installing oracle-instantclient-basic.deb.
        echo 'Installing oracle-instantclient-basic_21.1.0.0.0-2_amd64.deb.'
        sudo dpkg -i oracle-instantclient-basic_21.1.0.0.0-2_amd64.deb

    }
    removingPackages() {
        # Removing packages.
        echo 'Removing packages.'
        rm -rf oracle-instantclient-basic-linuxx64.rpm oracle-instantclient-basic_21.1.0.0.0-2_amd64.deb

    }
    if ! [ -x "$(command -v apt)" ]; then
        noAPT "$1" >&2
        exit 1
    else
        removingAptCrashes "$1"
        installRequiredLibraries "$1"
        downloadTheOracleInstantClientBasic "$1"
        convertingPackage "$1"
        installingTheOracleInstantClientBasic "$1"
        removingPackages "$1"
    fi
}

main "$1"
