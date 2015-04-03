module CurrentTag extend ActiveSupport::Concern
  protected
  def get_current_tag_name
    tags = Tag.all
    tag_names = Array.new
    tags.each do |tag|
      tag_names << tag.name
    end
    tag_names
  end
end