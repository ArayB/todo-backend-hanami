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
            url: "https://#{Hanami.environment.host}/#{todo.id}"
          }
        end
      )
    end
  end
end
