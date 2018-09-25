module Api::Views::Todos
  class Create
    include Api::View

    def render
      raw JSON.generate(
        {
          id: todo.id,
          title: todo.title,
          completed: todo.completed,
          url: "https://#{Hanami.environment.host}/#{todo.id}"
        }
      )
    end
  end
end
