class User < ActiveRecord::Base
  has_many :vacancies
  belongs_to :role

  validates :name, presence: true, uniqueness: true
  has_secure_password
end
