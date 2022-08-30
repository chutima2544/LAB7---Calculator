import 'package:flutter/foundation.dart';
import 'package:flutter_application_o2/database/information_db.dart';
import 'package:flutter_application_o2/models/Informations.dart';

class InformationProvider with ChangeNotifier{
    
      List<Informations> informations = [];
      
      List<Informations> getInformation(){
        return informations;
      }
      void initData() async{
          var db = InformationDB(dbName: "informations.db");
          var snapshot = await db.loadAllData();

          notifyListeners();
      }

      void addInformation(Informations statement) async{
          var db = InformationDB(dbName: "informations.db");
          await db.InsertData(statement);
          var snapshot = await db.loadAllData();
          for(var record in snapshot){
            double P1 = record["product"] as double;
            double P2 = record["price"] as double;
            Informations infor = Informations(title: record["title"].toString(), product: P1, price: P2);
            informations.add(infor);
          }
          informations;
          notifyListeners();
      }
}