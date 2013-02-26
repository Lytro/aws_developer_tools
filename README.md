# Chef Cookbook for EC2 CLI Tools

## Description
Setup EC2 CLI Tools for easier EC2 server management. The default recipe sets up both the AMI tools and the API tools.

API Tools requires java; by default, OpenJDK is installed. See the [java cookbook](https://github.com/opscode-cookbooks/java) for information on how to install Oracle's JDK.

## Requirements
Ruby 1.9+
Tested on Ubuntu 10.04

cookbook 'java'

## Attributes
* `default['chef_ec2_cli_tools']['install_java?'] = true` - set to `false` you do not want to install java
* `default['chef_ec2_cli_tools']['aws_access_key'] = "Your Access Key"` - you must set this if installing the API tools.
* `default['chef_ec2_cli_tools']['aws_secret_key'] = "Your Secret Key"` - you must set this if installing the API tools.

See [Setting Attributes (Examples)](http://wiki.opscode.com/pages/viewpage.action?pageId=8257848).

## Recipes
* `chef_ec2_cli_tools` - sets up all of the below tools
* `chef_ec2_cli_tools::ami` - [AMI tools](http://aws.amazon.com/developertools/368)
* `chef_ec2_cli_tools::api` - [API tools](http://aws.amazon.com/developertools/351)


Written by [Anuj Biyani](https://github.com/anujbiyani) for [Lytro](https://github.com/lytro)
