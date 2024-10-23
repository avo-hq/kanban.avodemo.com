class Avo::Resources::Board < Avo::BaseResource
  self.model_class = "Avo::Kanban::Board"

  self.edit_controls = -> {
    default_controls

    if record.persisted?
      link_to "Go to board", avo_kanban.board_path(record), color: :primary, style: :primary, icon: "heroicons/outline/arrow-right"
    end
  }

  self.show_controls = -> {
    default_controls
    link_to "Go to board", avo_kanban.board_path(record), color: :primary, style: :primary, icon: "heroicons/outline/arrow-right"
  }

  def fields
    field :id, as: :id
    field :name, as: :text
    field :description, as: :textarea
    field :allowed_resources, as: :text, format_using: -> { value.join(", ") }, hide_on: :forms
    field :property, as: :text
    field :allowed_resources, as: :tags, suggestions: -> { Avo.resource_manager.resources.map(&:to_s) }
    field :columns_count, as: :number, hide_on: :forms
    field :items_count, as: :number, hide_on: :forms

    field :columns, as: :has_many
  end
end
