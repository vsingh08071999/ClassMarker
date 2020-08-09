import 'package:flutter/material.dart';
import 'package:loginapp/models/group_view_model.dart';
import 'package:loginapp/models/model.dart';
import 'package:loginapp/provider/view_group_notifier.dart';
import 'package:loginapp/screens/get_reg_codes.dart';
import 'package:provider/provider.dart';

class ViewGroup extends StatefulWidget {
  @override
  _ViewGroupState createState() => _ViewGroupState();
}

class _ViewGroupState extends State<ViewGroup> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 5,
          title: Text(
            'View Group',
            //user.rights[23].createGroup,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Consumer<ViewGroupNotifier>(
            builder: (context, viewGroupNotifier, _) {
              switch (viewGroupNotifier.state) {
                case ViewgroupStatusNotifier.loading:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                case ViewgroupStatusNotifier.loaded:
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 4,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          onTap: () {
                            int gid =
                                viewGroupNotifier.groupModel.groups[index].gid;
                            print("GroupId is : $gid");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        GetRegCode(gid: gid)));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        'Name : ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        // 'asfdsfdsfdf',
                                        '${viewGroupNotifier.groupModel.groups[index].name}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        'Description : ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        // 'sddxfcgvhbncvb',
                                        '${viewGroupNotifier.groupModel.groups[index].descr}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        'Gid : ',
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${viewGroupNotifier.groupModel.groups[index].gid}',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    // itemCount: 4,
                    itemCount: viewGroupNotifier.groupModel.groups.length,
                  );
                default:
                  return Center(
                    child: Text(viewGroupNotifier.error),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
