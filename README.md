Chef Cookbook for EC2 CLI Tools
==============================
[EC2 API Tools](http://aws.amazon.com/developertools/351)

[EC2 AMI Tools](http://aws.amazon.com/developertools/368)

Description
-----------
Setup EC2 CLI Tools for easier EC2 server management. The default recipe sets up both the AMI tools and the API tools.

API Tools requires java; by default, OpenJDK is installed. See the [java cookbook](https://github.com/opscode-cookbooks/java) for information on how to install Oracle's JDK.

Requirements
------------
Ruby 1.9+
Tested on Ubuntu 10.04

cookbook 'java'

Attributes
----------
* `default['chef_ec2_cli_tools']['install_java?'] = true` - set to `false` you do not want to install java
* `default['chef_ec2_cli_tools']['aws_access_key'] = "Your Access Key"` - you must set this if installing the API tools.
* `default['chef_ec2_cli_tools']['aws_secret_key'] = "Your Secret Key"` - you must set this if installing the API tools.

See [Setting Attributes (Examples)](http://wiki.opscode.com/pages/viewpage.action?pageId=8257848).

Usage
-----
* Add `chef_ec2_cli_tools` to your run list to setup both AMI and API tools.
* Add `chef_ec2_cli_tools::ami` for only the AMI tools.
* Add `chef_ec2_cli_tools::api` for only the API tools.

Contributing
------------
1. Fork the repo
2. Create a topic branch
3. Make your changes (and write specs!)
  * Make sure you pull in dependent cookbooks with `bundle exec librarian-chef install` (see [Librarian](https://github.com/applicationsonline/librarian))
  * Run specs with `bundle exec rspec` (see [ChefSpec](https://github.com/acrmp/chefspec))
4. Submit a pull request
