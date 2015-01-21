module PostsHelper
  def images_select_options
    Image.all.map { |image| [image.name, image.id] }
  end
end
