class Item < ActiveRecord::Base
  belongs_to :circle
  has_many :orders
  has_many :users, through: :orders
end
