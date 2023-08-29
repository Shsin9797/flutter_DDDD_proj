import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Add onPressed logic here
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 8),
            StoriesSection(),
            Divider(),
            PostCard(),
            PostCard(),
            PostCard(),
            // Add more PostCard widgets
          ],
        ),
      ),

    );
  }
}


class StoriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
              image: DecorationImage(
                image: NetworkImage('https://placekitten.com/200/300'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage('https://placekitten.com/200/300'),
              ),
              SizedBox(width: 10),
              Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          CachedNetworkImage(
            imageUrl: 'https://placekitten.com/300/400',
            height: 300,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  // Add like logic here
                },
              ),
              IconButton(
                icon: Icon(Icons.comment),
                onPressed: () {
                  // Add comment logic here
                },
              ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: () {
                  // Add send logic here
                },
              ),
            ],
          ),
          Text(
            'Liked by 100 people',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Text(
                'Username',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 4),
              Text("Caption text goes here."),
            ],
          ),
        ],
      ),
    );
  }
}
