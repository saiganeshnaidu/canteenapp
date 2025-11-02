require 'rails_helper'

RSpec.describe "FoodCategories", type: :request do

  let(:user) { User.create!(email: "sai@test.com", password: "password", usertype: 'Admin') }

  before do
    post "/sign_in", params: { email: user.email, password: "password" }
  end

  after do
    user = nil
  end

  describe "POST /create" do
    it 'Should create new Food Category' do
      post '/food_categories', params: { food_category: { name: 'Chinese', category_image: nil } }

      expect(response.status).to eq(302)
    end


    it 'Should create new Food Category and redirect_to food categories index' do
      category_count = FoodCategory.all.count
      post '/food_categories', params: { food_category: { name: 'Chinese', category_image: nil } }
      expect(response).to redirect_to(food_categories_path)
      expect(category_count).to eq(FoodCategory.all.count + 1)

    end
  end
end
