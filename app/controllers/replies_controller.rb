class RepliesController < ApplicationController

  def new
    @reply = Reply.new
  end

  def create
    @reply = Reply.new reply_params
    if @reply.save
      flash[:notice] = I18n.t 'vacancies.reply.success'
      redirect_to action: :index
    else
      render 'new'
    end
  end

  def reply_params
    params.require(:reply).permit(:name, :city, :salary, :spoken, :technical, :contacts, :cv, :vacancy_id)
  end

end
