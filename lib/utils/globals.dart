library my_prj.globals;

String? userName;
String? userId;
String? email;
String? city;
int? contactNo;
String? token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NWU2ZmI2NDY0YzE1ZjU0OTgyYTExMTMiLCJyb2xlIjoiREVBTEVSIiwiaWF0IjoxNzEwMzA0ODY3LCJleHAiOjE3MTI4OTY4Njd9.0qZ2-AMWIzE10DqzthL7B3m1NEuJXKPCVrG7UipsBWI';
String? carId;
String? phoneNum;
String? password;
var headers = {'Authorization': 'Bearer $token'};
var jsonHeaders = {'Authorization': 'Bearer $token','Content-Type': 'application/json',};
