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
      f.input :name
      f.input :dimension
      f.input :material
      f.input :picture, :as => :file, :hint => cl_image_tag(f.object.picture.url, width: 150, height: 150, crop: :fit)
      f.input :picture_cache, :as => :hidden
      f.input :paint
      f.input :category, as: :select, :collection => Category.all
    end
    f.actions
  end

  permit_params :name, :dimension, :material, :picture, :paint, :category_id

end