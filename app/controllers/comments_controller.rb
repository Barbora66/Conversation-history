class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show edit update destroy]

  # GET /comments/1/edit
  def edit
  end

  # POST /projects/123/comments
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

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    if @comment.update(comment_params)
      redirect_to project_path(@comment.project), notice: "Comment was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment.destroy!

    redirect_to project_path(@comment.project), notice: "Comment was deleted."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content)
  end
end
