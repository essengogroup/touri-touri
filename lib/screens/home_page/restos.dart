import 'package:flutter/material.dart';

class Restos extends StatelessWidget {
  const Restos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: ListView.builder(
        itemCount: 40,
        itemBuilder: (context, index) {
          return builCard(index, context);
        },
      ),
    );
  }

  Widget builCard(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      height: 185,
      width: double.infinity,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              'assets/images/r-03.jpg',
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: (){},
              splashColor: Colors.blue.withOpacity(0.4),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.black26,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( 'resto $index',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold
                      ),),
                    const SizedBox(height: 6),
                    Text( 'Description resto $index',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                      ),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
/*
  Ink.image(
              image: const AssetImage('assets/images/r-01.jpg'),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
  */
}
