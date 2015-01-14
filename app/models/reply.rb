class Reply < ActiveRecord::Base
  belongs_to :vacancy

  mount_uploader :cv, CVUploader

  serialize :contacts, Array
  serialize :english, Hash

  SPOKEN_ENGLISH_LEVELS = 4
  TECH_ENGLISH_LEVELS = 5

  validates :name, :contacts, :city, :english, :work_type, presence: true
  validates :name, length: { minimum: 2, maximum: 128 }
  validates :city, length: { minimum: 3, maximum: 128 }
  validates :dob, presence: true
  validates :work_hours, numericality: { only_integer: true, greater_than: 0, less_than: 25 }
  validates :work_type, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 2 }
  validates :salary, length: { maximum: 32 }

  validates_with ContactsValidator, EnglishKnowledgeValidator
  validate :validate_cv_size

  def spoken
    english[:spoken]
  end

  def spoken= value
    english[:spoken] = value
  end

  def technical
    english[:technical]
  end

  def technical= value
    english[:technical] = value
  end

  def contacts= value
    super value.is_a?(String) ? JSON.parse(value) : value
  end

  def dob= value
    super value.to_date
  end

  def validate_cv_size
    errors[:cv] << I18n.t('errors.validation.reply.cv.size') if cv.size > 3.megabytes
  end
end
