class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: %i[show edit update destroy start]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = current_user.created_tests.new
  end

  def edit; end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      redirect_to admin_test_path(@test), notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to admin_test_path(@test)
    else
      render :edit
    end
  end

  def destroy
    if @test.destroy
      redirect_to admin_tests_path
    else
      render :show
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
