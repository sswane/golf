import 'package:flutter/material.dart';

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
    var theme = Theme.of(context);

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
                  const Text('Par Per Hole - Front 9'),
                  SizedBox(
                      height: 80.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                            9,
                            (index) => Container(
                                margin: const EdgeInsets.only(right: 10.0),
                                child: SizedBox(
                                    width: 50.0,
                                    height: 50.0,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  width: 3,
                                                  color: theme.primaryColor))),
                                    )))),
                      )),
                  const Text('Par Per Hole - Back 9'),
                  SizedBox(
                      height: 80.0,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(
                              9,
                              (index) => Container(
                                  margin: const EdgeInsets.only(right: 10.0),
                                  child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    width: 3,
                                                    color:
                                                        theme.primaryColor))),
                                      ))))))
                ],
              ))
        ],
      ),
    );
  }
}
