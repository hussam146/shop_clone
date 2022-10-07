// ignore_for_file: must_be_immutable

import 'package:shop_clone/modules/auth_service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/components/components.dart';

class RegisterScreen extends GetWidget<AuthService> {
  RegisterScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                height: 70.0,
              ),
              Container(
                height: 410.0,
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Sign Up', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: defaultFormField(
                                type: TextInputType.text,
                                label: 'name',
                                submit: (value)
                                {
                                  controller.name = value;
                                },
                                // ignore: body_might_complete_normally_nullable
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'name field can\'t be empty';
                                  }
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: defaultFormField(
                                type: TextInputType.text,
                                label: 'Email',
                                submit: (value){
                                  controller.email = value;
                                },
                                // ignore: body_might_complete_normally_nullable
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'email field can\'t be empty';
                                  }
                                }),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: defaultFormField(
                                type: TextInputType.text,
                                isPassword: true,
                                label: 'password',
                                submit: (value){
                                  controller.password = value;
                                },
                                // ignore: body_might_complete_normally_nullable
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'password field can\'t be empty';
                                  }
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 60.0,
                              width: MediaQuery.of(context).size.width,
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
                                    controller.createAccountWithEmailAndPass();
                                  }
                                },
                                child: const Text('SIGN IN', style: TextStyle(color: Colors.white,fontSize: 18.0),),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}