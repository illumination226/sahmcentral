class CommentsController < ApplicationController
  before_filter :valid, :except => [:create]
  
  def valid
    if !session[:user_id]
      flash[:notice] = "Please login"
      redirect_to :controller => 'login', :action => 'index'
    end
  end
  
  # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new(params[:comment])
	
	print "hello"
	
	if @comment.post_id.nil?
	
	@redirect_value = Announcement.find(:first, :conditions => "id = '#{@comment.announcement_id}'")

	else
	
    @redirect_value = Post.find(:first, :conditions => "id = '#{@comment.post_id}'")

	end

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@redirect_value) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        flash[:notice] = 'Unable to add Comment please fill out all fields.'
        format.html { redirect_to(@redirect_value) }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to(@comment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to(comments_url) }
      format.xml  { head :ok }
    end
  end
end
