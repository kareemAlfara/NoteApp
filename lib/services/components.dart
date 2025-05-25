import 'package:flutter/material.dart';

String Notebox = "notebox";

Future<dynamic> navigat(context, {required Widget widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
Widget defulttext({
  TextDirection? textDirection,
  required String data,
  double? fSize,
  Color? color,
  FontWeight? fw,
}) => Text(
  textDirection: textDirection,
  maxLines: 1,
  data,
  style: TextStyle(
    fontSize: fSize,
    color: color,
    fontWeight: fw,
  ).copyWith(overflow: TextOverflow.ellipsis),
);
Widget defulitTextFormField({
  
  int? maxline = 1,
   String ?title,
  Widget? label,
  void Function(String)? onChanged,
  TextInputAction? textInputAction,
  TextEditingController? controller,
  String? Function(String?)? validator,
}) => TextFormField(
  
  maxLines: maxline,
  onChanged:onChanged ,
  validator: validator,
  textInputAction: textInputAction,
  controller: controller,
  decoration: InputDecoration(
    label:label ,
    labelText: title,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  ),
);
PreferredSizeWidget noteAppbar({
  required String text,
  required IconData icon,
  required void Function()? onPressed,
}) => AppBar(
  title: defulttext(data: text, fSize: 27),
  actions: [
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.2),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, size: 30)),
    ),
  ],
);
