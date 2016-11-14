#
# Cookbook Name:: motd
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#This is to update MOTD message on all the clients
#
template "/etc/motd" do
	source "motd.erb"
	mode "0644"
end
