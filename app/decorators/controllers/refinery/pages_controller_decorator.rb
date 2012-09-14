# encoding: UTF-8

Refinery::PagesController.class_eval do
  before_filter :find_pv_news#, only: [:home, :actualites]
  before_filter :find_agences, only: [:home]

  protected

  def find_agences
    @agences = Refinery::Agences::Agence.showable_on_home
  end

  def find_pv_news
    @pv_news = Refinery::Events::Event.limit(5)
  end
end
