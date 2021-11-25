class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  def index
    @emails = Email.all
  end

  def show
    @email.update(read: true) if !@email.read

    respond_to do |format|
      format.html{}
      format.js{}
    end
  end

  def new
    create
  end

  def edit
  end

  def create
    @email = Email.create(object: Faker::Company.name, body: Faker::Lorem.paragraphs)

    respond_to do |format|
      if @email.save
        format.html { redirect_to @email, notice: 'Email was successfully created.' }
        format.js {}
      else
        format.html { render :new }
        format.js {}
      end
    end
  end

  def update
    if params[:invertRead] == true
      @email.update(read: !@email.read)
      respond_to do |format|
        format.html{}
        format.js{}
      end
    else
      respond_to do |format|
        if @email.update(email_params)
          format.html { redirect_to @email, notice: 'Email was successfully updated.' }
          format.js {}
        else
          format.html { render :edit }
          format.js {}
        end
      end
    end
  end

  def destroy
    @emailId = @email.id;
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_url, notice: 'Email was successfully destroyed.' }
      format.js{}
    end
  end

  private
 
  def set_email
    @email = Email.find(params[:id])
  end

 
  def email_params
    params.fetch(:email, {})
  end
end





