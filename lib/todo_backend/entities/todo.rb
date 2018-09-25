# frozen_string_literal: true

class Todo < Hanami::Entity
  def url
    "#{ENV['BASE_URL']}#{Api.routes.path(:todo, id)}"
  end
end
