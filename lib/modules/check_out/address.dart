// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_clone/shared/components/components.dart';
import 'package:shop_clone/view_models/chech_out_view.dart';

class AddressScreen extends StatelessWidget {
  AddressScreen({super.key});

  var st_1Controller = TextEditingController();
  var st_2Controller = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var countryController = TextEditingController();
  GlobalKey? formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: GetBuilder<CheckOutViewModel>(
        init: CheckOutViewModel(),
        builder: (controller) => Column(
                children: [
                  const ListTile(
                    leading: Icon(
                      Icons.check_circle,
                      color: Colors.blue,
                    ),
                    title: Text(
                      'Billing address is the same as delivery address',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: defaultFormField(
                        type: TextInputType.text,
                        submit: (value) {
                          controller.st_1 = value;
                        },
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'field is required';
                          }
                          return null;
                        },
                        label: 'Street 1'),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: defaultFormField(
                        type: TextInputType.text,
                        submit: (value) {
                          controller.st_2 = value;
                        },
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'field is required';
                          }
                          return null;
                        },
                        label: 'Street 2'),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: defaultFormField(
                        type: TextInputType.text,
                        submit: (value) {
                          controller.city = value;
                        },
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'field is required';
                          }
                          return null;
                        },
                        label: 'City'),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.maxFinite,
                            child: defaultFormField(
                                type: TextInputType.text,
                                submit: (value) {
                                  controller.state = value;
                                },
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'field is required';
                                  }
                                  return null;
                                },
                                label: 'State'),
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Expanded(
                          child: Container(
                            width: double.maxFinite,
                            child: defaultFormField(
                                type: TextInputType.text,
                                submit: (value) {
                                  controller.country = value;
                                },
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return 'field is required';
                                  }
                                  return null;
                                },
                                label: 'Country'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
