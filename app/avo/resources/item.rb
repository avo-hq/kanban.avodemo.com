class Avo::Resources::Item < Avo::BaseResource
  self.model_class = "Avo::Kanban::Item"
  self.visible_on_sidebar = false

  def fields
    field :id, as: :id
    field :record, as: :belongs_to, polymorphic_as: :record, types: [::User, ::Project]
    field :position, as: :number
    field :board, as: :belongs_to
    field :column, as: :belongs_to
  end
end
