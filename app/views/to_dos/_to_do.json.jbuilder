json.extract! to_do, :id, :task, :detail, :due_date, :due_time, :important, :repeat, :created_at, :updated_at
json.url to_do_url(to_do, format: :json)
