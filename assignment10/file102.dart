class EmployeeData {
  String? userId;
  String? jobTitleName;
  String? firstName;
  String? lastName;
  String? preferredFullName;
  String? employeeCode;
  String? region;
  String? phoneNumber;
  String? emailAddress;

  EmployeeData({
    this.userId,
    this.jobTitleName,
    this.firstName,
    this.lastName,
    this.preferredFullName,
    this.employeeCode,
    this.region,
    this.phoneNumber,
    this.emailAddress,
  });

  EmployeeData.fromJson(Map<String, String> json) {
    userId = json['userId'];
    jobTitleName = json['jobTitleName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    preferredFullName = json['preferredFullName'];
    employeeCode = json['employeeCode'];
    region = json['region'];
    phoneNumber = json['phoneNumber'];
    emailAddress = json['emailAddress'];
  }

  Map<String, dynamic> toJson() {
    return {
      'userId':userId,
      'jobTitleName':jobTitleName,
      'firstName':firstName,
      'lastName':lastName,
      'preferredFullName':preferredFullName,
      'employeeCode':employeeCode,
      'region':region,
      'phoneNumber':phoneNumber,
      'emailAddress':emailAddress,
    };
  }
}

void main() {
  Map<String, String> jsonData = {
    "userId": "rirani",
    "jobTitleName": "Developer",
    "firstName": "Romin",
    "lastName": "Irani",
    "preferredFullName": "Romin Irani",
    "employeeCode": "E1",
    "region": "CA",
    "phoneNumber": "408-1234567",
    "emailAddress": "romin.k.irani@gmail.com"
  };
  EmployeeData employee = EmployeeData.fromJson(jsonData);
  Map<String, dynamic> employeeJson = employee.toJson();
  // print('User ID: ${employee.userId}');
  // print('Job Title: ${employee.jobTitleName}');
  // print('First Name: ${employee.firstName}');
  // print('Last Name: ${employee.lastName}');
  // print('Preferred FullName: ${employee.preferredFullName}');
  // print('Employee Code: ${employee.employeeCode}');
  // print('Region: ${employee.region}');
  // print('Phone Number: ${employee.phoneNumber}');
  // print('Email Address: ${employee.emailAddress}');
  print(employeeJson);
}

// OUTPUT:
// {userId: rirani, jobTitleName: Developer, firstName: Romin, lastName: Irani, preferredFullName: Romin Irani, employeeCode: E1, region: CA, phoneNumber: 408-1234567, emailAddress: romin.k.irani@gmail.com}

