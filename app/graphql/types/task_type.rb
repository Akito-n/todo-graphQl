module Types
  class TaskType < Types::BaseObject
    field :id, ID, null: false
    field :title, String, null: false
    field :status, Integer, null: false
    field :priority, Integer, null: false
  end
end
