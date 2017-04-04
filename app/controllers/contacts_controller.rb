class ContactsController < ApplicationController
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new contact_params
    if @contact.save
      flash[:success] = t ".contact_success"
      redirect_to root_url
    else
      flash[:danger] = t ".contact_error"
      render :index
    end
  end

  private

  def contact_params
    params.require(:contact).permit :name, :email, :title, :content
  end
end
