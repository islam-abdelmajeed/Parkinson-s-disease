import 'package:flutter/material.dart';
import 'package:graduation_project/view/editprofile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

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
                  child:  Column(children: [
                    const SizedBox(
                      height: 115,
                      width: 115,
                      child: CircleAvatar(backgroundImage: AssetImage(
                          "assets/profile.png"),),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("Mirenda West",style: TextStyle(
                        color:Color(0xff5E6D92),
                        fontSize: 20),),
                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(
                                  builder: (context)=>EditProfile()));
                        }, child: Text('Edit Profile',style: TextStyle(fontSize: 20,color: Color(0xffD7D7D7)),),),
                        Icon(Icons.edit,color: Color(0xffD7D7D7),)
                      ],
                    ),


                  ],),
                ),
              ),
              SizedBox(height: 30,),

              buildTextField("Name","Mirenda West",false,),
              buildTextField("Email","Mirenda West @gmail.com",false),
              buildTextField("Phone number","01068575985",false),
              buildTextField("Birth date","20/10/1999",false),
              buildTextField("Password","*************",true),
              SizedBox(height: 30,)

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