class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    #@user = User.find(params[:id])

    #ログイン後に商品一覧へ遷移
    def after_sign_in_path_for(resource)
        products_path
    end

    #ログアウト後はログイン画面に遷移
    def after_sign_out_path_for(resource)
        '/users/sign_in'
    end

    private

    def current_cart
        Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
        cart = Cart.create
        session[:cart_id] = cart.id
        cart
    end
end
