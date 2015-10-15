module ApplicationHelper

  def menu_tree_for(categories)
    unless categories.blank?
      categories.to_a.map do |category, nested_categories|
        @category = category
        content_tag(:li, (
          render('layouts/category', locals: {category: @category}) +
          content_tag(:ul, menu_tree_for(nested_categories), class: "dropdown")), class: ("has-dropdown" if nested_categories.size > 0)
        )
      end.join.html_safe
    end
  end

  def about(artwork)
    [
      artwork.name,
      artwork.dimension,
      artwork.material,
      artwork.category.name
    ].map(&:to_s).each_with_index.map do |field, index|
        unless field == ""
          case index
          when 0
            field = "\"#{field}\""
          # when 1
          #   field +=" см"
          else
            field
          end
        end
      end.reject(&:blank?).join(", ")
  end

  def make_title(title=nil)
    [title, "Максим Кісільов"].reject(&:blank?).join(" | ")
  end
end