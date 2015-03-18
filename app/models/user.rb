class User < ActiveRecord::Base
	has_many :orders
	has_many :items, through: :orders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         	
validates :username, presence: true, uniqueness: true
 

  		attr_accessor :name

end
