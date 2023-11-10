import 'package:flutter/material.dart';
import 'package:golf/course/side.dart';

class Par extends StatefulWidget {
  const Par({super.key, required this.side});
  final Side side;

  @override
  State<Par> createState() => _Par();
}

class _Par extends State<Par> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controller =
      List.generate(9, (index) => TextEditingController());

  @override
  void dispose() {
    for (final TextEditingController c in _controller) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var side = widget.side;

    return Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Par Per Hole - ${side.title}'),
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
                              child: TextFormField(
                                keyboardType: TextInputType.number,
                                controller: _controller[index],
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 3,
                                            color: theme.primaryColor))),
                              )))),
                )),
          ],
        ));
  }
}
