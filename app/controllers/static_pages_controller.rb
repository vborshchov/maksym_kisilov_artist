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

        # TODO: Send email

        redirect_to back, notice: "Email successfully sent."
      else
        # flash.alert = "Email could not be sent. Please check your entries."
        flash.alert = "Пошту не можливо відправити, перевірте свое повідомлення."
        redirect_to contacts_path
      end

  end

  private

    def message_params
      params.require(:message).permit(:name, :email, :title, :body)
    end
end
