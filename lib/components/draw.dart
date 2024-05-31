import 'package:flutter/material.dart';

class DraW extends StatelessWidget {
  const DraW({super.key,required this.onselect});
final void Function(String identifire) onselect;
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          const DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 254, 230, 230),
              Color.fromARGB(255, 194, 226, 252)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Row(
              children: [
                Icon(Icons.fastfood, size: 48, color: Colors.black),
                SizedBox(
                  width: 18,
                ),
                Text("cooking up")
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant,color: Colors.black,size: 25,),
            title: const Text(
              "Meals",
              style: TextStyle(color: Colors.black),
            ),
            onTap: (){
              onselect('meals');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings,color: Colors.black,size: 25,),
            title: const Text(
              "filters",
              style: TextStyle(color: Colors.black),
            ),
            onTap: (){
                onselect('filters');
            },
          )
        ],
      ),
    );
  }
}
