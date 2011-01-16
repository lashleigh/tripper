module HomeHelper
  def icon_image(t, str)
    image_tag("/images/parkIcons/#{t}.gif", :alt => t, :title => t, :class => str)
  end
end
