//import 'package:api_call/helper/dataAPIHelper.dart';
import 'package:api_call/controller/datalist.dart';
import 'package:api_call/helper/dataAPIHelper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final dataListBloc = DataListBloc();
  data() async {
    dataListBloc.incrementDataList(await DataAPIHelp.dataAPIHelp.fetchData());
  }

  @override
  void initState() {
    super.initState();
    data();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Call"), centerTitle: true),
      body: StreamBuilder(
        initialData: dataListBloc.dataList,
        stream: dataListBloc.DataListStream,
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasError) {
            return Center(
              child: Text("Error is ${snapshot.error}"),
            );
          } else if (snapshot.data != []) {
            return ListView.builder(
              itemCount: dataListBloc.dataList.length,
              itemBuilder: (context, i) {
                return Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text("${dataListBloc.dataList[i].title}"),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
