class Admin::VacanciesController < AdminController
  before_action :set_vacancy, only: [:edit, :update, :clone, :destroy]

  def index
    @vacancies = current_user.is_admin? ? Vacancy.all : Vacancy.owned_by(current_user)
  end

  def clone
    copy = @vacancy.dup
    if copy.save
      flash[:notice] = I18n.t 'vacancies.clone.success'
    else
      flash[:error] = I18n.t 'vacancies.clone.fail'
    end

    redirect_to action: :index
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

  def edit
  end

  def update
    if @vacancy.update vacancy_params
      flash[:notice] = I18n.t 'vacancies.update.success'
    else
      flash[:error] = I18n.t 'vacancies.update.fail'
    end
    redirect_to action: :index
  end

  def destroy
    if @vacancy.destroy
      flash[:notice] = I18n.t 'vacancies.destroy.success'
    else
      flash[:error] = I18n.t 'vacancies.destroy.fail'
    end
    redirect_to action: :index
  end

  private

  def vacancy_params
    params[:vacancy].present? ? params.require(:vacancy).permit(:name, :description, :salary, :user_id) : nil
  end

  def set_vacancy
    @vacancy = Vacancy.find params[:id]
  end
end
