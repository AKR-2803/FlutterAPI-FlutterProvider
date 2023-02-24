# API Practice

## Complex JSON formats in flutter, and how to pass them? ([code here](https://github.com/AKR-2803/FlutterAPI/tree/main/lib))

#### All the APIs (Free and no Auth Needed) :  [here](https://mixedanalytics.com/blog/list-actually-free-open-no-auth-needed-apis/)

*Serialization* simply means writing the data (which might be in an object) as a string. 

_Deserialization_ is vice versa. Since the key is always a string and the value can be of any type, we keep it as dynamic to be on the safe side. (Map<String, dynamic>).

### Common Errors:

#1. **Error**:  _RangeError (index): Invalid value: Not in inclusive range_ 0..5: 6

**Solution**: Set itemCount property, this usually occurs when itemCount is "NOT GIVEN".


## Common Steps for any JSON data from API: 

#Class
Create a file in lib/models/ which will have the class Model, ClassModel.fromJson() and ClassModel.toJson() methods.

1.	Go the API link. Copy the data

2.	Format JSON data: https://jsonformatter.org/

3.	Create DART object: https://javiercbk.github.io/json_to_dart/

4.	Paste DART Object in the file lib/model/className_model.dart which we made bfor.

## Types of JSON formats:


## 1. FORMAT #1: [ { }, { }, { }...]   OR   List [map, map, map...] 

#API : https://jsonplaceholder.typicode.com/users 
### Tips:
- Why should you define function outside the buildMethod and call it using initState? [ref: [here](https://docs.flutter.dev/cookbook/networking/fetch-data#why-is-fetchalbum-called-in-initstate)]
- Flutter calls the build() method every time it needs to change anything in the view, and this happens surprisingly often. The function getUserApi() method, if placed inside build(), is repeatedly called on each rebuild causing the app to slow down.
-	Storing the getUserApi() result in a state variable ensures that the Future is executed only once and then cached for subsequent rebuilds. 




#Function:  
Define the function like this: 
(Tip: You may define the function in a separate file handling the API services.) 

```
Future<List<UserModel>> getUserApi() async {
  List<UserModel> userList = [];
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
  var data = jsonDecode(response.body); //try .toString()
  if (response.statusCode == 200) {
    for (Map<String, dynamic> item in data) {
      // print(item['name']);
      userList.add(UserModel.fromJson(item));
    }
    return userList;
  } else {
    return userList;
  }
}
```

As the format of JSON is this: 
[ 
{ }, 
{ }, 
{ },...
]   

- snapshot.data will have the List.
- We need to provide the respective index of the Maps inside the list.
- To provide index, we may use what?....Think!..Yes, A ListView.builder, or maybe  GridView.builder or anything that can traverse using an index(Maybe a ${\color{lightgreen}for}$ loop!).
-	Always ensure to give the itemCount else, you would face the common error #1 mentioned above.
-	Very ${\color{red}IMPORTANT}$: It is important typecast the snapshot into AsyncSnapshot<List<ClassModel>> snapshot.
-	Now you can access the data using snapshot.data![index]
-	Ensure null checks wherever required.

#Main Class

```
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<UserModel>> userList; //late keyword is important

  @override
  void initState() {
    super.initState();	
    userList = getUserApi();	//calling the function inside initState()
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getUserApi(),
		//Very Imp to typecast snapshot
          builder:
              (BuildContext context, AsyncSnapshot<List<UserModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
               //give itemCount else this error will be thrown : _RangeError (index): Invalid value: Not in inclusive range_
                itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 2.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Name : '),
					//use snapshot like this
                          Text(snapshot.data![index].name.toString()),
                        ],
                      ),
```
     
## 2. FORMAT #2: {  [ {}, {}, {}… ]  }   OR   Map {  List [  map, map, map… ]   } 

#API: https://archive.org/metadata/TheAdventuresOfTomSawyer_201303 

Example: 
```
  {
    "files": [
      	   {
        		"name": "The Adventures of Tom Sawyer.djvu",
        		"source": "derivative",
        		"format": "DjVu"
      	   },
       	   
               {
        		"name": "The Adventures of Tom Sawyer.gif",
        		"source": "derivative",
        		"format": "Animated GIF"
        
      	   },
  		
   		   {
        		"name": "TheAdventuresOfTomSawyer_201303_meta.xml",
        		"source": "original",
        		"format": "Metadata"
      	   }
   		]

	
  }
  ```


#Class: Make model class using same procedure.

#Function: 

```
Future<FilesModel> getFilesApi() async {
  final response = await http.get(Uri.parse(
      "https://archive.org/metadata/TheAdventuresOfTomSawyer_201303"));
  var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    return FilesModel.fromJson(data);
  } else {
    return FilesModel.fromJson(data);
  }
}
```


#Main class

```
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 //late keyword is important
  late Future<FilesModel> futureFiles;

  @override
  void initState() {
    super.initState();
    futureFiles = getFilesApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<FilesModel>(
            future: futureFiles,
		//this time don’t typecast snapshot
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: 800,
                  width: double.infinity,
                  child: GridView.builder(
                      // shrinkWrap: true,
                      //give itemCount else this error will be thrown : _RangeError (index): Invalid value: Not in inclusive range_
                      itemCount: snapshot.data!.filesCount,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
					//gridPosition is index
                      itemBuilder: (context, gridPosition) {
                        return Card(
                          elevation: 3.0,
                          child: Column(children: [
                            Text(
                              snapshot.data!.files![gridPosition].name!
                                  .toUpperCase(),
                              style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.cyan),
                            ),
```


As the format of JSON is this: 
{ [ 
{ }, 
{ }, 
{ },...
] }  

- snapshot.data will have the Map.
- We don't need to provide index here, can directly use [```snapshot.data.```] (see above code for reference)
-	Always ensure to give the itemCount else, you would face the common error #1 mentioned above.
-	Very ${\color{red}IMPORTANT}$: It is important typecast the FutureBuilder into FutureBuilder<ClassModel>.
-	Now you can access the data using [```snapshot.data.```] 
-	Ensure null checks wherever required.


**EOF**
