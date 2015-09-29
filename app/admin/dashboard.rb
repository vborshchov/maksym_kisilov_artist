ActiveAdmin.register_page "Dashboard" do

  menu priority: 4, label: "Останні події" #proc{ I18n.t("active_admin.dashboard") }

  content title: "Останні події" do #proc{ I18n.t("active_admin.dashboard") } do
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

  # Here is an example of a simple dashboard with columns and panels.
  #
    columns do
      column do
        panel "Останні новини" do
          ul do
            Post.last(5).map do |post|
              li link_to(post.title, admin_post_path(post))
            end
          end
        end
      end

      column do
        panel "Інформація" do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end
end
