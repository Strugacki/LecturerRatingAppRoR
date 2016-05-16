json.array!(@lecturers) do |lecturer|
  json.extract! lecturer, :id, :firstname, :lastname, :age, :rating
  json.url lecturer_url(lecturer, format: :json)
end
