import 'package:flutter/material.dart';
class meait extends StatelessWidget {
  const meait({super.key,required this.icon,required this.label});
final IconData icon;
final String label; 
  @override
  Widget build(BuildContext context) {
    return Row(
children: [
  Icon(icon),
  SizedBox(width: 12,),
  Text(label,style: TextStyle(color: Colors.white),)
],
    );
  }
}