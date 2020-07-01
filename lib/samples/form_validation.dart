import 'package:flutter/material.dart';

class MyFormValidation extends StatefulWidget {
  @override
  _MyFormValidationState createState() => _MyFormValidationState();
}

class _MyFormValidationState extends State<MyFormValidation> {
  final _formKey = GlobalKey<FormState>();
  FocusNode nameFocusNode;

  final nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    nameFocusNode.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Form Validation'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty) {
                        return '공백은 허용되지 않습니다.';
                      }
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Scaffold.of(_formKey.currentContext)
                              .showSnackBar(SnackBar(content: Text('처리중')));
                        }
                      },
                      child: Text('완료'),
                    ),
                  ),
                  TextField(
                    controller: nameController,
                    onChanged: (text) {
                      print(text);
                    },
                    focusNode: nameFocusNode,
                    decoration: InputDecoration(
                        hintText: '이름을 입력해 주세요',
                        border: InputBorder.none,
                        labelText: '이름'),
                    autofocus: true,
                  ),
                  RaisedButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus(nameFocusNode);
                    },
                    child: Text('포커스'),
                  ),
                  RaisedButton(
                    onPressed: () {
                      print(nameController.text);
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          content: Text(nameController.text),
                        );
                      },);
                    },
                    child: Text('TextField 값 확인'),
                  )
                ],
              )),
        ));
  }
}
