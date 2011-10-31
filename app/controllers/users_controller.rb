class UsersController < ApplicationController
  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only => [:show, :edit, :update]
  before_filter :signed_in_user,:only => [:new, :create] #prevent signedin user from creating new user?
  before_filter :admin_user,   :only => [:index, :destroy]


  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end
  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(current_user.id)
    @title = @user.name

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @title = "Sign up"
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @title = "Edit user"
    @user = User.find(current_user.id)
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    if @user.save
      if @user.is_company?
        @company = Company.create(:name => @user.name, :user_id => @user.id)
        @company.save
      end
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      @user.password = @user.password_confirmation = nil
      render 'new'
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(current_user.id)

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(profile_path, :flash => {:success => 'Profile updated.'}) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User destroyed."

    respond_to do |format|
      format.html { redirect_to(users_path) }
      format.xml  { head :ok }
    end
  end

  private
    #deny access in session_helper
    def authenticate
      deny_access unless signed_in?
    end

    #current_user? defined in session_helper
    def correct_user
      @user = User.find(current_user.id)
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end

    def signed_in_user
      if signed_in?
        flash[:info] = "You are already logged in"
        redirect_to(root_path)
      end
    end
end
