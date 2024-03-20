library my_prj.globals;

String? userName;
String? userId;
String? documentStatus;
bool? addressProofFront;
String? city;
int? contactNo;
String? token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWVlZDI1YzQ4NTczZGM0ODBjZjg5YTkiLCJyb2xlIjoiREVBTEVSIiwiaWF0IjoxNzEwNDE3MTIwLCJleHAiOjE3MTMwMDkxMjB9.Qwbypr0JfHQo6eFuEYDpat87AfloFC-v1Pu45jAofZk';
String? carId;
String? phoneNum;
String? password;
var headers = {'Authorization': 'Bearer $token'};
var jsonHeaders = {'Authorization': 'Bearer $token','Content-Type': 'application/json',};
