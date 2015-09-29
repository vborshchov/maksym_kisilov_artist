ActiveAdmin.register Category, :as => "All Category" do
  menu priority: 2, label: "Категорії"

  remove_filter :ancestor_hierarchies
  remove_filter :descendant_hierarchies

  permit_params :name, :position, :parent_id

end
