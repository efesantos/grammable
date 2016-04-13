class GramsController < ApplicationController

  def index
  end

  def new
    @gram = Gram.new
  end

  def create
    if @gram = Gram.create(gram_params)
      redirect_to root_path
    end
  end

  private
    def gram_params
      params.require(:gram).permit(:message)
    end

end
