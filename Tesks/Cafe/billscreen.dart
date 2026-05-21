import 'package:flutter/material.dart';

class Billscreen extends StatefulWidget {

  final String tableNo;
  final List<String> items;
  final int total;

  const Billscreen({
    super.key,
    required this.tableNo,
    required this.items,
    required this.total,
  });

  @override
  State<Billscreen> createState() => _BillscreenState();
}

class _BillscreenState extends State<Billscreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Bill Screen",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),

          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(20),
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // TABLE NUMBER
              Text(
                "Table Number : ${widget.tableNo}",

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              // ITEMS TITLE
              const Text(
                "Ordered Items",

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const Divider(
                color: Colors.white,
                thickness: 2,
              ),

              const SizedBox(height: 20),


              Expanded(
                child: ListView.builder(

                  itemCount: widget.items.length,

                  itemBuilder: (context, index) {

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),

                      child: Text(
                        widget.items[index],

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const Divider(
                color: Colors.white,
                thickness: 2,
              ),

              const SizedBox(height: 20),

              // TOTAL
              Text(
                "Total Bill : ₹ ${widget.total}",

                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}