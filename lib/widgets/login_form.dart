import 'package:flutter/material.dart';
import 'package:rynsysengineering/widgets/button_container.dart';

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
                    if(value!.isEmpty && value.length>=14&&value.length<10){
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
}
