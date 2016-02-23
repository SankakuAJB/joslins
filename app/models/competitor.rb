class Competitor < ActiveRecord::Base
	has_many :medals

	validates :name, presence: true,
					 uniqueness: {case_sensitive: false}
end
