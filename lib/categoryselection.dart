import 'package:flutter/material.dart';

class Categoryselection extends StatefulWidget {
  String resim_kod;

  Categoryselection({super.key, required this.resim_kod});

  @override
  State<Categoryselection> createState() => _CategoryselectionState();
}

class _CategoryselectionState extends State<Categoryselection> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(milliseconds: 400),
            content: Text("Category Selected"),
          ),
        );
      },
      child: Image.asset("lib/assets/"+widget.resim_kod,width: 10,),
    );
  }
}
