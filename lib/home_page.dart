import 'package:data_base/helpers/sql_helper.dart';
import 'package:data_base/models/employees.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var sqlHelper = SqlHelper();
  List <Employee> employee = [];

  Future<void> getEmployee() async {
    employee = await sqlHelper.getEmployees();
    setState(() {});
  }

  @override
  void initState() {
    getEmployee();
    super.initState();
    
  }

  var e = Employee(id: 1, name: 'ali');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employees Names'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(e.name)
          ],
        ),
      ),
    );
  }
}
