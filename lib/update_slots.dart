import 'package:flutter/material.dart';

class updateSlots extends StatelessWidget {
  final Function _update;
  updateSlots(this._update);
  //const updateSlots({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.all(50),
      width: 100,
      height: 35,
      child: ElevatedButton(
        onPressed: ()=>_update(),
        child: Text(
          'UPDATE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
