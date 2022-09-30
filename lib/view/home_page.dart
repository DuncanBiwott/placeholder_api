

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:placeholder_api/services/remote.dart';
import 'package:placeholder_api/services/remote_data.dart';
import 'package:placeholder_api/view/container_data.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Post>?post;
  var isloaded;

  @override
  void initState() {

    super.initState();
    getdata();
  }

  getdata()async{
    post=await RemoteData().remotedata();
    if(post != null){
      setState(() {
        isloaded=true;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Container(
          color: Colors.white,
          child: Expanded(child: TextFormField(
            textAlign: TextAlign.center,
          
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.arrow_forward),
              hintText: "Search",
              
              
            ),
          ),
        )
      )),
      body: Visibility(
        visible:isloaded,
        child: ListView.builder(
            itemCount: post?.length,

            itemBuilder: (context,index){
              return GestureDetector(
                onTap: (){
                  print(post![index].id);
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InputData(body: post![index].body.toString(),)),
                          );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child:Row(

                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 5, 61, 106),
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(image: AssetImage("assets/images/"))
                        ),

                      ),
                      const SizedBox(width: 16),

                      Expanded(

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(post![index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                            Text(post![index].body?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ),
              );
            }
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
