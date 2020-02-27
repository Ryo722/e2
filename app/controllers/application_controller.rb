class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    #ログイン後に商品一覧へ遷移
    def after_sign_in_path_for(resource)
        products_path
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
