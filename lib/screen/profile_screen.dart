import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('프로필'),
        actions: [
          IconButton( //앱바에 설정 버튼 추가
            icon: Icon(Icons.settings),
            onPressed: (){
              //설정화면으로 이동하는로직 추가
            },

          ),
        ],

      ),
      
      body: 
      Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        children: [


          ///화면 목록 추가 ///
          Padding(
            padding: EdgeInsets.symmetric(horizontal:16),
            child: Row(
              children: [
                SizedBox(width: 50),
                UserProfileImage(),
                SizedBox(width:25),
                ProfileFollowInfo(),
              ],
            ),
          ),
          /////////////////////////////////

          Divider(),
          UserProfileButtons(),
        ],
      ),
      
      );

  }
}

class UserProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      
      SizedBox(height:24),
      Text(//사용자 이름 출력  
      '사용자 이름',
      style: TextStyle(fontSize:28, fontWeight:FontWeight.bold),
      ),
      SizedBox(height: 8),
      
      //////////////
      CircleAvatar(// 사용자 프로필 이미지 출력
      radius: 60,
      backgroundImage:
        NetworkImage('https://placekitten.com/200/200'), //프로필 이미지 URL 로 대체
       ),
      SizedBox(height:16),
      ///////////
      

      Text( // 사용자 이메일 또는 기타정보 출력
      '이메일 주소 또는 기타 정보'),
      SizedBox(height:16),

      ////////////
      ElevatedButton(//프로필 편집 버튼
      onPressed: () {
        // 프로필 편집 화면으로 이동하는 로직 추가
      },
        child: Text('프로필 편집'),

      ),
      SizedBox(height:16),
    ]);
  }
}

class UserProfileButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Expanded( //버튼 1
          child: ListTile(
            leading: Icon(Icons.grid_on),
            title: Text('게시물'),
            onTap: () {
              //게시물 화면으로 이동하는 로직 추가 
            },
          ),
        ),

        Expanded( //버튼 2
          child: ListTile(
            leading: Icon(Icons.favorite),
            title: Text('좋아요'),
            onTap: () {
              //좋아요 화면으로 이동하는 로직 추가 
            },
          ),
        ),

        Expanded( //버튼 3
          child: ListTile(
            leading: Icon(Icons.chat_bubble),
            title: Text('댓글'),
            onTap: () {
              //댓글 화면으로 이동하는 로직 추가 
            },
          ),
        ),

    ],
    );
    
    
    
    //Column(children: [
      
    //  SizedBox(height:24),
    //  Text(//사용자 이름 출력 
    //  ),
    //  SizedBox(height:8),
    //]),
  }

}

class ProfileFollowInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround, //동일한 간격으로 배치 
      children: [
        Column( //게시물 
          children: [
            Text('게시물', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('254'),
          ],
        ),
        SizedBox(width: 30),

        GestureDetector( //팔로워 
          onTap:(){
            //팔로워 화면으로 이동하는 로직 추가 
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileRecommendedList(),
              ),
            );
          },
          child: Column(
          children: [
            Text('팔로워', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('200'),
          ],
          ),
        ),
        SizedBox(width: 30),

        Column(
          children: [
            Text('팔로우', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text('100'),
          ],
        ),
        SizedBox(width: 30),

      ],
    );
  }
}



//친구추천 

class ProfileRecommendedList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('프로필 추천'),
      ),
      body: Column(
      children: [
        Text('회원님을 위한 추천', style:TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        ProfileCardsList(),
      ],
      ),
    );
  }
}

class ProfileCardsList extends StatelessWidget{
  final List<ProfileData> profiles = [
    ProfileData('사용자1','https://placekitten.com/200/200'),
    ProfileData('사용자2','https://placekitten.com/200/200'),
    ProfileData('사용자3','https://placekitten.com/200/200'),
    ProfileData('사용자1','https://placekitten.com/200/200'),
    ProfileData('사용자2','https://placekitten.com/200/200'),
    ProfileData('사용자3','https://placekitten.com/200/200'),
    ProfileData('사용자1','https://placekitten.com/200/200'),
    ProfileData('사용자2','https://placekitten.com/200/200'),
    ProfileData('사용자3','https://placekitten.com/200/200'),
    //다른 사용자들 추가 
  ];

  @override
  Widget build(BuildContext context) { 
    return Expanded(
        child: ListView.builder(
      scrollDirection:Axis.horizontal,
      itemCount:profiles.length,
      itemBuilder: (BuildContext context, int index) {
        return ProfileCard(profile: profiles[index]);
      },
    ));
   }

}

class ProfileCard extends StatelessWidget {
  final ProfileData profile;
  ProfileCard({required this.profile});

  @override
  Widget build(BuildContext context){
    return Container(
      width: 180,
      height: 200,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar( //사용자 이미지
            radius: 40,
            backgroundImage: NetworkImage(profile.profileImageUrl),
          ),
          SizedBox(height:8),
          Text(profile.username), // 사용자 이름 
          SizedBox(height: 8),
          ElevatedButton( // 팔로우 버튼 
            onPressed: () {
              //팔로우 버튼 동작
            },
            child: Text('팔로우'),
          ),
          SizedBox(height: 8),
          ],
        ),
      );
  }
}

class ProfileData {
  final String username;
  final String profileImageUrl;

  ProfileData(this.username, this.profileImageUrl);
}
