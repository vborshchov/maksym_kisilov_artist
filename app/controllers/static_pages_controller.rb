class StaticPagesController < ApplicationController
  def about
    @info = Info.about
  end

  def contacts
    @info = Info.contacts
    @message = Message.new
  end

  def send_email_form
    @message = Message.new(message_params)

      if @message.valid?
        ContactMailer.contact_email(@message).deliver
        redirect_to :back, notice: t('.success')
      else
        flash.alert = t('.alert')
        redirect_to contacts_path
      end

  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :title, :body)
    end
end
