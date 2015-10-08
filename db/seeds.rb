# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: "Живопис", slug: "zhyvopys")
Category.create(name: "Графіка", slug: "hrafika")
Category.create(name: "Акварель", slug: "akvarel", parent_id: Category.find_by(name: "Живопис").id)
Category.create(name: "Олія", slug: "oliia", parent_id: Category.find_by(name: "Живопис").id)
Category.create(name: "Начерк", slug: "nacherk", parent_id: Category.find_by(name: "Графіка").id)
Category.create(name: "Малюнок", slug: "maliunok", parent_id: Category.find_by(name: "Графіка").id)

# artworks =
#   [
#     {name: "", dimension: "", material: "", picture:"v1444132132/fkmmvhur6dzuyidksypq.jpg"},
#     {name: "", dimension: "", material: "", picture:"v1444132132/mekegahb0akwtn2k3nin.jpg"},
#     {name: "", dimension: "", material: "", picture:"v1444132132/y19ndnfvj9e1itysmcoo.jpg"},
#     {name: "", dimension: "", material: "", picture:"v1444132132/sjxyqry47olibdckvhbb.jpg"},
#     {name: "", dimension: "", material: "", picture:"v1444132132/pbc0tckj84xf3tihcbua.jpg"},
#     {name: "", dimension: "", material: "", picture:"v1444132132/z4hlcmzwmxeafhaicolw.jpg"},
#     {name: "", dimension: "", material: "", picture:"v1444132132/ks8xi3s93ddydbvi3xme.jpg"},
#     {name: "", dimension: "", material: "", picture:"v1444132132/ilcptlcwazjfk42aocjf.jpg"},
#     {name: "", dimension: "", material: "", picture:"v1444132132/qou9y49dfqrad5epsjxn.jpg"},
#     {name: "", dimension: "", material: "", picture:"v1444132132/ves0aruvl9idahtrzmvf.jpg"},
#     {name: "", dimension: "", material: "", picture:"v1444132132/kgvfhpouzetcbtsjxivg.jpg"}
#   ]
# artworks.each do |a|
#   Artwork.create(a)
# end