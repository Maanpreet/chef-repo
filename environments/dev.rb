name "dev"
description "development environemnt"
cookbook "apache", "= 0.1.5"
override_attributes({
	"author"=> {
		"name" => "This id man Dev author name"
		}
})
