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
  end
end
