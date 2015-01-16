class Vacancy < ActiveRecord::Base
  STATUSES = [:actual, :frozen]

  has_many :replies
  belongs_to :user

  scope :owned_by, ->(user) { where(user_id: user.id) }

  validates :name, :description, presence: true
  validates :name, length: { minimum: 2, maximum: 128 }
  validates :description, length: { minimum: 1, maximum: 4096 }

  def status
    STATUSES[super]
  end

  def status= value
    super STATUSES.map.with_index.to_h[value]
  end

  STATUSES.each { |status| define_method("#{status}?") { self.status == status } }
end
