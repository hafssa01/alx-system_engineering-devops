# AirBnB Clone - Web Framework Setup

## Overview
This task involves setting up the development environment for the AirBnB clone project (version 2) and serving content using Flask. The task includes cloning the project repository, configuring the Flask application, and ensuring it runs correctly on the web server (`web-01`).

## Steps Completed
1. **SSH Configuration**: Ensured that task #3 of the SSH project is completed for `web-01`.
2. **Net-tools Installation**: Installed the `net-tools` package to aid in network configuration and monitoring.
3. **Repository Cloning**: Cloned the `AirBnB_clone_v2` repository onto the `web-01` server.
4. **Flask Setup**: Configured the Flask application to serve content from the route `/airbnb-onepage/` on port 5000.
5. **Running the Application**: Successfully ran the Flask application and verified that it works by sending a request to the server.

## Testing
The application was tested by sending a `curl` request to the configured route:
```bash
curl 127.0.0.1:5000/airbnb-onepage/

