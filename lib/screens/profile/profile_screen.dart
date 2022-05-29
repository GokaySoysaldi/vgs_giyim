import 'dart:io';
import 'package:app_settings/app_settings.dart';
import 'package:first_project/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({ Key? key }) : super(key: key);
  static const String routeName = '/user';
  
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => ProfileScreen(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Profil'),
      bottomNavigationBar: CustomNavBar(),
      body: getBody(),
      );
  }
  Widget getBody() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Row(
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage('https://media-exp1.licdn.com/dms/image/C4E03AQE7XJm3Y5DZCQ/profile-displayphoto-shrink_100_100/0/1615967165780?e=1655942400&v=beta&t=IzF78BDw1pirQfivGEwbrv46WIwgcpl7wAAJwj9xOUE'), fit: BoxFit.cover)),),
              SizedBox(
                width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Veli Gokay",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),),
                  SizedBox(
                    height: 10,),
                  Text(
                    "Uyelik - 2019",
                    style:
                        TextStyle(fontSize: 13, color: Colors.black.withOpacity(0.7)),),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black, borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Text(
                          "Hesabi Duzenle",
                          style: TextStyle(fontSize: 13, color: Colors.white),),),),)],)],),),
        SizedBox(
          height: 40,),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.inbox,
                    color: Colors.black,),
                  SizedBox(
                    width: 10,),
                  Text(
                    "Teklifler",
                    style: TextStyle(fontSize: 15),)],),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      AppSettings.openAppSettings();
                    },
                    icon: Icon(Icons.accessibility),
                    color: Colors.black,),
                  SizedBox(
                    width: 10,),
                  Text(
                    "Ayarlar",
                    style: TextStyle(fontSize: 15),)],),
              Row(
                children: [
                  IconButton(
                    onPressed: ()=>exit(0),
                    icon: Icon(Icons.ac_unit),
                    color: Colors.black,),
                  SizedBox(
                    width: 10,),
                  Text(
                    "Çıkış",
                    style: TextStyle(fontSize: 15),)],),],),),
        SizedBox(
          height: 30,),
        Divider(
          thickness: 1,),
        SizedBox(
          height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: List.generate(accountList.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          accountList[index],
                          style: TextStyle(fontSize: 16),),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black.withOpacity(0.5),
                          size: 17,)],),
                    SizedBox(
                      height: 15,),
                    Divider(
                      color: Colors.grey.withOpacity(0.8),)],),);}),),)],);
  }
}

List accountList = [
];