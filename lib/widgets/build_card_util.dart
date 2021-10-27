import 'package:flutter/material.dart';

Widget buildCardUtil({Key? key, required BuildContext context, required int index,required List items }) =>
    Card(
      key: key,
      elevation: 8,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: 200,
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  'https://picsum.photos/200',
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    items.contains(items[index])
                         ? items.remove(items[index])
                         : items.add(items[index]);
                     // state.didChange(_selectedAnimals);
                    print(items);
                  },
                  splashColor: Colors.blue.withOpacity(0.4),
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black45,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.favorite,
                              size: 32.0,
                            )
                          ],
                        ),
                        // const SizedBox(height: 6),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
