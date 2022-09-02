class PostsController < ApplicationController   
  before_action :authenticate_user!, except: :index
      
        def index
          @posts = Post.all
        end
          
        def new 
          @post = Post.new
        end

        def create
          @post = current_user.posts.build(post_params)
          if @post.save
            flash[:success] = 'Post successfully created'
            redirect_to posts_path
          else
            flash[:error] = 'Something went wrong'
            render 'new'
          end
        end
      
        # def create
        #   @post = Post.new(post_params)      
        #   if @post.save
        #     redirect_to @post
        #   else 
        #     render :new, status: :unprocessable_entity  
        #   end
        # end
      
        private
        
        # def set_post
        #   @post = Post.find(params[:id])
        # end

        def post_params
          params.require(:post).permit(:title, :content)   
        end
      end

