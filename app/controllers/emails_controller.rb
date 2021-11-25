class EmailsController < ApplicationController
  
 
  def index
    @emails = Email.all
  end

  def create
    @email = Email.create(object: Faker::Company.name, body: Faker::Lorem.paragraphs)
    if @email.save
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js { }
    end
    else
    redirect_to root_path
    end
  end

  def show
    @email = Email.find(params[:id])
  end

  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    if @email.destroy
    redirect_to root_path
    end
  end



  

end





