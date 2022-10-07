// ignore_for_file: avoid_unnecessary_containers, avoid_print, unused_element, sized_box_for_whitespace, sort_child_properties_last, constant_identifier_names, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:shop_clone/modules/check_out/address.dart';
import 'package:shop_clone/modules/check_out/summary.dart';
import 'package:shop_clone/modules/control_view/control_view.dart';
import 'package:shop_clone/modules/home_screen/home_screen.dart';
import 'package:shop_clone/shared/components/components.dart';
import '../../view_models/chech_out_view.dart';
import 'delivery.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int curStep = 0;
  var key = CheckOutViewModel().formKey;
  List<Step> getSteps() => [
        Step(
            isActive: curStep == 0,
            state: curStep > 0 ? StepState.complete : StepState.indexed,
            title: const Text(
              'Delivery',
              style: TextStyle(fontSize: 15.0),
            ),
            content: Container()),
        Step(
            isActive: curStep == 1,
            state: curStep > 1 ? StepState.complete : StepState.indexed,
            title: const Text(
              'Address',
              style: TextStyle(fontSize: 15.0),
            ),
            content: Container()),
        Step(
            isActive: curStep == 2,
            title: const Text(
              'Summer',
              style: TextStyle(fontSize: 15.0),
            ),
            content: Container()),
      ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 60.0,
                left: 20.0,
              ),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                  Container(
                    padding: const EdgeInsets.only(left: 80.0),
                    child: const Text(
                      'CheckOut',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Expanded(
              child: Container(
                height: 300.0,
                child: Stepper(
                    elevation: 0.0,
                    type: StepperType.horizontal,
                    currentStep: curStep,
                    onStepTapped: (index) {
                      setState(() {
                        curStep = index;
                      });
                    },
                    steps: getSteps(),
                    controlsBuilder: (context, details) {
                      if (curStep == 0) {
                        return const DeliveryTimeScreen();
                      } if (curStep == 1) {
                          return AddressScreen();
                      } else {
                        return const Summary();
                      }
                    }),
              ),
            ),
            if (curStep == 0)Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(10.0),
              child: MaterialButton(
                onPressed: () {
                    if(curStep == 2)
                    {
                      setState(() {
                        curStep;
                        // navigateTo(context, Summary());
                      });
                    }
                    else{
                      setState(() {
                        curStep++;
                      });
                    }
                },
                color: Colors.blue,
                minWidth: 150.0,
                height: 50.0,
                child: curStep == getSteps().length - 1
                    ? const Text('Delivered', style: TextStyle(fontSize: 20.0),)
                    : const Text('Next', style: TextStyle(fontSize: 20.0),),
              ),
            )
            else Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        curStep--;
                      });
                    },
                    color: Colors.white60,
                    height: 50.0,
                    minWidth: 150.0,
                    child: const Text('Back'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: MaterialButton(
                    onPressed: () {
                        if(curStep == 2)
                        {
                            setState(() {
                              curStep;
                              navigateTo(context, const ControlViewScreen());
                            });
                          }
                        else{
                          setState(() {
                            curStep++;
                          });
                        }
                    },
                    color: Colors.blue,
                    height: 50.0,
                    minWidth: 150.0,
                    child: curStep == getSteps().length - 1
                        ? const Text('Delivered')
                        : const Text('Next'),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
