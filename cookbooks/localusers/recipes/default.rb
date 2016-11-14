#
# Cookbook Name:: localusers
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
search(:users, "*:*").each do |data|

	user data["id"] do
		uid data["uid"]
		comment data["comment"]
		gid data["gid"]
		home data["home"]
		shell data["shell"]
	end	

end

include_recipe "localusers::groups"
