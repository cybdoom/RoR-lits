class VacanciesController < ApplicationController
  before_action :set_vacancy, only: [:reply, :apply]

  def index
    @vacancies = Vacancy.all
  end

  def reply
  end

  def apply
    @vacancy.apply apply_params
    redirect_to action: :index
  end

  private

  def set_vacancy
    @vacancy = Vacancy.find params[:id]
  end

  def apply_params
    result = params.require(:reply).permit(:name, :city, :salary, :spoken, :technical, :contacts, :cv)
    result[:contacts] = JSON.parse result[:contacts]
    result
  end

end
