import 'package:codemagic_flutter_cicd/bloc.dart';
import 'package:codemagic_flutter_cicd/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter(context) {
    Provider.of<Bloc>(context,listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    printLog("build ${Provider.of<Bloc>(context).list.length}");

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(Provider.of<Bloc>(context).list[index].nation!,style: TextStyle(color: Colors.black,fontSize: 16),),
          );
        },
        itemCount: Provider.of<Bloc>(context).list.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _incrementCounter(context),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
