import 'package:flutter/material.dart'; // [cite: 930]

class ProdukPage extends StatefulWidget { // [cite: 931]
  const ProdukPage({Key? key}): super(key: key); // [cite: 933]
  @override
  ProdukPageState createState() => ProdukPageState(); // [cite: 935]
}

class ProdukPageState extends State<ProdukPage> { // [cite: 936]
  @override
  Widget build (BuildContext context) { // [cite: 937]
    return Scaffold( // [cite: 938]
      appBar: AppBar( // [cite: 939]
        title: const Text('List Data Produk'), // [cite: 940]
      ),
      body: ListView( // [cite: 942]
        children: const [ // [cite: 943]
          Card( // [cite: 944]
            child: ListTile( // [cite: 945]
              title: Text('Kulkas'), // [cite: 946]
              subtitle: Text('30000'), // [cite: 947]
            ),
          ),
          Card( // [cite: 950]
            child: ListTile( // [cite: 951]
              title: Text('Playstation'), // [cite: 952]
              subtitle: Text('30000'), // [cite: 953]
            ),
          ),
          Card( // [cite: 956]
            child: ListTile( // [cite: 957]
              title: Text('Radio'), // [cite: 958]
              subtitle: Text('30000'), // [cite: 959]
            ),
          )
        ],
      ),
    );
  }
}