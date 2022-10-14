class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :food_store
  has_many :cart_items, dependent: :destroy
  has_one  :room
  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :chef_profile, dependent: :destroy
  
  after_create_commit :notify_recipient
  after_update_commit :notify_customer

  private
  def notify_recipient
    OrderNotification.with(cart: self, food_store: food_store).deliver_later(food_store.chef_profiles)
    OrderNotification.with(cart: self, food_store: food_store).deliver_later(User.find_by(usertype: "Admin"))
  end

  def notify_customer
    OrderNotification.with(cart: self, user: user).deliver_later(user.employee_profile)
    OrderNotification.with(cart: self, user: user).deliver_later(user.customer)
  end

  scope :myorder, ->{ where('user_id = ?', Current.user.id) }

  scope :cheforder, ->{ where('carts.food_store_id= ?', Current.user.chef_profile.food_store.id) }
end
