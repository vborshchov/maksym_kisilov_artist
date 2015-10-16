ActiveAdmin.register_page "Dashboard" do

  menu priority: 4, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
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
        panel t(".last_news") do
          ul do
            Post.last(5).map do |news|
              li link_to(news.title, admin_news_path(news))
            end
          end
        end
      end

      column do
        panel t(".information") do
          para "Welcome to ActiveAdmin."
        end
      end
    end
  end
end
