class EmployeesController < ApplicationController
  def index
    @employees = Unirest.get("localhost:3000/api/v1/employees.json").body
  end

  def new
    
  end

  def create
    employee = Unirest.post(
                            "localhost:3000/api/v1/employees.json",
                            headers: {
                                      "Accept" => "application/json"
                                      },
                            params: {
                                     first_name: params[:first_name],
                                     last_name: params[:last_name],
                                     email: params[:email]
                                    }
                            ).body

    redirect_to "/employees/#{employee["id"]}"
  end

  def show
    @employee = Unirest.get("localhost:3000/api/v1/employees/#{params[:id]}.json").body
  end

  def edit
    @employee = Unirest.get("localhost:3000/api/v1/employees/#{params[:id]}.json").body
  end

  def update
    employee = Unirest.patch(
                            "localhost:3000/api/v1/employees/#{params["id"]}.json",
                            headers: {
                                      "Accept" => "application/json"
                                      },
                            params: {
                                     first_name: params[:first_name],
                                     last_name: params[:last_name],
                                     email: params[:email]
                                    }
                            ).body

    redirect_to "/employees/#{employee["id"]}"
  end

  def destroy
    Unirest.delete(
                   "localhost:3000/api/v1/employees/#{params["id"]}.json",
                   headers: {
                             "Accept" => "application/json"
                             }
                   ).body
    redirect_to "/employees"
  end
end
