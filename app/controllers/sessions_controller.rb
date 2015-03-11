# -*- coding: utf-8 -*-
class SessionsController < ApplicationController
  skip_before_filter :require_login

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_path
    else
      flash.now[:danger] = '用户名或密码错误'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
