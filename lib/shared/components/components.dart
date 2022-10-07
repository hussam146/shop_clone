import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultFormField({
  TextEditingController? controller,
  required TextInputType? type,
  double? size,
  bool isPassword = false,
  required String? Function(String?)? validate,
  Function(String)? submit,
  Function(String)? change,
  String? label,
  IconData? prefix,
  IconData? suffix,
  Function()? ontap,
  Function()? suffixPressed,
}) {
  return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      onTap: ontap,
      onChanged: change,
      onFieldSubmitted: submit,
      style: TextStyle(
          fontSize: size
      ),
      validator: validate,
      decoration: InputDecoration(
          labelText: label,
          // prefixIcon: Icon(prefix),
          suffix: suffix != null ? IconButton(onPressed: suffixPressed, icon: Icon(suffix),) : null,
          border: const OutlineInputBorder()
      )
  );
}

void navigateTo(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => widget),
  );
}

Future navigateAndFinish(context, widget) async {
  return await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
          (Route<dynamic> route) => false);
}

Future<bool?> showToast({
  required String text,
  required ToastStates? state
})
{
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}

enum ToastStates {success, error, warning}

Color? chooseToastColor(ToastStates? state)
{
  Color? color;
  switch (state!)
  {
    case ToastStates.success:
      color = Colors.green;
      break;

    case ToastStates.warning:
      color = Colors.yellow;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
  }
  return color;
}

Widget defaultListTile({
  required IconData leading,
  required String text,
  required IconData trailing
})
{
  return ListTile(
    leading: Icon(leading),
    title: Text(text),
    trailing: Icon(trailing),
  );
}