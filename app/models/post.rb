class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :status

  has_many :likes, dependent: :destroy
end
