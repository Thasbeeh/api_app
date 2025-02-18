class TasksController < ApplicationController

	def index
		@tasks = Task.page(params[:page]).per(params[:limit])
		render json: @tasks, status: :ok
	end

	def show
		begin
			@task = Task.find(params[:id])
			render json: @task, status: :ok
		rescue ActiveRecord::RecordNotFound
			render json: 'Record not found', status: :ok
		end
	end

	def create
		@task = Task.new(task_params)
		if @task.save
			render json: @task, status: :created
		else
			render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def update
		@task = Task.find(params[:id])
		if @task.update(task_params)
			render json: @task, status: :ok
		else
			render json: { errors: @task.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def destroy
		@task = Task.find(params[:id])
		if @task.destroy
			render json: 'Task deleted', status: :ok
		end
	end

	private

	def task_params
		params.permit(:title, :description, :due_date).merge(status: params[:status].to_i)
	end
end
