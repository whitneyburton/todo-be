class Api::V1::ItemsController < ApplicationController
  # GET api/v1/users/:id/todos/:todo_id/items
  def index 
    todo = Todo.find(params[:todo_id])
    json_response(todo.items)
  end

  # GET api/v1/users/:id/todos/:todo_id/items/:id
  def show
    json_response(@item)
  end

  # POST api/v1/users/:id/todos/:todo_id/items
  def create
    todo = Todo.find(params[:todo_id])
    todo.items.create!(item_params)
    json_response(todo, :created)
  end

  # PUT api/v1/users/:id/todos/:todo_id/items/:id
  def update
    todo = Todo.find(params[:todo_id])
    item = todo.items.find_by!(id: params[:id]) if todo
    item.update(item_params)
    head :no_content
  end

  # DELETE api/v1/users/:id/todos/:todo_id/items/:id
  def destroy
    todo = Todo.find(params[:todo_id])
    item = todo.items.find_by!(id: params[:id]) if todo
    item.destroy
    head :no_content
  end

  private

  def item_params
    params.permit(:name, :done)
  end
end
