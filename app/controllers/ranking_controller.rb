class RankingController < ApplicationController
  layout "review_site"
  before_action :ranking
  def ranking
    @ranking = Yado.limit(5)
  end
end
