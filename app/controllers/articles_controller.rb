class ArticlesController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
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
       

    end
    def edit
       
    end
    def update
       
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
        
        if @article.destroy
            flash[:danger] ="Article was Sucessfully Delete"
        end    

        redirect_to articles_path(@article)
    end

    def set_user
        @article=Article.find(params[:id])
    
    end
  

    private

    def article_params
      params.require(:article).permit(:title, :description)
      end
    
end
