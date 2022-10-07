// ignore_for_file: must_be_immutable, avoid_print

import 'package:shop_clone/modules/auth_service/auth_service.dart';
import 'package:shop_clone/modules/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/components/components.dart';

class LoginScreen extends GetWidget<AuthService> {
  LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30.0,
                ),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Welcome,',
                                style: TextStyle(
                                    fontSize: 25.0, fontWeight: FontWeight.bold),
                              ),
                              MaterialButton(
                                onPressed: ()
                                {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                                },
                                child: Text(
                                  'sign',
                                  style: TextStyle(
                                      color: HexColor('#00C569'), fontSize: 20.0),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Sign in to Continue',
                            style: TextStyle(color: Colors.grey.withOpacity(.7)),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          defaultFormField(
                              type: TextInputType.text,
                              label: 'Email',
                              submit: (value){
                                controller.email = value;
                                print(value);
                              },
                              // ignore: body_might_complete_normally_nullable
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'email field can\'t be empty';
                                }
                              }),
                          const SizedBox(
                            height: 20.0,
                          ),
                          defaultFormField(
                              type: TextInputType.visiblePassword,
                              label: 'password',
                              submit: (value){
                                controller.password = value;
                                print(value);
                              },
                              // ignore: body_might_complete_normally_nullable
                              validate: (value) {
                                if (value!.isEmpty) {
                                  return 'email field can\'t be empty';
                                }
                              }),
                          Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'forget Password?',
                                    style: TextStyle(color: Colors.black),
                                  ))),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: HexColor('#00C569'),
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                            ),
                            child: MaterialButton(
                              onPressed: ()
                              {
                                formKey.currentState!.save();
                                if(formKey.currentState!.validate())
                                {
                                  controller.signInWithEmailAndPass();
                                }

                              },
                              child: const Text('SIGN IN', style: TextStyle(color: Colors.white,fontSize: 15.0),),
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Align(
                  alignment: Alignment.center,
                  child:  Text('-OR-'),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: ()
                  {
                    controller.signInWithFacebook();
                  },
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      children: const[
                        SizedBox(width: 20.0,),
                        Icon(Icons.facebook_outlined,color: Colors.blue,size: 30.0),
                        SizedBox(width: 30.0,),
                        Text('Sign In With Facebook')
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                InkWell(
                  onTap: ()
                  {
                    controller.signInWithGoogle();
                  },
                  child: Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                    ),
                    child: Row(
                      children: const[
                        SizedBox(width: 20.0,),
                        Icon(Icons.android,color: Colors.blue,size: 30.0),
                        SizedBox(width: 30.0,),
                        Text('Sign In With Google')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}