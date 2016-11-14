#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#


package "apache" do
	package_name node["apache"]["package"]
	action :install
end

node["apache"]["sites"].each do |sitename,data|
	
	document_root = "/content/site/#{sitename}"
	directory document_root do
		mode "0755"
		recursive true
	end
	
	template "/etc/httpd/conf.d/#{sitename}.conf" do
		source "vhost.erb"
		mode "0644"
		variables(
			:document_root => document_root,
			:port => data["port"],
			:domain => data["domain"]
			
		)
		notifies :restart, "service[httpd]"
	end
	
	template "/content/site/#{sitename}/index.html" do
		source "index.erb"
		mode "0644"
		variables(
			:site_name => sitename,
			:author_name => node["author"]["name"]
		)
	end

end

execute "cp /etc/httpd/conf.d/welcome.conf /etc/httpd/conf.d/welcome.conf.back" do
	not_if do
		File.exist?("/etc/httpd/conf.d/welcome.conf")
	end
end



service "httpd" do
	action [:enable, :start]
end


include_recipe "php::default"
