class Project < ApplicationRecord
  if Gem::Version.new(Rails.version) >= Gem::Version.new("7.3.0")
    enum :stage, {
      Discovery: "discovery",
      Idea: "idea",
      Done: "done",
      "On hold": "on hold",
      Cancelled: "cancelled",
      Drafting: "drafting"
    }
  else
    enum stage: {
      Discovery: "discovery",
      Idea: "idea",
      Done: "done",
      "On hold": "on hold",
      Cancelled: "cancelled",
      Drafting: "drafting"
    }
  end

  validates :name, presence: true
  # validates :users_required, numericality: {greater_than: 9, less_than: 1000000}

  has_many_attached :files

  belongs_to :user, optional: true

  # has_many :comments, as: :commentable
  # has_many :reviews, as: :reviewable
  # has_and_belongs_to_many :users, inverse_of: :projects

  default_scope { order(name: :asc) }
  
  # def status=(value)
  #   type_of_status = value.to_sym
  # end
end
