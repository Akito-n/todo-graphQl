# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
                               description: 'An example field added by the generator'
    def test_field
      'Hello World! Graph'
    end

    field :first_task, TaskType, null: false, description: 'return first task'
    def first_task
      Task.first
    end

    field :all_task, [TaskType], null: false, description: 'all task'
    def all_task
      Task.all
    end

    field :task_search_by, [TaskType], null: false, description: 'task where like match title' do
      argument :task_name, String, required: true
    end
    def task_search_by(task_name:)
      Task.where('title like ?', "%#{task_name}%")
    end
  end
end
