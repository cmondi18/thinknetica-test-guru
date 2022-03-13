class Admin::BadgesController < Admin::BaseController
  def index
    @badges = Badge.all
  end

  def new
    @images = Dir.glob('app/assets/images/badges/*.png')

    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      redirect_to admin_badges_path, notice: 'Badge was successfully created.'
    else
      render :new
    end
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :file_name, :badge_type, :level, :category_id)
  end
end
