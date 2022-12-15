import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:mcfooddriver/helper/FormatCurrency.dart';
import 'package:mcfooddriver/model/ModelDetailFood.dart';
import 'package:mcfooddriver/model/ModelTrans.dart';
import 'package:mcfooddriver/ui/GMaps.dart';
import 'package:mcfooddriver/util/CustomColor.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart'
as bottomNav;

class ListTransSub extends StatefulWidget {
  const ListTransSub({Key? key}) : super(key: key);

  @override
  State<ListTransSub> createState() => _ListTransSubState();
}

class _ListTransSubState extends State<ListTransSub> with ChangeNotifier {
  ValueNotifier<ModelTrans?> valTrans = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white,
      appBar: AppBar(
        title: Text(
          "Transaksi",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: "inter600", fontSize: 15, color: CustomColor.black),
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.access_time_sharp,
                color: CustomColor.primary,
              ))
        ],
        backgroundColor: CustomColor.white,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ayo selesaikan pesenannya !",
                    style: TextStyle(
                        fontFamily: "inter600",
                        fontSize: 25,
                        color: CustomColor.black),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      "Lihat pesanan di bawah ini",
                      style: TextStyle(
                          fontFamily: "inter500",
                          fontSize: 15,
                          color: CustomColor.black),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: valTrans,
                    builder: (_, result, __) {
                      return Visibility(
                          visible: result != null ? true : false,
                          child: listItem());
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                  onPressed: () {
                    bottomNav.pushNewScreen(context,
                        withNavBar: false,
                        screen: GMaps());
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColor.primary,
                      minimumSize: Size.fromHeight(45),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Go to location",
                        style: TextStyle(
                            fontFamily: "inter600",
                            fontSize: 15,
                            color: CustomColor.white),
                      ),
                      Icon(Icons.location_on_rounded, color: CustomColor.white,)
                    ],
                  )),
            ),
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

  Widget listItem() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: CustomColor.greyBd, width: 2)),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(vertical: 10),
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
                    "${valTrans.value?.idTrans}",
                    style: TextStyle(
                        fontFamily: "inter500",
                        fontSize: 15,
                        color: CustomColor.black),
                  ),
                ],
              ),
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
                    FormatCurrency.convertToIdr(
                        valTrans.value?.totPrice ?? 0, 0),
                    style: TextStyle(
                        fontFamily: "inter500",
                        fontSize: 13,
                        color: CustomColor.black),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
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
                  "${valTrans.value?.name}",
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
                "${valTrans.value?.totItem} item",
                style: TextStyle(
                    fontFamily: "inter500",
                    fontSize: 13,
                    color: CustomColor.black),
              ),
            ],
          ),
          Accordion(
              maxOpenSections: 2,
              headerBackgroundColorOpened: Colors.black54,
              scaleWhenAnimating: true,
              openAndCloseAnimation: true,
              sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
              sectionClosingHapticFeedback: SectionHapticFeedback.light,
              leftIcon: Icon(
                Icons.checklist,
                color: CustomColor.primary,
              ),
              children: [
                AccordionSection(
                  headerBackgroundColor: Colors.white,
                  headerBackgroundColorOpened: CustomColor.primary,
                  header: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Detail Pesanan",
                        style: TextStyle(
                          fontFamily: "inter500",
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  content: Column(
                    children: [
                      for (int x = 0;
                          x < valTrans.value!.listItem.length;
                          x++) ...[
                        detailItem(x),
                      ],
                    ],
                  ),
                ),
              ]),
        ],
      ),
    );
  }

  Widget detailItem(x) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 70,
            color: CustomColor.primary,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${valTrans.value?.listItem[x].name}",
                  style: TextStyle(
                      fontFamily: "inter600",
                      fontSize: 18,
                      color: CustomColor.black),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        FormatCurrency.convertToIdr(
                            valTrans.value?.listItem[x].price ?? 0, 0),
                        style: TextStyle(
                            fontFamily: "inter500",
                            fontSize: 15,
                            color: CustomColor.primary),
                      ),
                    ),
                    Text(
                      " x${valTrans.value?.listItem[x].sum}",
                      style: TextStyle(
                          fontFamily: "inter500",
                          fontSize: 15,
                          color: CustomColor.black),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void setupDummy() {
    List<ModelDetailFood> listDetail = [];
    listDetail.add(
        ModelDetailFood(idFood: 1, name: "Ayam Goreng", sum: 4, price: 12500));
    listDetail.add(
        ModelDetailFood(idFood: 2, name: "Sate Ayam", sum: 1, price: 25000));
    listDetail.add(
        ModelDetailFood(idFood: 3, name: "Jus Jambu", sum: 1, price: 15000));
    listDetail
        .add(ModelDetailFood(idFood: 4, name: "Nasi", sum: 1, price: 10000));

    valTrans.value = ModelTrans(
        idTrans: 1,
        name: "Ajat",
        totItem: 4,
        totPrice: 100000,
        listItem: listDetail);
    valTrans.notifyListeners();
    print("TOTAL ${valTrans.value?.name}");
  }
}
