class ArticlesController < ApplicationController
 
    def new
        @article = Article.new

    end
    def create
    #  render plain: params[:article].inspect
    @article = Article.new(article_params)
    if @article.save
        flash[:success] ="Article was Sucessfully created"
     
        redirect_to article_path(@article)
    else
        render 'new' 
    end


    # @article.save
    # redirect_to article_path(@article)

    end
    def show
        @article=Article.find(params[:id])

    end
    def edit
        @article=Article.find(params[:id])
    end
    def update
        @article=Article.find(params[:id])
        if @article.update(article_params)
            flash[:success] ="Article was Sucessfully updated"
            redirect_to article_path(@article)
        else
            render 'edit' 
        end
    end

    def index
        @articles=Article.all 

    end

    def destroy
        @article=Article.find(params[:id])
        if @article.destroy
            flash[:danger] ="Article was Sucessfully Delete"
        end    

        redirect_to articles_path(@article)


    end

    private

    def article_params
      params.require(:article).permit(:title, :description)
      end
    
end
