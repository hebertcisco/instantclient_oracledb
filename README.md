# Oracle InstantClient Installation Script

> This script automates the installation of Oracle InstantClient on Debian-based systems.

### Requirements

A Debian-based system (e.g. Ubuntu, Debian)
apt package manager installed
An internet connection

### Usage
To use the script, open a terminal and run the following command:

#### Bash & Curl

```sh
curl -fsSL https://raw.githubusercontent.com/hebertcisco/instantclient_oracledb/master/install.sh | sh
```

#### Bash & Curl

```sh
npm i -g instant-client-oracledb

# Usage:

instant-client-oracledb
```

The script will check for dependencies, download and install the Oracle InstantClient package, and remove any unnecessary files.

Note: The script is designed to work with Oracle InstantClient version 21.1.0.0.0 and x64 architecture. If you want to install a different version or architecture, you should edit the script accordingly.

### Troubleshooting

If you encounter any errors during the installation process, check the error messages displayed by the script and take appropriate action.
If you are unable to connect to the Oracle server after running the script, check that the Oracle server is running and that you have the correct credentials.

### Support

If you have any issues or questions about using this script, please open an issue on the GitHub repository or contact the author directly.

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](issues).

## Show your support

Give a ⭐️ if this project helped you!

<a  href="https://www.patreon.com/hebertfbarros">
  <img style="border-radius:20px;" src="https://c5.patreon.com/external/logo/become_a_patron_button@2x.png" width="160">
</a>

## 📝 License

Copyright © 2023 [Hebert F Barros](https://github.com/hebertcisco).<br />
This project is [MIT](LICENSE) licensed.
