class Tournament < ActiveRecord::Base
	has_many :medals

	validates :name, presence: true
	validates :multiplier, presence: true
end
