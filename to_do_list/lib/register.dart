import 'package:flutter/material.dart';
import 'package:teste/components/my_Button.dart';
import 'package:teste/login.dart';
import 'components/my_TextField.dart';
import 'components/my_Button.dart';
import 'User.dart';

class MyRegister extends StatefulWidget {
  List<User> tasks = [];
 

  MyRegister({Key? key, required this.tasks}) : super(key: key);

  @override
  State<StatefulWidget> createState(){
    return RegisterState();
  }
}
class RegisterState extends State<MyRegister>{
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
   User user = new User();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('To-Do List'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
             children: [
               const SizedBox(height: 50),
               const Icon(Icons.person_add, size:200, color: Colors.white,),
               Text(
                'Cadastro',
                 style: TextStyle(
                  color: Color.fromRGBO(130, 237, 214, 100),
                  fontSize: 18
                )
               ), 
               const SizedBox(height: 25,),

               MyTextField(
                controller: usernameController,
                hintText: "Email",
                obscureText: false,
               ),

               const SizedBox(height: 25,),
               
               MyTextField(
                controller: passwordController,
                hintText: "Senha",
                obscureText: true
               ),

               const SizedBox(height: 25,),

               MyButton(
                onTap: ()=>{

                  user.email = usernameController.text,
                  user.password= passwordController.text,
                  
                  widget.tasks.add(user),

                  print("Email: "+widget.tasks[0].email),
                  print("Senha: "+widget.tasks[0].password),
                  
                 Navigator.push(context, MaterialPageRoute(
                  builder: (_)=> MyLogin(tasks: widget.tasks)
                  )),
                  
                },
                text: "Cadastrar",
               ),
              ]
          ),
          ),
      )
    );
  }
}