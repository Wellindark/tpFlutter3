class Breeds {
  int id;
  String name;
  String wikipedia_url;
  Breeds.fromJsonMap(Map<String, dynamic> map):
        id = map["id"],
        name = map["name"],
        wikipedia_url = map["wikipedia_url"];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['wikipedia_url'] = wikipedia_url;
    return data;
  }
}