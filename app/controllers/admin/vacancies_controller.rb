class Admin::VacanciesController < AdminController
  def index
    @vacancies = current_user.is_admin? ? Vacancy.all : Vacancy.owned_by(current_user)
  end

  def new
    @vacancy = Vacancy.new vacancy_params
  end

  def create
    @vacancy = Vacancy.new vacancy_params
    if @vacancy.valid?
      if @vacancy.save
        flash[:notice] = I18n.t 'vacancies.create.success'
        redirect_to action: :index
      else
        flash[:error] = I18n.t 'vacancies.create.fail'
        redirect_to action: :new
      end
    else
      flash[:error] = humanized_validation_error_message(@vacancy)
      redirect_to action: :new, vacancy: vacancy_params
    end
  end

  private

  def vacancy_params
    params[:vacancy].present? ? params.require(:vacancy).permit(:name, :description, :salary, :user_id) : nil
  end
end
