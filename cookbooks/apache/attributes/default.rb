# default attributes for httpd server


default["apache"]["sites"]["chef1"] = { "port" => 80, "domain" => "chef1.manpreet.pro" }
default["apache"]["sites"]["2.chef1"] = { "port" => 80, "domain" => "2.chef1.manpreet.pro" }


case node["platform"]
when "amazon"
	default["apache"]["package"]="httpd"
when "ubuntu"
	default["apache"]["package"]="apache2"
end
