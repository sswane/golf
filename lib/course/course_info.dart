import 'package:flutter/material.dart';
import 'package:golf/course/par.dart';
import 'package:golf/course/side.dart';

class CourseInfo extends StatefulWidget {
  const CourseInfo({super.key});

  @override
  State<CourseInfo> createState() => _CourseInfo();
}

class _CourseInfo extends State<CourseInfo> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameTxtController = TextEditingController();

  @override
  void dispose() {
    nameTxtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Course Info')),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const Text('Course Name'),
          Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.name,
                    controller: nameTxtController,
                    decoration:
                        const InputDecoration(hintText: 'Enter course name'),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
                  const Par(
                    side: Side.front,
                  ),
                  const Par(side: Side.back),
                ],
              ))
        ],
      ),
    );
  }
}
