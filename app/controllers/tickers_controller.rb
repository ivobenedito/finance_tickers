class TickersController < ApplicationController
  
	def external_links
		@ticker = Ticker.find(params[:id])
	end
	
	# GET /tickers
  # GET /tickers.xml
  def index
    @tickers = Ticker.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tickers }
    end
  end

  # GET /tickers/1
  # GET /tickers/1.xml
  def show
    @ticker = Ticker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticker }
    end
  end

  # GET /tickers/new
  # GET /tickers/new.xml
  def new
    @ticker = Ticker.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticker }
    end
  end

  # GET /tickers/1/edit
  def edit
    @ticker = Ticker.find(params[:id])
  end

  # POST /tickers
  # POST /tickers.xml
  def create
    @ticker = Ticker.new(params[:ticker])

    respond_to do |format|
      if @ticker.save
        format.html { redirect_to(@ticker, :notice => 'Ticker was successfully created.') }
        format.xml  { render :xml => @ticker, :status => :created, :location => @ticker }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tickers/1
  # PUT /tickers/1.xml
  def update
    @ticker = Ticker.find(params[:id])

    respond_to do |format|
      if @ticker.update_attributes(params[:ticker])
        format.html { redirect_to(@ticker, :notice => 'Ticker was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tickers/1
  # DELETE /tickers/1.xml
  def destroy
    @ticker = Ticker.find(params[:id])
    @ticker.destroy

    respond_to do |format|
      format.html { redirect_to(tickers_url) }
      format.xml  { head :ok }
    end
  end
end
