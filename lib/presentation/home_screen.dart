import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:patient_data/utils/components.dart';
import 'package:patient_data/utils/constants.dart';

class HomeScreen extends StatelessWidget {
  TextEditingController idPatientController = TextEditingController();
  TextEditingController namePatientController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset("assets/images/logo.svg", height: 30),
            const Spacer(),
            const Text(
              'Jane',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 5),
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.asset(
                "assets/images/person.jpg",
                fit: BoxFit.fitWidth,
                height: 40,
                width: 40,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        color: Theme.of(context).primaryColor.withOpacity(.03),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Doctors Requests',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            largeVerticalSpace,
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (_, __) => mediumVerticalSpace,
                itemBuilder: (ctx, index) {
                  return InkWell(
                    onTap: () {},
                    // splashColor: Theme.of(context).primaryColor.withOpacity(.1),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: index < 2
                              ? Theme.of(context).primaryColor.withOpacity(.3)
                              : const Color(0xFFF2F3F4),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 45,
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: Image.asset(
                                  "assets/images/esther.png",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      'Esther Howard',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                    smallVerticalSpace,
                                    Text(
                                      'Doctor in commuity hospital, specialized in lungs treatment',
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if (index < 2) ...[
                            mediumVerticalSpace,
                            Row(
                              children: [
                                const Spacer(),
                                OutlinedButton(
                                  style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                      BorderSide(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFFFAFAFA),
                                    ),
                                    foregroundColor: MaterialStateProperty.all(
                                      Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  child: const Text("Cancel"),
                                  onPressed: () {},
                                ),
                                const SizedBox(width: 10),
                                FilledButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  child: const Text("Accept"),
                                  onPressed: () {
                                    acceptDialog(context);
                                  },
                                ),
                              ],
                            ),
                          ]
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
            /*const Text(
              "Patient Informations",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            mediumVerticalSpace,
            MyTextField(
              context,
              controller: idPatientController,
              label: "ID",
              hintText: "#ad4523"
            ),
            mediumVerticalSpace,
            MyTextField(
              context,
              controller: namePatientController,
              label: "Name",
              hintText: "Chris Bumstead"
            ),*/
          ],
        ),
      ),
    );
  }
}
