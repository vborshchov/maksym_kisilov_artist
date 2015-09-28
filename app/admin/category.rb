ActiveAdmin.register Category, :as => "All Category" do
  # before_filter :skip_sidebar!, :only => :index
  menu priority: 2

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
  remove_filter :ancestor_hierarchies
  remove_filter :descendant_hierarchies

  permit_params :name, :position, :parent_id

end
