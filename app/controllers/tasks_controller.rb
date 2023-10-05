class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def show
        @task = Task.find(params[:id])
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(task_params)
        if @task.save
          flash[:success] = "Task successfully created"
          redirect_to tasks_path
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def edit
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
	
        if @task.update(task_params)
            redirect_to :action => 'show', :id => @task
        else
            flash[:error] = "Something went wrong"
            render :action => 'edit'
        end
    end
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        flash[:success] = 'Task removida com sucesso!'
        redirect_to tasks_path
    end

    def task_params
        params.require(:task).permit(:title, :description)
    end
    

    
    
    
end
