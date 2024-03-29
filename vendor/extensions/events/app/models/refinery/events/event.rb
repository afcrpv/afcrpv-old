module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      extend FriendlyId
      self.table_name = 'refinery_events'

      default_scope order("created_at DESC")

      friendly_id :title, use: :slugged

      attr_accessible :title, :category_id, :start_date, :end_date, :description, :position
      belongs_to :category, class_name: "::Refinery::Categories::Category"

      acts_as_indexed :fields => [:title, :description]

      validates :title, :presence => true, :uniqueness => true
      validates :start_date, presence: true
      validates :category_id, presence: true

    end
  end
end
