import 'package:mcfooddriver/model/ModelDetailFood.dart';

class ModelTrans {
  int idTrans;
  String name;
  int totItem;
  int totPrice;
  List<ModelDetailFood> listItem;

  ModelTrans({required this.idTrans, required this.name, required this.totItem, required this.totPrice, required this.listItem});

}