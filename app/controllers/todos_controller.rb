class TodosController < ApplicationController

  def index
    @todos = Todo.all
    render json: @todos
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save!
      render json: @todo
    else
      redner json: @todo.errors.full_messages
    end
  end

  def edit
    @todo = Todo.new
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update!(todo_params)
      render json: @todo
    else
      render json: @todo.errors.full_messages
    end
  end

  def delete
    @todo = Todo.find(params[:id])

    @todo.delete
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :status)
  end

end