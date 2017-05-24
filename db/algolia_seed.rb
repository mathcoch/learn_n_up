Algolia.init :application_id => "LZEMPFONKV", :api_key => "d273e7cc48a855feae0750a9fac8db9a"
def load_data_from_database
  records = Lesson.all.map { |l| {id: l.id, name: l.name, description: l.description[0..120] + " ...", category: l.category, category_number: l.category_number, user_id: l.user.id} }
end
index = Algolia::Index.new("Lesson")
load_data_from_database.each_slice(1000) do |batch|
  index.add_objects(batch)
end
