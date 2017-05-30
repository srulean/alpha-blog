class Category < ActiveRecord::Base
  has_many :article_categories
  has_many :articles, through: :article_categories
  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 25 }
  # Alternative to uniqueness validation above is the following:
  # validates_uniqueness_of :name
  
end