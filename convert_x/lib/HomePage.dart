
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'CurrencyService/CurrencyService.dart';
import 'model/CurrencyModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String fromValue = "USD";
  String toValue = "EGP";
  CurrencyModel? currencyModel;
  bool validate = false;
  String result = "result";
  final TextEditingController amountTextEditingController =
      TextEditingController();

  CurrencyService service = CurrencyService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEAF3FF),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Colors.blue,
                  Colors.blue.shade600,
                  Colors.blue.shade700,
                  Colors.blue.shade800,
                  Colors.blue.shade300,
                  Colors.blue.shade400,
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 4,
                ),
                Image.asset(
                  'assets/Image/Logo.png',
                  height: 70,
                  width: 70,
                ),
                const Spacer(),
                const Text(
                  "Welcome to ConvertX",
                  style: TextStyle(
                      fontSize: 32, color: Colors.white, fontFamily: 'Alkatra'),
                ),
                const Text(
                  "I'm here to help you",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                const Spacer(
                  flex: 2,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 50),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            height: 300,
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Text(
                            "TRANSFER OPERATION",
                            style: TextStyle(fontSize: 18),
                          ),
                        )
                      ],
                    ),
                    const Divider(
                      color: Color(0xffEAF3FF),
                      thickness: 2,
                      indent: 0,
                      endIndent: 0,
                      height: 10,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("From"),
                            DropdownButton(
                              items: const [
                                DropdownMenuItem(
                                  value: "USD",
                                  child: Text("USD"),
                                ),
                                DropdownMenuItem(
                                  value: "SAR",
                                  child: Text("SAR"),
                                ),
                                DropdownMenuItem(
                                  value: "EGP",
                                  child: Text("EGP"),
                                ),
                                DropdownMenuItem(
                                  value: "EUR",
                                  child: Text("EUR"),
                                ),
                              ],
                              value: fromValue,
                              onChanged: (value) {
                                setState(() {
                                  fromValue = value!;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 4,
                      ),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("To"),
                            DropdownButton(
                              items: const [
                                DropdownMenuItem(
                                    value: "USD", child: Text("USD")),
                                DropdownMenuItem(
                                  value: "SAR",
                                  child: Text("SAR"),
                                ),
                                DropdownMenuItem(
                                  value: "EGP",
                                  child: Text("EGP"),
                                ),
                                DropdownMenuItem(
                                  value: "EUR",
                                  child: Text("EUR"),
                                ),
                              ],
                              value: toValue,
                              onChanged: (value) {
                                setState(() {
                                  toValue = value!;
                                });
                              },
                            )
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100,
                      child: Column(
                        children: [
                          TextField(
                            controller: amountTextEditingController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.numberWithOptions(
                                signed: false, decimal: true),
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp('[0-9.]'))
                            ],
                          )
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/Image/exchange.jpg',
                          height: 70,
                          width: 70,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 100,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 100,
                            height: 100,
                            child: Center(
                              child: Text(result),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 30,
            child: IconButton(
              onPressed: () async {
                double amount = double.parse(amountTextEditingController.text);

                if (amount > 0) {
                  currencyModel =
                      await service.getCurrencyData(fromValue, toValue, amount);
                  print(currencyModel);
                  setState(() {
                    result = currencyModel!.result.toString();
                  });
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Enter Valid Number'),
                    backgroundColor: (Colors.blue),
                  ));
                  setState(() {
                    result = "Enter valid value";
                  });
                }
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
