class User < ApplicationRecord
  devise :database_authenticatable, :recoverable,
         :validatable, :lockable, :trackable
end
