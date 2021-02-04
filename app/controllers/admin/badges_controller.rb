class Admin::BadgesController < Admin::BaseController

  before_action :find_badges, only: [:show, :edit, :update, :destroy]
  before_action :find_rules, only: [:new, :create, :update, :edit]

  def index
    @badges = Badge.all
  end

  def new
    @badge = current_user.badges.new
  end

  def show
  end

  def edit
  end

  def create
    @badge = current_user.badges.new(badge_params)
    if @badge.save
      redirect_to [:admin, @badge]
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge]
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def find_badges
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :image, :rule_name, :rule_value)
  end

  def find_rules
    @rules = Badge::RULES
  end
end
