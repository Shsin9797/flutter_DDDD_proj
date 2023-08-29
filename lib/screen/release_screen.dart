import 'package:flutter/material.dart';

class ReleaseScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Text('짧은 메시지 화면'),
      ) ,
      body: ListView.builder(
        itemCount: dummyReleases.length,
        itemBuilder:(context, index) {
          return GestureDetector(
            onTap: () {
              //제스쳐 동작: 클릭시 해당아이템의 상세 화면으로 이동 
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReleaseDetailScreen(
                    release: dummyReleases[index],
                    ),
                  ),
                );
              
            },
            child: ReleaseCard(release: dummyReleases[index]),
          );
        },
      ),

      );
  }
}

class ReleaseCard extends StatelessWidget{
  final ReleaseModel release;
  const ReleaseCard({required this.release});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical:10, horizontal:16),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color:Colors.grey.withOpacity(0.5),
            spreadRadius:2,
            blurRadius:5,
            offset : Offset(0,3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            release.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 8),
          Text(release.date),
          SizedBox(height: 8),
          Text(release.description),
        ],
      ),
    );
  }
}

class ReleaseDetailScreen extends StatelessWidget{
  final ReleaseModel release;

  const ReleaseDetailScreen({required this.release});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: Text(release.title),
      ) ,
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              release.date,
              style:TextStyle(fontWeight: FontWeight.bold, fontSize:16),
            ),
            SizedBox(height: 8),
            Text(release.description),
          ],
          ),
        ),
      );
  }
}

class ReleaseModel {
  final String title;
  final String date;
  final String description;

  ReleaseModel({
    required this.title,
    required this.date,
    required this.description,
  });
}

List<ReleaseModel> dummyReleases = [
  ReleaseModel(
    title: '짧은 메시지 화면1',
    date: '2023-08-15',
    description: '이것은 첫 번째 짧은 메시지 화면입니다.',
  ),
  ReleaseModel(
    title: '짧은 메시지 화면2',
    date: '2023-08-16',
    description: '이것은 두 번째 짧은 메시지 화면입니다.',
  ),
    ReleaseModel(
    title: '짧은 메시지 화면3',
    date: '2023-08-17',
    description: '이것은 세 번째 짧은 메시지 화면입니다.',
  ),
    ReleaseModel(
    title: '짧은 메시지 화면4',
    date: '2023-08-18',
    description: '이것은 네 번째 짧은 메시지 화면입니다.',
  ),

];