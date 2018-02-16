# Workload Automation Demo
This repositories contains demo definitions for Workload Automation

The scripts in the project allow the installation of required software and definition for WA demos

To create a demo environment:
- Create an AWS machine strating from the HCL AMI
- Login as wauser
- Install git: 
```shell
sudo yum install -y git
```
- Clone this repository
```shell
git clone git@github.com:WAdev0/WADemo.git
```
- Run setup.sh
```shell
WADemo/setup.sh
```

See [Update](Update.md) for information on the structure of the project and update instructions
