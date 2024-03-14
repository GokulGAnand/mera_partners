library my_prj.globals;

String? userName;
String? userId;
String? email;
String? city;
int? contactNo;
String? token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWVlZDI1YzQ4NTczZGM0ODBjZjg5YTkiLCJyb2xlIjoiREVBTEVSIiwiaWF0IjoxNzEwMTUwNDE0LCJleHAiOjE3MTI3NDI0MTR9.XplpPCma4dIzFKZ5_3W3AtRRIzGJlnlVqq6gXB9OHbs';
String? carId;
String? phoneNum;
String? password;
var headers = {'Authorization': 'Bearer $token'};
var jsonHeaders = {'Authorization': 'Bearer $token','Content-Type': 'application/json',};
