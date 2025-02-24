class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.project = Project.find(params[:project_id])
    @comment.user = current_user

    if @comment.save
      redirect_to project_comment_path(@comment.project, @comment), notice: "Comment was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to project_path(@comment.project), notice: "Comment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy!

    redirect_to project_path(@comment.project), notice: "Comment was deleted."
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
