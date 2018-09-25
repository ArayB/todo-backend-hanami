module Api::Views::Todos
  class Create
    include Api::View

    def render
      raw JSON.generate(
        {
          id: todo.id,
          title: todo.title,
          completed: todo.completed,
          url: routes.path(:todo, todo.id)
        }
      )
    end
  end
end
