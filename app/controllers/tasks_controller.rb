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
        @task = Task.new(strong_params)
        if @task.save
            flash[:success] = "タスクが作成されました。"
            redirect_to @task
        else
            flash.now[:danger] = "タスクが作成されませんでした。"
            render new
        end
    end
    
    def edit
        @task = Task.find(params[:id])
    end
    
    def update
        @task = Task.find(params[:id])
        if @task.update(strong_params)
            flash[:success] = "タスクは正常に変更されました。"
            redirect_to @task
        else
            flash[:danger] = "タスクは変更されませんでした。"
            render :edit
        end
    end
    
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        flash[:success] = "タスクは削除されました"
        redirect_to tasks_url
    end
    
    private
        def strong_params
            params.require(:task).permit(:content)
        end
end
