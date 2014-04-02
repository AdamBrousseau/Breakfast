class TestsController < ApplicationController
  
    ############################################################
    #
    #   Controller: Tests
    #   Associated Model: Test
    #   Purpose: This controller is responsible for all the
    #             actions associated with the Test model
    #   Actions: index, new, create, show, edit, update, destroy
    #
    ############################################################


    # Action: index
    # Purpose: Provide data for index view to list all test records
    # Functionality: All test records related to the give Phr are
    #           returned in the instance variable tests and are
    #           also paginated with 5 records showing per page.
    def index
        @phr = Phr.find(params[:phr_id])
        @tests = @phr.tests.paginate(page: params[:page], per_page: 5)
    end

    # Action: new
    # Purpose: This action creates an instance variable of the test model
    #         for the given Phr.
    # Functionality: Create instance variable of the test model.
    def new
        @phr = Phr.find(params[:phr_id])
        @test = @phr.tests.build
        @user = current_user
    end

    # Action: create
    # Purpose: This action saves the instance variable of test record to the database.
    # Functionality: Try to save the new record against the given Phr. If there is 
    #                a problem with the parameters,
    #                redirect back to the new action, otherwise flash a success
    #                message, and redirect to the newly saved record.
    def create
        @phr = Phr.find(params[:phr_id])
        @user = current_user
        @test = @phr.tests.create(test_params)

        if @test.save
            flash[:success] = "Test Result Saved"
            redirect_to(phr_tests_path(@phr, @test))
          else
            flash[:failure] = "Please fill in all fields as required"
            render 'new'
          end
    end

    # Action: show
    # Purpose: Provide data to show view to render each individual test record.
    # Functionality: Fetch the test record selected by the user from the databse into memory
    #         using the ID of the test record for the given Phr.
    def show
        @phr = Phr.find(params[:phr_id])
        @test = @phr.tests.find(params[:id])
    end

    # Action: edit
    # Purpose: This action creates an instance variable of the test model
    #       for the given Phr.
    # Functionality: Create instance variable of the test model.
    def edit
        @phr = Phr.find(params[:phr_id])
        @test = Test.find(params[:id])
        @user = current_user
    end

    # Action: update
    # Purpose: Update the test record attributes.
    # Functionality: Try to update the record's details. If there is a problem with
    #                the parameters, redirect back to the edit page, otherwise
    #                flash a success message and redirect to the current record's page.
    def update
        @test = Test.find(params[:id])
        @user = current_user
        if @test.update_attributes(test_params)
          flash[:success] = "Record updated"
          redirect_to(phr_tests_path(@test.phr, @test))
        else
          render 'edit'
        end
    end

    # Action: destroy
    # Purpose: Mark the test record in the Database as deleted
    # Functionality: "Destroy" the test record. Flash a success message. 
    #                Redirect to the index view for test records
    def destroy
        @phr = Phr.find(params[:phr_id])
        @test = @phr.tests.find(params[:id])
        if @test.update_attribute(:deleted, true)
            flash[:success] = "Record Deleted."
          else
          
          end
          redirect_to(phr_tests_path)
    end

    # Private definition
    private
        # test_params
        # These are the parameters permitted when submitting a request related
        # to a test record. This protects against malicious HTTP requests trying to
        # update a test record.
        def test_params
          params.require(:test).permit(:phr_id,
                        :date,
                        :doctor,
                        :name,
                        :test,
                        :comments)
        end
end
