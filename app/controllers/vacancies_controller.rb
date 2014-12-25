class VacanciesController < ApplicationController
  before_action :set_vacancy, only: [:reply, :apply]

  def index
    @vacancies = Vacancy.all
  end

  private

  def set_vacancy
    @vacancy = Vacancy.find params[:id]
  end

end
