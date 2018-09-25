module Api::Views::Todos
  class Create
    include Api::View

    def render
      response = { todo: { title: todo.title } }
      raw JSON.generate(response)
    end
  end
end
