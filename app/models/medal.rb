class Medal < ActiveRecord::Base
	belongs_to :competitor
	belongs_to :tournament
end
