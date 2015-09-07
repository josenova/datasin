module SearchesHelper

  def nav_link(link_text, link_path, link_id = "")
    class_name = current_page?(link_path) ? 'current' : nil
    content_tag(:li, :class => class_name, id: link_id) do
      link_to link_text, link_path
    end
  end
  
  
  def get_client_details(policy)
  
  	if policy.client_id 	
  	  details = [[policy.client.name,policy.client.surname].join(' '), policy.client.identification.insert(3, '-').insert(11, '-')]  
  	elsif policy.company_id
  	  details = [policy.company.name, policy.company.rnc.to_s.insert(3, '-').insert(7, '-')]  
  	end
  	content_tag :ul do
  	    details.collect {|item| concat(content_tag(:li, item))}
  	  end
  end
  
  
end
