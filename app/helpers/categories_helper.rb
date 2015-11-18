module CategoriesHelper

  def gallery_for(artworks, width=2000, height=450)
    artworks.map do |a|
      catch (:done) do
        p_url = a.picture.url.gsub(/upload\//, 'upload/c_limit,h_1500,w_1500/')
        p_size = FastImage.size(p_url)
        if p_size
          "<figure data-pos='" + a.position.to_s + "' itemprop='associatedMedia' itemscope itemtype='http://schema.org/ImageObject'>" +
            content_tag(:a, cl_image_tag(a.picture, width: width, height: height, crop: :fit, quality: 50, "itemprop": "thumbnail", alt: a.name), href: p_url, data: {size: p_size.join("x")}, itemprop: "contentUrl", onContextMenu: "return false;") +
            "<figcaption itemprop='caption description'>" + about(a) + "</figcaption></figure>"
        else
          throw :done
        end
      end
    end.join("").html_safe
  end
end
