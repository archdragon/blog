module PostsHelper
  def images_select_options
    images_array = Image.all.map { |image| [image.name, image.id] }
  end
end
