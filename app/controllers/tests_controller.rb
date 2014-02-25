class TestsController < ApplicationController
  
  def index
    @phr = Phr.find(params[:phr_id])
    @tests = @phr.tests.paginate(page: params[:page], per_page: 5)
  end

  def new
    @phr = Phr.find(params[:phr_id])
    @tests = @phr.tests.build
  end

  def create
    @phr = Phr.find(params[:phr_id])
    @test = @phr.tests.create(test_params)

    if @test.save
        flash[:success] = "Test Result Saved"
        redirect_to(phr_tests_path(@phr, @test))
      else
        flash[:failure] = "Please fill in all fields as required"
        render 'new'
      end
  end

  def show
    @phr = Phr.find(params[:phr_id])
    @test = @phr.tests.find(params[:id])
  end

  def edit
    @phr = Phr.find(params[:phr_id])
    @test = Test.find(params[:id])
  end

  def update
    @test = Test.find(params[:id])
    if @test.update_attributes(test_params)
      flash[:success] = "Record updated"
      redirect_to(phr_tests_path(@test.phr, @test))
    else
      render 'edit'
    end
  end

  def destroy
    @phr = Phr.find(params[:phr_id])
    @tests = @phr.tests.all
    @test = @phr.tests.find(params[:id])
    if @test.update_attribute(:deleted, true)
        flash[:success] = "Record Deleted."
      else
      
      end
      redirect_to(phr_tests_path)
  end
  private
    def test_params
      params.require(:test).permit(:phr_id,
                    :date,
                    :doctor,
                    :name,
                    :test,
                    :comments)
    end
end
