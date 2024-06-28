import 'package:flutter/material.dart';
import 'package:graduation_project/view/profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _ProfileState();
}

class _ProfileState extends State<EditProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: [
              Row(children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_outlined,
                      size: 30,
                      color: Colors.grey,
                    )),
              ]),
              Center(
                child: Container(
                  child: const Column(children: [
                    SizedBox(
                      height: 115,
                      width: 115,
                      child: CircleAvatar(backgroundImage: AssetImage("assets/profile.png"),),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Mirenda West",style: TextStyle(color:Color(0xff5E6D92),
                        fontSize: 20),),
                  ],),
                ),
              ),
              SizedBox(height: 40,),

              buildTextField("Name","Mirenda West",false),
              buildTextField("Email","Mirenda West @gmail.com",false),
              buildTextField("Phone number","01068575985",false),
              buildTextField("Birth date","20/10/1999",false),
              buildTextField("Password","*************",true),
              SizedBox(height: 10,),
              Center(
                child: ElevatedButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context)=>Profile()));
                }
                    ,style:ElevatedButton.styleFrom(
                      backgroundColor:Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ) ,
                    child: const Text("Save",style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),)
                    
    ),
              )

            ],
          ),

        ),
      ),
    );
  }
}
Widget buildTextField(String labelText,String placeholder,bool isPasswordTextField){
  bool isObscurePassword = true;
  return Padding(
    padding: EdgeInsets.only(bottom: 30),
    child: TextField(
      obscureText: isPasswordTextField ? isObscurePassword : false,
      decoration: InputDecoration(
          suffixIcon: isPasswordTextField ?
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.remove_red_eye,color: Colors.grey,)
          ): null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color:Colors.grey,
          )



      ),
    ),
  );
}