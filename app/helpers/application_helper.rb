module ApplicationHelper

  def menu_tree_for(categories)
    unless categories.blank?
      categories.to_a.map do |category, nested_categories|
        @category = category
        content_tag(:li, (
          # content_tag(:a, category.name, href: (category.leaf? ? "##" : "#" )) +
          render('layouts/category', locals: {category: @category}) +
          content_tag(:ul, menu_tree_for(nested_categories), class: "dropdown")), class: ("has-dropdown" if nested_categories.size > 0)
        )
      end.join.html_safe
    end
  end

end