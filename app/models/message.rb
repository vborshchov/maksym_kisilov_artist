class Message < ActiveRecord::Base
  validates_presence_of :name, :email, :title, :body
  validates :email, email: true
  validates_length_of :body, maximum: 500
end
