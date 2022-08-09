import 'package:application_from_scratch_flutter_9antra_the_bridge/theme/color.dart';
import 'package:flutter/material.dart';

class CustomDialogBox extends StatefulWidget {
  final String title;
  final String descriptions;
  final String text;
  final String? img;

  const CustomDialogBox({Key? key, this.title = "Message", this.descriptions = "", this.text = "Ok", this.img}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: Constants.padding,top: Constants.avatarRadius
              + Constants.padding, right: Constants.padding,bottom: Constants.padding
          ),
          margin: const EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            borderRadius: BorderRadius.circular(Constants.padding),
            boxShadow: const [
              BoxShadow(color: Colors.black,offset: Offset(0,10),
              blurRadius: 10
              ),
            ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(widget.title,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
              const SizedBox(height: 15,),
              Text(widget.descriptions, style: const TextStyle(fontSize: 14),textAlign: TextAlign.center,),
              const SizedBox(height: 22,),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text(widget.text, style: const TextStyle(fontSize: 18, color: primary),)),
               
              ),
            ],
          ),
        ),
        const Positioned(
          left: Constants.padding,
            right: Constants.padding,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: Constants.avatarRadius,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                  child: Image(image: NetworkImage("https://cdn-icons-png.flaticon.com/512/3820/3820331.png"))
              ),
            ),
        ),
      ],
    );
  }
}

class Constants{
  Constants._();
  static const double padding = 20;
  static const double avatarRadius =45;
}