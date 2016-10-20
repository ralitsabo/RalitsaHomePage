require 'spec_helper'
require 'rails_helper'

RSpec.describe ApplicationController do
  it "responds successfully" do
    get :index
    expect(response.status).to eq(200)
  end
end