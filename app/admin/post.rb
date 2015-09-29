ActiveAdmin.register Post do
  menu priority: 3, label: "Новини"
  index do
    selectable_column
    column :title
    column :archive
    column :created_at
    column :updated_at
    actions
  end

  filter :title, label: "Категорії"
  filter :archive, label: "Архівні новини"

  config.clear_action_items!
  action_item "Edit", only:[:show] do
    link_to "Редагувати", edit_admin_post_path
  end
  action_item "Delete", only:[:show] do
    link_to "Видалити", admin_post_path, method: "delete", data: {confirm: "Ви впевнені що хочете видалити цю роботу?"}
  end
  action_item "New", only:[:index] do
    link_to "Додати новину", new_admin_post_path
  end

  batch_action "В архів" do |ids|
    Post.find(ids).each do |post|
      post.update_attributes(archive: true)
    end
    redirect_to collection_path, alert: "Новина переміщена в архів"
  end

  batch_action "З архіву" do |ids|
    Post.find(ids).each do |post|
      post.update_attributes(archive: false)
    end
    redirect_to collection_path, alert: "Новина переміщена з архіву"
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
