class Admin::VacanciesController < AdminController
  def index
    @vacancies = current_user.is_admin? ? Vacancy.all : Vacancy.owned_by(current_user)
  end
end
