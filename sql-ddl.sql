create table 'user' (
 'userId' int(12) NOT NULL AUTO_INCREMENT,
 'emailId' varchar(80) NOT NULL,
 'password' varchar(16) NOT NULL,
 'userFirstName' varchar(30) NOT NULL,
 'userMiddleName' varchar(30) DEFAULT NULL,
 'userLastName' varchar(30) DEFAULT NULL,
 'phoneNumber' bigint(20) NOT NULL,
 'gender' varchar(5) NOT NULL,
 'addressLine1' varchar(200) DEFAULT NULL,
 'addressLine2' varchar(200) DEFAULT NULL,
 'city' varchar(30) NOT NULL,
 'pinCode' int(6) NOT NULL,
 'roleId' int(4) NOT NULL,
  PRIMARY KEY('userId'),
  UNIQUE('emailId'),
  CONSTRAINT 'roleFK' FOREIGN KEY('roleId') REFERENCES 'role'('roleID')
) 


create table 'role' (
'roleId' int(4) NOT NULL AUTO_INCREMENT,
'roleName' varchar(30) NOT NULL
)


create table 'area' (
'areaId' varchar(16) NOT NULL,
'name' varchar(30) NOT NULL,
'latitude' DECIMAL(8,6),
'longitude' DECIMAL(9,6),
PRIMARY KEY('areaId')
)

create table 'vehicle' (
'vehicleId' varchar(16) NOT NULL,
'driverName' varchar(30) NOT NULL,
'driverPhoneNumber' bigint(20) NOT NULL,
'areaId' varchar(16) NOT NULL,
PRIMARY KEY('vehicleId'),
CONSTRAINT 'areaFK' FOREIGN KEY('areaID') REFERENCES 'area' ('areaId')
)

create table 'request'(
'requestId' bigint(40) NOT NULL AUTO_INCREMENT,
 'latitude' DECIMAL(8,6),
'longitude' DECIMAL(9,6),
'requestedTime' datetime NOT NULL,
'resolvedTime' datetime DEFAULT NULL,
'status' varchar(15),
'userId' int(12) NOT NULL,
'vehicleId' varchar(16) NOT NULL,
PRIMARY KEY('requestId'),
CONSTRAINT 'userFK' FOREIGN KEY('userId') REFERENCES 'user' ('userId'),
CONSTRAINT 'vehicleFK' FOREIGN KEY(vehicleId) REFERENCES 'vehicle'('vehicleId')
)


create table 'notification' (
'requestId' bigint(40) NOT NULL,
'userId' int(12) NOT NULL,
PRIMARY KEY('request_id'),
CONSTRAINT 'requestFK' FOREIGN KEY('requestID') REFERENCES 'request'('requestId'),
CONSTRAINT 'userFK2' FOREIGN KEY('userId') REFERENCES 'user'('userId')
)
