**Title: uConsole CM4 LTE Connectivity Script**

**Description:**

This repository contains a Bash script designed to streamline the process of establishing and managing LTE connectivity on the uConsole CM4. The uConsole CM4, a versatile and compact computing platform, is based on the Raspberry Pi Compute Module 4 and offers a range of functionalities including LTE connectivity. This script simplifies the interaction with the LTE module, ensuring a smoother and more efficient connection process.

**Key Features:**
- **LTE Module Activation**: Automates the power-on sequence for the LTE module.
- **Service Management**: Manages the ModemManager service to ensure proper detection and functionality of the LTE modem.
- **Connection Establishment**: Handles the creation and activation of the `4gnet` GSM network connection, utilizing the `nmcli` tool.
- **Dynamic Interface Recognition**: Automatically detects the presence and status of the `ppp0` interface to confirm successful connection.
- **Error Handling**: Provides feedback and error messages for troubleshooting and ease of use.

This script is particularly useful for users who require a reliable method to establish LTE connections on their uConsole CM4 devices. It is designed to be user-friendly and requires minimal manual intervention, making it suitable for both novice and experienced users.