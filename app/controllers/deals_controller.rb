class DealsController < ApplicationController
  before_filter :is_company?, :except => [:index]
  before_filter :correct_company, :only => [:edit, :update]
  # GET /deals
  # GET /deals.xml
  def index
    @title = "Deals"
    if is_company?
      @company = Company.find_by_user_id(current_user.id)
      @deals = @company.deals
    else
      @deals = Deal.all.sort{|a,b| b.popularity <=> a.popularity}  #most popular first
    end
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @deals }
    end
  end

  # GET /deals/1
  # GET /deals/1.xml
  def show
    @title = "Deals"
    @deal = Deal.find(params[:id])
    
    @current_price = '10.00'
    @people = @deal.vouchers.count
    @milestones = @deal.milestones


    @max = @milestones.maximum('people')
    @percentage = @people / (@max * 1.0)
    @sorted_milestones = @deal.milestones.sort{|a,b| b.people <=> a.people}

    @time_left = ((@deal.startdate.to_datetime.utc + @deal.duration - DateTime.now.utc) * 24 * 60).to_i
    
    @company = Company.find(@deal.company_id)

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
    @company = Company.find(@deal.company_id)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @deal }
    end
    
  end 
  
  def execute_buy
    @deal = Deal.find(params[:id])
    @user = User.find(current_user.id)
    @user.credits -= @deal.org_price
    @voucher = @deal.vouchers.build(:user_id => current_user.id)
    @company = Company.find(@deal.company_id)
    @people = @deal.vouchers.count
    @milestones = @deal.milestones


    @max = @milestones.maximum('people')
    @percentage = @people / (@max * 1.0)
    @sorted_milestones = @deal.milestones.sort{|a,b| b.people <=> a.people}


   respond_to do |format|
     if @voucher.save and @user.save
       format.html { redirect_to(purchases_path, :flash => {:success => 'You have successfully purchased the deal!'}) }
     else
       format.html { render :action => "show" }
       format.xml  { render :xml => @deal.errors, :status => :unprocessable_entity }
     end
   end
  end

  def popularity_decrease
    @deal = Deal.find(params[:id])
    @deal.popularity -= 1
    respond_to do |format|
      if @deal.save
        format.html { redirect_to(@deal, :flash => {:success => 'You have successfully buried!'}) }
      else
        format.html {render :action => "show"}
      end
    end
  end

  def popularity_increase
    @deal = Deal.find(params[:id])
    @deal.popularity += 1
    respond_to do |format|
      if @deal.save
        format.html { redirect_to(@deal, :flash => {:success => 'You have successfully bidded!'}) }
      else
        format.html {render :action => "show"}
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
end

