import 'package:application_from_scratch_flutter_9antra_the_bridge/model/message.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/services/auth.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/services/message.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/theme/color.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/widgets/chat_room_item.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/widgets/custom_dialog.dart';
import 'package:application_from_scratch_flutter_9antra_the_bridge/widgets/custom_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController messageController = TextEditingController();
  bool isLoading = false;
  MessageService service = MessageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      appBar: AppBar(
        title: 
          Column(
            children: const [
              Text("Messanger"),
            ],
          ),
        actions: [
          Container(
            child: IconButton(
              onPressed: (){
                showConfirmLogout();
              }, 
              icon: const Icon(Icons.logout_rounded)
            )
          ),
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: getChats()
        ),
      ),
      floatingActionButton: getBottom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  getChats(){
    return StreamBuilder<QuerySnapshot>(
      stream: service.getMessageStream(10),
      builder: (context, snapshot){
        if(!snapshot.hasData) {
          return Container();
        }
        var data = snapshot.data!.docs;
        print(data.length);
       return ListView.builder(itemBuilder: (context, index) {
         var msg = Message.fromJson(data[index].data() as Map<String, dynamic>);
         return ChatRoomItem(message: msg);
       }, shrinkWrap: true, itemCount: data.length);
    });
  }

  getBottom(){
    return 
      Container(
        padding: const EdgeInsets.only(left: 15, right: 5),
        margin: const EdgeInsets.only(left: 10, right: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Row(children: [
          Expanded(
            child: Container(
              child: CustomTextField(
                controller: messageController,
                hintText: "Send your message",
              )
            ),
          ),
          IconButton(
            onPressed: () {
              sendMessage();
            },
            icon: Icon(Icons.send_rounded, color: isLoading ? Colors.grey : primary, size: 35,)
          )
        ],),
      );
  }

  sendMessage() async{
    if(isLoading) return;
    setState(() {
      isLoading = true;
    });

    var res = await service.sendMessage(messageController.text);

    setState(() {
      isLoading = false;
    });
    if(res["status"] == true){
      messageController.clear();
    }else{
      showDialog(
        context: context,
        builder: (BuildContext context){
        return CustomDialogBox(title: "Chat", descriptions: res["message"],);
        }
      );
    }
  }

  showConfirmLogout(){
    showCupertinoModalPopup(
      context: context, 
      builder: (context) =>
        CupertinoActionSheet(
          message: const Text("Are you sure to log out?"),
          actions: [
            CupertinoActionSheetAction(
              onPressed: (){
                AuthService auth = AuthService();
                auth.logOut();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginPage()), 
                (route) => false);
              },
              child: const Text("Log Out", style: TextStyle(color: secondary),),
            )
          ],
          cancelButton: 
            CupertinoActionSheetAction(child:
              const Text("Cancel"),
              onPressed: (){
               Navigator.of(context).pop();
              },
            )
        )
    );
  }
}