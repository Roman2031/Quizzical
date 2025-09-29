class CategoryModel{  
   int? id;   
   String? name;
  CategoryModel(this.id,this.name);

  factory CategoryModel.fromJson(dynamic json) {
    return CategoryModel(      
      json['id'] as int?,
      json['name'] as String?
      );
  }

  @override
  String toString() {
    // ignore: unnecessary_this
    return '{ ${this.id},${this.name}';
  }
  Map<String, dynamic> toMap() => { 
        "id": id,
        "title": name,
      };
}