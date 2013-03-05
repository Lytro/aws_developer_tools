# Chef Cookbook for AWS Developer Tools

## Description
Setup AWS Developer Tools for easier AWS server management. http://aws.amazon.com/developertools

API and AutoScaling Tools require java; by default, OpenJDK is installed. See the [java cookbook](https://github.com/opscode-cookbooks/java) for information on how to install Oracle's JDK.

## Requirements
* Ruby 1.9+
* Java
* Tested on Ubuntu 10.04

## Attributes
* `default['aws_developer_tools']['install_java?'] = true` - set to `false` if you'd rather install java yourself
* `default['aws_developer_tools']['install_ruby?'] = true` - set to `false` if you'd rather install ruby yourself
* `default['aws_developer_tools']['aws_access_key'] = 'Your Access Key'` - you must set this if installing the API tools.
* `default['aws_developer_tools']['aws_secret_key'] = 'Your Secret Key'` - you must set this if installing the API tools.
* `default['aws_developer_tools']['api']['source'] = 'http://s3.amazonaws.com/ec2-downloads/ec2-api-tools.zip'` - set to whatever URL you want
* `default['aws_developer_tools']['ami']['source'] = 'http://s3.amazonaws.com/ec2-downloads/ec2-ami-tools.zip'` - set to whatever URL you want
* `default['aws_developer_tools']['auto_scaling']['source'] = 'http://ec2-downloads.s3.amazonaws.com/AutoScaling-2011-01-01.zip'` - set to whatever URL you want

See [Setting Attributes (Examples)](http://wiki.opscode.com/pages/viewpage.action?pageId=8257848).

## Recipes
* `aws_developer_tools` - sets up all of the below tools
* `aws_developer_tools::ami` - [AMI tools](http://aws.amazon.com/developertools/368). Requires Ruby
* `aws_developer_tools::api` - [API tools](http://aws.amazon.com/developertools/351). Requires Java
* `aws_developer_tools::auto_scaling` - [Auto Scaling tools](http://aws.amazon.com/developertools/2535). Requires Java


Written by [Anuj Biyani](https://github.com/anujbiyani) for [Lytro](https://github.com/lytro)
