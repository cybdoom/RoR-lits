class Admin::PagesController < AdminController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
  end

  def edit
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to [:admin, @page], notice: 'Page was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @page.update(page_params)
      redirect_to [:admin, @page], notice: 'Page was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @page.destroy
    redirect_to admin_pages_url

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:name, :title, :description)
    end
end
