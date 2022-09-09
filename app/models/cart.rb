class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :foodstore
  has_many :cart_lists, dependent: :destroy
  validates :user_id, presence: true
  validates :foodstore_id, presence: true

  has_one  :room
  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, through: :chefprofile, dependent: :destroy

  after_create_commit :notify_recipient
  after_update_commit :notify_employee
  after_create_commit :notify_admin


  private
  def notify_recipient
    OrderNotification.with(cart: self, foodstore: foodstore).deliver_later(foodstore.chefprofiles)
  end

  def notify_employee
    OrderNotification.with(cart: self, user: user).deliver_later(user.employee_profile)
  end
  def notify_admin
    OrderNotification.with(cart: self, foodstore: foodstore).deliver_later(User.find_by(usertype: "Admin"))
  end

end
