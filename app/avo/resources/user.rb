class Avo::Resources::User < Avo::BaseResource
  self.title = :name
  self.includes = []
  self.search = {
    query: -> {
      query.ransack(id_eq: params[:q], first_name_cont: params[:q], last_name_cont: params[:q], m: "or").result(distinct: false)
    }
  }

  def fields
    field :id, as: :id
    field :first_name, as: :text
    field :last_name, as: :text
    field :roles, as: :code
    field :slug, as: :text
    field :active, as: :boolean
    field :email, as: :text
  end
end
