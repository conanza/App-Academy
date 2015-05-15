class Sub < ActiveRecord::Base
  belongs_to :moderator, class_name: "User"
  validates :title, :description, presence: true
end
