require 'rails_helper'

RSpec.describe "Customers", type: :request do

  let(:user) { User.create!(email: "sai@test.com", password: "password") }

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
      # expect(response).to render_template(:new) We can't handle templates with request testing
    end

    it 'Should create new customer' do
      post '/customer_detail', params: {customer: {name: 'Sai Ganesh', phone: '9898980989', user_id: user.id, isapproved: true, isrejected: false}}
      expect(response.status).to eq(302)
      expect(response.body).to include("<html><body>You are being <a href=\"http://www.example.com/customers/#{Customer.last.id}\">redirected</a>.</body></html>")
    end
  end
end
