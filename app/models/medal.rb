class Medal < ActiveRecord::Base
	belongs_to :competitor
	belongs_to :tournament

	validates :value, presence: true
	validates :tournament_id, presence: true
							  
	validates :competitor_id, presence: true,
						      uniqueness: {:scope => [:tournament_id, :absolute]}
end
