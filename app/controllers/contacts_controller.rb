class ContactsController < ApplicationController
  def new
    if user_signed_in
      @contact = Contact.new
    end
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:success] = 'Obrigada pela sua mensagem! Nós retornaremos em breve'
    else
      flash.now[:error] = 'Preencha os campos corretamente '
    end
  end
  private
  def require_logged_in_user
    unless user_signed_in?
      flash[:danger] = 'Área restrita. Por favor, realize o login.'
      redirect_to entrar_url
    end
  end
end
