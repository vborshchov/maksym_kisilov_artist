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
      "\"#{artwork.name.to_s}\"",
      artwork.dimension.to_s.downcase,
      artwork.material.to_s.downcase,
      artwork.category.name.to_s.capitalize
    ]
    .reject(&:blank?).join(", ")
  end

  def make_title(title=nil)
    [title, t('top_bar.title')].reject(&:blank?).join(" | ")
  end
end