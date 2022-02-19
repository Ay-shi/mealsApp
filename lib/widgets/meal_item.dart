import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './meal_screen.dart';
import '../models/meals.dart';

class MealItem extends StatelessWidget {
  //const MealItem({ Key? key }) : super(key: key);
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String id;
  //final Function remove;

  const MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    //required this.remove
  });

  void _selectMeal(ctx) {
    Navigator.of(ctx).pushNamed(MealScreen.routeName, arguments: id);
    //     .then((mid) {
    //   if (mid != null) remove(mid);
    // });
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'affordable';
        break;
      case Affordability.Luxurious:
        return 'luxurios';
        break;
      case Affordability.Pricey:
        return 'pricey';
      default:
        return 'unknown';
    }
  }

  String get complexityText {
    switch (complexity) {
      case Complexity.Challenging:
        return 'challenging';
        break;
      case Complexity.Hard:
        return 'hard';
        break;
      case Complexity.Simple:
        return 'simple';
      default:
        return 'unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          _selectMeal(context);
        },
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 4,
            margin: const EdgeInsets.all(10),
            child: Column(children: <Widget>[
              Stack(children: <Widget>[
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 250,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    )),
                Positioned(
                  left: 20,
                  top: 20,
                  child: Container(
                    width: 220,
                    child: Text(
                      title,
                      style: const TextStyle(
                        backgroundColor: Colors.black54,
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.schedule),
                          SizedBox(width: 6),
                          Text('$duration min'),
                        ],
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.work),
                          SizedBox(width: 6),
                          Text('$complexityText'),
                        ],
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(width: 6),
                        Text('$affordabilityText'),
                      ],
                    )
                  ],
                ),
              ),
            ])));
  }
}
