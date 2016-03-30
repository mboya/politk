# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

require 'csv'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

require 'csv'
PoliticalParty.destroy_all
County.destroy_all
Constituency.destroy_all
Politician.destroy_all
Contest.destroy_all


CSV.foreach("#{Rails.root}/lib/data/parties.csv") do |row|
  p row
  PoliticalParty.create!(:id=>row[0],:name => row[1], :symbol => row[3],:abr => row[2],:code=>row[4])
end

CSV.foreach("#{Rails.root}/lib/data/county.csv") do |row|
  p row
  County.create!(:id => row[0], :name => row[1],:code=>row[2])
end

CSV.foreach("#{Rails.root}/lib/data/constituency.csv") do |row|
  p row
  Constituency.create!(:id=>row[0],:name => row[1], :county_id =>row[2])
end


CSV.foreach("#{Rails.root}/lib/data/politician.csv") do |row|
  p row
  Politician.create!(id:row[0],other_name:row[1], contest_type:row[2],political_party_id:row[3],contest_id:row[4],surname:row[5], primary_secondary_school:row[6], undergraduate_school:row[7], graduate_school:row[8],previous_position:row[9])
end

CSV.foreach("#{Rails.root}/lib/data/contest.csv") do |row|
  p row
  Contest.create!( :id=>row[0],name: row[1], contestType: row[2])
end

