
import 'package:flutter/material.dart';

class ListItem extends StatefulWidget{//列表item
  final Map<String,dynamic> item;
  ListItem(this.item);
  @override
  _ListItemState createState() => new _ListItemState();
}

class _ListItemState extends State<ListItem> {  
  @override
  Widget build(BuildContext context) {
    var data = this.widget;
    return Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey,
                  width: 0.2,
                  style: BorderStyle.solid
                ),
              )
            ),
            padding: EdgeInsets.fromLTRB(0, 8, 10, 8),
            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                // Expanded(
                //   flex: 1,
                //   child:Icon(Icons.local_bar,color: Colors.grey,)
                // ),
                Expanded(
                  flex: 5,
                  child:Text(data.item['title'],style: TextStyle(color: Colors.black))
                ),
                Expanded(
                  flex: 1,
                  child:Text(data.item['subTitle'],style: TextStyle(color: Colors.black45))
                ),
                Expanded(
                  flex: 1,
                  child:Icon(Icons.chevron_right,color: Colors.black12,)
                ),
              ],
            ),
          );
  }
}

