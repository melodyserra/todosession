class TodosController < ApplicationController
  def index
  	@todos = session[:todos] ||= []
  end

  def create
    if params[:task] == ""
      flash[:alert] = "Please type something in"
      redirect_to todos_path
    else
    session[:todos] << params[:task]
    #session[:todos].push(params[:task])
    redirect_to todos_path, notice: "You have successfully created a task"
    #flash[:alert]="abc"
    end
  end
  def destroy
  	session[:todos] = []
  	redirect_to todos_path, notice: "You have successfully deleted all tasks"
  end
end
