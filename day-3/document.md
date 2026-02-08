# Project: Automated Web & App Server Deployment.
This README document outlines the deployment of a dual-layer application architecture on AWS, utilising Nginx as a reverse proxy for an application service. 

## Deployment Environment Specifications.
The environment is optimised for a modern Linux distribution on burstable performance hardware.

|   Component       |   Specification              |
|----------------   |------------------------------|
| Cloud Provider    | Amazon Web Services (AWS)    |
| Instance Type     | t3.micro                     |
| Operating System  | Ubuntu 24.04 LTS             | 
| Web Server        | Nginx 
| Network           | Security Group Rules: 22(SSH)|
| Configuration     | 80 HTTP), 3000(App Service)  |
| Storage           | 8GB EBS                      |

### Installation and Configuration Procedures. 

The deployment uses a Bash automation script to configure the environment.

### Prerequisites

- Access to the .pem key file for the Ubuntu user. 

### Step-by-Step Deployment 

Connect via SSH: 
```
Bash
ssh -i "your-key.pem" ubuntu@your-ec2-ip
```

![Bash](images/scp command.png)

### Infrastructure Scripting: 

The script (managed via nano) handles system updates and service setup.
```
Bash
# Ensure script has execution permissions
chmod +x deploy_app.sh
./deploy_app.sh
```

![Welcome](images/welcome page nginx.png)

### Application Configuration: 

Ensure the application is listening on 0.0.0.0:3000 to accept internal requests forwarded by Nginx or direct external traffic, as required for testing.

![Confirmation of the app deployment](images/Test app.png)

### System Integration Requirements:

This project integrates a web-facing proxy with a backend service layer. 
- Reverse Proxy Integration: Nginx is configured to forward traffic from Port 80 to the application service running on Port 3000. 
- Database Integration (Target: Tomorrow): The instance will be updated to host a database engine (e.g., MySQL or PostgreSQL).
  - Integration will require local socket connections or standard TCP/IP on the database port.
- Environment Variables: Integration secrets (DB user, pass, port 3000 configs) should be stored in a .env file within the app directory.
  

```
# Ensure the log and data directories are owned by the mongodb user
sudo chown -R mongodb:mongodb /var/lib/mongodb
sudo chown -R mongodb:mongodb /var/log/mongodb

# Start the service
sudo systemctl start mongod

# Verify it is running
sudo systemctl status mongod
```

### Verify it is running.

sudo systemctl status mongod

![](images/confirmation of mongod is running.png)

### Data Migration and Conversion. Note: Active requirements will be defined during tomorrow's database deployment.

- Schema Baseline: Application migrations must be run to initialise the database structure on Ubuntu 24.0.
- Version Compatibility: Database versioning must be compatible with Ubuntu 24.0's package manager (apt).

### Deployment Testing Procedures:

Standard validation to ensure the environment is operational: 
- Port 80 Check: Verify the Nginx landing page loads at the public IP.
- Port 3000 Check: Verify the application responds at http://[IP]:3000 (ensure security group allows this for testing).
- Service Stability: Confirm Nginx and the app service are set to auto-start:
  
```
  Bash
- sudo systemctl is-enabled nginx
```

### Log Verification: 

Check /var/log/nginx/error.log for any upstream connection failures to Port 3000.