require "rails_helper"

RSpec.describe "Projects", type: :request do
  include Capybara::RSpecMatchers

  describe "GET /projects" do
    it "loads projects" do
      Project.create!(name: "Project 1")
      get projects_path
      expect(response).to have_http_status(200)
      expect(response.body).to have_content("Project 1")
    end
  end

  describe "GET /projects/123" do
    it "loads project and comments" do
      project = Project.create!(name: "Project 1")
      user = User.create!(name: "Barbora")
      Comment.create!(project: project, content: "This is a comment by Barbora on Project 1", user: user)
      get project_path(project)
      expect(response).to have_http_status(200)
      expect(response.body).to have_content("Project 1")
      expect(response.body).to have_content("This is a comment by Barbora on Project 1")
    end
  end
end
