require "rails_helper"

RSpec.describe "Comments", type: :request do
  let!(:current_user) { User.create!(name: "Barbora") }
  let(:project) { Project.create!(name: "Project 1") }

  before do
    current_user
  end

  describe "POST /projects/123/comments" do
    it "should create comment" do
      expect do
        post project_comments_path(project), params: {comment: {content: "This is a comment by Barbora on Project 1"}}
      end.to change(Comment, :count).by(1)

      comment = Comment.last
      expect(comment.content).to eq("This is a comment by Barbora on Project 1")
      expect(comment.project).to eq(project)
      expect(comment.user).to eq(current_user)
    end
  end

  describe "PATCH /projects/123/comments/1" do
    it "should update comment" do
      comment = Comment.create!(project: project, user: current_user, content: "This is a comment by Barbora on Project 1")

      patch project_comment_path(project, comment), params: {comment: {content: "This is an updated comment by Barbora on Project 1"}}

      comment.reload
      expect(comment.content).to eq("This is an updated comment by Barbora on Project 1")
    end
  end

  describe "DELETE /projects/123/comments/1" do
    it "should delete comment" do
      comment = Comment.create!(project: project, user: current_user, content: "This is a comment by Barbora on Project 1")

      expect do
        delete project_comment_path(project, comment)
      end.to change(Comment, :count).by(-1)
    end
  end
end
