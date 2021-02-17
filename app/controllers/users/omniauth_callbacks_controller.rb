class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def facebook
        @user = User.from_omniauth(request.env["omniauth.auth"])

        if @user.persisted?
            sign_in_and_redirect @user, notice: 'sesion iniciada con Facebook'
        else
            redirect_to root_path, alert: 'No se pudo iniciar sesion con Facebook'
        end
    end
end