module CategoriesHelper

  def gallery_for(artworks)
    artworks.map do |a|
      catch (:done) do
        if FastImage.size(a.picture.url)
          "<figure data-pos='" + a.position.to_s + "' itemprop='associatedMedia' itemscope itemtype='http://schema.org/ImageObject'>" + 
            content_tag(:a, cl_image_tag(a.picture, border: { width: 3, color: '#ffffff' }, width: 2000, height: 200, crop: :fit, "itemprop": "thumbnail"), href: a.picture.url.gsub(/upload\//, 'upload/bo_15px_solid_rgb:fff/'), data: {size: FastImage.size(a.picture.url).join("x")}, itemprop: "contentUrl") + 
            "<figcaption itemprop='caption description'>" + about(a) + "</figcaption></figure>"
        else
          throw :done
        end
      end
    end.join("").html_safe
  end
end
