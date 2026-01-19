class Notification < ApplicationRecord
  include Noticed::Model

  belongs_to :recipient, polymorphic: true

  after_create_commit { notify_customer }

  private

  def notify_customer
    # Reason for using this ApplicationController is to pass locals to layouts
    html = ApplicationController.render(
    partial: "layouts/notification_alert",
    locals: { notification: self }
    )

    broadcast_prepend_to recipient, target: "notifications", html: html
  end
end
