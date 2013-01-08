Chef Cookbook for EC2 CLI Tools
==============================
[EC2 API Tools](http://aws.amazon.com/developertools/351)

[EC2 AMI Tools](http://aws.amazon.com/developertools/368)

Description
-----------
Setup EC2 CLI Tools for easier EC2 server management. The default recipe sets up both the AMI tools and the API tools.

Requirements
------------
Ruby 1.9+
Tested on Ubuntu 10.04

Attributes
----------

Usage
-----
* Add `chef_ec2_cli_tools` to your run list to setup both AMI and API tools.
* Add `chef_ec2_cli_tools::ami` for only the AMI tools.
* Add `chef_ec2_cli_tools::api` for only the API tools.
