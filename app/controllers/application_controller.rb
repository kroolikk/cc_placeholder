# -*- encoding: utf-8 -*-

class ApplicationController < ActionController::Base
  protect_from_forgery

  def index    
  end


  def subscribe
    if params[:email].present? && params[:email] =~ /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
      @subscribtion = Subscription.new(:email => params[:email])
      if @subscribtion.save
        Notifier.subscription_notification(@subscribtion).deliver
        redirect_to root_url, notice: "Adres został zapisany. Dziękujemy."
      else
        redirect_to root_url, alert: "Nie udało się zapisac adresu."
      end
    else
      redirect_to root_url, alert: "Podaj prawidłowy adres e-mail."
    end
  end
end
