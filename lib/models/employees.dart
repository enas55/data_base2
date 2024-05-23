class Employee {
  final int id;
  final String name;

  Employee({required this.id, required this.name});

  Map<String, Object?> toMap(){
    return {
      'id' : id,
      'name' : name,
    };
  }

  @override
  String toString (){
    return 'Employee {id : $id, name : $name}';
  }
}