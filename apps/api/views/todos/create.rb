module Api::Views::Todos
  class Create
    include Api::View

    def render
      raw JSON.generate(
        {
          id: todo.id,
          title: todo.title,
          completed: todo.completed,
          order: todo.order,
          url: todo.url
        }
      )
    end
  end
end
