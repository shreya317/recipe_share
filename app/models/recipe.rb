class Recipe < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :title, :ingredients, :directions
end
