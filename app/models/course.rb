class Course < ActiveRecord::Base
	belongs_to :user
	has_many :selections

	validates :title, presence: true
	validates :description, presence: true
	validates :cost, presence: true, numericality: {greater_than_orequal_to: 0}
end
