import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Color(0xFF6200AF),
      ),
      home: MyHomePage(),
    );
  }
}

class HomeUserMessage extends StatefulWidget {
  String photoURL;
  String name;
  String lastMessage;
  int nbrUnreadMessage;
  String lastMessageHour;

  HomeUserMessage(
      {this.photoURL,
      this.name,
      this.lastMessage,
      this.lastMessageHour,
      this.nbrUnreadMessage});

  _HomeUserMessageState createState() => _HomeUserMessageState();
}

class _HomeUserMessageState extends State<HomeUserMessage> {
  String formatter(String msg) {
    String result;

    if (msg.length > 26) {
      result = msg.substring(0, 26) + '...';
      return (result);
    } else
      return (msg);
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
        child: Row(
      children: [
        Stack(
          children: [
            Container(
              height: 78,
              width: 78,
              decoration: BoxDecoration(
                  color: Theme.of(context).accentColor, shape: BoxShape.circle),
            ),
            Positioned(
              top: 4,
              left: 4,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  widget.photoURL,
                ),
                backgroundColor: Theme.of(context).accentColor,
                radius: 35,
              ),
            ),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: MediaQuery.of(context).size.width * (0.55),
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                text: widget.name + '\n\n',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              TextSpan(
                  text: formatter(widget.lastMessage),
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontWeight: FontWeight.normal,
                      fontSize: 15)),
            ]),
          ),
        ),
        Column(
          children: [
            Text(
              widget.lastMessageHour,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 27,
              width: 27,
              decoration: BoxDecoration(
                color: !(widget.nbrUnreadMessage == 0)
                    ? Theme.of(context).accentColor
                    : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Center(
                    child: !(widget.nbrUnreadMessage == 0)
                        ? AutoSizeText(
                            widget.nbrUnreadMessage.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          )
                        : null,
                  )),
            ),
          ],
        )
      ],
    )));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String fullMessage = "Salut bro comment te portes tu ?";

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: Drawer(
        child: Column(),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).accentColor,
        title: Center(
          child: Text(
            "Chats",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2),
            child: IconButton(
              onPressed: null,
              icon: Icon(
                LineIcons.search,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height,
              width: size.width,
              color: Theme.of(context).accentColor,
            ),
            Positioned(
              top: size.height * (0.05),
              child: Container(
                height: size.height * 0.82,
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Wrap(
                          spacing: 10,
                          direction: Axis.vertical,
                          children: [
                            HomeUserMessage(
                              photoURL:
                                  'https://randomuser.me/api/portraits/men/17.jpg',
                              name: "Jean Claude",
                              lastMessage: "Mon argent bro ?",
                              nbrUnreadMessage: 0,
                              lastMessageHour: "11:20",
                            ),
                            HomeUserMessage(
                              photoURL:
                                  'https://randomuser.me/api/portraits/men/18.jpg',
                              name: "Baba Tiguè",
                              lastMessage: "Je cherche ta soeur.. Impoli !",
                              nbrUnreadMessage: 100,
                              lastMessageHour: "11:20",
                            ),
                            HomeUserMessage(
                              photoURL:
                                  'https://randomuser.me/api/portraits/men/19.jpg',
                              name: "Fofo Mano",
                              lastMessage: "Arrête la weeb. C'est pas bien.",
                              nbrUnreadMessage: 2,
                              lastMessageHour: "11:20",
                            ),
                            HomeUserMessage(
                              photoURL:
                                  'https://randomuser.me/api/portraits/men/20.jpg',
                              name: "Boss",
                              lastMessage: fullMessage,
                              nbrUnreadMessage: 1,
                              lastMessageHour: "14:01",
                            ),
                            HomeUserMessage(
                              photoURL:
                                  'https://randomuser.me/api/portraits/women/17.jpg',
                              name: "Andrea",
                              lastMessage: "Sodabi combien ?",
                              nbrUnreadMessage: 5,
                              lastMessageHour: "12:20",
                            ),
                            HomeUserMessage(
                              photoURL:
                                  'https://randomuser.me/api/portraits/women/1.jpg',
                              name: "Kpocle",
                              lastMessage: "Miss U Bae...",
                              nbrUnreadMessage: 5,
                              lastMessageHour: "04:10",
                            ),
                            HomeUserMessage(
                              photoURL:
                                  'https://randomuser.me/api/portraits/men/50.jpg',
                              name: "Brizzy",
                              lastMessage:
                                  "Je suis vraiment énerver contre toi",
                              nbrUnreadMessage: 5,
                              lastMessageHour: "20:50",
                            ),
                            HomeUserMessage(
                              photoURL:
                                  'https://randomuser.me/api/portraits/women/28.jpg',
                              name: "Tanti Claudia",
                              lastMessage: "Bébé tu es où ?",
                              nbrUnreadMessage: 5,
                              lastMessageHour: "8:37",
                            ),
                            HomeUserMessage(
                              photoURL:
                                  'https://randomuser.me/api/portraits/men/65.jpg',
                              name: "Jean Claude",
                              lastMessage: "COCHON !",
                              nbrUnreadMessage: 1,
                              lastMessageHour: "19:16",
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
