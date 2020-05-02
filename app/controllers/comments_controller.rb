class CommentsController < ApplicationController
  load_and_authorize_resource
    http_basic_authenticate_with name: "heba", password: "123456", only: :destroy

    def create
      @comment.user_id=current_user.id
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
      end
      
      def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
      end

      private
        def comment_params
          params.require(:comment).permit(:commenter, :body)
        end
end
