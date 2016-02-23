class Tournament < ActiveRecord::Base
	has_many :medals

	validates :name, presence: true,
					 uniqueness: {case_sensitive: false}
	validates :multiplier, presence: true
end
