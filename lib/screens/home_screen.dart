import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_o2/models/Informations.dart';
import 'package:flutter_application_o2/providers/information_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import 'form_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<InformationProvider>(context,listen: false).initData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("หน้าสูตร"),
          actions: [
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  SystemNavigator.pop();
                })
          ],
        ),
        body: Consumer(
          builder: (context, InformationProvider provider, Widget? child) {
            var count = provider.informations.length;
            if (count <= 0) {
              return Center(
                child: Text(
                  "วงกลม =22/7 (พาย)xเส้นผ่านศูนย์กลาง \nรูปว่าว = 1/2 x ผลคูนของเส้นทะเเยงมุม\nสามเหลี่ยม =1/2xฐานxสูง\nพื้นที่สี่เหลี่ยมผืนผ้า = กว้างxยาว\nพื้นที่สี่เหลี่ยมผืนผ้า = กว้างxยาว\nพื้นที่สี่เหลี่ยมจตุรัส = ด้านxด้าน\nพื้นที่สี่เหลี่ยมด้านขนาน = ฐานxสูง\nพื้นที่สี่เหลี่ยมขนมเปียกปูน = 0.5xผลคูนของเส้นทแยงมุม\nพื้นที่สี่เหลี่ยมคางหมู = 0.5xผลบวกของด้านคู่ขนานxสูง\nพื้นที่สี่เหลี่ยมด้านไม่เท่า หรือ ใดๆ = 0.5xเส้นทแยงมุมxผลบวกของเส้นกิ่ง",
                  style: TextStyle(fontSize: 35),
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: provider.informations.length,
                  itemBuilder: (context, int index) {
                    Informations data = provider.informations[index];
                    return Card(
                      elevation: 5,
                      margin: const EdgeInsets.all(5.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          child: FittedBox(
                            child: Text(data.price.toString()),
                          ),
                        ),
                        title: Text(data.title),
                        subtitle: Text(data.product.toString()),
                      ),
                    );
                  });
            }
          },
        ));
  }
}