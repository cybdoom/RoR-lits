class RepliesController < ApplicationController

  def new
    @reply = Reply.new
    @reply.vacancy_id = params[:vacancy_id]
  end

  def create
    @reply = Reply.new reply_params
    if @reply.save
      flash[:notice] = I18n.t 'vacancies.reply.success'
      redirect_to vacancies_path
    else
      render 'new'
    end
  end

  def reply_params
    params.require(:reply).permit(:name, :dob, :city, :salary, :work_type, :work_hours, :spoken, :technical, :contacts, :cv, :vacancy_id)
  end

end
