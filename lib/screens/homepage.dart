import 'package:flutter/material.dart';
import 'package:hpb_covid_api/services/api_service.dart';

import '../components/custom_container.dart';
import '../models/covid_data_model.dart';
import '../models/pcr_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService service = ApiService();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: FutureBuilder(
        future: service.getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            CovidDataModel data = snapshot.data!;
            List<PcrData> pcrDataList = data.pcrData!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Icon(Icons.menu),
                      Text(
                        "Covid 19",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      Icon(Icons.add_location)
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomContainer(
                        size: size,
                        title: 'Total Deaths',
                        color: Color.fromARGB(255, 233, 10, 155),
                        value: data.totalDeaths!,
                      ),
                      CustomContainer(
                        size: size,
                        title: 'Total Recovered',
                        color: Colors.green,
                        value: data.totalRecovered!,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomContainer(
                        size: size,
                        title: 'Active Cases',
                        color: Color.fromARGB(255, 221, 237, 6),
                        value: data.activeCases!,
                      ),
                      CustomContainer(
                        size: size,
                        title: 'Total Cases',
                        color: Color.fromARGB(255, 230, 13, 230),
                        value: data.totalCases!,
                      ),
                    ],
                  ),
                  const Text(
                    "Daily Pcr Test",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: pcrDataList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              pcrDataList[index].date.toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              pcrDataList[index].count.toString(),
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    ));
  }
}
