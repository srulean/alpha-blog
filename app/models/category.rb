class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }
  # Alternative to uniqueness validation above is the following:
  # validates_uniqueness_of :name
  
end