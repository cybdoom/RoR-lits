class Reply < ActiveRecord::Base
  belongs_to :vacancy
  has_attached_file :cv

  serialize :contacts, Hash
  serialize :english, Hash

  SPOKEN_ENGLISH_LEVELS = 4
  TECH_ENGLISH_LEVELS = 5

  validates :name, :contacts, :city, :english, :work_type, presence: true
  validates :name, length: { minimum: 2, maximum: 128 }
  validates :city, length: { minimum: 3, maximum: 128 }
  validates :work_hours, numericality: { only_integer: true, greater_than: 0, less_than: 25 }
  validates :work_type, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 2 }
  validates :salary, length: { maximum: 32 }

  validates_with ContactsValidator, EnglishKnowledgeValidator
  validates_attachment :cv, presence: true, size: { less_than: 2.megabyte }
end
