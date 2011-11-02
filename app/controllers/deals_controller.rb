class DealsController < ApplicationController
  before_filter :is_company?, :except => [:index]
  before_filter :correct_company, :only => [:edit, :update]
  # GET /deals
  # GET /deals.xml
  def index
    if is_company?
      @company = Company.find_by_user_id(current_user.id)
      @deals = @company.deals
      @users = @deals.users
    else
      @deals = Deal.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @deals }
    end
  end

  # GET /deals/1
  # GET /deals/1.xml
  def show
    @deal = Deal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @deal }
    end
  end

  # GET /deals/new
  # GET /deals/new.xml
  def new
    @deal = Deal.new
    
    @deal.milestones.build
    @deal.milestones.build
    @deal.milestones.build
    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @deal }
    end
  end

  # GET /deals/1/edit
  def edit
    @deal = Deal.find(params[:id])
    @company = @deal.company
  end

  # POST /deals
  # POST /deals.xml
  def create
    @deal = Deal.new(params[:deal])
    @company = Company.find_by_user_id(current_user.id)
    @deal.company_id = @company.id
    respond_to do |format|
      if @deal.save
        format.html { redirect_to(@deal, :flash => {:success => 'Deal successfully created.'}) }
        format.xml  { render :xml => @deal, :status => :created, :location => @deal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @deal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /deals/1
  # PUT /deals/1.xml
  def update
    @deal = Deal.find(params[:id])

    respond_to do |format|
      if @deal.update_attributes(params[:deal])
        format.html { redirect_to(@deal, :notice => 'Deal was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @deal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /deals/1
  # DELETE /deals/1.xml
  def destroy
    @deal = Deal.find(params[:id])
    @deal.destroy

    respond_to do |format|
      format.html { redirect_to(deals_url) }
      format.xml  { head :ok }
    end
  end
  
  def buy
    @deal = Deal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @deal }
    end
    
  end 
  
  def execute_buy
    @deal = Deal.find(params[:id])
    current_user.credits -= @deal.org_price
    
   @voucher = @deal.vouchers.build(:user_id => current_user.id, :value=>'2339')
    
   respond_to do |format|
     if @voucher.save
       format.html { redirect_to(purchases_user_path, :flash => {:success => 'You have successfully purchased the deal!.'}) }
     else
       format.html { render :action => "show" }
       format.xml  { render :xml => @deal.errors, :status => :unprocessable_entity }
     end
   end
  end
end

  private
    def correct_company   #if user not signed in, can still edit deals?
      if signed_in?
        @deal = Deal.find(params[:id])
        @company = @deal.company
        redirect_to(root_path) unless current_company?(@company)
      end
    end