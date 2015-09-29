ActiveAdmin.register Post do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
  batch_action :in_archive do |ids|
    Post.find(ids).each do |post|
      puts "---------------------------"
      puts post
      puts post.archive.nil?
      puts post.title
      puts post.body.size
      puts post.archive = true
      puts "---------------------------"
    end
    redirect_to collection_path, alert: "The posts have been moved to archive."
  end

  form do |f|
    f.inputs "Новина" do
      f.input :title, label: "Заголовок"
      # f.input :body, label: "Текст"
      f.input :body, :as => :ckeditor
    end
    f.actions
  end

  permit_params :title, :body, :archive

end
