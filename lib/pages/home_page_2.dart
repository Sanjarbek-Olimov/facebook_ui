import 'dart:math';

import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class HomePage2 extends StatefulWidget {
  static const String id = "home_page_2";

  const HomePage2({Key? key}) : super(key: key);

  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  bool isLiked = false;
  List stories = [
    {
      "storyImage": 'assets/images/story_5.jpeg',
      "storyImage2": 'assets/images/feed_5.jpeg',
      "userImage": 'assets/images/user_5.jpeg',
      "userName": 'User Five'
    },
    {
      "storyImage": 'assets/images/story_4.jpeg',
      "storyImage2": 'assets/images/feed_4.jpeg',
      "userImage": 'assets/images/user_4.jpeg',
      "userName": 'User Four'
    },
    {
      "storyImage": 'assets/images/story_3.jpeg',
      "storyImage2": 'assets/images/feed_3.jpeg',
      "userImage": 'assets/images/user_3.jpeg',
      "userName": 'User Three'
    },
    {
      "storyImage": 'assets/images/story_2.jpeg',
      "storyImage2": 'assets/images/feed_2.jpeg',
      "userImage": 'assets/images/user_2.jpeg',
      "userName": 'User Two'
    },
    {
      "storyImage": 'assets/images/story_1.jpeg',
      "storyImage2": 'assets/images/feed_1.jpeg',
      "userImage": 'assets/images/user_1.jpeg',
      "userName": 'User One'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "facebook",
          style: TextStyle(
              color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, HomePage.id);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.grey,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.camera_alt,
                color: Colors.grey,
              )),
          const SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // #search
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage("assets/images/user_5.jpeg"),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "What's on your mind?",
                          hintStyle: const TextStyle(color: Colors.grey),
                          contentPadding: const EdgeInsets.only(left: 15),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50),
                              borderSide: const BorderSide(color: Colors.grey)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50))),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
            // #live_photo_check
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 10),
              width: MediaQuery.of(context).size.width,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        const Icon(
                          Icons.video_call,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text("Live", style: TextStyle(color: Colors.grey.shade600),)
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),
                    VerticalDivider(
                      thickness: 1,
                      color: Colors.grey.shade600,
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.photo,
                          color: Colors.green,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text("Photo", style: TextStyle(color: Colors.grey.shade600))
                      ],
                    )),
                    VerticalDivider(
                      thickness: 1,
                      color: Colors.grey.shade600,
                    ),
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.red,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        Text("Check in", style: TextStyle(color: Colors.grey.shade600))
                      ],
                    )),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 5,
              color: Colors.grey.shade700,
            ),
            // #stories
            Container(
              height: 200,
              padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    return _stories(
                        stories[index]["storyImage"],
                        stories[index]["userImage"],
                        stories[index]["userName"]);
                  }),
            ),
            Divider(
              thickness: 5,
              color: Colors.grey.shade700,
            ),
            ListView.builder(
              itemCount: stories.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return _posts(stories[(index+3)%5]["storyImage"], stories[(index+3)%5]["storyImage2"],
                    stories[(index+3)%5]["userImage"], stories[(index+3)%5]["userName"]);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _stories(String storyImage, String userImage, String userName) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 180,
      width: MediaQuery.of(context).size.width * 0.28,
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage(storyImage), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(.5),
              Colors.black.withOpacity(.1),
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.blue, width: 1.5)),
              child: CircleAvatar(
                backgroundImage: AssetImage(userImage),
              ),
            ),
            Text(
              userName,
              style: TextStyle(color: Colors.grey.shade400),
            )
          ],
        ),
      ),
    );
  }

  Widget _posts(String storyImage, String storyImage2, String userImage, String userName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(left: 10),
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(userImage),
          ),
          title: Text(
            userName,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.grey.shade700,
                letterSpacing: 1),
          ),
          subtitle: Text(
            "1 hr ago",
            style: TextStyle(fontSize: 15, color: Colors.grey.shade700),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: Colors.grey.shade700,
              size: 30,
            ),
          ),
        ),
        Container(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
            child: Text(
              "All the Lorem Ipsum generators on the Internet tend to repeat predefined.",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[700],
                  height: 1.5,
                  letterSpacing: .7),
            )),
        Row(
          children: [
            Expanded(child: Image.asset(storyImage, height: 240, fit: BoxFit.cover)),
            Expanded(child: Image.asset(storyImage2, height: 240, fit: BoxFit.fill)),
          ],
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Badge(
                        padding: EdgeInsets.zero,
                        elevation: 0,
                        position: const BadgePosition(start: 20),
                        badgeContent: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 1,
                                color: Colors.white
                              )
                            ),
                            child: const CircleAvatar(
                              backgroundColor: Colors.red,
                              radius: 11,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.white,
                                size: 13,
                              ),
                            ),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    width: 1,
                                    color: Colors.white
                                )
                            ),
                            child: const CircleAvatar(
                              radius: 11,
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.thumb_up_alt_rounded,
                                color: Colors.white,
                                size: 13,
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.08,
                    ),
                    Text(
                      "2.5K",
                      style:
                          TextStyle(color: Colors.grey.shade700, fontSize: 15),
                    )
                  ],
                ),
                Text(
                  "400 Comments",
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
                ),
              ],
            )),
        Divider(
          color: Colors.grey.shade700,
          thickness: 1,
          endIndent: 15,
          indent: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  isLiked = !isLiked;
                });
              },
              child: Row(
                children: [
                  Icon(
                    isLiked
                        ? CupertinoIcons.hand_thumbsup_fill
                        : CupertinoIcons.hand_thumbsup,
                    color: isLiked ? Colors.blue : Colors.grey.shade700,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Like",
                    style: TextStyle(
                        color: isLiked ? Colors.blue : Colors.grey.shade700,
                        fontSize: 16),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            )),
            Expanded(
                child: MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.grey.shade700,
                    size: 25,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Comment",
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                  )
                ],
              ),
            )),
            Expanded(
                child: MaterialButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform(
                    alignment: FractionalOffset.center,
                    transform: Matrix4.rotationY(pi),
                    child: Icon(
                      CupertinoIcons.reply,
                      color: Colors.grey.shade700,
                      size: 25,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Share",
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                  )
                ],
              ),
            )),
          ],
        ),
        Divider(
          color: Colors.grey.shade700,
          thickness: 8,
        )
      ],
    );
  }
}
