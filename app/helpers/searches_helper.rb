module SearchesHelper

  def nav_link(link_text, link_path, link_id = "")
    class_name = current_page?(link_path) ? 'current' : nil
    content_tag(:li, :class => class_name, id: link_id) do
      link_to link_text, link_path
    end
  end
  
  
  
  
end
