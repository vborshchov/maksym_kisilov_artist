ActiveAdmin.register Artwork do
  menu priority: 1

  index do
    selectable_column
    column :name
    column :dimension
    column :material
    actions
  end

  index as: :grid, default: true do |artwork|
    link_to cl_image_tag(artwork.picture_url, :width => 1200, :height => 200, :crop => :fit), admin_artwork_path(artwork)
  end

  show do
    panel "" do
      table_for artwork do |f|
        column "Фото" do |image|
          cl_image_tag(image.picture_url, width: -1, height: 300)
        end
      end
    end
  end

  sidebar "Деталі", only: :show do
    attributes_table_for artwork do
      row "Назва" do |art|
        art.name
      end
      row "Розмір" do |art|
        [art.dimension, "см"].reject(&:blank?).join(" ")
      end
      row "Матеріал" do |art|
        art.material
      end
    end
  end

  form do |f|
    f.inputs "Artwork", :multipart => true do
      f.input :name, label: "Назва"
      f.input :dimension, label: "Розмір"
      f.input :material, as: :select, :collection => %w(папір холст), label: "Матеріал"
      f.input :picture, :as => :file, :hint => image_tag(f.object.picture.url, width: 150, height: 150, crop: :fit), label: "Фото"
      f.input :picture_cache, :as => :hidden
      f.input :category, as: :select, :collection => Category.leaves, label: "Категорія"
    end
    f.actions
  end

  permit_params :name, :dimension, :material, :picture, :category_id

end
