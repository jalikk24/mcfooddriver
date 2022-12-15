import 'package:flutter/material.dart';
import 'package:mcfooddriver/helper/FormatCurrency.dart';
import 'package:mcfooddriver/model/ModelOrder.dart';
import 'package:mcfooddriver/util/CustomColor.dart';
import 'package:mcfooddriver/util/ScreenSize.dart';

class ListOrderSub extends StatefulWidget {
  const ListOrderSub({Key? key}) : super(key: key);

  @override
  State<ListOrderSub> createState() => _ListOrderSubState();
}

class _ListOrderSubState extends State<ListOrderSub> {
  List<ModelOrder> listOrder = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: ScreenSize.getWidth(context),
            padding: EdgeInsets.only(
                top: ScreenSize.getHeight(context) / 17, bottom: 15),
            child: Text(
              "Daftar Order",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "inter600",
                  fontSize: 15,
                  color: CustomColor.black),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: listOrder.length,
                  itemBuilder: (context, index) {
                    return listItem(index);
                  })),
        ],
      ),
    );
  }

  Widget listItem(int index) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: CustomColor.greyBd, width: 2)),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "ID Transaksi : ",
                    style: TextStyle(
                        fontFamily: "inter600",
                        fontSize: 15,
                        color: CustomColor.black),
                  ),
                  Text(
                    "${listOrder[index].idOrder}",
                    style: TextStyle(
                        fontFamily: "inter500",
                        fontSize: 15,
                        color: CustomColor.black),
                  ),
                ],
              ),
              Text(
                listOrder[index].time,
                style: TextStyle(
                    fontFamily: "inter500",
                    fontSize: 13,
                    color: CustomColor.black),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Row(
              children: [
                Text(
                  "Pemesan : ",
                  style: TextStyle(
                      fontFamily: "inter600",
                      fontSize: 13,
                      color: CustomColor.black),
                ),
                Text(
                  listOrder[index].name,
                  style: TextStyle(
                      fontFamily: "inter500",
                      fontSize: 13,
                      color: CustomColor.black),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                "Item : ",
                style: TextStyle(
                    fontFamily: "inter600",
                    fontSize: 13,
                    color: CustomColor.black),
              ),
              Text(
                "${listOrder[index].totItem} item",
                style: TextStyle(
                    fontFamily: "inter500",
                    fontSize: 13,
                    color: CustomColor.black),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Total : ",
                    style: TextStyle(
                        fontFamily: "inter600",
                        fontSize: 13,
                        color: CustomColor.black),
                  ),
                  Text(
                    FormatCurrency.convertToIdr(listOrder[index].totOrder, 0),
                    style: TextStyle(
                        fontFamily: "inter500",
                        fontSize: 13,
                        color: CustomColor.black),
                  ),
                ],
              ),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: CustomColor.red),
                      child: Text("Tolak",
                          style: TextStyle(
                              fontFamily: "inter600",
                              fontSize: 13,
                              color: CustomColor.white))),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          backgroundColor: CustomColor.primary),
                      child: Text(
                        "Terima",
                        style: TextStyle(
                            fontFamily: "inter600",
                            fontSize: 13,
                            color: CustomColor.white),
                      ))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    setupDummy();
    super.initState();
  }

  void setupDummy() {
    listOrder.add(ModelOrder(
        idOrder: 1,
        name: "Ajat",
        totItem: 4,
        totOrder: 100000,
        time: "08:30 WIB"));
    listOrder.add(ModelOrder(
        idOrder: 2,
        name: "Jeka Huna Laguna",
        totItem: 1,
        totOrder: 5000,
        time: "13:00 WIB"));
    listOrder.add(ModelOrder(
        idOrder: 3,
        name: "Mc'Duloh",
        totItem: 1,
        totOrder: 50000,
        time: "14:30 WIB"));
    listOrder.add(ModelOrder(
        idOrder: 4,
        name: "Asep",
        totItem: 10,
        totOrder: 200000,
        time: "17:00 WIB"));
  }
}
