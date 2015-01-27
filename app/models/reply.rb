class Reply < ActiveRecord::Base
  WORK_TYPES = [:office, :remote]

  after_create ->(created_reply) do
    CareerMailer.reply_created(created_reply).deliver
  end

  belongs_to :vacancy

  mount_uploader :cv, CVUploader

  serialize :contacts, Array
  serialize :english, Hash

  SPOKEN_ENGLISH_LEVELS = 4
  TECH_ENGLISH_LEVELS = 5

  validates :name, :contacts, :city, :english, :work_types, presence: true
  validates :name, length: { minimum: 2, maximum: 128 }
  validates :city, length: { minimum: 3, maximum: 128 }
  validates :dob, presence: true
  validates :work_hours, numericality: { only_integer: true, greater_than: 0, less_than: 25 }
  validates :work_types, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than: 2**WORK_TYPES.count }
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
    super Date.strptime(value, "%m/%d/%Y") if value.present?
  end

  def validate_cv_size
    errors[:cv] << I18n.t('errors.validation.reply.cv.size') if cv.size > 3.megabytes
  end

  def work_types
    result = []
    i = 0
    super.to_s(2).each_char do |presence|
      result << WORK_TYPES[i] if presence == '1'
      i += 1
    end
    result
  end

  def work_types= value
    value = (JSON.parse value).map &:to_sym
    result = '0' * 2**(WORK_TYPES.count - 1)
    value.each {|type| result[Hash[WORK_TYPES.map.with_index.to_a][type]] = '1' }
    super result.to_i 2
  end
end
