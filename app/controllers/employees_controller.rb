class EmployeesController < ApplicationController
  
  def index
    @employees = Employee.all
  end 

  def new
    
  end

  def create


    employee = Empoyee.create(
                              first_name: params[:first_name],
                              last_name: params[:last_name],
                              email: params[:email]
                            )

    redirect_to "/employees/#{employee["id"]}"
  end

  def show
    @employee = Employee.find(params[:id])

  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    employee = Employee.find(params[:id])
    employee.update(
                                    parameters: {
                                     first_name: params[:first_name],
                                     last_name: params[:last_name],
                                     email: params[:email]
                                    }
                            ).body

    redirect_to "/employees/#{employee.id}"
  end

  def destroy
    Unirest.delete(
                   "#{ENV["API_HOST"]}/api/v1/employees/#{params["id"]}.json",
                   headers: {
                             "Accept" => "application/json"
                             }
                   ).body
    redirect_to "/employees"
  end
end
