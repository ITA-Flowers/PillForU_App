import 'package:mysql1/mysql1.dart';

class Mysql{
  static String host='sql86.lh.pl',
  user='serwer163508_bszyk00',
  password='D8oN-RT_',
  db='serwer163508_bszyk00';
  static int port=8080;

  Mysql();
  Future<MySqlConnection> getConnection() async{
    var settings= new ConnectionSettings(
        host:host,
        port:port,
        user: user,
        db:db
    );
    return await MySqlConnection.connect(settings);
  }
}