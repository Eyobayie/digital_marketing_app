import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rynsysengineering/widgets/button_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
   LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final textStyle=const TextStyle(fontSize: 16,fontWeight: FontWeight.w400);
         final _formKey= GlobalKey<FormState>();
           TextEditingController? phoneController=TextEditingController();
       TextEditingController? PasswordController=TextEditingController();
       String? _token;
  @override
  Widget build(BuildContext context) {

return ListView(
      children:[
      const Divider(color: Colors.black,thickness: 3,),
        Container(
        margin: const EdgeInsets.symmetric(horizontal: 18),
        child: Form(
          key: _formKey,
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
             Text('Phone number',style: textStyle,),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 70,
              child: TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                maxLines: 1,
                maxLength: 40,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.9),
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    )),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                 validator: (value) {
                    if(value!.isEmpty){
                      return 'phone is incorrect';
                    } 
                    return null; 
                }
              ),
            ),
            const SizedBox(
              height: 15,
            ),
             Text('Password',style: textStyle,),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 70,
              child: TextFormField(
                controller: PasswordController,
                keyboardType: TextInputType.text,
                maxLines: 1,
                maxLength: 40,
                decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.9),
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    )),
                obscureText: true,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.sentences,
                validator: (value) {
                    if(value!.isEmpty && value.length<4){
                      return 'password is incorrect/too short';
                    }  
                }
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: () {
               if(_formKey.currentState!.validate()){
                postUsernameAndPassword(phoneController!.text,PasswordController!.text)
                .then((_)=> setState(() {
                  PasswordController!.text='';
                  phoneController!.text='';
                })
                );
               }
              },
              child:const ButtonContainer(color: Colors.orange, title: 'SIGN IN')
            ),
             Row(
               children: [
                 const Text('have not account yet?',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                 Text('Register',style: TextStyle(color: Colors.blue.shade900),),
               ],
             )
          ],
        )),
      ),] 
    );
  }
  Future<http.Response> postUsernameAndPassword(String phone, String password) async{
    
  final response= await http.post(
    Uri.parse('https://rensys-laravel.merahitechnologies.com/api/user_login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'accept': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'phone_number': phone,
      'password' : password,   
    }),
  );
  if(response.statusCode!=200){
    print('There is some thing wrong ////////////////'+response.statusCode.toString());
    print(response.body);
  }
  else if(response.statusCode==200){
   Map<String, dynamic> requestResponse=(jsonDecode(response.body));
   print('///////////////////////////////');
   final token=requestResponse['access_token'];
   print(requestResponse['access_token']);
   print('//////////////////////////////////');
   print(requestResponse['user']['id']);
   final userId=requestResponse['user']['id'];
   print (requestResponse['user']['phone_number']);
   final phoneNumber=requestResponse['user']['phone_number'];
      print('///////////////////////////////');

   saveTokenAndId(userId, token,phoneNumber);
  }
     return response;
}
void saveTokenAndId(int id, String token,String phone)async{
  SharedPreferences preferences= await SharedPreferences.getInstance();
  preferences.setInt('user_id', id);
  preferences.setString('access_token', token);
  preferences.setString('phone_number', phone);
  setState(() {
    token=preferences.getString('access_token')!;
  });
}
  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }
}
