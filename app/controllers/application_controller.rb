class ApplicationController < ActionController::Base
    before_action :authenticate_user!

    #ログイン後に商品一覧へ遷移
    def after_sign_in_path_for(resource)
        products_path
      end
end
