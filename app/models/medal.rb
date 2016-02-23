class Medal < ActiveRecord::Base
	belongs_to :competitor
	belongs_to :tournament

	validates :value, presence: true
	validates :tournament_id, presence: true,
							  uniqueness: {scope: :competitor_id}
	validates :competitor_id, presence: true
end
