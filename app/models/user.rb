class User < ActiveRecord::Base
  has_many :vacancies
  has_secure_password

  ROLES = [:customer, :hr, :admin]

  ROLES.each do |role|
    scope role.to_s + 's', ->() do
      role_i = ROLES.map.with_index.to_h[role]
      where(role: role_i)
    end
  end

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, email: true
  validates :role, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: ROLES.size - 1 }

  ROLES.each { |role_name| define_method("is_#{ role_name }?") { ROLES[self.role] == role_name } }

end
