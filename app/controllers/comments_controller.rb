class CommentsController < ApplicationController
	def index
		@comment = Comment.all
	end	

	def new
		@comment = Comment.new
	end
	
	def create
		@comment = current_user.comments.new(comment_params)
    	if @comment.save
        	redirect_to comments_path(@comment)
      	end
	end

	def show
		@comment = Comment.find(params[:id])
	end

	def edit
		@comment = Comment.find(params[:id])
		@user = current_user
	end

	def update
		@comment = Comment.find(params[:id])
		@user = current_user
		@comment.update(comment_params)
      redirect_to @comment
	end

	def destroy
		@user = current_user
		@comment = Comment.find(params[:id])
		@comment.destroy
		redirect_to comments_path
	end	

	private
	def comment_params
		params.require(:comment).permit(:user_id, :location, :title, :body)
	end
end
