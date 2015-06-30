class Section < ActiveRecord::Base
 has_many :lessons
 # belongs_to :chapter
 validates :title, :presence => true
end
