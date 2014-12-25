class VacanciesController < ApplicationController
  before_action :set_vacancy, only: [:reply, :apply]

  def index
    @vacancies = Vacancy.all
  end

  def reply
    @reply = Reply.new
  end

  def apply
    @reply = Reply.new(reply_params.merge vacancy_id: @vacancy.id)
    if @reply.save
      flash[:notice] = I18n.t 'vacancies.reply.success'
      redirect_to action: :index
    else
      render 'reply'
    end
  end

  private

  def set_vacancy
    @vacancy = Vacancy.find params[:id]
  end

  def reply_params
    params.require(:reply).permit(:name, :city, :salary, :spoken, :technical, :contacts, :cv)
  end

end
