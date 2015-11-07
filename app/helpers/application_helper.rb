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

  def hash_tree_to_hash(ht, root=false)
    result = []
    ht.each_pair do |k,v|
      result << if v.is_a?(Hash) && v != {}
        {
          "name": k.name,
          "children": hash_tree_to_hash(v)
        }
      else
        # MODIFY HERE! Look for what you want to find in the hash here
        { "name": "#{k.name}" }
      end
    end
    result = {name: root}.merge(children: result)  if root.is_a?(String)
    result
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