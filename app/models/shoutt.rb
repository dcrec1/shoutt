class Shoutt < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user, :body, :date
end
