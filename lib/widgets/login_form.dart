import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);
  final textStyle=const TextStyle(fontSize: 16,fontWeight: FontWeight.w400);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children:[
      const Divider(color: Colors.black,thickness: 3,),
        Container(
        margin: const EdgeInsets.symmetric(horizontal: 18),
        child: Form(
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
                onChanged: (value) {},
                //obscureText: ,
                onSaved: (_) {},
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                validator: (_) {},
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
                onChanged: (value) {},
                obscureText: true,
                onSaved: (_) {},
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
                textInputAction: TextInputAction.done,
                textCapitalization: TextCapitalization.sentences,
                validator: (_) {},
              ),
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.height * 0.15,
                    height: MediaQuery.of(context).size.height * 0.065,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    )),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.height * 0.35,
                    height: MediaQuery.of(context).size.height * 0.065,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 43, 117, 46),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                        child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'CHECKOUT AS GUEST',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    )),
                  ),
                ),
              ],
            )
          ],
        )),
      ),] 
    );
  }
}
