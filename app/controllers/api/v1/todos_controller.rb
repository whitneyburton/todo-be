class Api::V1::TodosController < ApplicationController

  # GET api/v1/users/:id/todos
  def index
    user = User.find(params[:user_id])
    todos = user.todos
    json_response(todos)
  end

  # GET api/v1/users/:id/todos/:id
  def show
    todo = Todo.find(params[:id])
    json_response(@todo)
  end

  # POST api/v1/users/:id/todos
  def create
    todo = Todo.create!(todo_params)
    json_response(todo, :created)
  end

  # PUT api/v1/users/:id/todos/:id
  def update
    todo = Todo.find(params[:id])
    todo.update(todo_params)
    head :no_content
  end

  # DELETE api/v1/users/:id/todos/:id
  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    head :no_content
  end

  private

  def todo_params
    params.permit(:title)
  end
end
