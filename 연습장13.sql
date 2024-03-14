
SELECT *
FROM EVENT ; 
INSERT INTO Event VALUES (1, '할인', '아이폰을찾아라', TO_DATE('2024-03-10', 'YYYY-MM-DD')
, TO_DATE('2024-03-15', 'YYYY.MM.DD.'), '#admin001', NULL);
INSERT INTO Event VALUES (2, '경험', '음식점 이벤트', TO_DATE('2024-03-05', 'YYYY-MM-DD')
, TO_DATE('2024-03-10', 'YYYY.MM.DD.'), '#admin001', NULL);
INSERT INTO Event VALUES (3, '마일리지', '문화 이벤트', TO_DATE('2024-03-01', 'YYYY-MM-DD')
, TO_DATE('2024-03-06', 'YYYY.MM.DD.'), '#admin001', NULL);
INSERT INTO Event VALUES (4, '응모', '체육 이벤트', TO_DATE('2024-02-25', 'YYYY-MM-DD')
, TO_DATE('2024-03-01', 'YYYY.MM.DD.'), '#admin001', NULL);
INSERT INTO Event VALUES (5, '응모', '봄맞이 이벤트', TO_DATE('2024-02-20', 'YYYY-MM-DD')
, TO_DATE('2024-02-25', 'YYYY-MM-DD'), '#admin001', NULL);


CREATE TABLE Event (
    Evnum number(4) NOT NULL PRIMARY KEY,
    Evcat varchar2(100) NOT NULL,
    Evname varchar2(200) NOT NULL,
    stdate date NOT NULL,
    endate date NOT NULL,
    AdminID varchar2(100) NOT NULL,
    Eposter blob NULL
);


CREATE TABLE Winner (
    Key number(8) NOT NULL,
    Wingrade varchar2(100) NOT NULL,
    phoneNumber varchar2(100) NOT NULL,
    UserID varchar2(100) NOT NULL,
    Evnum number(4) NOT NULL
);
CREATE TABLE entry (
    Key number(8) PRIMARY KEY,
    phoneNumber varchar2(100) NOT NULL,
    UserID varchar2(100) NOT NULL,
    Evnum number(4) NOT NULL
);

CREATE TABLE Prize (
    Evnum number(4) NOT NULL,
    Price1 VARCHAR2(30) NOT NULL,
    Price2 VARCHAR2(30) NOT NULL,
    Price3 VARCHAR2(30) DEFAULT NULL
);

CREATE TABLE FLIGHTUSER (
    USERID VARCHAR2(100) PRIMARY KEY,
    PHONENUMBER VARCHAR2(200) NOT NULL
);


DELETE EVENT WHERE EVNUM =EVNUM;
DELETE winner WHERE EVNUM =EVNUM;

