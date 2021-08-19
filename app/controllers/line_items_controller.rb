class LineItemsController < ApplicationController
  include CurrentCart
  before_filter :set_line_item, :only => [:show, :edit, :update, :destroy]
  before_filter :set_cart, :only => [:create]

  # GET /line_items
  # GET /line_items.xml
  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @line_items }
    end
  end

  # GET /line_items/1
  # GET /line_items/1.xml
  def show
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @line_item }
    end
  end

  # GET /line_items/new
  # GET /line_items/new.xml
  def new
    @line_item = LineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @line_item }
    end
  end

  # GET /line_items/1/edit
  def edit
    @line_item = LineItem.find(params[:id])
  end

  # POST /line_items
  # POST /line_items.xml
  def create
    instrument = Instrument.find(params[:instrument_id])
    @line_item = @cart.add_instrument(instrument)
    #@line_item = LineItem.new(params[:line_item])

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to(@line_item.cart, :notice => 'Item added to Cart.') }
        format.xml  { render :xml => @line_item, :status => :created, :location => @line_item }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @line_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /line_items/1
  # PUT /line_items/1.xml
  def update
    @line_item = LineItem.find(params[:id])

    respond_to do |format|
      if @line_item.update_attributes(params[:line_item])
        format.html { redirect_to(@line_item, :notice => 'LineItem was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @line_item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.xml
  #format.html { redirect_to(line_items_url) }
  def destroy
    @line_item = LineItem.find(params[:id])
    @cart = Cart.find(session[:cart_id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to cart_path(@cart) }
      format.xml  { head :ok }
    end
  end

  private

    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

  
end
