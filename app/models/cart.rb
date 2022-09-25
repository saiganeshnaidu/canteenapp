class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :foodstore
  has_many :cart_lists, dependent: :destroy
  has_one  :room
  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :chefprofile, dependent: :destroy
  
  after_create_commit :notify_recipient
  after_update_commit :notify_customer

  private
  def notify_recipient
    OrderNotification.with(cart: self, foodstore: foodstore).deliver_later(foodstore.chefprofiles)
    OrderNotification.with(cart: self, foodstore: foodstore).deliver_later(User.find_by(usertype: "Admin"))
  end

  def notify_customer
    OrderNotification.with(cart: self, user: user).deliver_later(user.employee_profile)
    OrderNotification.with(cart: self, user: user).deliver_later(user.normal_customer)
  end

  scope :myorder, ->{ where('user_id = ?', Current.user.id) }

  scope :cheforder, ->{ where('carts.foodstore_id= ?', Current.user.chef_profile.foodstore.id) }
end
