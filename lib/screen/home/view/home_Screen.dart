import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user/screen/home/model/home_Model.dart';
import 'package:random_user/screen/home/provider/home_provider.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  Homeprovider? hptrue;
  Homeprovider? hpfalse;
  @override
  Widget build(BuildContext context) {
    hptrue=Provider.of<Homeprovider>(context,listen: true);
    hpfalse=Provider.of<Homeprovider>(context,listen: false);
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Random User"),
        centerTitle: true,
      ),
      backgroundColor: Colors.green.shade50,
      body: FutureBuilder(
        future: hpfalse!.findperson(),
        builder: (context, snapshot) {

          if(snapshot.hasError)
            {
              Text("${snapshot.error}");
            }
          else if(snapshot.hasData)
            {
              RandomPerson? randomPerson = snapshot.data;
              List<Result>? resultList = randomPerson!.results;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage("${resultList![0].picture!.large}"),
                    ),

                    SizedBox(height: 10,),
                    Text("${resultList![0].name!.title}  ${resultList![0].name!.first}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(height: 5,),
                    Text("${resultList![0].gender}",style: TextStyle(fontSize: 17),),


                    SizedBox(height: 50,),
                    Container(height: 290,width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.black,width: 1),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(right: 210),
                            child: Text(" City  :  ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(right: 190),
                            child: Text("${resultList![0].location!.city}",style: TextStyle(fontSize: 15),),
                          ),
                          SizedBox(height: 25,),
                          Text("==================================",style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 17,),
                          Padding(
                            padding: const EdgeInsets.only(right: 150),
                            child: Text(" Date of Birth  :  ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(right: 70),
                            child: Text("${resultList![0].dob!.date}",style: TextStyle(fontSize: 15),),
                          ),
                          SizedBox(height: 25,),
                          Text("==================================",style: TextStyle(fontWeight: FontWeight.bold),),
                          SizedBox(height: 17,),
                          Padding(
                            padding: const EdgeInsets.only(right: 190),
                            child: Text(" Phone  :  ",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.only(right: 130),
                            child: Text("${resultList![0].phone}",style: TextStyle(fontSize: 15),),
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                    SizedBox(height: 50,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,

                        child: ElevatedButton(
                          onPressed: () {
                            hpfalse!.changeindex();
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                          ),
                          child: Text("Refresh"),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }
          return CircularProgressIndicator();
        },

      )


    ),
    );
  }
}
