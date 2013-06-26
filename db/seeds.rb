# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Politician.create(name: "Frankie", party: "Republican", handle: "@testing12345", avatar: "http://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Bill_Nelson.jpg/75px-Bill_Nelson.jpg")
Politician.create(name: "Bob", party: "Democrat", handle: "@testtest1234", avatar: "http://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Bill_Nelson.jpg/75px-Bill_Nelson.jpg")
Politician.create(name: "Reggie", party: "Democrat", handle: "@foobar12345", avatar: "http://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Mike_Crapo_Official_Photo_110th_Congress.jpg/75px-Mike_Crapo_Official_Photo_110th_Congress.jpg")
Politician.create(name: "Andy", party: "Democrat", handle: "@testfoobar12345", avatar: "http://upload.wikimedia.org/wikipedia/commons/thumb/8/8c/Senator_Mark_Kirk_official_portrait_crop.jpg/75px-Senator_Mark_Kirk_official_portrait_crop.jpg")