class Vacancy < ActiveRecord::Base
  has_many :replies
  belongs_to :user

  validates :name, :description, presence: true
  validates :name, length: { minimum: 2, maximum: 128 }
  validates :description, length: { minimum: 1, maximum: 4096 }
end
