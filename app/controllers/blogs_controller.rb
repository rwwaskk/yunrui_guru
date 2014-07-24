class BlogsController < ApplicationController
  #before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_god!, 
              :only => [:new, :edit, :create, :update, :destroy]

  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.last(3).reverse
  end


  def archives
    @year_hash = Blog.get_years
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
    
    if params[:id].nil?
      puts 'id is null>>>>>>>>>>>'
      @blog=set_blog()
    else
      @blog=Blog.find(params[:id])
    end
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
  end

  # GET /blogs/1/edit
  def edit
    if params[:id].nil?
      puts 'id is null>>>>>>>>>>>'
      @blog=set_blog()
    else
      @blog=Blog.find(params[:id])
    end
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
     if params[:id].nil?
      puts 'id is null>>>>>>>>>>>'
      @blog=set_blog()
    else
      @blog=Blog.find(params[:id])
    end
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
       if params[:id].nil?
      puts 'id is null>>>>>>>>>>>'
      @blog=set_blog()
    else
      @blog=Blog.find(params[:id])
    end
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      slug_back=params[:title].gsub('-', ' ')
      @blogs = Blog.where(:title=>slug_back)
      if @blogs.count>=1
        @blog=@blogs.first
      else
        puts 'sorry, this blog has been removed'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
