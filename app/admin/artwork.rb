ActiveAdmin.register Artwork do
  menu priority: 1

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
  form do |f|
    f.inputs "Artwork", :multipart => true do
      f.input :name, label: "Назва"
      f.input :dimension, label: "Розмір"
      f.input :material, as: :select, :collection => %w(папір холст), label: "Матеріал"
      # if f.object.picture.blank?
      #   f.input :picture, :as => :file, label: "Фото"
      # else
        f.input :picture, :as => :file, :hint => image_tag(f.object.picture.url, width: 150, height: 150, crop: :fit), label: "Фото"
      # end
      f.input :picture_cache, :as => :hidden
      panel 'Категорія' do
        f.input :category, as: :select, :collection => Category.leaves, label: "Категорія"
      end
      # f.input :category, as: :select, :collection => option_groups_from_collection_for_select(Category.roots, :children, :name, :id, :name), label: "Категорія"
    end
    f.actions
  end

  permit_params :name, :dimension, :material, :picture, :paint, :category_id

end
