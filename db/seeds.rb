# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Office.all.empty?
  Office.create(name: 'Deaconship', organization_id: 0)
  Office.create(name: 'Choir', organization_id: 0)
  Office.create(name: 'Finance', organization_id: 0)
  Office.create(name: 'Secretariat', organization_id: 0)
  Office.create(name: 'SCAN', organization_id: 0)
  Office.create(name: 'PNK', organization_id: 0)
  Office.create(name: 'Buklod', organization_id: 0)
  Office.create(name: 'Kadiwa', organization_id: 0)
  Office.create(name: 'Binhi', organization_id: 0)
end
