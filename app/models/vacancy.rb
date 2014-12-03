class Vacancy < ActiveRecord::Base
  has_many :replies
  belongs_to :user

  validates :name, :description, presence: true
end
