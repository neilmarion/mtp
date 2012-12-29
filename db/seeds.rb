# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


a = Organization.create(name: 'IGLESIA NI CRISTO', type_of_children: 'District')
a = a.children.create(name: 'Metro Manila South', type_of_children: 'Locale')
a = a.children.create(name: 'Talon', type_of_children: 'Purok')
a = a.children.create(name: '1', type_of_children: 'Grupo')
@talon = a.children.create(name: '1', type_of_children: nil)

if Office.all.empty?
  Office.create(name: 'Deaconship')
  Office.create(name: 'Pagkakatiwala')
  a = Office.create(name: 'Choir')
  @choir = a.children.create(name: 'Adult')
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
  @kadiwa_office = a.children.create(name: 'KADIWA')
  a.children.create(name: 'Binhi')
end

if Cfo.all.empty?
  Cfo.create(name: 'Buklod')
  @kadiwa = Cfo.create(name: 'KADIWA')
  Cfo.create(name: 'Binhi')
end

Person.create(last_name: "dela Cruz", first_name: "Neil Marion", middle_name: "Flores", organization_id: @talon.id, cfo_id: @kadiwa.id)

Person.first.offices = [@choir, @kadiwa_office]
