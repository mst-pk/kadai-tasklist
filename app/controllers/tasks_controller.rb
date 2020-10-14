class TasksController < ApplicationController
    before_action :task_set, only: [:show, :edit, :update, :destroy]
    
    def index
        @tasks = Task.all
    end
    
    def show
        
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
        
    end
    
    def update
        if @task.update(strong_params)
            flash[:success] = "タスクは正常に変更されました。"
            redirect_to @task
        else
            flash[:danger] = "タスクは変更されませんでした。"
            render :edit
        end
    end
    
    def destroy
        @task.destroy
        flash[:success] = "タスクは削除されました"
        redirect_to tasks_url
    end
    
    private
        def task_set
            @task = Task.find(params[:id])
        end
        
        def strong_params
            params.require(:task).permit(:content, :status)
        end
end
