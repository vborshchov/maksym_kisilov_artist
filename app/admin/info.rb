ActiveAdmin.register Info do
  menu priority: 5

  filter :page, as: :select, label: "Строінка"

  config.clear_action_items!
  action_item "Edit", only:[:show] do
    link_to "Редагувати", edit_admin_info_path
  end
  action_item "Delete", only:[:show] do
    link_to "Видалити", admin_info_path, method: "delete", data: {confirm: "Ви впевнені що хочете видалити цю роботу?"}
  end
  action_item "New", only:[:index] do
    link_to "Додати інформацію", new_admin_info_path
  end

  index do
    selectable_column
    column :id
    column :page
    column :created_at
    column :updated_at
    actions
  end

  form do |f|
    f.inputs " " do
      f.input :page, label: "Сторінка", as: :radio, :collection => %w(about contacts)
      f.input :content, :as => :ckeditor
    end
    f.actions
  end

  permit_params :page, :content

end
