import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';

class AddPlayer extends StatefulWidget {
  const AddPlayer({super.key});
  @override
  State<AddPlayer> createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameTxtController = TextEditingController();
  final handicapTxtController = TextEditingController();
  late FocusNode nameFieldFocusNode;
  late FocusNode handicapFieldFocusNode;

  @override
  void initState() {
    super.initState();
    nameFieldFocusNode = FocusNode();
    handicapFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    nameTxtController.dispose();
    handicapTxtController.dispose();
    nameFieldFocusNode.dispose();
    handicapFieldFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Add Golfers'),
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: <Widget>[
                Expanded(
                    child: TextFormField(
                  autofocus: true,
                  focusNode: nameFieldFocusNode,
                  controller: nameTxtController,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(hintText: 'Name'),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      nameFieldFocusNode.requestFocus();
                      return 'Name is required';
                    }
                    if (appState.players.singleWhereOrNull(
                            (player) => player.name == value.trim()) !=
                        null) {
                      nameFieldFocusNode.requestFocus();
                      return 'No duplicate names allowed';
                    }
                    return null;
                  },
                  onFieldSubmitted: (String? value) {
                    handicapFieldFocusNode.requestFocus();
                  },
                )),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10.0)),
                Expanded(
                  child: TextFormField(
                    autofocus: true,
                    focusNode: handicapFieldFocusNode,
                    controller: handicapTxtController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(hintText: 'Handicap'),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        handicapFieldFocusNode.requestFocus();
                        return 'Player handicap is required';
                      }
                      return null;
                    },
                    onFieldSubmitted: (String? value) {
                      if (_formKey.currentState!.validate()) {
                        appState.addPlayer(nameTxtController.text,
                            double.parse(handicapTxtController.text));
                        handicapTxtController.clear();
                        nameTxtController.clear();
                        nameFieldFocusNode.requestFocus();
                      }
                    },
                  ),
                )
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      appState.addPlayer(nameTxtController.text,
                          double.parse(handicapTxtController.text));
                      nameTxtController.clear();
                      handicapTxtController.clear();
                      nameFieldFocusNode.requestFocus();
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
