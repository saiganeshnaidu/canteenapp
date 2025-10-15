require 'rails_helper'

RSpec.describe "Customers", type: :request do

  let(:user) { User.create!(email: "test@example.com", password: "password") }

  before do
    post "/sign_in", params: { email: user.email, password: "password" }
  end

  after do
    user = nil
  end

  describe "APIs test" do

    it "does not render the incorrect template" do
      get "/customer_detail"
      expect(response.status).to eq(200)
    end

    it 'Should create new customer' do
      post '/customer_detail', params: {customer: {name: 'Sai Ganesh', phone: '9898980989', user_id: user.id, isapproved: true, isrejected: false}}
      expect(response.status).to eq(302)
    end
  end
end
