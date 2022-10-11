module NavigationHelper
    def nav_links(style)
      if logged_in?
        if (employee? && validate_employee?)
          (link_to 'Order history', order_history_path, class: "#{style} header-space") +
          (link_to 'Notifications', noticee_path, class: "#{style} header-space") +
          (link_to 'Dashboard', employee_profile_path(Current.user.employee_profile), class: "#{style} header-space")


        elsif (customer? && validate_customer?)
          (link_to 'Order history', order_history_path, class: "#{style} header-space") +
          (link_to 'Notifications', customer_notice_path, class: "#{style} header-space") +
          (link_to 'Dashboard', customer_path(Current.user.customer), class: "#{style} header-space")


        elsif (chef? && validate_chef?)
          (link_to 'Received Orders', order_path, class: "#{style} header-space") +
          (link_to 'Notifications', notice_path, class: "#{style} header-space") +
          (link_to 'Dashboard', chef_profile_path(Current.user.chef_profile), class: "#{style} header-space")

         elsif admin?
          (link_to 'All Orders', carts_path, class: "#{style} header-space") +
          (link_to 'Show Notifications', admin_notice_path, class: "#{style} header-space") +
          (link_to 'Dashboard', admin_dashboard_path, class: "#{style} header-space")

        end

      else
        (link_to 'Sign up', sign_up_path, class: "#{style} header-space") +
        (link_to 'Login', sign_in_path, class: "#{style} header-space") 
      end
    end
end