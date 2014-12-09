module VacanciesHelper
  def select_options_owner
    User.where(role: Hash[User::ROLES.map.with_index.to_a][:hr]).map { |user| [user.name, user.id] }
  end
end
