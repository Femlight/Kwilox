import 'package:flutter/material.dart';
import 'package:kwilox_/models/constant.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(80)),
          Center(
            child: Text(
              'List Of Items',
              style: TextStyle(
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
                color: kmainColor,
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Expanded(
            child: ListView.builder(
                itemCount: 3,
                // widget.myTickets.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(getProportionateScreenWidth(10)),
                    padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                    decoration: BoxDecoration(
                      color: kmainColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(height: getProportionateScreenHeight(10)),
                            Row(
                              children: [
                                Text('ID:'),
                                SizedBox(
                                  width: getProportionateScreenWidth(10),
                                ),
                                Text('62137008b1c712482ec2c65c'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Row(
                          children: [
                            Text("itemName:"),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            Text("pepsi"
                                // '${widget.myTickets[index].fullName}'
                                ),
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Row(
                          children: [
                            Text("manufacturerCompany:"),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            Text("7up bottling company"
                                // '${widget.myTickets[index].fullName}'
                                ),
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Row(
                          children: [
                            Text("quantityAvailable:"),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            Text(
                              '8',
                              // '${widget.myTickets[index].fullName}'
                            ),
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Row(
                          children: [
                            Text("expiryDate:"),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            Text("2023-12-11T23:00:00.000Z"
                                // '${widget.myTickets[index].fullName}'
                                ),
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(10)),
                        Row(
                          children: [
                            Text("name:"),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            Text("cocacola"
                                // '${widget.myTickets[index].fullName}'
                                ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
