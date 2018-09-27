module Api::Views::Todos
  class Index
    include Api::View

    def render
      raw JSON.generate(
        todos.map do |todo|
          {
            id: todo.id,
            title: todo.title,
            completed: todo.completed,
            order: todo.order,
            url: todo.url
          }
        end
      )
    end
  end
end
