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
  final double coverHeight = 170;//200
  final double profilHeight = 96;//144

  late SharedPref pref;
  late User user = User() ;

  loadUser () async {
    await pref.getUser().then((newUser){
      user =newUser;
    });
  }

  @override
  void initState() {
    pref = SharedPref();
    loadUser();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: appBarWidget(context,(){}),
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[builTop(), builContent(user,pref)],
        ));
  }

  Widget builContent(User user,SharedPref pref ) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          user.first_name!,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black),
        ),
        const SizedBox(
          height: 8.0,
        ),
        Text(
          user.name!,
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildIcon(Icons.map,pref),
            const SizedBox(
              width: 12.0,
            ),
            buildIcon(Icons.face_outlined,pref),
            const SizedBox(
              width: 12.0,
            ),
            buildIcon(Icons.tune,pref),
            const SizedBox(
              width: 12.0,
            ),
            buildIcon(Icons.image,pref),
          ],
        ),
        const SizedBox(
          height: 16.0,
        ),
        const Divider(),
        const SizedBox(
          height: 16.0,
        ),
        NumbersWidget(),
        const SizedBox(
          height: 16.0,
        ),
        const Divider(),
        const SizedBox(
          height: 16.0,
        ),
        buildAbout(),
        const SizedBox(
          height: 32.0,
        ),
      ],
    );
  }

  Widget NumbersWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildButton(text: 'Viste', value: 39),
        buildDivider(),
        buildButton(text: 'Trophet', value: 39),
        buildDivider(),
        buildButton(text: 'Event', value: 5),
      ],
    );
  }

  Widget buildIcon(IconData iconData,SharedPref pref ) {
    return CircleAvatar(
      radius: 25,
      child: Material(
        shape: const CircleBorder(),
        clipBehavior: Clip.hardEdge,
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            pref.loggout(context, MaterialPageRoute(builder: (context) => const Login()));
          },
          child: Center(
            child: Icon(
              iconData,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }

  Widget builTop() {
    final bottom = profilHeight / 2;
    final top = coverHeight - profilHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: bottom),
            child: buildCoverImage()
        ),
        Positioned(top: top, child: buildProfilImage()),
      ],
    );
  }

  Widget buildCoverImage() {
    return Container(
      color: Colors.grey,
      child: Image.network(
        'https://picsum.photos/200',
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
        boxShadow:  [
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
        backgroundImage:
        NetworkImage('https://picsum.photos/200'),
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
            style: const TextStyle(fontSize: 16,color: Colors.black54),
          )
        ],
      ),
    );
  }

  Widget buildDivider() => Divider();

  Widget buildAbout() => Column(
    children: const <Widget>[
      Text("About ou liste des reservations",style: TextStyle( color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
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
