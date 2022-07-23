import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:proje/core/components/field/rounded_input_filed.dart';
import 'package:proje/core/extensions/context_extension.dart';
import 'package:proje/core/init/lang/locale_keys.g.dart';

class TodoView extends StatefulWidget {
  TodoView({Key? key}) : super(key: key);

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  List todos = [];
  String todoTitle = '';

  createTodos() {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('Todos').doc(todoTitle);

    Map<String, String> todos = {'todoTitle': todoTitle};

    documentReference.set(todos).whenComplete(() {
      print('$todoTitle created');
    });
  }

  deleteTodos(item) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('Todos').doc(item);

    documentReference.delete().whenComplete(() => print('$item deleted'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.todo_todos.tr()),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: context.colors.onPrimary,
          onPressed: () {
            buildAddToDo(context);
          },
          child: Icon(
            Icons.add,
            color: context.colors.primary,
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('Todos').snapshots(),
          builder: (context, snapshots) {
            if (snapshots.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshots.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot documentSnapshot =
                      snapshots.data!.docs[index];
                  return Dismissible(
                    onDismissed: (direction) {
                      deleteTodos(documentSnapshot['todoTitle']);
                    },
                    key: Key(documentSnapshot['todoTitle']),
                    child: Card(
                      color: context.colors.onBackground,
                      elevation: 4,
                      margin: context.paddingAllDefaultScreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: context.buttonBorderRadius),
                      child: ListTile(
                        title: Text(documentSnapshot['todoTitle']),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: context.colors.error,
                          ),
                          onPressed: () {
                            deleteTodos(documentSnapshot['todoTitle']);
                          },
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ));
  }

  Future<dynamic> buildAddToDo(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: context.buttonBorderRadius),
          title: Text(LocaleKeys.todo_addtodo.tr()),
          content: RoundedInputField(
            hintText: LocaleKeys.todo_hinttext.tr(),
            icon: Icons.note_alt,
            onChanged: (String value) {
              todoTitle = value;
            },
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  createTodos();
                  Navigator.of(context).pop();
                },
                child: Text(
                  LocaleKeys.todo_add.tr(),
                  style: TextStyle(
                    color: context.colors.onSecondary,
                  ),
                )),
          ],
        );
      },
    );
  }
}
