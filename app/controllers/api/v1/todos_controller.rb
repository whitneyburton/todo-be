class Api::V1::TodosController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET api/v1/todos
  def index
    @todos = Todo.all
    # @todos = @user.todos
    json_response(@todos)
  end

  # GET api/v1/todos/:id
  def show
    json_response(@todo)
  end

  # POST api/v1/todos
  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  # PUT api/v1/todos/:id
  def update
    @todo.update(todo_params)
    head :no_content
  end

  # DELETE api/v1/todos/:id
  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def todo_params
    params.permit(:title, :created_by)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
