class ApplicationController < ActionController::Base
  private

  # 以下の4行を記述する
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(_resource_or_scope)
    root_path # ←redirect先にしたいpathを自分で書く
  end
end
