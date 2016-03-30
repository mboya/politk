class Politician < ActiveRecord::Base
	belongs_to :county
	belongs_to :constituency
	belongs_to :political_party
	belongs_to :contest

	acts_as_followable
	acts_as_mentionable

	self.per_page = 10
end
