import 'package:smartstudy/temporaryData.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class Chatservices {
  String url = "http://192.168.29.223:5000";
  late IO.Socket websocket;

  Future<void> initService() async {
    websocket = IO.io(url);

    websocket.connect();

    websocket.onConnect((_){
      print('Connection estabilshed with regNo: $curUser');
      websocket.emit('getRegNo', {'regNo' : curUser});
    });

    websocket.onDisconnect((_){
      print('Reg No: $curUser disconnected');
    });

    initializeListeners();
  }

  void initializeListeners(){
    websocket.on('getReaction', (data){
      Map<String, dynamic> d = data;
      if (d.containsKey('error')){
        print(d['error']);
      }
      else{
        print('${d['date']} ${d['time']} ${d['fromUser']} ${d['body']}');
      }
    });

    websocket.on('getSentStatus', (data){
      print('data sent successfully: ${data['status']}');
    });
  }

  Future<void> sendMessage(String userId) async {
    websocket.emit('chat', {'date' : '13/7', 'time' : '12:03', 'body' : 'This is my message', 'to' : 'RA2211003011128', 'from' : curUser});
  } 
}