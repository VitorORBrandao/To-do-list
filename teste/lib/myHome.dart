import 'package:flutter/material.dart';
import 'User.dart';

class MyHome extends StatefulWidget {
   List<User> tasks = [];
    String updateText = "";
    int currentUser = 0;

    

    MyHome({Key? key, required this.tasks, required this.currentUser}) : super(key: key);

  @override
  State<StatefulWidget> createState(){
    return MyHomeState();
  }
}

class MyHomeState extends State<MyHome>{
  final TextEditingController taskController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title:  Text('To-Do List'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Form(
              key: _formkey,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: taskController,
                      style: TextStyle(
                        fontSize: 32,
                        color: Color.fromRGBO(130, 237, 214, 100)
                      ),
                      decoration: InputDecoration(
                        hintText: 'Crie uma nova tarefa',
                        hintStyle: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(139, 215, 217, 100)
                        )
                      ),
                      keyboardType: TextInputType.text,
                      validator: (value){
                        if(value!.trim().isEmpty){
                          return 'A descrição da tarefa é obrigatória';
                        }
                        return null;
                      },
                    ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: ElevatedButton(
                      child: Text('Add', style: TextStyle(color: Colors.white, fontSize: 20),),
                      onPressed: () {
                        debugPrint('CLIQUEI!!!');
                        if(_formkey.currentState!.validate()){
                          setState(() {
                            widget.tasks[widget.currentUser].task.add(taskController.text);
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
                    )    
                ],
              )
            ), 
            ),            
            Expanded(
              child: ListView.builder(
              itemCount: widget.tasks[widget.currentUser].task.length,
              itemBuilder: (context, index) { 
                return Card( 
                  child: Padding(
                  padding: const EdgeInsets.all(20), 
                  child: ListTile(
                  leading: IconButton(
                     icon: Icon(Icons.check),
                     color:(isChecked) ? Color(0xff007397): Color(0xff9A9A9A),
                        onPressed: () {
                      setState((){
                         isChecked= !isChecked;
                      });
                    },
                    ),    
                  title: Text(widget.tasks[widget.currentUser].task[index]),
                  trailing:  Container(
                    width: 70,
                    child:  Row(
                            children: [
                              Expanded(
                                child:  IconButton(
                                  onPressed: (){
                                    setState(() {
                                      widget.tasks[widget.currentUser].task.removeAt(index);
                                    });
                                  }, 
                                  icon: Icon(Icons.delete)
                                  )
                                ),
                              Expanded(
                                child: IconButton(
                                  onPressed: (){
                                    showDialog(context: context, builder: (context) => SimpleDialog(
                                      children: [
                                        TextFormField(
                                        style: TextStyle(
                                          fontSize: 32,
                                          color: Colors.black87
                                        ),
                                        decoration: InputDecoration(
                                          hintText: widget.tasks[widget.currentUser].task[index],
                                          hintStyle: TextStyle(
                                            fontSize: 20
                                          )
                                        ),
                                        keyboardType: TextInputType.text,
                                        validator: (value){
                                        if(value!.trim().isEmpty){
                                          return 'A descrição da tarefa é obrigatória';
                                        }
                                        return null;
                                        },
                                        onChanged: (value) => {
                                          setState((){
                                            widget.updateText = value;
                                          })
                                          },  
                                        ), 
                                        ElevatedButton(
                                          child: Text('Add', style: TextStyle(color: Colors.white, fontSize: 20),),
                                          onPressed: () {
                                            setState(() {
                                              widget.tasks[widget.currentUser].task[index] = widget.updateText;
                                            });
                                            Navigator.pop(context);
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
                                        ],
                                    ),
                                    );
                                  },
                                  icon: Icon(Icons.edit)
                                  )
                                )
                              
                            ],),
                        ),                     
                ),
                ), 
                );
              }
              ))
          ],
        ),
      ),
    );
  }
}