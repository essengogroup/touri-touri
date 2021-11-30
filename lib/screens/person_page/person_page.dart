import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:touritouri/models/user.dart';
import 'package:touritouri/screens/login_register/login.dart';
import 'package:touritouri/utils/preference.dart';
import 'package:touritouri/widgets/app_bar_widget.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  final double coverHeight = 170; //200
  final double profilHeight = 96; //144

  // late SharedPref pref;
  // late User user = User() ;

  // loadUser () async {
  //   await pref.getUser().then((newUser){
  //     user =newUser;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // pref = SharedPref().isLogged();
    // loadUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarProfileWidget(context, () {}),
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[builTop(), buildContent()],
        ));
  }

  Widget builTop() {
    final bottom = profilHeight / 2;
    final top = coverHeight - profilHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: bottom), child: buildCoverImage()),
        Positioned(top: top, child: buildProfilImage()),
      ],
    );
  }

  Widget buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
              "name first_name",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black),
            ),
          ),
          Center(
            child: Text(
              'email / phone',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 20,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Statistique",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.blue),
          ),
          const Divider(),
          buildRowDetail(name: "Visite de site", number: 7),
          const Divider(),
          buildRowDetail(name: "Participation événement", number: 0),
          const Divider(),
          buildRowDetail(name: "Participation activité", number: 2),
          const Divider(),
          buildRowDetail(name: "Trophet optenue", number: 2),
          const Divider(),
          buildRowDetail(name: "Partages", number: 2),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Details",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.blue),
          ),
          const Divider(),
          buildListCard(),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Reservation encours de validation",
            textAlign: TextAlign.start,
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, color: Colors.blue),
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.only(bottom: 80),
            child: buildListReservationWait(),
          ),
        ],
      ),
    );
  }


  Widget buildRowDetail({required String name, required int number}) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            textAlign: TextAlign.start,
            style: const TextStyle(
                fontWeight: FontWeight.normal, color: Colors.black),
          ),
          Text(
            "$number",
            textAlign: TextAlign.start,
            style: const TextStyle(
                fontWeight: FontWeight.normal, color: Colors.black),
          ),
        ],
      ),
    );
  }

  Widget buildListCard() {
    List<String> datas = ['sites', 'activity', 'events', 'trophets'];
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: datas.length,
        itemBuilder: (context, index) {
          return Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              splashColor: Colors.blue.withOpacity(0.4),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: 150,
                margin: const EdgeInsets.only(left: 8.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  border: Border.all(
                    color: Colors.black12,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.blueAccent]),
                ),
                child: Center(
                  child: Text(
                    datas[index],
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildListReservationWait() {
    List<int> datas = [1, 2, 3];
    return Column(
      children: datas
          .map((e) => Container(
                height: 50,
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: 4.0,
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text(
                                  "Site Louango",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Encours de traitement...",
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            Text('Date')
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }

  Widget buildCoverImage() {
    return Container(
      color: Colors.grey,
      child: Image.asset(
        'assets/bg_head_trophy.jpg',
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget buildProfilImage() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(profilHeight / 2)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      padding: EdgeInsets.all(3.0),
      child: CircleAvatar(
        radius: profilHeight / 2,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: const NetworkImage('https://picsum.photos/200'),
      ),
    );
  }

  Widget buildButton({required String text, required int value}) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 4),
      onPressed: () {},
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '$value',
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 2.0,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          )
        ],
      ),
    );
  }

  Widget buildDivider() => Column(
        children: const [
          SizedBox(
            height: 8.0,
          ),
          Divider(),
          SizedBox(
            height: 8.0,
          ),
        ],
      );

  Widget buildAbout() => Column(
        children: const <Widget>[
          Text(
            "About ou liste des reservations",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin sed lobortis lacus. Maecenas arcu lorem, tincidunt et molestie egestas, mollis vel velit. Nunc suscipit sit amet enim vitae tincidunt. Nunc ac metus vestibulum, consectetur mi at, venenatis neque. In sem mauris, gravida sollicitudin lobortis sit amet, tincidunt et arcu. Maecenas feugiat turpis maximus porta rhoncus. Quisque auctor sodales tincidunt. Donec a elementum leo, eu aliquam ipsum. Fusce purus neque, scelerisque sed massa vel, interdum auctor lacus. Nullam cursus non odio in ullamcorper. Duis eget vehicula turpis."),
          ),
        ],
      );
}
