class GossipsController < ApplicationController
  def index
      @gossips = Gossip.all
  end 

  def create
     # @gossip = Gossip.new(gossip_params)
     #@gossip.save
     #if @gossip.save
	#  redirect_to @gossip
      #else
#	  render 'new'
#      end

      #redirect_to gossip_path(@gossip)
						@gossip = Gossip.new(gossip_params)
						@gossip.anonymous_author = params[:anonymous_author]	
    						@gossip.content = params[:content]
	 		        		@gossip.save
						redirect_to @gossip
  end


  def new
      @gossip = Gossip.new
  end


  def edit
      @gossip = Gossip.find(params[:id])
  end


  def show
      @gossip = Gossip.find(params[:id])
  end


  def update
      @gossip = Gossip.find(params[:id])
      if @gossip.update(gossip_params)
	  @gossip.save
	  redirect_to @gossip
      else
         render 'edit'
      end
						#@gossip = Gossip.find(params[:id])
						#@gossip.anonymous_author = params[:anonymous_author]	
    						#@gossip.content = params[:content]
	 		        		#@gossip.save
						#redirect_to @gossip
  end


  def destroy
      @gossip = Gossip.find(params[:id])
      @gossip.destroy
	
      redirect_to gossips_path
  end

  private
    def gossip_params
      params.permit(:anonymous_author, :content)
      #params.require(:gossip).permit(:anonymous_author, :content)
    end

end

