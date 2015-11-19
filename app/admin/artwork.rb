ActiveAdmin.register Artwork do
  menu priority: 1

  filter :category_id, as: :select, collection: proc { Category.leaves }
  filter :name
  filter :material

  config.clear_action_items!
  action_item "Edit", only:[:show] do
    link_to t('.artwork.edit.button'), edit_admin_artwork_path
  end

  action_item "Delete", only:[:show] do
    link_to t('.artwork.delete.button'), admin_artwork_path, method: "delete", data: {confirm: t('.artwork.delete.confirm')}
  end

  action_item "New", only:[:index] do
    link_to t('.artwork.new'), new_admin_artwork_path
  end

  batch_action :for_main_page do |ids|
    Artwork.find(ids).each do |artwork|
      artwork.update_attributes(for_main_page: true)
    end
    redirect_to collection_path, add_notice: t('.artwork.add_notice')
  end

  batch_action :from_main_page do |ids|
    Artwork.find(ids).each do |artwork|
      artwork.update_attributes(for_main_page: false)
    end
    redirect_to collection_path, revome_notice: t('.artwork.remove_notice')
  end

  controller do
    before_create do |artwork|
      if Artwork.pluck(:position).compact.blank?
        artwork.position = 0
      else
        artwork.position = Artwork.pluck(:position).compact.max.to_i + 1
      end
    end
  end

  index do
    selectable_column
    column :name
    column :category_id, :sortable => :category_id do |artwork|
      artwork.category.name
    end
    column :for_main_page
    column :dimension
    column :material
    column :year
    column :position
    actions
  end

  index as: :grid, columns: 4  do |artwork|
    resource_selection_cell artwork
    render partial: "artwork", locals: {artwork: artwork}
  end

  show do
    panel "" do
      table_for artwork do |f|
        column " " do |image|
          cl_image_tag(image.picture_url, height: 300, alt: image.name)
        end
      end
    end
  end

  sidebar I18n.t('active_admin.resource.show.artwork.sidebar.title'), only: :show do
    attributes_table_for artwork do
      row t('.artwork.sidebar.name') do |art|
        art.name
      end
      row t('.artwork.sidebar.dimension') do |art|
        art.dimension
      end
      row t('.artwork.sidebar.material') do |art|
        art.material
      end
      row t('.artwork.sidebar.year') do |art|
        art.year
      end
      row t('.artwork.sidebar.category') do |art|
        art.category.name if art.category
      end
    end
  end

  form do |f|
    f.inputs " ", :multipart => true do
      f.input :name
      f.input :dimension
      f.input :material
      f.input :year
      f.input :picture, :as => :file, :hint => image_tag(f.object.picture.url, width: 150, height: 150, crop: :fit)
      f.input :remote_picture_url
      f.input :picture_cache, :as => :hidden
      f.input :category_id, as: :select, :collection => Category.all
      f.input :for_main_page, as: :radio
    end
    f.actions
  end

  permit_params :name, :dimension, :material, :year, :picture, :category_id, :for_main_page, :remote_picture_url
end
