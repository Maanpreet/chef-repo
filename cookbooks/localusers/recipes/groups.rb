#this is recipe to add users in data bag into wheel group
#
#
search(:groups, "*:*").each do |data|

	group data["id"] do
		gid data["gid"]
		members data["members"]
	end

end
