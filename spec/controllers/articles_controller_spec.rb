require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do

	it "renders the index template" do
		get :index
		expect(response).to render_template("index")
	end

	it "render show" do
		get :show
		response.body.should have_content("This is article")
		# expect(page).to have_content("This is article")
	end
end
