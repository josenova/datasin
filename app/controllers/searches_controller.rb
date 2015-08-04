class SearchesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_target, only: [:index]
  #before_action :create, only: [:index]


  # Results Index 
  def index
    if @client
      @policies = Policy.where(client_id: @client.id)
      @claims = Claim.where("policy_id = ?", @policies.each)
      @history = Search.where("client = ?", @client.identification)
      #lookup_tickets(@client.identification)
    elsif @company
      @policies = Policy.where(company_id: @company.id)
      @claims = Claim.where("policy_id = ?", @policies.each)
    end
      #create more policies to comprobar ascending desc order    
    
  end

  # New Search Root
  def new
    @search = Search.new
  end
  
  # Save User Search
  def create
    
    @search = Search.new(search_params)
    @search.user_id = current_user.id

    respond_to do |format|
      if @search.save
        format.html { redirect_to searches_url(:client => @search.client, :vehicle => @search.vehicle) }
      else
        format.html { render :new } #Create error page
      end
    end
  end


  private
  
		# Set Client and Vehicle variables
		def set_target
			client_query = params[:client]
			vehicle_query = params[:vehicle]
			
				if client_query.length == 11
					@client = Client.find_by(identification: client_query)
				elsif client_query.length == 9 
					@company = Company.find_by(rnc: client_query)
				end
			
				if vehicle_query.length == 17      
					@vehicle = Vehicle.find_by(vin: vehicle_query)
				elsif vehicle_query.length < 8
					@vehicle = Vehicle.find_by(plate: vehicle_query) 
				end  
		end
		
		#Look for tickets in AMET
		def lookup_tickets(cedula)
			agent = Mechanize.new
			page = agent.get('http://amet.pgr.gob.do/Consulta/Default.aspx')
			form = agent.page.forms.first  
			field = form.field_with(:id => "ContentPlaceHolder1_wucAmet1_tbCedula")
			field.value = cedula  
			form.submit form.button_with(:name => "ctl00$ContentPlaceHolder1$wucAmet1$btBuscar")
			tickets = agent.page.at('#ContentPlaceHolder1_wucAmet1_gvAmet')
			parse_tickets(tickets)
	
		end

		#Parse Tickets 
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
      params.require(:search).permit(:client, :vehicle)
    end
    

end
