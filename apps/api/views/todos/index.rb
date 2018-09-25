module Api::Views::Todos
  class Index
    include Api::View

    def render
      raw JSON.generate(
        todos.map do |todo|
          {
            id: todo.id,
            title: todo.title
          }
        end
      )
    end
  end
end
