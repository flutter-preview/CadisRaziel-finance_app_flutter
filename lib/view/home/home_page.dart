import 'package:finance/core/shared/routes/named_routes.dart';
import 'package:finance/services/secure_storage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _secureStorage = const SecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _secureStorage.deleteOne(key: "CURRENT_USER").then((_) =>
                Navigator.of(context).popAndPushNamed(NamedRoute.initial));

            //quando o flutter reclamar o seguinte 'don't use 'BuildContext' across async gaps.' devemos remover o async await e trabalhr com .then
            // Navigator.of(context).popAndPushNamed(NamedRoute.initial);
          },
          child: Text("Sair"),
        ),
      ),
    );
  }
}
