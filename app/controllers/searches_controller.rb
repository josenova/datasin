class SearchesController < ApplicationController
  before_action :authenticate_user!
  before_action :create, only: [:index]
  before_action :set_target, only: [:index]



  # Results 
  def index
    if @client
      @policies = @client.policies
      @client_history = Search.joins(:user).where("searches.client = ?", @client.identification).group("users.insurance_id, searches.date, searches.id")
      lookup_tickets(@client.identification)
    elsif @company
      @policies = @company.policies
    elsif @vehicle
    
    else
      render action: 'not_found'
    end   
    
  end

  # New Search Root
  def new
  end
  
  # Save User Search
  def create    
    @search = Search.new(search_params)
    @search.user_id = current_user.id
    @search.date = Date.today
		@search.save
  end
  
  def not_found
    
  end


  private
  
		# Set Client and Vehicle variables
		def set_target
		  
			client_query = params[:client]
			vehicle_query = params[:vehicle]
			
			unless client_query.blank?
			
			  client_query = client_query.strip.gsub(/[^0-9]/, '') 
			
				if client_query.length == 11
					@client = Client.find_by(identification: client_query)
				elsif client_query.length == 9 
					@company = Company.find_by(rnc: client_query)
				end
			else
				#load with dummy data to show off results view
				client_query = '00117999383'
				@client = Client.find_by(identification: client_query)
			end
			
			
			unless vehicle_query.blank?
			
				if vehicle_query.length == 17      
					@vehicle = Vehicle.find_by(vin: vehicle_query)
				elsif vehicle_query.length < 8
				  vehicle_query.upcase!
					@vehicle = Vehicle.find_by(plate: vehicle_query) 
				end  
			else
				#load with dummy data to show off results view
				vehicle_query = '1HGBH41JXMN109186'
				@vehicle = Vehicle.find_by(vin: vehicle_query)
			end
			
		end
		
		#Look for tickets in AMET
		def lookup_tickets(cedula)
			agent = Mechanize.new
			page = agent.get('http://consultas.amet.gob.do/')
			form = agent.page.forms.first  
			field = form.field_with(:id => "ctl00_ContentPlaceHolder1_Cedula")
			field.value = cedula  
			form.submit form.button_with(:name => "ctl00$ContentPlaceHolder1$BotonValidar")
			tickets = agent.page.at('#ctl00_ContentPlaceHolder1_GridViewMultas')
			#parse_tickets(tickets)
			@tickets = tickets
	
		end

		#Parse Tickets (no longer needed after AMET redesigned website)
		def parse_tickets(tickets)
			tickets.search("//b").each do |node|
				node.replace Nokogiri::XML::Text.new(node.inner_html, node.document)
			end
		
			tickets.search("//font").each do |node|
				node.replace Nokogiri::XML::Text.new(node.inner_html, node.document)
			end
		
			tickets.search('//*[@align="right"]').each do |node|
				node.remove
			end
			
			tickets.at('//*[@colspan="5"]').remove
		
			@tickets = tickets
		end
  
    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.permit(:client, :vehicle)
    end
    

end
