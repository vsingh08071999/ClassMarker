import 'package:flutter/material.dart';
import 'package:loginapp/provider/get_reg_codes_notifier.dart';
import 'package:provider/provider.dart';

class GetRegCode extends StatefulWidget {
  int gid;
  GetRegCode({this.gid});
  @override
  _GetRegCodeState createState() => _GetRegCodeState();
}

class _GetRegCodeState extends State<GetRegCode> {
  TextEditingController regController = TextEditingController();
  getDataFromServer() {
    Provider.of<GetRegCodesNotifier>(context, listen: false)
        .postRegCode(widget.gid, regController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          'Get Registration Codes',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  // width: 250,
                  width: MediaQuery.of(context).size.width * 0.70,
                  //height: MediaQuery.of(context).size.height * 0.20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      border: Border.all(width: 2, color: Colors.black)),
                  child: TextField(
                    controller: regController, textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "Type no. of RegCode you want",
                        hintStyle: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w400,
                            fontSize: 18)),
                    onTap: () {},
                    style: TextStyle(fontSize: 23),
                    // maxLines: _line,
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: RaisedButton(
                    onPressed: () {
                      getDataFromServer();
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    color: Colors.red,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Consumer<GetRegCodesNotifier>(
                builder: (context, getRegCodesNotifier, _) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      if (index >=
                          getRegCodesNotifier.regCodeModel.codes.length) {
                        return CircularProgressIndicator();
                      }
                      return Card(
                        child: InkWell(
                          onTap: () {
                            var code =
                                getRegCodesNotifier.regCodeModel.codes[index];
                            print("RegCode is : $code");
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              getRegCodesNotifier.regCodeModel.codes[index],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 20),
                            ),
                          ),
                        ),
                        elevation: 3,
                        margin: EdgeInsets.only(left: 8, right: 8, bottom: 15),
                      );
                    },
                    itemCount: getRegCodesNotifier.regCodeModel.codes.length,
                    shrinkWrap: true,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
