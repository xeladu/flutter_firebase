import 'package:flutter/material.dart';
import 'package:flutter_firebase/firebase/firestore.dart';
import 'package:flutter_firebase/widgets/custom_bottom_app_bar.dart';

class FirestorePage extends StatefulWidget {
  const FirestorePage({Key? key}) : super(key: key);

  @override
  State<FirestorePage> createState() => _State();
}

class _State extends State<FirestorePage> {
  List<Car> _dataToDisplay = <Car>[];
  final List<Car> _dummyCars = <Car>[
    Car(
        manufacturer: "Tesla",
        price: 65000,
        engine: Engine(cylinders: 0, horsePower: 540)),
    Car(
        manufacturer: "Ford",
        price: 34000,
        engine: Engine(cylinders: 4, horsePower: 350)),
    Car(
        manufacturer: "BMW",
        price: 75000,
        engine: Engine(cylinders: 6, horsePower: 690)),
    Car(
        manufacturer: "Mercedes-Benz",
        price: 125000,
        engine: Engine(cylinders: 8, horsePower: 460)),
    Car(
        manufacturer: "Audi",
        price: 92000,
        engine: Engine(cylinders: 8, horsePower: 520)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text("Firebase Firestore"))),
        bottomNavigationBar: const CustomBottomAppBar(
          showGitHubLink: false,
          showMediumLink: true,
          customMediumLink:
              "https://medium.com/gitconnected/how-to-use-firebase-cloud-firestore-with-a-flutter-app-2110da689e08",
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Container(
                  color: Colors.grey.shade300,
                  child: IconButton(
                      onPressed: () async {
                        await Firestore.addOrUpdateWithId(
                            "cars", "0", _dummyCars[0].toMap());
                        await Firestore.addOrUpdateWithId(
                            "cars", "1", _dummyCars[1].toMap());
                        await Firestore.addOrUpdateWithId(
                            "cars", "2", _dummyCars[2].toMap());
                        await Firestore.addOrUpdateWithId(
                            "cars", "3", _dummyCars[3].toMap());
                        await Firestore.addOrUpdateWithId(
                            "cars", "4", _dummyCars[4].toMap());

                        _dataToDisplay = await Firestore.getAllEntries("cars");
                        setState(() {});

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text("Dummy data added!")));
                      },
                      icon: Icon(Icons.add,
                          color: Theme.of(context).colorScheme.secondary)),
                ),
                Container(
                  color: Colors.grey.shade300,
                  child: IconButton(
                      onPressed: () async {
                        await Firestore.deleteEntry("cars", "4");
                        await Firestore.deleteEntry("cars", "3");
                        await Firestore.deleteEntry("cars", "2");
                        await Firestore.deleteEntry("cars", "1");
                        await Firestore.deleteEntry("cars", "0");

                        _dataToDisplay = await Firestore.getAllEntries("cars");
                        setState(() {});

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text("All data deleted!")));
                      },
                      icon: Icon(Icons.delete,
                          color: Theme.of(context).colorScheme.secondary)),
                ),
                Container(
                  color: Colors.grey.shade300,
                  child: IconButton(
                      onPressed: () async {
                        _dataToDisplay =
                            await Firestore.getAllEntriesSortedByName("cars");
                        setState(() {});

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.green,
                                content: Text("Data sorted by name")));
                      },
                      icon: Icon(Icons.sort_by_alpha,
                          color: Theme.of(context).colorScheme.secondary)),
                ),
                Container(
                  color: Colors.grey.shade300,
                  child: IconButton(
                      onPressed: () async {
                        _dataToDisplay =
                            await Firestore.getAllEntriesFilteredByPrice(
                                "cars");
                        setState(() {});

                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.green,
                                content:
                                    Text("Data filtered by price > 60000")));
                      },
                      icon: Icon(Icons.filter_alt,
                          color: Theme.of(context).colorScheme.secondary)),
                ),
              ]),
              Container(height: 10),
              (_dataToDisplay.isEmpty)
                  ? const Text("No data")
                  : Expanded(
                      child: ListView.builder(
                          itemCount: _dataToDisplay.length,
                          itemBuilder: (ctx, index) {
                            return Text(_dataToDisplay[index].toString());
                          }))
            ])));
  }
}
