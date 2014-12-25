class Admin::RepliesController < AdminController

  def index
    @replies = Vacancy.find(params[:vacancy_id]).replies
  end

end
