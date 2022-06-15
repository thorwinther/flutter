import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/data.dart';

class CheckBoxInListView extends StatelessWidget {
  CheckBoxInListView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Consumer<Data>(
        builder: (context, data, child) {
          return ListView.builder(
            itemCount: data.taskCount,
            itemBuilder: (context, index) {
              return CheckboxListTile(
                activeColor: Colors.lightBlueAccent,
                title: GestureDetector(
                  onLongPress: () {
                    data.removeFromList(index);
                  },
                  child: Text(
                    data.texts[index],
                    style: TextStyle(
                        decoration: data.isChecked[index] ? TextDecoration.lineThrough : null),
                  ),
                ),
                value: data.isChecked[index],
                onChanged: ((val) =>
                    data.onCheckboxChanged(index, val)), //Could remove val and just toggle instead
              );
            },
          );
        },
      ),
    );
  }
}
