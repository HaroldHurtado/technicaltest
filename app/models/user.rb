class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
=begin
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
=end
devise :database_authenticatable,
       :rememberable, :trackable, :validatable
end
