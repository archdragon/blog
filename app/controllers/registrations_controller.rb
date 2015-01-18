class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    if User.count >= 1
      redirect_to root_path, alert: 'Main user already exists. This blog supports only one user.'
    else
      super
    end
  end

  def update
    super
  end
end 