import 'package:flutter/material.dart';

class Edit extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return EditState();
  }
}
class EditState extends State<Edit>{
  final TextEditingController taskController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  List<String> _tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Update '),
      ),
      body: Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Form(
              key: _formkey,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: taskController,
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.black87
                      ),
                      decoration: InputDecoration(
                        hintText: 'Type a new task here',
                        hintStyle: TextStyle(
                          fontSize: 20
                        )
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value){
                        if(value!.trim().isEmpty){
                          return 'Task field it\'s required';
                        }
                        return null;
                      },
                    ),
                    ),
                    Center(
                      child: Container(
                        child: ElevatedButton(
                        child: Text('Salvar', style: TextStyle(color: Colors.white, fontSize: 20),),
                        onPressed: () {
                          debugPrint('CLIQUEI!!!');
                          if(_formkey.currentState!.validate()){
                            setState(() {
                              _tasks.add(taskController.text);
                            });           
                            taskController.clear();
                          }                      
                        },
                        style: ElevatedButton.styleFrom(
                           backgroundColor: Color.fromRGBO(45, 96, 115,100),
                           minimumSize: Size(88, 36),
                           padding: EdgeInsets.symmetric(horizontal: 16),
                           shape: const RoundedRectangleBorder(
                             borderRadius: BorderRadius.all(Radius.circular(2)),
                           ),
                        )
                      ),
                      ),
                    )    
                ],
              )
            ), 
            ),           
            );
  }
}