import 'package:flutter/material.dart';
import 'package:teste/components/my_Button.dart';
import 'package:teste/myHome.dart';
import 'components/my_TextField.dart';
import 'components/my_Button.dart';
import 'User.dart';
import 'register.dart';

class MyLogin extends StatefulWidget {
  List<User> tasks = [];
  int currentUser = 0;

  MyLogin({Key? key, required this.tasks}) : super(key: key);

  @override
  State<StatefulWidget> createState(){
    return LoginState();
  }
}
  class Helpers {
    static findByEmail(list, String email){
        var findByEmail = (obj) => obj.email == email;
        var result = list.where(findByEmail);
        return result.length > 0 ? result.first : null;

    }
    static getIndexByEmail(list, String email){
        var result = list.indexWhere((obj) => obj.email == email);
        return result;

    }
  }
class LoginState extends State<MyLogin>{
  final TextEditingController taskController = TextEditingController();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var obj;
    return Scaffold(
      appBar: AppBar(
        title:  Text('To-Do List'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
             children: [
               const SizedBox(height: 50),
               const Icon(Icons.person, size:200, color: Colors.white,),
               Text(
                'Bem vindo!',
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
                obscureText: true,
               ),

               const SizedBox(height: 25,),

               MyButton(
                onTap: ()=>{
                   obj = Helpers.findByEmail(widget.tasks,usernameController.text),
                  if((obj!=null)&&(obj.password==passwordController.text))
                  {
                    obj = Helpers.getIndexByEmail(widget.tasks,usernameController.text),
                    print(obj),
                    Navigator.push(context, MaterialPageRoute(
                      builder: (_)=> MyHome(tasks: widget.tasks, currentUser: obj)
                    )),
                  }
                  else{
                    showDialog(
                      context: context,
                       builder: (BuildContext context) => AlertDialog(
                          content: const SingleChildScrollView(
                            child: Text('Email ou senha incorretos'),
                              
                            ),
                          )
                       )      
                  }
                  
                },
                text: "Entrar"
               ),

              const SizedBox(height: 5,),

              GestureDetector(
                onTap: ()=>{
                  Navigator.push(context, MaterialPageRoute(
                      builder: (_)=> MyRegister(tasks: widget.tasks)
                    )),
                },
                child: Center(
                  child: Container(
                    child: Text(
                    'Registrar-se',
                     style: TextStyle(
                      color: Color.fromRGBO(130, 237, 214, 100),
                      fontSize: 16
                    )
                                 ),
                  ),
                ),
              )

              ]
          ),
          ),
      )
    );
  }
}