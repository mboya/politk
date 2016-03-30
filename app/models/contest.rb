class Contest < ActiveRecord::Base
	belongs_to :politician
    belongs_to :county
    belongs_to :constituency
    belongs_to :ward
end
