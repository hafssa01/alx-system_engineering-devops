Here’s a README file for your task to configure `ufw` on `web-01` to block all incoming traffic except for specific TCP ports:

---

# Task: Configure UFW Firewall

## Objective

The goal is to configure the Uncomplicated Firewall (UFW) on `web-01` to block all incoming traffic except for specific TCP ports: 22 (SSH), 443 (HTTPS), and 80 (HTTP). The configuration will ensure that only the necessary traffic can reach the server while blocking all other incoming connections.

## Requirements

- Install UFW on `web-01` (you may also apply this to `lb-01` and `web-02`, but the task will only be checked on `web-01`).
- Configure UFW to block all incoming traffic except for TCP ports 22, 443, and 80.

## Instructions

1. **Install UFW**:
   Ensure that UFW is installed on `web-01`. If not, install it using the following command:
   ```sh
   sudo apt-get update
   sudo apt-get install ufw
   ```

2. **Configure UFW Rules**:
   - **Allow SSH (Port 22)**: This rule allows SSH connections, which is essential for remote management.
   - **Allow HTTPS (Port 443)**: This rule allows secure web traffic.
   - **Allow HTTP (Port 80)**: This rule allows standard web traffic.
   - **Block All Other Incoming Traffic**: By default, UFW blocks all other incoming traffic once you set it to be active.

   Apply the following UFW commands to configure the firewall rules:

   ```sh
   # Allow incoming SSH connections
   sudo ufw allow 22/tcp

   # Allow incoming HTTPS connections
   sudo ufw allow 443/tcp

   # Allow incoming HTTP connections
   sudo ufw allow 80/tcp

   # Set default policy to deny all incoming traffic
   sudo ufw default deny incoming

   # Set default policy to allow all outgoing traffic
   sudo ufw default allow outgoing

   # Enable UFW
   sudo ufw enable
   ```

3. **Verify Configuration**:
   After applying the rules, check the status of UFW to ensure the rules are applied correctly:
   ```sh
   sudo ufw status verbose
   ```

## Notes

- **Be Cautious**: Ensure you do not lock yourself out of the server. Confirm that SSH access (port 22) is allowed before applying the firewall rules.
- **Testing**: Test the configuration to ensure that you can still access the necessary services (SSH, HTTPS, and HTTP) and that all other ports are blocked.

## Repository

- **GitHub Repository**: `alx-system_engineering-devops`
- **Directory**: `0x13-firewall`
- **File**: `0-block_all_incoming_traffic_but`

## Share Your Work

Submit the `0-block_all_incoming_traffic_but` file containing the commands you used to configure UFW. Ensure that it includes the full list of commands applied for setting up the firewall rules.

---

