ActiveAdmin.register Category, :as => "All Category" do
  menu priority: 2

  around_filter do |controller, action|
      Category.class_eval do
        alias :__active_admin_to_param :to_param
        def to_param() id.to_s end
      end

      begin
        action.call
      ensure
        Category.class_eval do
          alias :to_param :__active_admin_to_param
        end
      end
    end

  remove_filter :ancestor_hierarchies
  remove_filter :descendant_hierarchies

  config.clear_action_items!
  action_item "Edit", only:[:show] do
    link_to "Редагувати", edit_admin_all_category_path
  end
  action_item "Delete", only:[:show] do
    link_to t('.category.delete.button'), admin_all_category_path, method: "delete", data: {confirm: t('.category.delete.confirm')}
  end
  action_item "New", only:[:index] do
    link_to t('.category.new'), new_admin_all_category_path
  end

  index do
    selectable_column
    column "Назва", :name
    column "Батьківська категорія", :parent_id, :sortable => :parent_id do |category|
      category.parent.name if category.parent
    end
    actions
  end

  sidebar "Графік", only: :index do
    # graph of caterogies hierarchy goes here
  end

  form do |f|
    f.inputs "Категорія" do
      f.input :name, label: "Назва"
      f.input :parent_id, as: :select, collection: Category.all, label: "Батьківська категорія"
    end
    f.actions
  end

  permit_params :name, :position, :parent_id

end
