# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Organization.create(name: 'IGLESIA NI CRISTO', type_of_children: 'District')

if Office.all.empty?
  Office.create(name: 'Deaconship')
  Office.create(name: 'Pagkakatiwala')
  a = Office.create(name: 'Choir')
  a.children.create(name: 'Adult')
  a.children.create(name: 'PNK')
  a = Office.create(name: 'Finance')
  a.children.create(name: 'P-1')
  a.children.create(name: 'P-9')
  a.children.create(name: 'P-10')
  a.children.create(name: 'P-13')
  Office.create(name: 'Secretariat')
  Office.create(name: 'SCAN')
  a = Office.create(name: 'PNK')
  a.children.create(name: 'Kagawad')
  a.children.create(name: 'Tagapagturo')
  a = Office.create(name: 'Kapisanan')
  a.children.create(name: 'Buklod')
  a.children.create(name: 'KADIWA')
  a.children.create(name: 'Binhi')
end

if Cfo.all.empty?
  Cfo.create(name: 'Buklod')
  Cfo.create(name: 'KADIWA')
  Cfo.create(name: 'Binhi')
end
