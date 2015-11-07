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

  # remove_filter :ancestor_hierarchies
  # remove_filter :descendant_hierarchies
  filter :artworks
  filter :name

  index do
    selectable_column
    column :name
    column :parent_id, :sortable => :parent_id do |category|
      category.parent.name if category.parent
    end
    actions
  end

  sidebar " ", only: :index do
    render partial: "caterogies_tree" # Graph of caterogies hierarchy goes here
  end

  form do |f|
    f.inputs I18n.t('activerecord.models.all_category.one') do
      f.input :name
      f.input :parent_id, as: :select, collection: Category.all
    end
    f.actions
  end

  permit_params :name, :position, :parent_id

end
