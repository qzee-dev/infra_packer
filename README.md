<img width="482" height="278" alt="Screenshot from 2026-04-12 00-24-57" src="https://github.com/user-attachments/assets/f681cfcb-5c6d-4c2c-bb7e-f64d0acf1e4a" />

✅ Architecture (based on repo code)

Packer → builds a custom AMI
Ansible → configures the server inside the AMI
GitHub Actions → automates AMI build
AWS → target cloud (AMI goes to EC2)

✅ CI/CD pipeline (very important)
Your workflow:
👉 build-ami.yml

Installs Packer
Sets up Ansible
Uses AWS credentials
Builds AMI and extracts ID [github.com]

✅ Ansible provisioning
Your playbook does:

Install Docker
Install Docker Compose v2
Copy app config
Set up systemd services
Enable CloudWatch integration [github.com]


