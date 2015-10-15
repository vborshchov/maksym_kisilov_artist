ActiveAdmin.register Artwork do
  menu priority: 1

  filter :category, label: "Категорії", as: :select, collection: proc { Category.leaves }
  filter :name, label: "Назва"
  filter :material, label: "Матеріал"

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

  batch_action "На головну" do |ids|
    Artwork.find(ids).each do |artwork|
      artwork.update_attributes(for_main_page: true)
    end
    redirect_to collection_path, notice: "Успішно додано на головну сторінку"
  end

  batch_action "Прибрати з головної" do |ids|
    Artwork.find(ids).each do |artwork|
      artwork.update_attributes(for_main_page: false)
    end
    redirect_to collection_path, notice: "Успішно прибрано з головної сторінки"
  end

  controller do
    # params[:artwork].merge!({ position: Artwork.pluck(:position).max + 10 })
    # create!
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
    column :position
    column :category_id, :sortable => :category_id do |artwork|
      artwork.category.name
    end
    column :for_main_page
    column :dimension
    column :material
    actions
  end

  index as: :grid, columns: 4  do |artwork|
    resource_selection_cell artwork
    render partial: "artwork", locals: {artwork: artwork}
    #link_to cl_image_tag(artwork.picture_url, height: 200, alt: artwork.name), admin_artwork_path(artwork)
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

  sidebar " ", only: :show do
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
      row t('.artwork.sidebar.category') do |art|
        art.category.name if art.category
      end
    end
  end

  form do |f|
    f.inputs "Робота", :multipart => true do
      f.input :name
      f.input :dimension
      f.input :material
      f.input :picture, :as => :file, :hint => image_tag(f.object.picture.url, width: 150, height: 150, crop: :fit)
      f.input :remote_picture_url
      f.input :picture_cache, :as => :hidden
      f.input :category_id, as: :select, :collection => Category.leaves
      f.input :for_main_page, as: :radio
    end
    f.actions
  end

  permit_params :name, :dimension, :material, :picture, :category_id, :for_main_page, :remote_picture_url
end
