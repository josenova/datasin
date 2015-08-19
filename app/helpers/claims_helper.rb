module ClaimsHelper

	def get_gender(boolean)
    if boolean == true
      "Masculino"
    else
      "Femenino"
    end
  end
  
  
  def get_coverage(boolean)
    if boolean == true
      "DP"
    else
      "Ley"
    end
  end
  
end
