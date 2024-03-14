-- 참조 관계가 있는 테이블 삭제
ALTER TABLE payrefund DROP CONSTRAINT FK_Scplane_TO_payrefund_1;
ALTER TABLE Scplane DROP CONSTRAINT FK_airplane_TO_Scplane_1;
ALTER TABLE SEAT_NUM DROP CONSTRAINT FK_airplane_TO_SEAT_NUM_1;
ALTER TABLE payrefund DROP CONSTRAINT FK_flightuser_TO_payrefund_1;
ALTER TABLE yesno DROP CONSTRAINT FK_Contract_TO_yesno_1;
ALTER TABLE Ifare DROP CONSTRAINT FK_Adminstrator_TO_Ifare_1;
ALTER TABLE Mtracking DROP CONSTRAINT FK_flightuser_TO_Mtracking_1;
ALTER TABLE dfare DROP CONSTRAINT FK_Adminstrator_TO_dfare_1;
ALTER TABLE L_rule DROP CONSTRAINT FK_R_section_TO_L_rule_1;
ALTER TABLE Notice DROP CONSTRAINT FK_Adminstrator_TO_Notice_1;
ALTER TABLE Rfamily DROP CONSTRAINT FK_flightuser_TO_Rfamily_1;
ALTER TABLE Cservice DROP CONSTRAINT FK_Adminstrator_TO_Cservice_1;

-- 참조 관계가 없는 테이블 삭제
drop table loginhis;
DROP TABLE CARD_USE;
DROP TABLE GIFTCARD;
DROP TABLE Contract;
DROP TABLE Event;
DROP TABLE Winner;
DROP TABLE Prize;
DROP TABLE Adminstrator;
DROP TABLE Userdetail;
DROP TABLE S_Grade;
DROP TABLE Movie;
DROP TABLE TV;
DROP TABLE Music;
DROP TABLE Bpass;
DROP TABLE flight_meal;
DROP TABLE Scplane;
DROP TABLE SEAT_NUM;
DROP TABLE payrefund;
DROP TABLE Ifare;
DROP TABLE yesno;
DROP TABLE Customerc;
DROP TABLE dfare;
DROP TABLE LOUNGE_INFO;
DROP TABLE L_rule;
DROP TABLE R_section;
DROP TABLE Notice;
DROP TABLE Rfamily;
DROP TABLE Cservice;
DROP TABLE airplane;
DROP TABLE Mtracking;
DROP TABLE flightuser;
drop table refund;
drop table entrys;
drop table card_table;
----------------- 시퀀스 삭제 ----------------
----------------- 시퀀스 삭제 ----------------
----------------- 시퀀스 삭제 ----------------
drop sequence customercseq;
drop sequence flight_mealseq;
drop sequence tr_dc_giftcard;
drop sequence SE_giftcard_03;
drop sequence DC_giftcard_01;
DROP SEQUENCE seq_mtracking;
----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------
----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------
----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------
----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------
----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------
----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------
----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------
----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------
----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------
----------------------------------------------------테이블 생성 문 ---------------------------------------------------------------

CREATE TABLE refund (
    snum number NOT NULL,
    rmethod varchar2(100) NOT NULL,
    flight varchar2(100) NOT NULL,
    seatnumber varchar2(100) NOT NULL,
    redate varchar2(500) NOT NULL,
    nluggage number NOT NULL,
    charge number NOT NULL,
    mile number NOT NULL,
    UserID varchar2(100) NOT NULL,
    renum varchar2(10 char) NOT NULL,
    GIFTCARDNUMBER VARCHAR2(100) NULL,
    PIN_NUM number(6) null
);


CREATE TABLE flightuser (
    UserID varchar2(100) NOT NULL,
    Korlastname varchar2(20) NOT NULL,
    Korfirstname varchar2(100) NOT NULL,
    lastname varchar2(100) NOT NULL,
    firstname varchar2(100) NOT NULL,
    password varchar2(200) NOT NULL,
    birthdate date NOT NULL,
    gender varchar2(6) NOT NULL,
    emailaddress varchar2(200) NOT NULL,
    phoneNumber varchar2(200) NOT NULL,
    Anation varchar2(200) NOT NULL,
    Skypassnumber varchar2(200) NOT NULL
);

CREATE TABLE Loginhis (
	UserID	varchar2(100)		NOT NULL,
	logd	varchar2(100)		NULL
);

CREATE TABLE Cservice (
    CS_num VARCHAR2(4) NOT NULL,
    Area VARCHAR2(30) NOT NULL,
    Country_name VARCHAR2(30) NOT NULL,
    CS_call1 VARCHAR2(50) NOT NULL,
    CS_call2 VARCHAR2(50) NULL,
    lang_time clob NOT NULL,
    AdminID varchar2(100) NOT NULL
);

CREATE TABLE Rfamily (
    relation VARCHAR2(20) NOT NULL,
    status VARCHAR2(10) NULL,
    request_date DATE DEFAULT SYSDATE NULL,
    family_id VARCHAR2(100) NOT NULL,
    UserID varchar2(100) NOT NULL
);

CREATE TABLE Notice (
    Notice_num VARCHAR2(3) NOT NULL,
    Notice_title VARCHAR2(200) NOT NULL,
    Notice_contents clob NOT NULL,
    Notice_topic VARCHAR2(20) NOT NULL,
    AdminID varchar2(100) NOT NULL
);

CREATE TABLE R_section (
    ROUTE_SECTION VARCHAR2(50) NOT NULL,
    dairport VARCHAR2(1000) NOT NULL,
    aairport varchar2(1000) NOT NULL
);

CREATE TABLE L_rule (
    LUGREGULAR_NUM NUMBER(2) NOT NULL,
    SEAT_GRADE VARCHAR2(20) NOT NULL,
    numberofluggage NUMBER(2) NOT NULL,
    EXCESS_FEE NUMBER(8) NOT NULL, 
    ROUTE_SECTION VARCHAR2(50) NOT NULL
);

CREATE TABLE LOUNGE_INFO (
    LOUNGE_NUM VARCHAR2(10) NOT NULL,
    LOUNGE_NAME VARCHAR2(100) NULL,
    DESTINATION_AIRPORT VARCHAR2(50) NOT NULL,
    COUNTRY VARCHAR2(40) NOT NULL,
    LOCATION VARCHAR2(1000) NOT NULL,
    OPERATING_TIME clob NOT NULL,
    OPERATOR VARCHAR2(10) NOT NULL,
    ENTRY_PASSENGER clob NOT NULL,
    SERVICE VARCHAR2(500) NOT NULL,
    ETC VARCHAR2(300) NULL
);

CREATE TABLE dfare (
    Keynum number(4) NOT NULL,
    peak varchar2(100) NOT NULL,
    discount varchar2(100) NOT NULL,
    timezone varchar2(100) NOT NULL,
    sg varchar2(50) NOT NULL,
    route varchar2(200) NOT NULL,
    fare number NOT NULL,
    redis number NOT NULL,
    AdminID varchar2(100) NOT NULL,
    wknddy varchar2(100) null
);

--항공기
CREATE TABLE airplane (
    asnum varchar2(100) NOT NULL,
    AIRLINE VARCHAR(30) NULL,
    totalseat NUMBER(4) NOT NULL,
    TYPE VARCHAR(30) NULL,
    M_DATE DATE NULL,
    FCLA_COUNT NUMBER(3) NULL,
    PreCLA_COUNT NUMBER(3) NULL,
    NCLA_COUNT NUMBER(3) NULL,
    PRECLA_Features VARCHAR2(300) NULL,
    NCLA_Features VARCHAR2(300) NULL,
    FCLA_Features VARCHAR2(300) NULL
);


CREATE TABLE Mtracking (
    Tracking_num NUMBER NOT NULL,
    Consumtion_date DATE DEFAULT SYSDATE NULL,
    Amount_Mileage NUMBER NOT NULL,
    airline_type VARCHAR2(50) NOT NULL,
    spendorearned VARCHAR2(10) NOT NULL,
    UserID varchar2(100) NOT NULL
);

CREATE TABLE payrefund (
    SerialNumber number NOT NULL,
    payrefund varchar2(50) NOT NULL,
    pmethod varchar2(70) DEFAULT '카드' NOT NULL,
    flight varchar2(50) DEFAULT '정상' NOT NULL,
    seatNumber varchar2(50) NULL,
    drdate date default sysdate NOT NULL,
    nluggage number(2) DEFAULT 0 NULL,
    cost number NOT NULL,
    mileage number null,
    UserID varchar2(100) NOT NULL,
    renum number NOT NULL,
    GIFTCARDNUMBER VARCHAR2(100) NULL,
    PIN_NUM number(6) null
);

CREATE TABLE SEAT_NUM (
    SEAT_CODE VARCHAR2(20) NOT NULL,
    SEAT_NUM VARCHAR2(20) NOT NULL,
    SEAT_GRADE VARCHAR2(100) NULL,
    asnum varchar2(100) NOT NULL
);

CREATE TABLE Scplane (
    renum number NOT NULL,
    food varchar2(100) DEFAULT '(기내식 제공없음)' NULL,
    ddate date NOT NULL,
    adate date NOT NULL,
    dnation varchar2(100) NOT NULL,
    anation varchar2(100) NOT NULL,
    AdminID varchar2(100) NOT NULL,
    fnumber varchar2(100) NOT NULL,
    aairport varchar2(100) NOT NULL,
    dairport varchar2(100) NOT NULL,
    GATE number(4) NULL,
    Terminal number(2) NOT NULL,
    asnum varchar2(100) NOT NULL
);

COMMENT ON COLUMN Scplane.dnation IS '한국고정';

COMMENT ON COLUMN Scplane.anation IS '한국,일본,중국,미국';

CREATE TABLE Bpass (
    Key VARCHAR2(10) NOT NULL,
    dairport varchar2(100) NOT NULL,
    aairport varchar2(100) NOT NULL,
    ddate date NOT NULL,
    SEAT_NUM VARCHAR2(5) NOT NULL,
    PNAME VARCHAR2(200) NOT NULL,
    GATE NUMBER(4) NULL,
    TERMINAL NUMBER(2) NOT NULL,
    UserID varchar2(100) NOT NULL
);

CREATE TABLE flight_meal (
    meal_code NUMBER(2) NOT NULL,
    menu VARCHAR2(300) NULL,
    MENU_PDF BLOB NULL
);

CREATE TABLE Customerc (
    Q_num NUMBER NOT NULL,
    type VARCHAR2(12) NOT NULL,
    Field VARCHAR2(60) NOT NULL,
    F_NAME VARCHAR2(20) NOT NULL,
    L_NAME VARCHAR2(20) NOT NULL,
    P_NUM VARCHAR2(20) DEFAULT '(82)' NOT NULL,
    Email VARCHAR2(40) NOT NULL,
    title VARCHAR2(100) NOT NULL,
    content varchar2(3000) NOT NULL,
    SP_NUM VARCHAR2(20) NULL,
    renum VARCHAR2(8) NULL,
    e_check NUMBER(1) NOT NULL,
    city_arr VARCHAR2(40) NULL,
    start_city VARCHAR2(40) NULL,
    arr_date DATE NULL,
    Flights VARCHAR2(6) NULL
);

CREATE TABLE yesno (
    Contrat_num varchar2(4) NOT NULL,
    agree varchar2(100) NOT NULL,
    Agree_date date NOT NULL,
    UserID varchar2(100) NOT NULL,
    Contract_code number NOT NULL
);

COMMENT ON COLUMN yesno.agree IS '동의/비동의';

CREATE TABLE Ifare (
    Keynum number(4) NOT NULL,
    starta varchar2(100) NOT NULL,
    arrive varchar2(100) NOT NULL,
    sg varchar2(50) NOT NULL,
    fare number NOT NULL,
    redis number NOT NULL,
    tax number NOT NULL,
    fuelch number NOT NULL,
    AdminID varchar2(100) NOT NULL
);

CREATE TABLE CARD_USE (
    record_num NUMBER(10) NOT NULL,
    section VARCHAR(12) NOT NULL,
    tdate DATE NOT NULL,
    amount number NOT NULL,
    CARD_NUM VARCHAR2(19) NOT NULL
);
CREATE TABLE GIFTCARD (
    CARD_NUM VARCHAR2(19) NOT NULL,
    message VARCHAR2(450) NOT NULL,
    PIN_NUM NUMBER(6) NOT NULL,
    Recipient VARCHAR2(30) NOT NULL,
    Recipient_PNUM varchar2(20) NOT NULL,
    SENDER VARCHAR2(30) NOT NULL,
    SENDER_PNUM varchar2(20) NOT NULL,
    amount NUMBER(7) NOT NULL
);

CREATE TABLE Contract (
    Contract_code number NOT NULL,
    Essentiality varchar2(6) NOT NULL,
    Contract_title varchar2(150) NOT NULL,
    Contract_contents varchar2(3000) NOT NULL
);

COMMENT ON COLUMN Contract.Essentiality IS '필수/선택';

COMMENT ON COLUMN Contract.Contract_title IS '50자내외';

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
CREATE TABLE entrys (
    Key number(8) PRIMARY KEY,
    phoneNumber varchar2(100) NOT NULL,
    UserID varchar2(100) NOT NULL,
    Evnum number(4) NOT NULL
);

CREATE TABLE Prize (
    Keynum  number(4) PRIMARY KEY,
    Evnum number(4) NOT NULL,
    Price1 VARCHAR2(30) NOT NULL,
    countnum NUMBER(4) NOT NULL,
    GRADE NUMBER(4) DEFAULT NULL
);



CREATE TABLE Adminstrator (
    AdminID varchar2(100) NOT NULL,
    Korlastname varchar2(20) NOT NULL,
    Korfirstname varchar2(100) NOT NULL,
    lastname varchar2(100) NOT NULL,
    firstname varchar2(100) NOT NULL,
    password varchar2(200) NOT NULL,
    birthdate date NOT NULL,
    gender varchar2(6) NOT NULL,
    emailaddress varchar2(200) NOT NULL,
    phoneNumber varchar2(200) NOT NULL,
    Area_Nation varchar2(200) NOT NULL,
    Skypassnumber varchar2(200) NOT NULL
);




CREATE TABLE Userdetail (
    UserID varchar2(100) NOT NULL,
    totalmile number DEFAULT 0 NULL,
    usergrade varchar2(100) DEFAULT '스카이패스 클럽' NULL,
    family_id VARCHAR2(100) NULL,
    grade_date DATE DEFAULT SYSDATE NULL
);

CREATE TABLE S_Grade (
    Key NUMBER NOT NULL,
    grade varchar2(100) DEFAULT '스카이패스 클럽' NOT NULL,
    totalmile NUMBER DEFAULT 0 NOT NULL,
    minarr NUMBER DEFAULT 0 NOT NULL
);


--테이블 수정
CREATE TABLE Movie (
    MovieID NUMBER PRIMARY KEY,
    Title varchar2(100) NOT NULL,
    Duration date NOT NULL,
    Category varchar2(100) NOT NULL,
    Content clob NOT NULL,
    Lang varchar2(20) NOT NULL
);
CREATE TABLE TV (
    TVID NUMBER PRIMARY KEY,
    Title varchar2(100) NOT NULL,
    duration date NOT NULL,
    cate varchar2(100) NOT NULL,
    content clob NOT NULL
);
CREATE TABLE Music (
    MusicID NUMBER PRIMARY KEY,
    Title varchar2(100) NOT NULL,
    Duration date NOT NULL,
    cate varchar2(100) NOT NULL,
    content clob NOT NULL
);

CREATE TABLE card_table (
    card_code   NUMBER PRIMARY KEY,
    card_number VARCHAR2(19) 
);




ALTER TABLE flightuser ADD CONSTRAINT PK_FLIGHTUSER PRIMARY KEY (UserID);

ALTER TABLE Cservice ADD CONSTRAINT PK_CSERVICE PRIMARY KEY (CS_num);

ALTER TABLE Rfamily ADD CONSTRAINT PK_RFAMILY PRIMARY KEY (userid);

ALTER TABLE Notice ADD CONSTRAINT PK_NOTICE PRIMARY KEY (Notice_num);

ALTER TABLE R_section ADD CONSTRAINT PK_R_SECTION PRIMARY KEY (ROUTE_SECTION);

ALTER TABLE L_rule ADD CONSTRAINT PK_L_RULE PRIMARY KEY (LUGREGULAR_NUM);

ALTER TABLE LOUNGE_INFO ADD CONSTRAINT PK_LOUNGE_INFO PRIMARY KEY (LOUNGE_NUM);

ALTER TABLE dfare ADD CONSTRAINT PK_DFARE PRIMARY KEY (Keynum);

ALTER TABLE airplane ADD CONSTRAINT PK_AIRPLANE PRIMARY KEY (asnum);

ALTER TABLE Mtracking ADD CONSTRAINT PK_MTRACKING PRIMARY KEY (Tracking_num);

ALTER TABLE payrefund ADD CONSTRAINT PK_PAYREFUND PRIMARY KEY (SerialNumber);

ALTER TABLE SEAT_NUM ADD CONSTRAINT PK_SEAT_NUM PRIMARY KEY (SEAT_CODE);

ALTER TABLE Scplane ADD CONSTRAINT PK_SCPLANE PRIMARY KEY (renum);

ALTER TABLE Bpass ADD CONSTRAINT PK_BPASS PRIMARY KEY (Key);

ALTER TABLE flight_meal ADD CONSTRAINT PK_FLIGHT_MEAL PRIMARY KEY (meal_code);

ALTER TABLE Customerc ADD CONSTRAINT PK_CUSTOMERC PRIMARY KEY (Q_num);

ALTER TABLE yesno ADD CONSTRAINT PK_YESNO PRIMARY KEY (Contrat_num);

ALTER TABLE Ifare ADD CONSTRAINT PK_IFARE PRIMARY KEY (Keynum);

ALTER TABLE CARD_USE ADD CONSTRAINT PK_CARD_USE PRIMARY KEY (record_num);

ALTER TABLE GIFTCARD ADD CONSTRAINT PK_GIFTCARD PRIMARY KEY (CARD_NUM);

ALTER TABLE Contract ADD CONSTRAINT PK_CONTRACT PRIMARY KEY (Contract_code);

--ALTER TABLE Event ADD CONSTRAINT PK_EVENT PRIMARY KEY (Evnum);

ALTER TABLE Winner ADD CONSTRAINT PK_WINNER PRIMARY KEY (Key);

--ALTER TABLE Prize ADD CONSTRAINT PK_PRIZE PRIMARY KEY (Evnum);

ALTER TABLE Adminstrator ADD CONSTRAINT PK_ADMINSTRATOR PRIMARY KEY (AdminID);

ALTER TABLE Userdetail ADD CONSTRAINT PK_USERDETAIL PRIMARY KEY (UserID);

ALTER TABLE S_Grade ADD CONSTRAINT PK_S_GRADE PRIMARY KEY (Key);

ALTER TABLE Loginhis ADD CONSTRAINT PK_LOGINHIS PRIMARY KEY (UserID);

ALTER TABLE refund ADD CONSTRAINT PK_REFUND PRIMARY KEY (snum);


ALTER TABLE Cservice ADD CONSTRAINT FK_Adminstrator_TO_Cservice_1 FOREIGN KEY (AdminID)
REFERENCES Adminstrator (AdminID) on delete cascade;

ALTER TABLE Rfamily ADD CONSTRAINT FK_flightuser_TO_Rfamily_1 FOREIGN KEY (UserID)
REFERENCES flightuser (UserID) on delete cascade;

ALTER TABLE Notice ADD CONSTRAINT FK_Adminstrator_TO_Notice_1 FOREIGN KEY (AdminID)
REFERENCES Adminstrator (AdminID) on delete cascade;

ALTER TABLE L_rule ADD CONSTRAINT FK_R_section_TO_L_rule_1 FOREIGN KEY (ROUTE_SECTION)
REFERENCES R_section (ROUTE_SECTION) on delete cascade;

ALTER TABLE dfare ADD CONSTRAINT FK_Adminstrator_TO_dfare_1 FOREIGN KEY (AdminID)
REFERENCES Adminstrator (AdminID) on delete cascade;

ALTER TABLE Mtracking ADD CONSTRAINT FK_flightuser_TO_Mtracking_1 FOREIGN KEY (UserID)
REFERENCES flightuser (UserID) on delete cascade;

ALTER TABLE payrefund ADD CONSTRAINT FK_flightuser_TO_payrefund_1 FOREIGN KEY (UserID)
REFERENCES flightuser (UserID) on delete cascade;

ALTER TABLE payrefund ADD CONSTRAINT FK_Scplane_TO_payrefund_1 FOREIGN KEY (renum)
REFERENCES Scplane (renum) on delete cascade;

ALTER TABLE SEAT_NUM ADD CONSTRAINT FK_airplane_TO_SEAT_NUM_1 FOREIGN KEY (asnum)
REFERENCES airplane (asnum) on delete cascade;

ALTER TABLE Scplane ADD CONSTRAINT FK_airplane_TO_Scplane_1 FOREIGN KEY (asnum)
REFERENCES airplane (asnum) on delete cascade;

ALTER TABLE Bpass ADD CONSTRAINT FK_flightuser_TO_Bpass_1 FOREIGN KEY (UserID)
REFERENCES flightuser (UserID) on delete cascade;

ALTER TABLE yesno ADD CONSTRAINT FK_flightuser_TO_yesno_1 FOREIGN KEY (UserID)
REFERENCES flightuser (UserID) on delete cascade;

ALTER TABLE yesno ADD CONSTRAINT FK_Contract_TO_yesno_1 FOREIGN KEY (Contract_code)
REFERENCES Contract (Contract_code) on delete cascade;

ALTER TABLE Ifare ADD CONSTRAINT FK_Adminstrator_TO_Ifare_1 FOREIGN KEY (AdminID)
REFERENCES Adminstrator (AdminID) on delete cascade;

ALTER TABLE CARD_USE ADD CONSTRAINT FK_GIFTCARD_TO_CARD_USE_1 FOREIGN KEY (CARD_NUM)
REFERENCES GIFTCARD (CARD_NUM) on delete cascade;

ALTER TABLE Event ADD CONSTRAINT FK_Adminstrator_TO_Event_1 FOREIGN KEY (AdminID)
REFERENCES Adminstrator (AdminID) on delete cascade;

ALTER TABLE Winner ADD CONSTRAINT FK_flightuser_TO_Winner_1 FOREIGN KEY (UserID)
REFERENCES flightuser (UserID) on delete cascade;

ALTER TABLE Winner ADD CONSTRAINT FK_Event_TO_Winner_1 FOREIGN KEY (Evnum)
REFERENCES Event (Evnum) on delete cascade;

ALTER TABLE Prize ADD CONSTRAINT FK_Event_TO_Prize_1 FOREIGN KEY (Evnum)
REFERENCES Event (Evnum) on delete cascade;

ALTER TABLE Userdetail ADD CONSTRAINT FK_flightuser_TO_Userdetail_1 FOREIGN KEY (UserID) 
REFERENCES flightuser (UserID) on delete cascade;

ALTER TABLE refund ADD CONSTRAINT FK_flightuser_TO_refund_1 FOREIGN KEY (UserID)
REFERENCES flightuser (UserID) on delete cascade;

ALTER TABLE Prize ADD CONSTRAINT FK_Event_TO_Prize_1 FOREIGN KEY (Evnum)
REFERENCES Event (Evnum) on delete cascade;




--------------------------------------------------------------예시 데이터 삽입문---------------------------------------------------
--------------------------------------------------------------예시 데이터 삽입문---------------------------------------------------
--------------------------------------------------------------예시 데이터 삽입문---------------------------------------------------
--------------------------------------------------------------예시 데이터 삽입문---------------------------------------------------
--------------------------------------------------------------예시 데이터 삽입문---------------------------------------------------
--------------------------------------------------------------예시 데이터 삽입문---------------------------------------------------
--------------------------------------------------------------예시 데이터 삽입문---------------------------------------------------
--------------------------------------------------------------예시 데이터 삽입문---------------------------------------------------
-----
-- 회원 정보 5개
INSERT INTO flightuser VALUES ('user001', '홍', '길동', 'Hong', 'GilDong', 'password123', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'Male', 'user001@example.com', '01012345678', 'Korea', '1234-5678-9012-3456');

INSERT INTO flightuser VALUES ('user002', '김', '철수', 'Kim', 'ChulSoo', 'pass456', TO_DATE('1985-12-15', 'YYYY-MM-DD'), 'Male', 'user002@example.com', '01023456789', 'Korea', '5678-9012-3456-7890');

INSERT INTO flightuser VALUES ('user003', '이', '영희', 'Lee', 'YoungHee', 'securepass', TO_DATE('1993-05-20', 'YYYY-MM-DD'), 'Female', 'user003@example.com', '01034567890', 'Japan', '9012-3456-7890-1234');

INSERT INTO flightuser VALUES ('user004', '박', '미영', 'Park', 'MiYoung', 'mypassword', TO_DATE('1987-04-03', 'YYYY-MM-DD'), 'Female', 'user004@example.com', '01045678901', 'China', '2345-6789-0123-4567');

INSERT INTO flightuser VALUES ('user005', '김', '수현', 'Kim', 'SuHyun', 'p@ssw0rd', TO_DATE('1990-11-11', 'YYYY-MM-DD'), 'Female', 'user005@example.com', '01056789012', 'Korea', '6789-0123-4567-8901');

--항공기 정보 5개
INSERT INTO airplane  VALUES (
    'HL7553',
    '대한항공',
    276,
    'A330-300',
    TO_DATE('1999-04-16', 'YYYY-MM-DD'),
    0,
    24,
    252,
    '프레스티지 클래스 우선 탑승, 추가 수하물 허용',
    '향상된 좌석 공간, 개인 엔터테인먼트 시스템',
    NULL
);



INSERT INTO airplane VALUES (
    'HL7554',
    '대한항공',
    276,
    'A330-300',
    TO_DATE('1999-01-04', 'YYYY-MM-DD'),
    0,
    24,
    252,
    '프레스티지 클래스 전용 체크인, 라운지 이용 가능',
    '조절 가능한 헤드레스트, USB 충전 포트',
    NULL
);

INSERT INTO airplane VALUES (
    'HL7611',
    '대한항공',
    407,
    'A380-800',
    TO_DATE('2010-09-27', 'YYYY-MM-DD'),
    12,
    94,
    301,
    '프레스티지 클래스 셀프 체크인, 우선 탑승',
    '와이드 스크린 개인 모니터, 다리 공간 확장'
    ,'퍼스트클래스 최고의 서비스'
);


INSERT INTO airplane VALUES (
    'HL8348',
    '대한항공',
    146,
    'B737-8',
    TO_DATE('2019-04-18', 'YYYY-MM-DD'),
    0,
    8,
    138,
    '프레스티지 클래스 스위트, 고급 식사 옵션',
    '개인 엔터테인먼트, 더 넓은 좌석 및 다리 공간'
    ,NULL
);

INSERT INTO airplane VALUES (
    'HL8240',
    '대한항공',
    138,
    'B737-800',
    TO_DATE('2011-09-14', 'YYYY-MM-DD'),
    0,
    12,
    126,
    '프레스티지 클래스 스위트, 고급 식사 옵션',
    '개인 엔터테인먼트, 더 넓은 좌석 및 다리 공간'
    ,NULL
);
-- 예약 일정 5개
delete scplane where 1=1;
INSERT INTO Scplane VALUES (1, NULL, TO_DATE('2024-03-20 09:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-03-20 10:45', 'YYYY-MM-DD HH24:MI'), 'Korea', 'Korea', 'admin001', 'KE1234', 'JEJU.CJU', 'SEOUL.GMP', 23, 2, 'HL7553');
INSERT INTO Scplane VALUES (2, NULL, TO_DATE('2024-03-23 15:15', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-03-23 16:30', 'YYYY-MM-DD HH24:MI'), 'Korea', 'Korea', 'admin002',  'KE5678',  'JEJU.CJU','SEOUL.GMP', 15, 3, 'HL7554');
INSERT INTO Scplane VALUES (3, '햄버거', TO_DATE('2024-04-09 14:45', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-04-09 20:00', 'YYYY-MM-DD HH24:MI'), 'Korea', 'Japan', 'admin003', 'KE9876', 'FUK.FUK','SEOUL.ICN', 8, 1, 'HL7611');
INSERT INTO Scplane VALUES (4, '김치찌개', TO_DATE('2024-04-10 09:05', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-04-10 10:25', 'YYYY-MM-DD HH24:MI'), 'Korea', 'China', 'admin004',  'KE4321', 'BEIJING.PEK', 'SEOUL.ICN', 12, 4, 'HL8348');
INSERT INTO Scplane VALUES (5, NULL, TO_DATE('2024-05-03 21:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-05-03 22:15', 'YYYY-MM-DD HH24:MI'), 'Korea', 'Korea', 'admin005', 'KE8765', 'JEJU.CJU', 'SEOUL.GMP', 20, 2, 'HL8240');



-- 나머지 5개의 데이터
INSERT INTO Scplane VALUES 
(11, NULL, TO_DATE('2024-03-25 09:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-03-25 11:05', 'YYYY-MM-DD HH24:MI')
, 'Korea', 'Japan', 'admin001', 'KE2468', 'FUK.FUK', 'SEOUL.ICN', 18, 3, 'HL7553');
INSERT INTO Scplane VALUES 
(12, '스테이크', TO_DATE('2024-04-15 11:10', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-04-15 12:25', 'YYYY-MM-DD HH24:MI')
, 'Korea', 'CHINA', 'admin001', 'KE6543', 'BEIJING.PEK','SEOUL.ICN', 10, 1, 'HL8348');
--INSERT INTO Scplane VALUES 
--(13, NULL, TO_DATE('2024-05-01 16:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-05-01 17:40', 'YYYY-MM-DD HH24:MI')
--, 'Korea', 'Korea', 'admin001', 97000, 'KE7890', 'GMP', 'CJU', 25, 4, 'HL8197');
--INSERT INTO Scplane VALUES 
--(14, NULL, TO_DATE('2024-05-10 20:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-05-10 21:40', 'YYYY-MM-DD HH24:MI')
--, 'Korea', 'Korea', 'admin001', 132000, 'KE1227', 'GMP', 'CJU', 22, 2, 'HL6635');
--INSERT INTO Scplane VALUES 
--(15, NULL, TO_DATE('2024-05-20 13:20', 'YYYY-MM-DD HH24:MI'), TO_DATE('2024-05-20 14:30', 'YYYY-MM-DD HH24:MI')
--, 'Korea', 'Thailand', 'admin010', 101000, 'KE1115', 'GMP', 'CJU', 14, 3, 'HL5721');

--결제/예약/환불
--INSERT INTO payrefund VALUES (1, '결제', '카드', '정상', '20A', SYSDATE, 2, 97000, 276, 'user001', 1 ,'a');
--INSERT INTO payrefund VALUES (2, '결제', '기프트카드', '정상', '21A', SYSDATE, 0, 115000, 150, 'user002', 2);
--INSERT INTO payrefund VALUES (3, '결제', '카드', '정상', '22A', SYSDATE, 1, 199000, 250, 'user003', 3);
--INSERT INTO payrefund VALUES (4, '결제', '마일리지', '정상', '20A', SYSDATE, 0, 169000, 398, 'user004', 4);
--INSERT INTO payrefund VALUES (5, '결제', '기프트카드', '할인', '20A', SYSDATE, 3, 63000, 276, 'user005', 5);

--
-- 관리자 5개행 삽입
INSERT INTO Adminstrator VALUES ('#admin001', '김', '철수', 'Kim', 'Chulsoo', 'adminpass1', TO_DATE('1990-01-15', 'YYYY-MM-DD'), 'Male', 'chulsoo.kim@example.com', '010-1234-5678', 'Seoul, South Korea', '1234-5678-9012-3456');
INSERT INTO Adminstrator VALUES ('#admin002', '이', '영희', 'Lee', 'Younghee', 'adminpass2', TO_DATE('1985-03-22', 'YYYY-MM-DD'), 'Female', 'younghee.lee@example.com', '010-9876-5432', 'Busan, South Korea', '7890-1234-5678-9012');
INSERT INTO Adminstrator VALUES ('#admin003', '박', '민수', 'Park', 'Minsu', 'adminpass3', TO_DATE('1995-07-10', 'YYYY-MM-DD'), 'Male', 'minsu.park@example.com', '010-5555-1234', 'Incheon, South Korea', '3456-7890-1234-5678');
INSERT INTO Adminstrator VALUES ('#admin004', '장', '서영', 'Jang', 'Seoyoung', 'adminpass4', TO_DATE('1988-11-05', 'YYYY-MM-DD'), 'Female', 'seoyoung.jang@example.com', '010-7777-8888', 'Daejeon, South Korea', '9012-3456-7890-1234');
INSERT INTO Adminstrator VALUES ('#admin005', '윤', '준호', 'Yoon', 'Junho', 'adminpass5', TO_DATE('1992-04-30', 'YYYY-MM-DD'), 'Male', 'junho.yoon@example.com', '010-3333-9999', 'Ulsan, South Korea', '5678-9012-3456-7890');

--
--국내선 운임 인서트 3개
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (1, '비수기', '정상', '선호', '일반석', 'SEOUL/GMP-JEJU/CJU', 101000, 3000, '#admin001', '주중');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (2, '비수기', '정상', '일반', '일반석', 'SEOUL/GMP-JEJU/CJU', 97000 , 3000, '#admin001', '주중');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (3, '비수기', '정상', '선호', '일반석', 'SEOUL/GMP-JEJU/CJU', 115000, 3000, '#admin001', '주말');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (4, '비수기', '정상', '일반', '일반석', 'SEOUL/GMP-JEJU/CJU', 110000, 3000, '#admin001', '주말');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (5, '성수기', '정상', '성수기', '일반석', 'SEOUL/GMP-JEJU/CJU', 132000, 3000, '#admin001', '성수기');

INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (6, '비수기', '정상', '선호', '프레스티지석', 'SEOUL/GMP-JEJU/CJU', 161000, 3000, '#admin001', '주중');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (7, '비수기', '정상', '일반', '프레스티지석', 'SEOUL/GMP-JEJU/CJU', 157000, 3000, '#admin001', '주중');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (8, '비수기', '정상', '선호', '프레스티지석', 'SEOUL/GMP-JEJU/CJU', 175000, 3000, '#admin001', '주말');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (9, '비수기', '정상', '일반', '프레스티지석', 'SEOUL/GMP-JEJU/CJU', 170000, 3000, '#admin001', '주말');
INSERT INTO dfare (Keynum, peak, discount, timezone, sg, route, fare, redis, AdminID, wknddy)
VALUES (10, '성수기', '정상', '성수기', '프레스티지석', 'SEOUL/GMP-JEJU/CJU', 192000, 3000, '#admin001', '성수기');



--국제선 운임 인서트 2개
insert into ifare values (1,'ICN','FUK','일반석',150000,110000,20300,21000,'#admin003');
insert into ifare values (2,'ICN','PEK','일반석',235000,172300,22350,35000,'#admin004');
--국제선 운임

INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (3, 'ICN', 'FUK', '일등석', 807600, 593500, 18450, 35000, '#admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (4, 'ICN', 'FUK', '프레스티지석', 588850, 432000, 18450, 35000, '#admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (5, 'ICN', 'FUK', '일반석', 235000, 172300, 18450, 35000, '#admin001');

--exec mk_scplane_01  ('202404050800','202404050925','korea','JAPAN','#admin001','SEOUL.ICN','FUK.FUK');
--exec mk_scplane_01  ('202404051355','202404051525','korea','JAPAN','#admin001','SEOUL.ICN','FUK.FUK');
--exec mk_scplane_01  ('202404051835','202404052000','korea','JAPAN','#admin001','SEOUL.ICN','FUK.FUK');


INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (7, 'ICN', 'PEK', '일등석', 667000, 489500,  22350, 35000, '#admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (8, 'ICN', 'PEK', '프레스티지석', 506000,  370800,  22350, 35000, '#admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (9, 'ICN', 'PEK', '일반석', 361500, 265200, 22350, 35000, '#admin001');

--exec mk_scplane_01  ('202404200815','202404200940','korea','CHINA','#admin001','SEOUL.ICN','BEIJING.PEK');
--exec mk_scplane_01  ('202404200905','202404201025','korea','CHINA','#admin002','SEOUL.ICN','BEIJING.PEK');
--exec mk_scplane_01  ('202404201840','202404202005','korea','CHINA','#admin002','SEOUL.ICN','BEIJING.PEK');



INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (11, 'ICN', 'JFK', '일등석', 6412000,  4743000, 62300, 161000, '#admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (12, 'ICN', 'JFK', '프레스티지석', 4511000, 3336000, 62300, 161000, '#admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (13, 'ICN', 'JFK', '일반석', 2384000, 1763000, 62300, 161000, '#admin001');

--exec mk_scplane_01  ('202404201000','202404210020','korea','USA','#admin002','SEOUL.ICN','NYC.JFK');
--exec mk_scplane_01  ('202404201930','202404210930','korea','USA','#admin002','SEOUL.ICN','NYC.JFK');


INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (15, 'ICN', 'BOS', '일등석', 6412200, 4735028, 62300, 161000, '#admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (16, 'ICN', 'BOS', '프레스티지석', 4511000, 3334140, 62300, 161000, '#admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (17, 'ICN', 'BOS', '일반석', 2384500, 1759230, 62300, 161000, '#admin001');

--exec mk_scplane_01  ('202405100930','202405102330','korea','USA','#admin002','SEOUL.ICN','BOS.BOS');
--exec mk_scplane_01  ('202405100920','202405110340','korea','USA','#admin002','SEOUL.ICN','BOS.BOS');

INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (19, 'ICN', 'LAS', '일등석', 11033900, 4082543,  124600, 260400, '#admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (20, 'ICN', 'LAS', '프레스티지석', 7755600, 2869572 , 124600, 260400, '#admin001');
INSERT INTO Ifare (Keynum, starta, arrive, sg, fare, redis, tax, fuelch, AdminID)
VALUES (21, 'ICN', 'LAS', '일반석', 3656100, 1352757, 124600, 260400, '#admin001');


-- 안내 사항 5개
INSERT INTO notice VALUES ( 1, '한국 입국 세관신고 절차 변경', '2023년 5월 1일부터 대한민국 입국 세관신고 절차가 변경됩니다. 
 신고할 물품이 없는 경우에는 세관 신고서 없이 면세 라인 이용해 주세요.
 º 필수 신고 품목이 있는 경우에만 세관 신고서 제출 (검사 라인 이용) - 필수 신고 품목 : 미화 8백불 초과 물품, 미화 1만불 초과 외환, 검역물품 등
 º 신고 방법 : App/Web 사전 신고 또는 종이 휴대품 신고서 작성 
 º App 설치 및 Web 접속 방법', '여행정보', '#admin005');
INSERT INTO notice VALUES ( 2, '스카이패스 회원 할인 제휴 변경(키자니아 서울)', '스카이패스 회원 제휴사인 키자니아 서울과의 제휴 내용이 변경됩니다.
 º 스카이패스 회원 할인 적용은 현장 예매 시에만 가능 - 인터넷 사전 예매 시 할인 제공 불가  
 º 반일권 2부 할인율 30%로 인상 ( 2024년 2월 26일 부터) - 반일권 1부 할인율은 20% 유지', '스카이패스', '#admin001');
INSERT INTO notice VALUES ( 3, '엑설런트 보딩패스 제휴 종료 (쉐이크쉑)', '제휴사 폐점 계획에 따라 쉐이크쉑과의 엑설런트 보딩패스 제휴가 종료됩니다.
 º 제휴사 : 쉐이크쉑 (SHAKE SHACK) 인천국제공항 제2여객터미널 인천공항점
 º 제휴 종료일 : 2024년 3월 30일 º 엑설런트 보딩패스 제휴 혜택은 3월 29일 까지 제공됩니다.', '여행정보', '#admin003');
INSERT INTO notice VALUES ( 4, '카드 영수 일시 중단 (Diners Club, Discover)', '홈페이지에서 항공권 구매 시 Diners club 및 Discover 카드 영수가 일시 중단될 예정입니다.
 º 중단 일자 : 2024년 3월 16일 부 º 중단 사유 : 해당 카드사 심화인증 프로그램 개선 
 * 그 외 클로벌 카드사(Visa, Mastercard, American Express, JCB, UATP)로의 결제는 가능하며 카드사 심화인증 프로그램 개선 작업 후 다시 영수할 예정입니다.(20204년 상반기 내)'
, '기타안내', '#admin001');
INSERT INTO notice VALUES ( 5, '신규 마일리지 적립 제휴( 교보문고, 11번가)', '교보문고 및 11번가와 마일리지 적립 제휴를 시행하여,
 대한항공 홈페이지 내 제공된 링크를 통해 쇼핑 시 지불 금액에 따라 스카이패스 마일리지 적립이 가능함을 알려드립니다. 
 <제휴내용> 
  º 교보문고 : 지불 금액 1,000원당 2마일  
  º 11번가 : 지불 금액 1,000원당 1마일'
, '제휴소식', '#admin002');

--좌석


------
-- 일등석 좌석 추가
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-01A', 'HL7553', '01A', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-01B', 'HL7553', '01B', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-01C', 'HL7553', '01C', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-02A', 'HL7553', '02A', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-02B', 'HL7553', '02B', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-02C', 'HL7553', '02C', '일등석');

-- 일반석 좌석 추가
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-20A', 'HL7553', '20A', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-20B', 'HL7553', '20B', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-20C', 'HL7553', '20C', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-21A', 'HL7553', '21A', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-21B', 'HL7553', '21B', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-21C', 'HL7553', '21C', '일반석');

-- 프레스티지석 좌석 추가
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-10A', 'HL7553', '10A', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-10B', 'HL7553', '10B', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-10C', 'HL7553', '10C', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-11A', 'HL7553', '11A', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-11B', 'HL7553', '11B', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7553-11C', 'HL7553', '11C', '프레스티지석');

-- 일등석
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-01D', 'HL7554', '01D', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-01E', 'HL7554', '01E', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-01F', 'HL7554', '01F', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-02D', 'HL7554', '02D', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-02E', 'HL7554', '02E', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-02F', 'HL7554', '02F', '일등석');
-- 일반석
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-21A', 'HL7554', '21A', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-21B', 'HL7554', '21B', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-21C', 'HL7554', '21C', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-22A', 'HL7554', '22A', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-22B', 'HL7554', '22B', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-22C', 'HL7554', '22C', '일반석');
-- 프레스티지석
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-11A', 'HL7554', '11A', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-11B', 'HL7554', '11B', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-11C', 'HL7554', '11C', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-12A', 'HL7554', '12A', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-12B', 'HL7554', '12B', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7554-12C', 'HL7554', '12C', '프레스티지석');

-- 일등석
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-01G', 'HL7611', '01G', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-01H', 'HL7611', '01H', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-01I', 'HL7611', '01I', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-02G', 'HL7611', '02G', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-02H', 'HL7611', '02H', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-02I', 'HL7611', '02I', '일등석');

-- 일반석
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-22A', 'HL7611', '22A', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-22B', 'HL7611', '22B', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-22C', 'HL7611', '22C', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-23A', 'HL7611', '23A', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-23B', 'HL7611', '23B', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-23C', 'HL7611', '23C', '일반석');
-- 프레스티지석
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-12A', 'HL7611', '12A', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-12B', 'HL7611', '12B', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-12C', 'HL7611', '12C', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-13A', 'HL7611', '13A', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-13B', 'HL7611', '13B', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL7611-13C', 'HL7611', '13C', '프레스티지석');

-- 일등석 좌석 추가
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-01A', 'HL8348', '01A', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-01B', 'HL8348', '01B', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-01C', 'HL8348', '01C', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-02A', 'HL8348', '02A', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-02B', 'HL8348', '02B', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-02C', 'HL8348', '02C', '일등석');
-- 일반석 좌석 추가
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-20A', 'HL8348', '20A', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-20B', 'HL8348', '20B', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-20C', 'HL8348', '20C', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-21A', 'HL8348', '21A', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-21B', 'HL8348', '21B', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-21C', 'HL8348', '21C', '일반석');
-- 프레스티지석 좌석 추가
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-10A', 'HL8348', '10A', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-10B', 'HL8348', '10B', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-10C', 'HL8348', '10C', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-11A', 'HL8348', '11A', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-11B', 'HL8348', '11B', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8348-11C', 'HL8348', '11C', '프레스티지석');


-- 일등석 좌석 추가
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-01A', 'HL8240', '01A', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-01B', 'HL8240', '01B', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-01C', 'HL8240', '01C', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-02A', 'HL8240', '02A', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-02B', 'HL8240', '02B', '일등석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-02C', 'HL8240', '02C', '일등석');
-- 일반석 좌석 추가
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-20A', 'HL8240', '20A', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-20B', 'HL8240', '20B', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-20C', 'HL8240', '20C', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-21A', 'HL8240', '21A', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-21B', 'HL8240', '21B', '일반석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-21C', 'HL8240', '21C', '일반석');
-- 프레스티지석 좌석 추가
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-10A', 'HL8240', '10A', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-10B', 'HL8240', '10B', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-10C', 'HL8240', '10C', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-11A', 'HL8240', '11A', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-11B', 'HL8240', '11B', '프레스티지석');
INSERT INTO SEAT_NUM (SEAT_CODE, asnum, SEAT_NUM, SEAT_GRADE) VALUES ('HL8240-11C', 'HL8240', '11C', '프레스티지석');



-- 클럽등급기준 값 넣기 


INSERT INTO S_Grade (Key) VALUES (1); 
INSERT INTO S_Grade VALUES (2, '모닝캄 클럽', 50000, 40 ) ;  
INSERT INTO S_Grade VALUES (3, '모닝캄 프리미엄 클럽' , 500000, 40);
INSERT INTO S_Grade VALUES (4, '밀리언 마일러 클럽', 1000000, 40); 

-- 가족 신청 하기 


--INSERT INTO Rfamily (keynum,relation,family_id,userid) VALUES (1,'부','#id_01','user001');
--INSERT INTO Rfamily (keynum,relation,family_id,userid) VALUES (2,'모','#id_01','user002');
--INSERT INTO Rfamily (keynum,relation,family_id,userid) VALUES (3,'부','#id_02','user003');
--INSERT INTO Rfamily (keynum,relation,family_id,userid) VALUES (4,'모','#id_02','user004');
--INSERT INTO Rfamily (keynum,relation,family_id,userid) VALUES (5,'자','#id_02','user005');

---- 회원 세부 정보 
--INSERT INTO Userdetail (UserID) VALUES ('user001');
--INSERT INTO Userdetail (UserID) VALUES ('user002');
--INSERT INTO Userdetail (UserID) VALUES ('user003');
--INSERT INTO Userdetail (UserID) VALUES ('user004');
--INSERT INTO Userdetail (UserID) VALUES ('user005');


-- 마일리지 적립 / 소비
--    
--INSERT INTO Mtracking (Tracking_num, Amount_Mileage, airline_type, spendorearned, userID) VALUES(1,0,'대한항공','적립','user001');
--INSERT INTO Mtracking (Tracking_num, Amount_Mileage, airline_type, spendorearned, userID) VALUES(2,0,'대한항공','소비','user001');
--INSERT INTO Mtracking (Tracking_num, Amount_Mileage, airline_type, spendorearned, userID) VALUES(3,20,'대한항공','적립','user002');
--INSERT INTO Mtracking (Tracking_num, Amount_Mileage, airline_type, spendorearned, userID) VALUES(4,30,'대한항공','소비','user002');
--INSERT INTO Mtracking (Tracking_num, Amount_Mileage, airline_type, spendorearned, userID) VALUES(5,40,'대한항공','적립','user003');
--

-- 고객의 말씀
-- 첫 번째 행 삽입
INSERT INTO Customerc VALUES (
    1,                -- 문의사항고유번호
    '칭송',                        -- 유형
    '공항서비스',                  -- 분야
    '이',                         -- 승객 성
    '동찬',                       -- 승객 이름
    '(82) 10-1234-5678',          -- 전화번호
    'example@email.com',          -- 이메일주소
    '칭찬해요 ~',                  -- 제목
    '모두 너무 친절합니다',          -- 내용
    '1232-3456-7890-1323',         -- 스카이패스회원번호
    '34534534',                     -- 예약번호
    1,                            -- 이메일수신여부
    '서울',                        -- 도착도시
    '뉴욕',                        -- 출발도시
    TO_DATE('2024-03-10', 'YYYY-MM-DD'), -- 출발일자
    'KE123'                       -- 항공편명
);

-- 두 번째 행 삽입
INSERT INTO Customerc VALUES (
    2,                -- 문의사항고유번호
    '문의',                        -- 유형
    '기내식',                      -- 분야
    '김',                         -- 승객 성
    '영희',                       -- 승객 이름
    '(82) 10-2345-6789',          -- 전화번호
    'user2@example.com',          -- 이메일주소
    '기내식 관련 문의',            -- 제목
    '기내식 옵션이 무엇인가요?',   -- 내용
    '9012-3678-7890-1323',                       -- 스카이패스회원번호
    '12346786',                     -- 예약번호
    0,                            -- 이메일수신여부
    '도쿄',                        -- 도착도시
    '서울',                        -- 출발도시
    TO_DATE('2024-04-15', 'YYYY-MM-DD'), -- 출발일자
    'KE456'                       -- 항공편명
);

-- 세 번째 행 삽입
INSERT INTO Customerc VALUES (
    3,                -- 문의사항고유번호
    '불만',                        -- 유형
    '수화물',                      -- 분야
    '박',                         -- 승객 성
    '민수',                       -- 승객 이름
    '(82) 10-3456-7890',          -- 전화번호
    'user3@example.com',          -- 이메일주소
    '수화물 분실에 대한 불만',      -- 제목
    '짐을 받지 못했습니다',        -- 내용
    '9012-3456-2340-1323',                       -- 스카이패스회원번호
    '54367344',                     -- 예약번호
    1,                            -- 이메일수신여부
    '뉴욕',                        -- 도착도시
    '런던',                        -- 출발도시
    TO_DATE('2024-05-20', 'YYYY-MM-DD'), -- 출발일자
    'KE789'                       -- 항공편명
);

-- 네 번째 행 삽입
INSERT INTO Customerc VALUES (
    4,                -- 문의사항고유번호
    '제언',                        -- 유형
    '기타',                        -- 분야
    '최',                         -- 승객 성
    '지민',                       -- 승객 이름
    '(82) 10-4567-8901',          -- 전화번호
    'user4@example.com',          -- 이메일주소
    '기내 서비스 개선 제안',        -- 제목
    '기내 엔터테인먼트를 개선해주세요', -- 내용
    '9012-3456-7890-1323',                       -- 스카이패스회원번호
    '21346578',                     -- 예약번호
    0,                            -- 이메일수신여부
    '로스앤젤레스',                -- 도착도시
    '서울',                        -- 출발도시
    TO_DATE('2024-06-01', 'YYYY-MM-DD'), -- 출발일자
    'KE890'                       -- 항공편명
);

INSERT INTO Customerc VALUES (
    5,                -- 문의사항고유번호
    '불만',                        -- 유형
    '기내식',                      -- 분야
    '김',                         -- 승객 성
    '민준',                       -- 승객 이름
    '(82) 10-2345-6789',          -- 전화번호
    'user5@example.com',          -- 이메일주소
    '기내식 품질 개선 요청',         -- 제목
    '기내식의 맛과 질이 기대에 못 미쳤습니다.', -- 내용
    '1234-5678-9012-3456',        -- 스카이패스회원번호
    '87654321',                   -- 예약번호
    1,                            -- 이메일수신여부
    '도쿄',                        -- 도착도시
    '서울',                        -- 출발도시
    TO_DATE('2024-09-15', 'YYYY-MM-DD'), -- 출발일자
    'KE453'                       -- 항공편명
);


--식사메뉴

-- 첫 번째 식사 옵션 추가
INSERT INTO flight_meal (meal_code, menu) VALUES (1, '치킨 카레 라이스 - 온화한 향신료와 함께 제공되는 풍미 가득한 치킨 카레');

-- 두 번째 식사 옵션 추가
INSERT INTO flight_meal (meal_code, menu) VALUES (2, '비건 스페셜 - 채식주의자를 위한 특별 준비된 신선한 야채와 곡물로 만든 식사');

-- 세 번째 식사 옵션 추가
INSERT INTO flight_meal (meal_code, menu) VALUES (3, '스테이크와 감자 - 고급스러운 스테이크와 함께 제공되는 구운 감자');

-- 네 번째

INSERT INTO flight_meal (meal_code, menu) VALUES (4, '비빔밥- 새콤달콤 고추장과 어우러지는 각종 야채 밸런스잡힌 식사');

-- 다섯번째

INSERT INTO flight_meal (meal_code, menu) VALUES (5, '랍스터와 샌드위치 - 고급스러운 랍스터 함께 제공되는 구운 샌드위치');

-- 여섯번째

INSERT INTO flight_meal (meal_code, menu) VALUES (6, '돈까스- 경양식 돈까스와 샐러드');

-- 일곱번째

INSERT INTO flight_meal (meal_code, menu) VALUES (7, ' 바비큐 - 달콤한 소스와 어우러진 풍성한 식사 ');



---
--기프트카드 50만원 1개 생성


INSERT INTO GIFTCARD (
    CARD_NUM, 
    message, 
    PIN_NUM, 
    Recipient, 
    Recipient_PNUM, 
    SENDER, 
    SENDER_PNUM, 
    amount
) VALUES (
    '1234-5678-9012-3456',       -- 카드 번호
    '축하합니다!',               -- 메시지
    123456,                      -- PIN 번호
    '홍길동',                    -- 수령인
    '010-1234-5678',             -- 수령인 전화번호
    '김철수',                    -- 발송인
    '010-8765-4321',             -- 발송인 전화번호
    500000                       -- 금액 (50만원)
);



INSERT INTO GIFTCARD (
    CARD_NUM, 
    message, 
    PIN_NUM, 
    Recipient, 
    Recipient_PNUM, 
    SENDER, 
    SENDER_PNUM, 
    amount
) VALUES (
    '6654-5678-9012-3456',       -- 카드 번호
    '축하합니다!',               -- 메시지
    576555,                      -- PIN 번호
    '김명선',                    -- 수령인
    '010-1234-5678',             -- 수령인 전화번호
    '김철수',                    -- 발송인
    '010-8765-4321',             -- 발송인 전화번호
    100000                       -- 금액 (50만원)
);


INSERT INTO GIFTCARD (
    CARD_NUM, 
    message, 
    PIN_NUM, 
    Recipient, 
    Recipient_PNUM, 
    SENDER, 
    SENDER_PNUM, 
    amount
) VALUES (
    '0988-5678-9012-3456',       -- 카드 번호
    '축하합니다!',               -- 메시지
    678977,                      -- PIN 번호
    '이동찬',                    -- 수령인
    '010-1234-5678',             -- 수령인 전화번호
    '김철수',                    -- 발송인
    '010-8765-4321',             -- 발송인 전화번호
    50000                       -- 금액 (50만원)
);


INSERT INTO GIFTCARD (
    CARD_NUM, 
    message, 
    PIN_NUM, 
    Recipient, 
    Recipient_PNUM, 
    SENDER, 
    SENDER_PNUM, 
    amount
) VALUES (
    '4646-5678-9012-3456',       -- 카드 번호
    '축하합니다!',               -- 메시지
    234533,                      -- PIN 번호
    '이경석',                    -- 수령인
    '010-1234-5678',             -- 수령인 전화번호
    '김철수',                    -- 발송인
    '010-8765-4321',             -- 발송인 전화번호
    200000                       -- 금액 (50만원)
);


INSERT INTO GIFTCARD (
    CARD_NUM, 
    message, 
    PIN_NUM, 
    Recipient, 
    Recipient_PNUM, 
    SENDER, 
    SENDER_PNUM, 
    amount
) VALUES (
    '7686-5678-9012-3456',       -- 카드 번호
    '축하합니다!',               -- 메시지
    765755,                      -- PIN 번호
    '권석호',                    -- 수령인
    '010-1234-5678',             -- 수령인 전화번호
    '김철수',                    -- 발송인
    '010-8765-4321',             -- 발송인 전화번호
    400000                       -- 금액 (50만원)
);

-- 구간 테이블 3개

INSERT INTO r_section VALUES ( '국내선', 'ICN,GMP,CJU,KWJ,TAE,RSU,USN,HIN,CJJ,KPO'
                              , 'ICN,GMP,PUS,CJU,KWJ,TAE,RSU,USN,HIN,CJJ,KPO');
INSERT INTO r_section VALUES ( '국제선 미주', 'ICN,GMP,PUS,CJU,KWJ,TAE,RSU,USN,HIN,CJJ,KPO'
                              , 'NYC,JFK,DFW,DTW,LAS,LAX,MSP,YVR,BOS,SFO,SEA,CHI,ATL,WAS,YYZ,HNL');   
INSERT INTO r_section VALUES ( '국제선 동북아시아', 'ICN,GMP,PUS,CJU,KWJ,TAE,RSU,USN,HIN,CJJ,KPO'
                             ,'KOJ,KHH,KMQ,CAN,KKJ,NGO,NKG,KIJ,DLC,TYO,MFM,PEK,CTS,SHA,XMN,SHE,SZX,XIY,AOJ,YNJ,YNT,KIX,OIT,OKA,URC,WUH,WEH,DYG,CGO,TNA,CSX,TAO,KMG,TPE,RMQ,TSN,HGH,HFE,HKG,TXN,FUK');
--수화물 규정

INSERT INTO l_rule VALUES ( 1, '일반석', 1, 0 , '국제선 동북아시아' );
INSERT INTO l_rule VALUES ( 2, '일반석', 2, 70000 , '국제선 동북아시아' );
INSERT INTO l_rule VALUES ( 3, '일반석', 3, 170000 , '국제선 동북아시아' );
INSERT INTO l_rule VALUES ( 4, '프레스티지석', 1, 0 , '국제선 동북아시아' );
INSERT INTO l_rule VALUES ( 5, '프레스티지석', 2, 0 , '국제선 동북아시아' );
INSERT INTO l_rule VALUES ( 6, '프레스티지석', 3, 100000 , '국제선 동북아시아' );
INSERT INTO l_rule VALUES ( 7, '일등석', 1, 0 , '국제선 동북아시아' );
INSERT INTO l_rule VALUES ( 8, '일등석', 2, 0 , '국제선 동북아시아' );
INSERT INTO l_rule VALUES ( 9, '일등석', 3, 0 , '국제선 동북아시아' );
INSERT INTO l_rule VALUES ( 10, '일등석', 4, 100000 , '국제선 동북아시아' );

INSERT INTO l_rule VALUES ( 11, '일반석', 1, 0 , '국제선 미주' );
INSERT INTO l_rule VALUES ( 12, '일반석', 2, 0 , '국제선 미주' );
INSERT INTO l_rule VALUES ( 13, '일반석', 3, 200000 , '국제선 미주' );
INSERT INTO l_rule VALUES ( 14, '프레스티지석', 1, 0 , '국제선 미주' );
INSERT INTO l_rule VALUES ( 15, '프레스티지석', 2, 0 , '국제선 미주' );
INSERT INTO l_rule VALUES ( 16, '프레스티지석', 3, 200000 , '국제선 미주' );
INSERT INTO l_rule VALUES ( 17, '일등석', 1, 0 , '국제선 미주' );
INSERT INTO l_rule VALUES ( 18, '일등석', 2, 0 , '국제선 미주' );
INSERT INTO l_rule VALUES ( 19, '일등석', 3, 0 , '국제선 미주' );
INSERT INTO l_rule VALUES ( 20, '일등석', 4, 200000 , '국제선 미주' );

--라운지 정보
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 1,'KAL 일등석 라운지', '서울/인천', '대한민국','(제 2여객 터미널,출국심사 후)248 Gate 맞은편 위층(4F)', 'º 요일 : 매일
 º 시간 : 04:00 ~ 22:00 ', '직영', '일등석 승객' ,'음료, 스낵, 독서물, 텔레비전, 팩스, 무선 인터넷, 노트북 포트, 프린터, 회의실, 샤워시설, 주류');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 2,'KAL 라운지(국제선)', '서울/김포', '대한민국','대한민국, 출국장 내 4층(보안 검색 및 출국심사 후)', 'º 요일 : 매일
 º 시간 : 06:20 ~ 20:05 º 라운지 운영 시간은 항공기 운항 스케줄에 따라 변동될 수 있습니다.', '직영', 'º 프레스티지 클래스 승객 º 대한항공 밀리언 마일러 클럽 승객
 º 대한항공 모닝캄 프리미엄 클럽 승객 º 스카이팀 엘리트 플러스 승객 º 대한항공 모닝캄 클럽 승객 (라운지 좌석 상황에 따라 입장 제한)' 
 ,'음료, 스낵, 독서물, 텔레비전, 팩스, 무선 인터넷, 노트북 포트, 프린터, 주류');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 3,'KAL 라운지', '도쿄/나리타', '동북아시아','제1 터미널 출국심사 후 26번 GATE 근처에 위치', 'º 요일 : 매일
 º 시간 : 07:15 ~ 20:30 º 최종 접수 시간 : 종료 시간 20분전', '직영', 'º 일등석 승객 º 프리스티지 클래스 승객 º 대한항공 밀리언 마일러 클럽 승객 º 대한항공 모닝캄 프리미엄 클럽 승객
 º 스카이팀 엘리트 플러스 승객 º 대한항공 모닝캄 클럽 승객 (라운지 좌석 상황에 따라 입장 제한)' ,'음료, 스낵, 텔레비전, 무선 인터넷, 주류');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 4,'중국국제항공 라운지', '베이징/서우두(PEK)', '동북아시아','터미널2,보안검색지역 통과 후 면세지역','<º 요일 : 화, 목, 토
 º 시간 : 07:40 ~ 10:40> <º 요일 : 월, 수, 금, 일 º 시간 : 07:50 ~ 10:50> <º 요일 : 매일 º 시간 : 08:45 ~ 11:45> <º 요일 : 월, 수, 금, 일 º 시간 : 11:15 ~ 14:15>
 <º 요일 : 월, 수, 금, 일 º 시간 : 15:55 ~ 18:55> <º 요일 : 매일 º 시간 : 18:55 ~ 21:45>', '임차', 'º 일등석 승객 º 프리스티지 클래스 승객 º 대한항공 밀리언 마일러 클럽 승객
 º 대한항공 모닝캄 프리미엄 클럽 승객 º 스카이팀 엘리트 플러스 승객' ,'음료, 스낵, 독서물, 텔레비전, 무선 인터넷, 노트북 포트, 프린터, 주류');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 5,'36번 동방항공 라운지', '상하이/푸동(PVG)', '동북아시아','보안검색지역 통과후 면세지역','º 요일 : 매일 º 시간 : 05:00 ~ 23:59', '임차'
 , 'º 일등석 승객 º 프리스티지 클래스 승객 º 대한항공 밀리언 마일러 클럽 승객 º 대한항공 모닝캄 프리미엄 클럽 승객 º 스카이팀 엘리트 플러스 승객' 
 ,'음료, 스낵, 독서물, 텔레비전, 전화, 팩스, 컴퓨터(인터넷 가능), 무선 인터넷, 프린터, 수면실, 샤워시설, 주류');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 6,'중화항공 라운지', '타이베이/타오위엔(TPE)', '동북아시아','제1 여객터미널, 출국장 3층 안전검사 통과 및 출국사열 후 오른쪽"A" 방향의 4층에 위치'
 ,'º 요일 : 매일 º 시간 : 05:30 ~ 23:30', '임차', 'º 일등석 승객 º 프리스티지 클래스 승객 º 대한항공 밀리언 마일러 클럽 승객 º 대한항공 모닝캄 프리미엄 클럽 승객
 º 스카이팀 엘리트 플러스 승객' ,'음료, 스낵, 독서물, 텔레비전, 팩스, 컴퓨터(인터넷 가능), 무선 인터넷, 노트북 포트, 수면실, 샤워시설, 주류');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 7,'플라자 프리미엄 라운지', '홍콩(HKG)', '동북아시아','1번 탑승구 부근','º 요일 : 매일 º 시간 : 06:00 ~ 01:00 º 라운지 사용 시간 : 최대 3시간'
, '임차', 'º 일등석 승객 º 프리스티지 클래스 승객 º 대한항공 밀리언 마일러 클럽 승객 º 대한항공 모닝캄 프리미엄 클럽 승객
 º 스카이팀 엘리트 플러스 승객' ,'음료, 스낵, 텔레비전, 전화');
INSERT INTO lounge_info (lounge_num, lounge_name, destination_airport, country, location, operating_time, operator, entry_passenger, service)
VALUES ( 8,'스카이팀 라운지', '밴쿠버(YVR)', '미주','국제선 청사 탑승구 D54 근처에 위치','º 요일 : 매일 º 시간 : 07:30 ~ 02:00
 º 추가정보는 공식 웹사이트 참조 요망 http://www.skyteam.com/en/lounges/Vancouver 참조', '임차', 'º 프리스티지 클래스 승객 º 대한항공 밀리언 마일러 클럽 승객
 º 대한항공 모닝캄 프리미엄 클럽 승객 º 스카이팀 엘리트 플러스 승객 ※주류 제공으로 인해 19세 이상만 출입 가능( 단, 성인 동반자와는 입장 가능)' 
 ,'음료, 스낵, 팩스, 무선 인터넷, 노트북 포트, 프린터, 수면실, 샤워시설, 주류');

--서비스 센터 5개

INSERT INTO cservice VALUES ('82', '한국', '대한민국', '1588-2001', '02-2656-2001', '[국내선] 
한국어/영어 : 매일 07:00-19:00 
[국제선] 
한국어 : 매일 07:00-22:00 
영어 : 매일 24시간 
일본어 : 매일 09:00-19:00(일본 현지시간 기준) 
중국어 : 매일 08:00-19:00(중국 현지시간 기준)','#admin002');
INSERT INTO cservice VALUES ('81', '동북아시아', '일본', '0570-05-2001', '06-6648-8201', '한국어/영어 : 매일 24시간 
일본어 : 매일 09:00-19:00 
중국어 : 매일 08:00-19:00(중국 현지시간 기준)','#admin002');
INSERT INTO cservice (cs_num, area, country_name, cs_call1,lang_time, adminid) VALUES ('852', '동북아시아', '홍콩', '2366-2001', '한국어/영어 : 매일 24시간 
일본어 : 매일 09:00-19:00(일본 현지시간 기준) 
중국어(보통화) : 매일 08:00-19:00(중국 현지시간 기준)','#admin003');
INSERT INTO cservice (cs_num, area, country_name, cs_call1,lang_time, adminid) VALUES ('61', '대양주/괌', '호주', '02-9262-6000', '한국어/영어 : 매일 24시간 
일본어 : 매일 09:00-19:00(일본 현지시간 기준) 
중국어 : 매일 08:00-19:00(중국 현지시간 기준)','#admin003');
INSERT INTO cservice VALUES ('7', '러시아/중앙아시아', '러시아', '(모스크바)8-800-500-2510(무료)', '(블라디보스토크)8-4232-433-444', '한국어/영어 : 매일 24시간 
일본어 : 매일 09:00-19:00(일본 현지시간 기준) 
중국어 : 매일 08:00-19:00(중국 현지시간 기준) 
* 현지어 선택 가능
현지어는 지점의 운영시간에 따라 서비스 제공 시간이 다릅니다.','#admin002');

-- 약관
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (1, '필수', '이용약관', '제1장 총칙 제1조 (목적) 이 약관은 ㈜대한항공(이하 "대한항공"이라 합니다)이 운영하는 대한항공 온라인 플랫폼에서 제공하는 온라인 서비스(이하 "서비스"라 합니다)를 이용함에 있어 대한항공과 이용자의 권리· 및 의무 및 책임사항을 규정함을 목적으로 합니다.');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (2, '필수', '개인정보 수집 및 이용 동의', '회원의 개인정보 수집 및 이용에 대한 동의 사항');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (3, '선택', '개인정보 제3자 제공 동의', '회원의 개인정보보호를 위한 이용자 동의 사항');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (4, '선택', '마케팅 광고 활용 및 수신 동의', '마케팅 광고 활용 동의
대한항공은 광고성 정보(이벤트, 혜택) 제공을 위해 휴대전화 번호, 이메일 주소, 우편물 수령지(자택, 직장), 회사정보(회사명, 부서명, 직위)를 수집합니다.');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (5, '선택', '뉴스레터', '내용없음');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (6, '선택', '프로모션 정보', '내용없음');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (7, '선택', '이메일', '내용없음');
INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
VALUES (8, '선택', 'SMS', '내용없음');


-- 약관 동의 여부
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('1', '동의', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 1);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('2', '동의', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 2);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('3', '동의', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 3);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('4', '동의', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 4);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('5', '동의', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 5);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('6', '동의', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 6);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('7', '동의', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 7);
INSERT INTO yesno (Contrat_num, agree, Agree_date, UserID, Contract_code)
VALUES ('8', '동의', TO_DATE('2024.03.08', 'YYYY.MM.DD'), 'user001', 8);

--기프트 카드 사용 내역

--INSERT INTO CARD_USE VALUES (1,'등록',TO_DATE('2024-03-07','YYYY-MM-DD'),500000,'1234-5678-9012-3456');
-- 데이터 삽입
INSERT INTO Event VALUES (1, '응모', '아이폰을찾아라', TO_DATE('2024-03-10', 'YYYY-MM-DD')
, TO_DATE('2024-03-28', 'YYYY.MM.DD.'), '#admin001', NULL);
INSERT INTO Event VALUES (2, '응모', '음식점 이벤트', TO_DATE('2024-03-10', 'YYYY-MM-DD')
, TO_DATE('2024-03-25', 'YYYY.MM.DD.'), '#admin001', NULL);
INSERT INTO Event VALUES (3, '마일리지', '문화 이벤트', TO_DATE('2024-03-01', 'YYYY-MM-DD')
, TO_DATE('2024-03-06', 'YYYY.MM.DD.'), '#admin001', NULL);
INSERT INTO Event VALUES (4, '경험', '체육 이벤트', TO_DATE('2024-02-25', 'YYYY-MM-DD')
, TO_DATE('2024-03-01', 'YYYY.MM.DD.'), '#admin001', NULL);
INSERT INTO Event VALUES (5, '응모', '봄맞이 이벤트', TO_DATE('2024-02-20', 'YYYY-MM-DD')
, TO_DATE('2024-02-25', 'YYYY-MM-DD'), '#admin001', NULL);


--데이터 위너



INSERT INTO Prize (Keynum, Evnum, Price1, countnum, GRADE) VALUES (1, 1, '갤럭시', 1, 1);
INSERT INTO Prize (Keynum, Evnum, Price1, countnum, GRADE) VALUES (2, 1, '아이폰', 2, 2);
INSERT INTO Prize (Keynum, Evnum, Price1, countnum, GRADE) VALUES (3, 1, '샤오미', 3, 3);
INSERT INTO Prize (Keynum, Evnum, Price1, countnum, GRADE) VALUES (4, 2, '문화상품권 100만원', 2, 1);
INSERT INTO Prize (Keynum, Evnum, Price1, countnum, GRADE) VALUES (5, 2, '대한항공상품권50만원', 5, 2);
INSERT INTO Prize (Keynum, Evnum, Price1, countnum, GRADE) VALUES (6, 2, '쌍용 상품권 5천원', 10, 3);
INSERT INTO Prize (Keynum, Evnum, Price1, countnum, GRADE) VALUES (7, 3, '마일리지 500000점', 1, 1);
INSERT INTO Prize (Keynum, Evnum, Price1, countnum, GRADE) VALUES (8, 3, '마일리지 300000점', 3, 2);
INSERT INTO Prize (Keynum, Evnum, Price1, countnum, GRADE) VALUES (9, 3, '마일리지 100000점', 5, 3);
INSERT INTO Prize (Keynum, Evnum, Price1, countnum, GRADE) VALUES (10, 4, '대한항공 인턴', 5, 1);


INSERT INTO flightuser VALUES ('user006', '이', '준호', 'Lee', 'JunHo', 'password123', TO_DATE('1988-06-25', 'YYYY-MM-DD'), 'Male', 'user006@example.com', '01067890123', 'Korea', '3456-7890-1234-5678');
INSERT INTO flightuser VALUES ('user007', '정', '수민', 'Jung', 'SuMin', 'pass456', TO_DATE('1992-09-30', 'YYYY-MM-DD'), 'Female', 'user007@example.com', '01078901234', 'Korea', '8901-2345-6789-0123');
INSERT INTO flightuser VALUES ('user008', '이', '시우', 'Lee', 'SiWoo', 'securepass', TO_DATE('1986-03-17', 'YYYY-MM-DD'), 'Male', 'user008@example.com', '01089012345', 'Japan', '2345-6789-0123-4567');
INSERT INTO flightuser VALUES ('user009', '박', '진영', 'Park', 'JinYoung', 'mypassword', TO_DATE('1995-07-08', 'YYYY-MM-DD'), 'Male', 'user009@example.com', '01090123456', 'China', '6789-0123-4567-8901');
INSERT INTO flightuser VALUES ('user010', '최', '수진', 'Choi', 'SuJin', 'p@ssw0rd', TO_DATE('1991-02-14', 'YYYY-MM-DD'), 'Female', 'user010@example.com', '01001234567', 'Korea', '0123-4567-8901-2345');
INSERT INTO flightuser VALUES ('user011', '김', '태영', 'Kim', 'TaeYoung', 'password123', TO_DATE('1989-10-05', 'YYYY-MM-DD'), 'Male', 'user011@example.com', '01012345678', 'Korea', '5678-9012-3456-7890');
INSERT INTO flightuser VALUES ('user012', '이', '수빈', 'Lee', 'SuBin', 'pass456', TO_DATE('1994-11-26', 'YYYY-MM-DD'), 'Female', 'user012@example.com', '01023456789', 'Korea', '9012-3456-7890-1234');
INSERT INTO flightuser VALUES ('user013', '박', '민준', 'Park', 'MinJun', 'securepass', TO_DATE('1984-08-12', 'YYYY-MM-DD'), 'Male', 'user013@example.com', '01034567890', 'Japan', '2345-6789-0123-4567');
INSERT INTO flightuser VALUES ('user014', '손', '지원', 'Son', 'JiWon', 'mypassword', TO_DATE('1983-12-31', 'YYYY-MM-DD'), 'Female', 'user014@example.com', '01045678901', 'China', '6789-0123-4567-8901');
INSERT INTO flightuser VALUES ('user015', '장', '성우', 'Jang', 'SungWoo', 'p@ssw0rd', TO_DATE('1982-05-17', 'YYYY-MM-DD'), 'Male', 'user015@example.com', '01056789012', 'Korea', '0123-4567-8901-2345');
INSERT INTO flightuser VALUES ('user016', '김', '영희', 'Kim', 'YoungHee', 'password123', TO_DATE('1987-09-22', 'YYYY-MM-DD'), 'Female', 'user016@example.com', '01067890123', 'Korea', '3456-7890-1234-5678');
INSERT INTO flightuser VALUES ('user017', '이', '민수', 'Lee', 'MinSoo', 'pass456', TO_DATE('1983-04-14', 'YYYY-MM-DD'), 'Male', 'user017@example.com', '01078901234', 'Korea', '8901-2345-6789-0123');
INSERT INTO flightuser VALUES ('user018', '장', '미영', 'Jang', 'MiYoung', 'securepass', TO_DATE('1990-12-01', 'YYYY-MM-DD'), 'Female', 'user018@example.com', '01089012345', 'Japan', '2345-6789-0123-4567');
INSERT INTO flightuser VALUES ('user019', '오', '준호', 'Oh', 'JunHo', 'mypassword', TO_DATE('1988-08-30', 'YYYY-MM-DD'), 'Male', 'user019@example.com', '01090123456', 'China', '6789-0123-4567-8901');
INSERT INTO flightuser VALUES ('user020', '배', '수진', 'Bae', 'SuJin', 'p@ssw0rd', TO_DATE('1992-03-07', 'YYYY-MM-DD'), 'Female', 'user020@example.com', '01001234567', 'Korea', '0123-4567-8901-2345');




-------기능 실행 전 미리 만들어야하는 수열,전역변수 ----------------------------------------------------------------------------
-------기능 실행 전 미리 만들어야하는 수열 ----------------------------------------------------------------------------
-------기능 실행 전 미리 만들어야하는 수열 ----------------------------------------------------------------------------
-------기능 실행 전 미리 만들어야하는 수열 ----------------------------------------------------------------------------
-------기능 실행 전 미리 만들어야하는 수열 ----------------------------------------------------------------------------
-------기능 실행 전 미리 만들어야하는 수열 ----------------------------------------------------------------------------
CREATE SEQUENCE DC_SEQEVE
START WITH 8;

CREATE SEQUENCE DCDRAW;
CREATE SEQUENCE KeySequence;
CREATE SEQUENCE customercseq
START WITH 6;
CREATE SEQUENCE flight_mealseq
START WITH 4;
CREATE SEQUENCE tr_dc_giftcard
START WITH 2;

CREATE SEQUENCE  SE_giftcard_03;
CREATE SEQUENCE  DC_giftcard_01
START WITH 8;
CREATE SEQUENCE SEQ_LOB
START WITH 8;
-- 시퀀스 잡고 날짜 초분까지 잡아서 넘겨주기 --> userdetail sum 총값 자동으로 업뎃해줌 . 
-- Mtracking 시퀀스 

CREATE SEQUENCE seq_mtracking
INCREMENT BY 1 
START WITH 1 
MINVALUE 1 
MAXVALUE 9999 
NOCYCLE
NOCACHE
NOORDER;


------------------------------------트리거 목록 --------------------------------------------
------------------------------------트리거 목록 --------------------------------------------
------------------------------------트리거 목록 ---------------------------------------------
------------------------------------트리거 목록 ----------------------------------------------
------------------------------------트리거 목록 ---------------------------------------------
-- 예약 결제 행 업데이트 후 
create or replace trigger tr_mk_payrefund_01
AFTER insert on payrefund
for each row
declare 
    vnum1 number;
    vnum2 number;
    vuserid varchar2(100);
begin
     select nvl(count(tracking_num),0)+1 into vnum1 from mtracking;
     select nvl(count(record_num),0)+1 into vnum2 from card_use;
        select userid into vuserid from loginhis ;
     if :new.pmethod ='마일리지' then
     insert into mtracking values(vnum1 , sysdate, :new.mileage,'대한항공','소비', vuserid);
     elsif :new.pmethod ='카드' then 
     insert into mtracking values(vnum1 , sysdate, :new.mileage, '대한항공','적립',vuserid);
     elsif :new.pmethod = '기프트카드' then
     insert into card_use values ( vnum2,'사용' ,sysdate, :new.cost, :new.giftcardnumber);
     end if;
end;


----------------------------
----------------- 마일리지 내역 추가시 해당하는 총마일리지 적립--
create or replace trigger tr_mk_userdetail_01
after insert on mtracking
for each row
begin
        update userdetail 
        set totalmile = nvl(totalmile,0) + ( case :new.spendorearned when '적립' then :new.amount_mileage when '환불' then -(:new.amount_mileage) end)
        where userid = (select userid from loginhis);
end ;
drop trigger tr_mk_userdetail_01;
select * from userdetail;
select * from mtracking;
-------------- 회원가입시 userdetail 테이블에 추가 트리거 필요

 create or replace trigger tr_mk_flightuser_01 
 after insert on flightuser
 for each row
 begin
        insert into userdetail(userid) values (:new.userid);

 end;
 

     
------- 환불시 마일리지 혹은 기프트카드에 작동하는 트리거
------  환불 테이블 행 업데이트 후 
create or replace trigger tr_mk_refund_02
AFTER insert on REFUND
for each row
declare 
    vnum1 number;
    vnum2 number;
    vuserid varchar2(100);
begin
     select nvl(count(tracking_num),0)+1 into vnum1 from mtracking;
     select nvl(count(record_num),0)+1 into vnum2 from card_use;
     select userid into vuserid from loginhis ;
     if :new.rmethod ='마일리지' then
     insert into mtracking values(vnum1 , sysdate, :new.mile,'대한항공','환불', vuserid);
     elsif :new.rmethod ='카드' then 
     insert into mtracking values(vnum1 , sysdate, :new.mile, '대한항공','환불',vuserid);
     elsif :new.rmethod = '기프트카드' then
     insert into card_use values ( vnum2,'환불' ,sysdate, :new.charge, :new.giftcardnumber);
     end if;
end;



--  select * from mtracking;
--  select * from payrefund;
------------------------- 마일리지 내역 업로드시 조건에 따라 USERDETAIL의 정보를 업데이트 하는 트리거 
--CREATE OR REPLACE TRIGGER  tr_mk_mtracking_01
--after insert on mtracking
--for each row 
--begin
--  if totalmile  + :new.amount_mileage >=5000 then 
--        usergrade = '모닝캄 클럽';
--        end if;
--    update userdetail
--    set totalmile += :new.amount_mileage 
--    where userid = (select userid from loginhis);
--end;
--
--select * from userdetail;
--select * from mtracking;
--------------------------------------시은 트리거 -----------
CREATE OR REPLACE TRIGGER se_lrule_04
BEFORE
INSERT ON payrefund
FOR EACH ROW
DECLARE
 vgrade l_rule.seat_grade%TYPE;
 vnum NUMBER;
 vfee l_rule.excess_fee%TYPE;
 vsection r_section.route_section%TYPE;
 vaairport scplane.aairport%TYPE;
 vasnum seat_num.asnum%TYPE;
 vcost payrefund.cost%TYPE;
 vdate scplane.ddate%TYPE;
BEGIN
 IF :NEW.payrefund = '환불' THEN
 DBMS_OUTPUT.PUT_LINE(' ');
 ELSE
 SELECT ddate INTO vdate
 FROM scplane
 WHERE renum = :NEW.renum;

 SELECT asnum INTO vasnum
 FROM scplane
 WHERE renum = :NEW.renum;

 SELECT seat_grade INTO vgrade
 FROM seat_num 
 WHERE seat_num = :NEW.seatnumber AND asnum = vasnum;
 
 vnum := :NEW.nluggage;
 
 SELECT aairport INTO vaairport
 FROM scplane 
 WHERE renum = :NEW.renum;
 
 WITH a AS(
 SELECT route_section,
 REGEXP_SUBSTR(aairport , '[^,]+' , 1 , b.lv )AS airport
 FROM r_section,(SELECT LEVEL AS lv FROM dual CONNECT BY LEVEL <= 50) b
 )
 SELECT route_section INTO vsection
 FROM a
 WHERE airport = SUBSTR(vaairport,-3);
 IF vsection LIKE '%국제선%' THEN
 SELECT excess_fee INTO vfee
 FROM l_rule
 WHERE seat_grade = vgrade AND numberofluggage = vnum AND route_section = vsection;
 ELSE
  vfee := 0;
 END IF;
 
 vcost := :NEW.cost + vfee; 

 UPDATE payrefund
 SET cost = :NEW.cost + vfee
 WHERE serialnumber = :NEW.serialnumber;
 DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
 DBMS_OUTPUT.PUT_LINE('    '||TO_CHAR(vdate, 'MM/DD')||' '||TO_CHAR(vdate, 'HH24:MI')||'에 출발하는 '||vaairport ||'행 비행기 좌석'|| :NEW.seatnumber);
 DBMS_OUTPUT.PUT_LINE('  운임가격은 '||:NEW.cost ||'이고, 위탁수하물 초과 요금은 ' || vfee|| '입니다. ' );
 DBMS_OUTPUT.PUT_LINE('      결제수단은 '||:NEW.pmethod||'고 최종 결제 금액은 ' || vcost ||'입니다!');
 DBMS_OUTPUT.PUT_LINE(' ');
 DBMS_OUTPUT.PUT_LINE(' ');
 DBMS_OUTPUT.PUT_LINE('                  ★(예약완료)★');
 DBMS_OUTPUT.PUT_LINE('           설레는 여행 같이 준비해 봐요~!');
 DBMS_OUTPUT.PUT_LINE(' ');
 DBMS_OUTPUT.PUT_LINE(' ');
 DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
 DBMS_OUTPUT.PUT_LINE('주문금액                                   '||vcost||'원');
 DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
 DBMS_OUTPUT.PUT_LINE('총결제금액                                 '||vcost||'원');
 DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
 DBMS_OUTPUT.PUT_LINE(' ');
 DBMS_OUTPUT.PUT_LINE('▶사전체크인 하러 가기                               ');
 END IF;
END;

-----------탑승권 삭제 트리거 -----------
-----------탑승권 삭제 트리거 -----------

CREATE OR REPLACE TRIGGER se_bpass_01
AFTER
DELETE ON payrefund
FOR EACH ROW
DECLARE
BEGIN
 DELETE FROM bpass WHERE key = CONCAT('b',:OLD.serialnumber);
END;

-----------------------------------동찬 트리거 ------------------------------------
-----------------------------------동찬 트리거 ------------------------------------

CREATE OR REPLACE TRIGGER tr_dc_giftcard_01
BEFORE INSERT ON payrefund
FOR EACH ROW
DECLARE 
    notenough EXCEPTION;
    vamount giftcard.AMOUNT%TYPE;
    vPIN_NUM giftcard.pin_num%TYPE;
BEGIN

    IF :NEW.pmethod = '기프트카드' THEN
    
    SELECT AMOUNT,PIN_NUM INTO vamount,VPIN_NUM
    FROM GIFTCARD 
    WHERE  CARD_NUM = :NEW.GIFTCARDNUMBER;
            IF vPIN_NUM = :NEW.PIN_NUM   THEN 
            DBMS_OUTPUT.PUT_LINE('핀번호 일치!');
            
                        IF vamount<:NEW.cost   THEN
                            RAISE_APPLICATION_ERROR(-20002, '잔액이 부족합니다.');
                          
                            
                        ELSE
                            UPDATE GIFTCARD
                            SET
                            AMOUNT = vamount - :NEW.cost 
                            WHERE CARD_NUM = :NEW.GIFTCARDNUMBER;
                            DBMS_OUTPUT.PUT_LINE( '기프트카드사용완료 이용전 잔액 : '|| VAMOUNT);
                        END IF;
            ELSE
                RAISE_APPLICATION_ERROR(-20000, '핀번호 불일치.');
               
            END IF;
    END IF;
--EXCEPTION

END;

---- 기능 실행 -----------------------------------------------------------------------------------------------------
---- 기능 실행 -----------------------------------------------------------------------------------------------------
---- 기능 실행 -----------------------------------------------------------------------------------------------------
---- 기능 실행 -----------------------------------------------------------------------------------------------------
---- 기능 실행 -----------------------------------------------------------------------------------------------------
---- 기능 실행 -----------------------------------------------------------------------------------------------------

-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------


-- 일정 삽입 프로시저 
create or replace procedure mk_scplane_01 
(
    pddate varchar2,
    padate varchar2,
    pdnation scplane.dnation%type default 'Korea',
    panation scplane.anation%type,
    padmin scplane.adminid%type,
    pdairport scplane.dairport%type,
    paairport scplane.aairport%type
    
)
is
    vnumber varchar2(100);
    vasnum varchar2(100);
    vddate date;
    vadate date;
    vdnation varchar2(100);
    vanation varchar2(100);
    vfood varchar2(100) default '(기내식 제공없음)';
    vcheck number(10);
begin
    select count(renum) into vcheck from scplane where pddate = to_char(ddate,'yyyymmddhh24mi') and padate = to_char(adate,'yyyymmddhh24mi') and substr(dairport ,instr(dairport ,'.')+1) =substr(pdairport ,instr(pdairport ,'.')+1) and substr(aairport ,instr(aairport ,'.')+1) =substr(paairport ,instr(paairport ,'.')+1) ;
    if vcheck !=0 then
    raise_application_error ( -20022 , '중복된 일정이 존재합니다');
    end if;
    vanation := upper(panation); 
    if vanation !='KOREA' then
    select substr(menu,1,instr(menu,'-')-1) into vfood from  (select menu from flight_meal order by dbms_random.value ) where rownum=1;
    end if ;
    vddate :=to_date(pddate,'yyyy.mm.dd hh24:mi');
    vadate :=to_date(padate,'yyyy.mm.dd hh24:mi');
    
    select asnum into vasnum from  (select asnum from airplane order by dbms_random.value ) where rownum=1 ;
    select NVL(max(renum)+1,1) INTO vnumber  from scplane ;
    
    insert into scplane values (vnumber ,vfood, vddate,vadate ,upper(pdnation),upper(panation),padmin, substr(initcap(pAnation),1,1) ||upper(dbms_random.string('A',1))||to_char(round(dbms_random.value(1000,9999))),paairport,pdairport,dbms_random.value(1,30),dbms_random.value(1,6),vasnum);
end;





--회원가입 프로시저
create or replace procedure mk_flightuser_01 
(
    UI flightuser.userid%type,
    kl flightuser.Korlastname%type ,
    kf flightuser.Korfirstname%type ,
    lne flightuser.lastname%type,
    fn flightuser.firstname%type ,
    pw flightuser.password%type ,
    bd  flightuser.birthdate%type ,
    gd flightuser.gender%type ,
    ea1 flightuser.emailaddress%type ,
    pn flightuser.phoneNumber%type  ,
    at1 flightuser.Anation%type,
    spn flightuser.Skypassnumber%type,
    ct1 contract.contract_code%type,
    ct2 contract.contract_code%type
)
is
  vui flightuser.userid%type;
  vnum number;
begin
    if ct1<>12 then 
        raise_application_error(-20003,' 필수 약관 미동의 회원가입 진행 불가');
     end if;
        select count(userid) into vnum from flightuser where userid=ui;
        if vnum =1 then
          raise_application_error(-20002,' 유저Id 중복 오류');
        else
         select userid into vui from flightuser where userid=ui;
        end if;
      
  
    exception 
        when no_data_found then
       insert into flightuser values ( ui,kl,kf,lne,fn,pw,bd,gd,ea1,pn,at1,spn);
       insert into yesno values ( yesnoseq.nextval,'동의',to_char(sysdate,'yyyy-mm-dd'),ui,1);
       insert into yesno values ( yesnoseq.nextval,'동의',to_char(sysdate,'yyyy-mm-dd'),ui,2);
       insert into yesno values ( yesnoseq.nextval,decode(instr(ct2,'3'),0,'거부','동의'),to_char(sysdate,'yyyy-mm-dd'),ui,3);
       insert into yesno values ( yesnoseq.nextval,decode(instr(ct2,'4'),0,'거부','동의'),to_char(sysdate,'yyyy-mm-dd'),ui,4);
       insert into yesno values ( yesnoseq.nextval,decode(instr(ct2,'5'),0,'거부','동의'),to_char(sysdate,'yyyy-mm-dd'),ui,5);
        dbms_output.put_line('회원가입에 성공하였습니다.');
end;

--회원 탈퇴 프로시저
create or replace procedure mk_flightuser_02
 (
    UI flightuser.userid%type,
    ppw flightuser.password%type
 )
 is 
     vUI flightuser.userid%type;
    vppw flightuser.password%type;
 begin
    select userid into vui from flightuser where userid=ui;
    select password into vppw from flightuser where userid=vui and ppw= password ;
    delete flightuser
   where userid=ui;
    dbms_output.put_line('회원탈퇴가 성공하였습니다..');
    exception
    when no_data_found then
        dbms_output.put_line('해당하는 회원이 없습니다.');
    when others then
        dbms_output.put_line('회원 삭제에 실패했습니다.');
 end;

 --로그인 프로시저
 --select * from payrefund;
 create or replace procedure mk_flightuser_03
 (
   ui flightuser.userid%type ,
   pw flightuser.password%type
 )
 is
     vui flightuser.userid%type;
    vpw flightuser.password%type;
 begin
        select  password into vpw from flightuser where userid=ui;
        if vpw != pw then
        raise_application_error(-20006,'비밀번호가 일치하지 않습니다.');
        end if;
        
       
        insert into loginhis values(ui,to_char(sysdate, 'yyyy"년" mm"월" dd"일" hh24"시" mi"분" ss"초"'));
         dbms_output.put_line('로그인에 성공하였습니다');
        exception
            when no_data_found then 
            raise_application_error(-20007,'아이디가 존재하지 않습니다.');
             when others then
             raise_application_error(-20015,'이미 로그인 되어있습니다.');
end;




--로그아웃 프로시저 -- 
create or replace procedure mk_loginhis_01
is
begin
    delete loginhis where 1=1;
    dbms_output.put_line('로그아웃 하였습니다');
end;



set serveroutput on;

--예약 가능 일정 조회 프로시저 (국내선)
--create or replace procedure mk_scplane_01
--(
--    dap scplane.dairport%type,
--    aap scplane.aairport%type,
--    dd scplane.ddate%type,
--    anum number,
--    sgrade seat_num.seat_grade%type
--)
--is
--    vexfee number;
-- cursor vreserv is
-- select to_char(s.ddate,'yy/mm/dd hh24:mi') 출발시각, to_char(s.adate,'yy/mm/dd hh24:mi') 도착시각, 
-- to_char(to_number(to_char(s.adate , 'hh24')) -to_number(to_char(s.ddate , 'hh24')) )||'시간' || to_char(to_number(to_char(s.adate , 'mi')) -to_number(to_char(s.ddate , 'mi'))) || '분' 소요시간,
-- substr(dairport,instr(dairport,'.')+1) 출발공항,
-- substr(aairport,instr(aairport,'.')+1) 도착공항,
-- a.FCLA_COUNT -(select count(p.renum) from scplane s,airplane a ,payrefund p,seat_num sn where s.asnum=a.asnum and s.renum=p.renum and sn.asnum=s.asnum and sn.seat_num=p.seatnumber and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap and to_char(s.ddate,'yymmdd')=dd and sn.seat_grade='일등석'
--) 남은일등석수 ,
--a.PreCLA_COUNT -(select count(p.renum)   from scplane s,airplane a ,payrefund p,seat_num sn where s.asnum=a.asnum and s.renum=p.renum and sn.asnum=s.asnum and sn.seat_num=p.seatnumber and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap and to_char(s.ddate,'yymmdd')=dd and sn.seat_grade='프레스티지석'
--) 남은프레스티지석수 , 
--a.NCLA_COUNT -(select count(p.renum)  from scplane s,airplane a ,payrefund p,seat_num sn where s.asnum=a.asnum and s.renum=p.renum and sn.asnum=s.asnum and sn.seat_num=p.seatnumber and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap and to_char(s.ddate,'yymmdd')=dd and sn.seat_grade='일반석'
--) 남은일반석수, 
-- d.fare 정상운임 from scplane s,airplane a , dfare d 
--where s.asnum=a.asnum 
--and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap  and sgrade = d.sg 
--and to_char(s.ddate,'yymmdd')=dd and d.peak = CASE
--        WHEN to_char(s.ddate, 'yymmdd') = to_date('240101','yymmdd') THEN '성수기'
--        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240208','yymmdd') AND to_date('240213','yymmdd') THEN '성수기'
--        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240224','yymmdd') AND to_date('240302','yymmdd') THEN '성수기'
--        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240503','yymmdd') AND to_date('240506','yymmdd') THEN '성수기'
--        WHEN to_char(s.ddate, 'yymmdd') = to_date('240515','yymmdd') THEN '성수기'
--        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240606','yymmdd') AND to_date('240608','yymmdd') THEN '성수기'
--        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240727','yymmdd') AND to_date('240824','yymmdd') THEN '성수기'
--        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240913','yymmdd')AND to_Date('240919','yymmdd') THEN '성수기'
--        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('241003','yymmdd') AND to_Date('241005','yymmdd') THEN '성수기'
--        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241009','yymmdd') THEN '성수기'
--        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241225','yymmdd') THEN '성수기'
--        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241231','yymmdd') THEN '성수기'
--        else '비수기'
--        end
--    and d.discount = '정상' and d.sg=sgrade and substr(d.route,1,instr(d.route,'/')-1)=dap and substr(d.route,instr(d.route,'-')+1,instr(d.route,'/',-1)-instr(d.route,'-')-1)=aap and 
--      d.timezone = case when to_char( s.ddate , 'hh24mi') >= '1500' then '일반' else '선호' end  and d.wknddy  = case to_char(s.ddate , 'dy') when '월' then '주중' when '화' then '주중' when '수' then '주중' when '목' then '주중' else '주말' end;
--   rec vreserv%ROWTYPE;
--
--begin
--     open vreserv;
--       FETCH vreserv INTO rec;
--     if vreserv%notfound then
--        raise no_data_found ;
--        close vreserv;
--        end if;
--          close vreserv;
--        for rec in vreserv loop 
--            dbms_output.put_line('출발시각 :'|| rec.출발시각 || ' 도착시각 : ' ||rec.도착시각 || ' 출발공항 :'|| rec.출발공항 ||' 도착공항 :'||rec.도착공항 || ' 소요시간 : '|| rec.소요시간 ||' 정상 운임 : ' ||rec.정상운임 ||'원'||'할인 운임 : ' || round(rec.정상운임*0.85,-2) ||'원'||' 특가 운임 : ' ||round(rec.정상운임*0.55,-2)||'원' );
--      
--       
--           
--        
--    
--              end loop;
--            
--        
--        exception 
--            when no_data_found then
--            dbms_output.put_line('해당하는 예약 가능한 일정이 없습니다.');
--            when others then
--            dbms_output.put_line('입력 오류입니다.');
--end;
--------------------------------------------------------------------------------
--- 예약 조회 
--- 예약 조회 
create or replace procedure mk_scplane_02
(
  
    dap scplane.dairport%type,
    aap scplane.aairport%type,
    dd scplane.ddate%type,
    anum number,
    sgrade seat_num.seat_grade%type
  
    )
is 
    cursor vreserv is
 select to_char(s.ddate,'yy/mm/dd hh24:mi') 출발시각, to_char(s.adate,'yy/mm/dd hh24:mi') 도착시각, 
 to_char( (to_number(to_char(s.adate , 'DD')) -to_number(to_char(s.ddate , 'DD')))*24 + to_number(to_char(s.adate , 'hh24'))-to_number(to_char(s.ddate , 'hh24'))) + case when sign(to_number(to_char(s.adate , 'mi')) -to_number(to_char(s.ddate , 'mi'))) <0 then (-1) else 0 end ||'시간' || to_char(ABS(to_number(to_char(s.adate , 'mi')) -to_number(to_char(s.ddate , 'mi')))) || '분' 소요시간,
 substr(dairport,instr(dairport,'.')+1) 출발공항,
 substr(aairport,instr(aairport,'.')+1) 도착공항,
 a.FCLA_COUNT -(select count(p.renum) from scplane s,airplane a ,payrefund p,seat_num sn where s.asnum=a.asnum and s.renum=p.renum and sn.asnum=s.asnum and sn.seat_num=p.seatnumber and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap and to_char(s.ddate,'yymmdd')=dd and sn.seat_grade='일등석'
) 남은일등석수 ,
a.PreCLA_COUNT -(select count(p.renum)   from scplane s,airplane a ,payrefund p,seat_num sn where s.asnum=a.asnum and s.renum=p.renum and sn.asnum=s.asnum and sn.seat_num=p.seatnumber and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap and to_char(s.ddate,'yymmdd')=dd and sn.seat_grade='프레스티지석'
) 남은프레스티지석수 , 
a.NCLA_COUNT -(select count(p.renum)  from scplane s,airplane a ,payrefund p,seat_num sn where s.asnum=a.asnum and s.renum=p.renum and sn.asnum=s.asnum and sn.seat_num=p.seatnumber and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap and to_char(s.ddate,'yymmdd')=dd and sn.seat_grade='일반석'
) 남은일반석수, 
 d.fare 정상운임 from scplane s,airplane a , dfare d 
where s.asnum=a.asnum 

and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap  and sgrade = d.sg 
and to_char(s.ddate,'yymmdd')=dd and d.peak = CASE
        WHEN to_char(s.ddate, 'yymmdd') = to_date('240101','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240208','yymmdd') AND to_date('240213','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240224','yymmdd') AND to_date('240302','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240503','yymmdd') AND to_date('240506','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') = to_date('240515','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240606','yymmdd') AND to_date('240608','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240727','yymmdd') AND to_date('240824','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240913','yymmdd')AND to_Date('240919','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('241003','yymmdd') AND to_Date('241005','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241009','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241225','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241231','yymmdd') THEN '성수기'
        else '비수기'
        end
    and d.discount = '정상'  and 
      d.timezone = case when to_char( s.ddate , 'hh24mi') >= '1500' then '일반' else '선호' end  and d.wknddy  = case to_char(s.ddate , 'dy') when '월' then '주중' when '화' then '주중' when '수' then '주중' when '목' then '주중' else '주말' end;
      
      cursor vreserv2 is
      select to_char(s.ddate,'yy/mm/dd hh24:mi') 출발시각, to_char(s.adate,'yy/mm/dd hh24:mi') 도착시각, 
 to_char( (to_number(to_char(s.adate , 'DD')) -to_number(to_char(s.ddate , 'DD')))*24 + to_number(to_char(s.adate , 'hh24'))-to_number(to_char(s.ddate , 'hh24'))) + case when sign(to_number(to_char(s.adate , 'mi')) -to_number(to_char(s.ddate , 'mi'))) <0 then (-1) else 0 end ||'시간' ||ABS( to_char(to_number(to_char(s.adate , 'mi')) -to_number(to_char(s.ddate , 'mi')))) || '분' 소요시간,
 substr(dairport,instr(dairport,'.')+1) 출발공항,
 substr(aairport,instr(aairport,'.')+1) 도착공항,
 a.FCLA_COUNT -(select count(p.renum) from scplane s,airplane a ,payrefund p,seat_num sn where s.asnum=a.asnum and s.renum=p.renum and sn.asnum=s.asnum and sn.seat_num=p.seatnumber and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap and to_char(s.ddate,'yymmdd')=dd and sn.seat_grade='일등석'
) 남은일등석수 ,
a.PreCLA_COUNT -(select count(p.renum)   from scplane s,airplane a ,payrefund p,seat_num sn where s.asnum=a.asnum and s.renum=p.renum and sn.asnum=s.asnum and sn.seat_num=p.seatnumber and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap and to_char(s.ddate,'yymmdd')=dd and sn.seat_grade='프레스티지석'
) 남은프레스티지석수 , 
a.NCLA_COUNT -(select count(p.renum)  from scplane s,airplane a ,payrefund p,seat_num sn where s.asnum=a.asnum and s.renum=p.renum and sn.asnum=s.asnum and sn.seat_num=p.seatnumber and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap and to_char(s.ddate,'yymmdd')=dd and sn.seat_grade='일반석'
) 남은일반석수,i.fare 정상운임 from scplane s,airplane a , ifare i 
where s.asnum=a.asnum and substr(s.dairport,1,instr(s.dairport,'.')-1)=dap and substr(s.aairport,1,instr(s.aairport,'.')-1)=aap   and sgrade = i.sg and to_char(s.ddate,'yymmdd')=dd AND I.ARRIVE = substr(s.aairport,instr(s.aairport,'.')+1);
     rec vreserv%ROWTYPE;
     rec2 vreserv2%ROWTYPE;
    EF NUMBER ;
    EF2 VARCHAR2(100) ;
begin

    if aap in ( 'SEOUL','JEJU','INCHEON') THEN 
         open vreserv;
       FETCH vreserv INTO rec;
     if vreserv%notfound then
        raise no_data_found ;
        close vreserv;
        end if;
          close vreserv;
        for rec in vreserv loop 
            
           
            dbms_output.put_line('출발시각 :'|| rec.출발시각 || ' 도착시각 : ' ||rec.도착시각 || ' 출발공항 :'|| rec.출발공항 ||' 도착공항 :'||rec.도착공항 || ' 소요시간 : '|| rec.소요시간 ||' 정상 운임 : ' ||rec.정상운임 ||'원'||'할인 운임 : ' || round(rec.정상운임*0.85,-2) ||'원'||' 특가 운임 : ' ||round(rec.정상운임*0.55,-2)||'원' );
        
         end loop;
                dbms_output.put_line('                     무료수화물 갯수는 1개 입니다. 
                추가 수화물은 공항체크인시 초과무게 1KG 당 2000원의 추가요금이 발생합니다!');
       
         else
         open vreserv2;
       FETCH vreserv2 INTO rec2;
       if vreserv2%notfound then
        raise no_data_found ;
        close vreserv2;
        end if;
          close vreserv2;
        for rec2 in vreserv2 loop 
            
            
            dbms_output.put_line('출발시각 :'|| rec2.출발시각 || ' 도착시각 : ' ||rec2.도착시각 || ' 출발공항 :'|| rec2.출발공항 ||' 도착공항 :'||rec2.도착공항 || ' 소요시간 : '|| rec2.소요시간 ||' 정상 운임 : ' ||rec2.정상운임 ||'원'||'할인 운임 : ' || round(rec2.정상운임*0.85,-2) ||'원'||' 특가 운임 : ' ||round(rec2.정상운임*0.55,-2)||'원' );
            
        end loop;
            for rec in (select NUMBEROFLUGGAGE , EXCESS_fEE  from l_rule where seat_grade = sgrade and route_section = case when aap in ('BEIJING','FUK') then '국제선 동북아시아' else '국제선 미주' end)  loop
            ef := rec.numberofluggage ;
            ef2 := rec.excess_fee ;
            dbms_output.put_line( '                    수화물 갯수 : ' || ef ||'개 당' || '추가금액 : '|| ef2 || '원');
                
        end loop;
        end if ;
         
        exception 
            when no_data_found then
            dbms_output.put_line('해당하는 예약 가능한 일정이 없습니다.');
            when others then
            dbms_output.put_line('입력 오류입니다.');
    
end;
















--------------------------------------------------------------------------------

--
--예약 (결제 ) 기능 

create or replace procedure mk_payrefund_01
(
    pddate varchar2,
    pdairport scplane.dairport%type,
    paairport scplane.aairport%type,
    pseatnum payrefund.seatnumber%type default null,
    pnum number,
    pflight payrefund.flight%type,
    ppmethod payrefund.pmethod%type,
    pnluggage payrefund.nluggage%type,
    PCARDNUM PAYrefund.giftcardnumber%type default null,
    PPIN_NUMBER giftcard.pin_num%TYPE default null
)
is
    vrenum scplane.renum%type;
    vcost payrefund.cost%type;
    vpnum payrefund.seatnumber%type;
    vpnum2 payrefund.seatnumber%type;
    occupfiederror exception; 
    nocard exception; 
    nocardamount exception; 
    nomile exception; 
    vamount number;
    cardnumc payrefund.giftcardnumber%type;
    vmile number;
    vuserid varchar2(100);
    vpaynum number;
begin
     select nvl(max(serialnumber),0)+1 into vpaynum from payrefund;
     select userid into vuserid from loginhis ;
     select  count(seatnumber)  into vpnum from payrefund p ,scplane s where p.renum = (select renum from scplane s where to_char(s.ddate ,'YYMMDDhh24mi') =pddate) and pseatnum=p.seatnumber and p.payrefund = '결제' ;
        select count(seatnumber)  into vpnum2 from payrefund p ,scplane s where p.renum = (select renum from scplane s where to_char(s.ddate ,'YYMMDDhh24mi') =pddate) and pseatnum=p.seatnumber and p.payrefund = '환불';
       if  vpnum-vpnum2 !=0 then
         raise occupfiederror;
         end if;
        
     select renum  into vrenum from scplane s where to_char(s.ddate ,'YYMMDDhh24mi') =pddate
    and substr(s.dairport,instr(s.dairport,'.')+1) = pdairport and  substr(s.aairport,instr(s.aairport,'.')+1) = paairport ;
   if  paairport in ('CJU','ICN','GMP') then 
   select d.fare 정상운임 into vcost from scplane s,dfare d ,seat_num sn
where s.renum=vrenum and d.peak = CASE 
        WHEN to_char(s.ddate, 'yymmdd') = to_date('240101','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240208','yymmdd') AND to_date('240213','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240224','yymmdd') AND to_date('240302','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_date('240503','yymmdd') AND to_date('240506','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') = to_date('240515','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240606','yymmdd') AND to_date('240608','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240727','yymmdd') AND to_date('240824','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('240913','yymmdd')AND to_Date('240919','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') BETWEEN to_Date('241003','yymmdd') AND to_Date('241005','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241009','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241225','yymmdd') THEN '성수기'
        WHEN to_char(s.ddate, 'yymmdd') = to_Date('241231','yymmdd') THEN '성수기'
        else '비수기'
        end
    and d.sg= sn.seat_grade and s.asnum=sn.asnum and sn.seat_num = pseatnum and
    d.discount = '정상' and substr(d.route,instr(d.route,'/')+1,instr(d.route,'-')-instr(d.route,'/')-1)=pdairport and substr(d.route,instr(d.route,'/',-1)+1)=paairport and 
      d.timezone = case when to_char( s.ddate , 'hh24mi') >= '1500' then '일반' else '선호' end  and d.wknddy  = case to_char(s.ddate , 'dy') when '월' then '주중' when '화' then '주중' when '수' then '주중' when '목' then '주중' else '주말' end;
     ELSE
       SELECT  i.fare 정상운임 INTO VCOST from scplane s , ifare i ,SEAT_NUM SN
       where s.asnum=sn.asnum and substr(s.dairport,instr(s.dairport,'.')+1)=PDAIRPORT and substr(s.aairport,instr(s.aairport,'.')+1)=PAAIRPORT   and  i.sg =SN.SEAT_GRADE  AND SN.SEAT_NUM = PSEATNUM  and to_char(s.ddate,'yymmddHH24MI')=pddate AND I.ARRIVE = substr(s.aairport,instr(s.aairport,'.')+1);
     END IF;
     
      if ppmethod = '기프트카드' then

        select count(card_num) into cardnumc from giftcard g where g.card_num = pcardnum and g.pin_num=PPIN_NUMBER ;
         if  cardnumc !=1  then
         raise  nocard ;
         else  select amount into vamount from giftcard where card_num = pcardnum; 
         end if;
         end if;
      
        if vamount <vcost then 
        raise nocardamount ;
        end if;
  
      
        vcost := (case when pflight = '할인' then vcost*0.85 when pflight = '특가' then vcost *0.55 else vcost end);
          if ppmethod = '마일리지' then
            select totalmile into vmile from userdetail where userid = vuserid;
            if vmile<vcost then 
                raise nomile;
                end if;
                end if;
       
      insert into payrefund  values
      (vpaynum, '결제', ppmethod , pflight, pseatnum ,sysdate , pnluggage ,round(vcost,-2), round(vcost*0.005,-1) ,vuserid, vrenum, pcardnum ,PPIN_NUMBER);
       dbms_output.put_line('예약이 완료되었습니다.');
     
     exception
        when no_data_found then
        dbms_output.put_line('결제에 실패하였습니다.');
        when occupfiederror then
         dbms_output.put_line('해당 좌석은 이미 예약되어있습니다.');
          when nocard then
         dbms_output.put_line('입력하신 기프트카드가 없습니다.');
         when nocardamount then
          dbms_output.put_line('기프트카드 잔액이 부족합니다.');
          when nomile then
          dbms_output.put_line('마일리지 잔액이 부족합니다.');
          
end;
--------------------------------------------------------
select * from seat_num;
select * from scplane;
    

---------------------------로그인한 유저의 예약 내역 조회--------------
create or replace procedure mk_payrefund_04

is
    vuserid flightuser.userid%type;
    cursor cpayrefund is 
    select p.serialnumber, p.pmethod,p.flight,s.dairport ,s.aairport , p.drdate , p.cost from payrefund p , scplane s where p.userid = (select userid from loginhis) and s.renum =p.renum order by serialnumber;
    rec cpayrefund%rowtype;
    vnumber number :=0;
    
begin
   
        select userid into vuserid from loginhis;
         dbms_output.put_line( vuserid ||'회원님의 예약 내역입니다');
       for rec in cpayrefund loop
           vnumber := vnumber +1;
            dbms_output.put_line( rec.serialnumber || '번 예약 ' ||' 결제수단 : ' || rec.pmethod ||' 정상,할인,특가여부 : ' || rec.flight || ' 출발공항 :' || rec.dairport ||' 도착공항 : ' || rec.aairport ||' 결제일자 :' || to_char(rec.drdate , 'yyyy"년" mm"월" dd"일" hh24"시" mi"분" ss"초" ' ) || ' 결제금액 :' || rec.cost||'원' );
         
       end loop;
end;


----------------------------예약(환불) ---------------------
create or replace procedure mk_payrefund_03
(
    pnumber number
)
is
  cursor vrefund is 
    select * from payrefund where serialnumber = pnumber and userid = (select userid from loginhis)   ;
    v_row vrefund%ROWTYPE;
  v_number number;
  vcheck number;
    vdup exception;
BEGIN
   
    select count(renum) into vcheck from refund r where r.userid= (select userid from loginhis) and r.renum =  (select renum from payrefund where userid = (select userid from loginhis) and serialnumber= pnumber  ) and not exists (select 1 from payrefund p where r.renum=p.renum) ;
    if vcheck !=0 then
        raise vdup;

    end if;
    select nvl(max(snum),0)+1 into v_number from refund;
    OPEN vrefund;
    FETCH vrefund INTO v_row;
    insert into refund values ( v_number, v_row.pmethod,v_row.flight,v_row.seatnumber,to_char(sysdate,'yyyy"년" mm"월" dd"일" hh24"시" mi"분" ss"초"'),v_row.nluggage , v_row.cost,v_row.mileage,v_row.userid,v_row.renum,v_row.giftcardnumber,v_row.pin_num);
    dbms_output.put_line('환불이 완료되었습니다');
    CLOSE vrefund;
    delete payrefund 
    where userid=(select userid from loginhis) and serialnumber = pnumber;
    exception
        when vdup then
        dbms_output.put_line('이미 환불되었습니다');
        when others then
        dbms_output.put_line('환불에 실패하였습니다.');
    
end;

select * from refund;
select * from payrefund;




----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------맑음 --------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

---------------------------------------시은 프로시저 ---------------------------------
---------------------------------------시은 프로시저 ---------------------------------
---------------------------------------시은 프로시저 ---------------------------------
---------------------------------------시은 프로시저 ---------------------------------
---------------------------------------시은 프로시저 ---------------------------------
---------------------------------------시은 프로시저 ---------------------------------

--<<<<< 사전체크인 , 탑승권 발급>>>>>
CREATE OR REPLACE PROCEDURE se_payrefund_01
(
 pserialnum payrefund.serialnumber%TYPE,
 pddate scplane.ddate%TYPE,
 plastname flightuser.lastname%TYPE,
 pfirstname flightuser.firstname%TYPE
)
IS
 EXISTS_NUM VARCHAR2(10);
 vserialnum payrefund.serialnumber%TYPE;
 vdairport scplane.dairport%TYPE;
 vaairport scplane.aairport%TYPE;
 vddate scplane.ddate%TYPE;
 vseatnumber payrefund.seatnumber%TYPE;
 vlastname flightuser.lastname%TYPE;
 vfirstname flightuser.firstname%TYPE;
 vgate scplane.gate%TYPE;
 vterminal scplane.terminal%TYPE;
 vuserid flightuser.userid%TYPE;
 vnum bpass.key%TYPE;
 vname VARCHAR2(200);
 vnumber scplane.asnum%TYPE;
BEGIN
 SELECT serialnumber, s.dairport, s.aairport, s.ddate, p.seatnumber, f.lastname, f.firstname, s.gate, terminal, f.userid, s.asnum
  INTO vserialnum, vdairport, vaairport, vddate, vseatnumber, vlastname, vfirstname, vgate, vterminal, vuserid, vnumber
 FROM flightuser f JOIN payrefund p ON f.userid = p.userid
                   JOIN scplane s ON p.renum = s.renum 
 WHERE serialnumber = pserialnum AND s.ddate = pddate AND
      f.lastname = plastname AND f.firstname = pfirstname;
 
 vnum := 'b'||vserialnum;
 vname:= vlastname||vfirstname;
 
 SELECT CASE WHEN EXISTS 
  (SELECT serialnumber FROM flightuser f JOIN payrefund p ON f.userid = p.userid
                                         JOIN scplane s ON p.renum = s.renum WHERE serialnumber = pserialnum AND s.ddate = pddate AND
                                                                                   f.lastname = plastname AND f.firstname = pfirstname)  THEN '1' ELSE '0' END 
 INTO EXISTS_NUM
 FROM DUAL;
 IF  EXISTS_NUM = '1'  THEN
  INSERT INTO bpass VALUES (vnum, vdairport, vaairport, vddate, vseatnumber, vname, vgate, vterminal, vuserid);  
--  COMMIT;
  DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------');
  DBMS_OUTPUT.PUT_LINE(' ');
  DBMS_OUTPUT.PUT_LINE('KOREAN AIR'||'        '|| '탑승권'|| '            '|| 'BOARDING PASS');
  DBMS_OUTPUT.PUT_LINE(' ');
  DBMS_OUTPUT.PUT_LINE('NAME   '||vname || '                  ' ||'NAME   '||vname  );
  DBMS_OUTPUT.PUT_LINE('                                    ' ||'FROM   '||vdairport );
  DBMS_OUTPUT.PUT_LINE('FLIGHT '||vnumber || '  ' ||TO_CHAR(vddate,'MM-DD')||' TO  ' ||vaairport||'        '|| 'TO     ' ||vaairport );
  DBMS_OUTPUT.PUT_LINE('                                    '||'DATE   '||TO_CHAR(vddate,'MM-DD'));
  DBMS_OUTPUT.PUT_LINE('DEP TIME   '||TO_CHAR(vddate,'HH24:MI'));
  DBMS_OUTPUT.PUT_LINE('BOARDING   '||TO_CHAR(vddate-30/(24*60),'HH24:MI')||'   '||'GATE  '||vgate||'         ' || 'SEAT  '||vseatnumber||' FLIGHT  '||vnumber );
  DBMS_OUTPUT.PUT_LINE(' ');
  DBMS_OUTPUT.PUT_LINE('   항공기 출발 10분전에 탑승이 마감됩니다.');
  DBMS_OUTPUT.PUT_LINE(' ');
  DBMS_OUTPUT.PUT_LINE('------------------------------------------------------------');
  
  DBMS_OUTPUT.PUT_LINE(' ');
  DBMS_OUTPUT.PUT_LINE('탑승권 발급되었습니다!');
 ELSE
  RAISE_APPLICATION_ERROR( -20008 , '예약/결제 정보가 없습니다. 다시 확인해 주세요.');
 END IF;
EXCEPTION
WHEN NO_DATA_FOUND THEN
    RAISE_APPLICATION_ERROR(-20001,'예약/결제 정보가 없습니다. 다시 확인해 주세요.');
END;



-- <<<<< 수화물 규정 검색 >>>>>
CREATE OR REPLACE PROCEDURE se_lrule_01
(
 psection l_rule.route_section%TYPE
)
IS
 CURSOR vcursor IS
 SELECT seat_grade, MAX(numberofluggage)AS vnum
 FROM l_rule
 WHERE route_section = psection AND excess_fee = 0
 GROUP BY seat_grade;
BEGIN
 DBMS_OUTPUT.PUT_LINE('-------------------------------------');
 DBMS_OUTPUT.PUT_LINE(' ♧좌석등급♧      ♧무료 수하물 허용량♧');
 DBMS_OUTPUT.PUT_LINE('-------------------------------------');
 FOR vrow IN vcursor
 LOOP
 DBMS_OUTPUT.PUT(' '||vrow.seat_grade);
 DBMS_OUTPUT.PUT_LINE('               ' || vrow.vnum);
 END LOOP;
 DBMS_OUTPUT.PUT_LINE('-------------------------------------');
END;


-- <<<<< 수화물 수정, 추가 >>>>>
--SELECT *
--FROM l_rule;
--ROLLBACK;

CREATE OR REPLACE PROCEDURE se_lrule_02
(
 psection l_rule.route_section%TYPE,
 pgrade l_rule.seat_grade%TYPE,
 pnum l_rule.numberofluggage%TYPE,
 pfee l_rule.excess_fee%TYPE
)
IS
 vfee l_rule.excess_fee%TYPE;
 vsection l_rule.route_section%TYPE;
 vgrade l_rule.seat_grade%TYPE;
 vnum l_rule.numberofluggage%TYPE;
BEGIN
 SELECT excess_fee ,route_section, seat_grade, numberofluggage 
  INTO vfee, vsection, vgrade, vnum
 FROM l_rule
 WHERE route_section = psection ANd seat_grade = pgrade ANd numberofluggage = pnum;
 
 UPDATE l_rule
 SET excess_fee = pfee
 WHERE route_section = psection ANd seat_grade = pgrade ANd numberofluggage = pnum;
 COMMIT;
 
 DBMS_OUTPUT.PUT_LINE('수화물 요금 규정이 수정되었습니다!');
 DBMS_OUTPUT.PUT_LINE(' ');
 DBMS_OUTPUT.PUT_LINE(vsection || '  ' || vgrade || ' '|| '수화물 ' ||vnum||'개의 요금이');
 DBMS_OUTPUT.PUT_LINE(vfee || ' -> '|| pfee ||' 로 변경되었습니다!');
END;



CREATE OR REPLACE PROCEDURE se_lrule_03
(
 pnum l_rule.lugregular_num%TYPE,
 pgrade l_rule.seat_grade%TYPE,
 plugnum l_rule.numberofluggage%TYPE,
 pfee l_rule.excess_fee%TYPE,
 psection l_rule.route_section%TYPE
)
IS
BEGIN
 INSERT INTO l_rule VALUES (pnum, pgrade, plugnum, pfee, psection);
 COMMIT;
 DBMS_OUTPUT.PUT_LINE('새로운 수화물 규정이 추가되었습니다!');
 DBMS_OUTPUT.PUT_LINE(' ');
 DBMS_OUTPUT.PUT_LINE(psection || ' ' || pgrade || ' '|| '수화물 ' ||plugnum||'개의 요금은 '|| pfee||'입니다');
END;


--DELETE FROM l_rule WHERE numberofluggage = 5;


--<<<<< 라운지 조회 쿼리>>>>>
CREATE OR REPLACE PROCEDURE se_loungeinfo_01
(
 pcountry lounge_info.country%TYPE,
 pdestination_airport lounge_info.destination_airport%TYPE
)
IS
 vloungename lounge_info.lounge_name%TYPE;
 vlocation lounge_info.location%TYPE;
 voperatingtime lounge_info.operating_time%TYPE;
 voperator lounge_info.operator%TYPE;
 ventrypassenger lounge_info.entry_passenger%TYPE;
 vservice lounge_info.service%TYPE;
BEGIN
 SELECT lounge_name, location, operating_time, operator, entry_passenger, service
  INTO vloungename, vlocation, voperatingtime, voperator, ventrypassenger, vservice
 FROM lounge_info
 WHERE country = pcountry AND destination_airport = pdestination_airport;
 
 DBMS_OUTPUT.PUT_LINE(vloungename);
 DBMS_OUTPUT.PUT_LINE('위치 : ' || vlocation);
 DBMS_OUTPUT.PUT_LINE('요일별 운영시간 : ' || voperatingtime);
 DBMS_OUTPUT.PUT_LINE('운영사 : ' || voperator);
 DBMS_OUTPUT.PUT_LINE('입장 가능 승객 : ' || ventrypassenger);
 DBMS_OUTPUT.PUT_LINE('서비스 : ' || vservice);
END;





-- <<<<< 지역별 서비스 조회쿼리 >>>>>
CREATE OR REPLACE PROCEDURE se_cservice_01
(
 parea cservice.area%TYPE
)
IS
BEGIN
 FOR vrow IN ( SELECT * 
 FROM cservice
 WHERE area = parea)
 LOOP
 IF vrow.cs_call2 IS NULL THEN
 DBMS_OUTPUT.PUT_LINE(vrow.country_name||'('||vrow.cs_num||')');
 DBMS_OUTPUT.PUT_LINE('전화번호 : ' || vrow.cs_call1);
 DBMS_OUTPUT.PUT_LINE('언어/시간 : ' || vrow.lang_time);
 DBMS_OUTPUT.PUT_LINE(' ');
 ELSE
 DBMS_OUTPUT.PUT_LINE(vrow.country_name||'('||vrow.cs_num||')');
 DBMS_OUTPUT.PUT_LINE('전화번호 : ' || vrow.cs_call1 || ',' || vrow.cs_call2);
 DBMS_OUTPUT.PUT_LINE('언어/시간 : ' || vrow.lang_time);
 DBMS_OUTPUT.PUT_LINE(' ');
 END IF;
 END LOOP;
END;




-- <<<<< 지역별 서비스 글 생성 >>>>>
CREATE OR REPLACE PROCEDURE se_cservice_02
(
 vnum cservice.cs_num%TYPE, 
 varea cservice.area%TYPE,
 vcountry cservice.country_name%TYPE,
 vcall1 cservice.cs_call1%TYPE,
 vcall2 cservice.cs_call2%TYPE:=NULL,
 vlangtime VARCHAR2,
 vadminid cservice.adminid%TYPE
)
IS
BEGIN
 IF  vcall2 IS NULL THEN
 INSERT INTO cservice (cs_num, area, country_name, cs_call1,lang_time, adminid)
 VALUES (vnum, varea, vcountry, vcall1, vlangtime, vadminid);
 DBMS_OUTPUT.PUT_LINE('새로운 정보가 등록 되었습니다!');
 DBMS_OUTPUT.PUT_LINE(' ');
 DBMS_OUTPUT.PUT_LINE(' ');
 DBMS_OUTPUT.PUT_LINE(vcountry||'('||vnum||')');
 DBMS_OUTPUT.PUT_LINE('전화번호 : ' || vcall1);
 DBMS_OUTPUT.PUT_LINE('언어/시간 : ' || vlangtime);
 ELSE
 INSERT INTO cservice (cs_num, area, country_name, cs_call1, cs_call2, lang_time, adminid)
 VALUES (vnum, varea, vcountry, vcall1, vcall2, vlangtime, vadminid);
 DBMS_OUTPUT.PUT_LINE('새로운 정보가 등록 되었습니다!');
 DBMS_OUTPUT.PUT_LINE(' ');
 DBMS_OUTPUT.PUT_LINE(' ');
 DBMS_OUTPUT.PUT_LINE(vcountry||'('||vnum||')');
 DBMS_OUTPUT.PUT_LINE('전화번호 : ' || vcall1 || ',' || vcall2);
 DBMS_OUTPUT.PUT_LINE('언어/시간 : ' || vlangtime);
 END IF;
 COMMIT;
END;

--SELECT *
--FROM cservice;
--
--DELETE FROM cservice WHERE cs_num = '886';



-- <<<<< 지역별 서비스 글 수정 >>>>>
-- 1) 자기가 쓴 글을 조회
CREATE OR REPLACE PROCEDURE se_cservice_03
(
 padminid cservice.adminid%TYPE
)
IS
BEGIN
 FOR vrow IN ( SELECT * 
 FROM cservice
 WHERE adminid = padminid)
 LOOP
 IF vrow.cs_call2 IS NULL THEN
 DBMS_OUTPUT.PUT_LINE(vrow.country_name||'('||vrow.cs_num||')');
 DBMS_OUTPUT.PUT_LINE('전화번호 : ' || vrow.cs_call1);
 DBMS_OUTPUT.PUT_LINE('언어/시간 : ' || vrow.lang_time);
 DBMS_OUTPUT.PUT_LINE(' ');
 ELSE
 DBMS_OUTPUT.PUT_LINE(vrow.country_name||'('||vrow.cs_num||')');
 DBMS_OUTPUT.PUT_LINE('전화번호 : ' || vrow.cs_call1 || ',' || vrow.cs_call2);
 DBMS_OUTPUT.PUT_LINE('언어/시간 : ' || vrow.lang_time);
 DBMS_OUTPUT.PUT_LINE(' ');
 END IF;
 END LOOP;
END;



-- 2) 원하는 글을 선택한 후
-- 3) 글 내용 수정
CREATE OR REPLACE PROCEDURE se_cservice_04
(
 pnum cservice.cs_num%TYPE ,
 pcall1 cservice.cs_call1%TYPE := NULL,
 pcall2 cservice.cs_call2%TYPE := NULL, 
 plangtime cservice.lang_time%TYPE := NULL
)
IS
BEGIN
 UPDATE cservice
 SET cs_call1 = NVL(pcall1,cs_call1),
     cs_call2 = NVL(pcall2,cs_call2),
     lang_time = NVL(plangtime, lang_time)
 WHERE cs_num = pnum;
 DBMS_OUTPUT.PUT_LINE('수정 완료되었습니다!');
 COMMIT;
END;



-- <<<<< 지역별 서비스 글 삭제 >>>>>
CREATE OR REPLACE PROCEDURE SE_CSERVICE_05
(
 pnum cservice.cs_num%TYPE
)
IS
BEGIN
 DELETE FROM cservice WHERE cs_num = pnum;
 DBMS_OUTPUT.PUT_LINE('삭제 완료되었습니다!');
 COMMIT;
END;

----------------------------------동찬 ---------------------------------------
----------------------------------동찬 ---------------------------------------
----------------------------------동찬 ---------------------------------------
--- 고객의 말씀 조회 -----------
CREATE OR REPLACE PROCEDURE dc_customerc_01
(
    pQ_num NUMBER
)
IS
    vE_check VARCHAR2(20);
    v_count NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO v_count
    FROM customerc
    WHERE Q_num = pQ_NUM;

    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당 번호가 존재하지 않습니다.');
        ELSE
            FOR vrow IN (SELECT *   
                        FROM customerc
                        WHERE Q_num = pQ_NUM)
            LOOP
                IF  vrow.e_check =1 THEN 
                      vE_check  :='허가';
                ELSE 
                    vE_check :='거부';
                END IF;
            
                DBMS_OUTPUT.PUT_LINE('Q_num: ' || vrow.Q_num);
                DBMS_OUTPUT.PUT_LINE('Type: ' || vrow.type);
                DBMS_OUTPUT.PUT_LINE('Field: ' || vrow.Field);
                DBMS_OUTPUT.PUT_LINE('First Name: ' || vrow.F_NAME);
                DBMS_OUTPUT.PUT_LINE('Last Name: ' || vrow.L_NAME);
                DBMS_OUTPUT.PUT_LINE('Phone Number: ' || vrow.P_NUM);
                DBMS_OUTPUT.PUT_LINE('Email: ' || vrow.Email);
                DBMS_OUTPUT.PUT_LINE('Title: ' || vrow.title);
                DBMS_OUTPUT.PUT_LINE('Content: ' || vrow.content);
                DBMS_OUTPUT.PUT_LINE('SP Number: ' || vrow.SP_NUM);
                DBMS_OUTPUT.PUT_LINE('Renumber: ' || vrow.renum);
                DBMS_OUTPUT.PUT_LINE('E Check: ' ||vE_check );
                DBMS_OUTPUT.PUT_LINE('City Arr: ' || vrow.city_arr);
                DBMS_OUTPUT.PUT_LINE('Start City: ' || vrow.start_city);
                DBMS_OUTPUT.PUT_LINE('Arrival Date: ' || TO_CHAR(vrow.arr_date, 'YYYY-MM-DD'));
                DBMS_OUTPUT.PUT_LINE('Flights: ' || vrow.Flights);
            END LOOP;
        END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
         DBMS_OUTPUT.PUT_LINE('해당 번호가 존재하지 않습니다.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다: ' );
END;

-- 고객의 말씀 입력

CREATE OR REPLACE PROCEDURE dc_customerc_02
(
        ptype VARCHAR2,    pField VARCHAR2,
    pF_NAME VARCHAR2,    pL_NAME VARCHAR2,    pP_NUM VARCHAR2,
    pEmail VARCHAR2,    ptitle VARCHAR2,    pcontent varchar2,
    pSP_NUM VARCHAR2,    prenum VARCHAR2,    pe_check NUMBER,
    pcity_arr VARCHAR2,    pstart_city VARCHAR2,    parr_date DATE ,
    pFlights VARCHAR2
)
IS
    vnum number ;
BEGIN
     vnum := customercseq.NEXTVAL ;

    INSERT INTO customerc
    VALUES(  vnum  ,
    ptype ,pField ,pF_NAME ,pL_NAME ,pP_NUM ,pEmail ,ptitle ,pcontent ,pSP_NUM ,prenum ,
    pe_check ,pcity_arr ,pstart_city ,parr_date  ,pFlights  );

--EXCEPTION
END;


--고객의말씀 생성 -입력


-- 고객의 말씀 수정

CREATE OR REPLACE PROCEDURE dc_customerc_03
(
     pQ_num NUMBER ,    ptype VARCHAR2,    pField VARCHAR2,
    pF_NAME VARCHAR2,    pL_NAME VARCHAR2,    pP_NUM VARCHAR2,
    pEmail VARCHAR2,    ptitle VARCHAR2,    pcontent varchar2,
    pSP_NUM VARCHAR2,    prenum VARCHAR2,    pe_check NUMBER,
    pcity_arr VARCHAR2,    pstart_city VARCHAR2,    parr_date DATE ,
    pFlights VARCHAR2
)
IS
    v_count NUMBER;
BEGIN

    SELECT COUNT(*)
    INTO v_count
    FROM customerc
    WHERE Q_NUM = pQ_num;
    IF v_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('해당하는 레코드를 찾을 수 없습니다.');
        ELSE
            UPDATE customerc
            SET  
            type= ptype ,Field = pField ,F_NAME = pF_NAME ,L_NAME = pL_NAME ,P_NUM =pP_NUM 
            ,Email= pEmail ,title = ptitle ,content = pcontent ,SP_NUM = pSP_NUM ,renum = prenum ,
            e_check = pe_check ,city_arr = pcity_arr ,start_city = pstart_city 
            ,arr_date = parr_date  ,Flights = pFlights
            WHERE Q_NUM = pQ_NUM;
    END IF;
--EXCEPTION
END;







-- 삭제 프로시저
CREATE OR REPLACE PROCEDURE dc_customerc_04
(
    pq_num NUMBER
)
IS
    v_count NUMBER;
BEGIN
    
    SELECT COUNT(*)
    INTO v_count
    FROM customerc
    WHERE Q_NUM = pq_num;

   
    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, '해당 번호가 존재하지 않습니다..');
    ELSE
       
        DELETE FROM customerc
        WHERE Q_NUM = pq_num;
        
        DBMS_OUTPUT.PUT_LINE('레코드가 삭제되었습니다.');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다 ' );
END;



--기내식 조회 쿼리 
CREATE OR REPLACE PROCEDURE dc_flight_meal_01
(
    pmeal_code NUMBER
)
IS
    v_count NUMBER;
BEGIN
  
    SELECT COUNT(*)
    INTO v_count
    FROM flight_meal
    WHERE meal_code = pmeal_code;

   
    IF v_count = 0 THEN
         DBMS_OUTPUT.PUT_LINE('해당 번호가 존재하지 않습니다.');
    ELSE
       
        FOR vrow IN (SELECT *
                     FROM flight_meal
                     WHERE meal_code = pmeal_code)
        LOOP
            DBMS_OUTPUT.PUT_LINE('meal_code: ' || vrow.meal_code);
            DBMS_OUTPUT.PUT_LINE('menu: ' || vrow.menu);
            DBMS_OUTPUT.PUT_LINE('MENU_PDF: vrow.menu_pdf' );
        END LOOP;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다 ' );
END;

---------기내식 blob 입력 
---------기내식 blob 입력 

--기내식 blob 입력


CREATE OR REPLACE DIRECTORY BLOB_DIR
AS 'C:\E\Class\Workspace\OracleClass';


--;


CREATE OR REPLACE PROCEDURE FLIGHT_meal_BLOB_INSERT
( 
pmeal_code number,
V_FILENAME IN VARCHAR2
)
IS
    V_LOCATOR_BLOB  BLOB;
    
    V_SOURCE_DATA_FILE BFILE := BFILENAME('BLOB_DIR', V_FILENAME);
    
    V_DEST_OFFSET    NUMBER := 1;
    V_SRC_OFFSET      NUMBER := 1;
    
BEGIN
         
         UPDATE flight_meal
         SET  
         menu_pdf =  empty_blob()
         WHERE meal_code = pmeal_code
         RETURNING MENU_PDF INTO V_LOCATOR_BLOB;
         
         DBMS_LOB.OPEN(V_SOURCE_DATA_FILE, 
                                  DBMS_LOB.LOB_READONLY);
                                  
         DBMS_LOB.LOADBLOBFROMFILE(V_LOCATOR_BLOB,
                                                      V_SOURCE_DATA_FILE,
                                                      DBMS_LOB.GETLENGTH(V_SOURCE_DATA_FILE),
                                                      V_DEST_OFFSET,
                                                      V_SRC_OFFSET
                                                      );
                                                      
         DBMS_LOB.CLOSE(V_SOURCE_DATA_FILE);
         
         COMMIT;
         
         DBMS_OUTPUT.PUT_LINE('이미지 입력 성공!!!');
         
         EXCEPTION
            WHEN OTHERS THEN 
                DBMS_OUTPUT.PUT_LINE('이미지 입력 실패!!');
END;

--기내식 작성 쿼리 


CREATE OR REPLACE PROCEDURE dc_flight_meal_02
(
    pmenu VARCHAR2,
    pmenu_pdf VARCHAR2
)
IS
    vmeal_code flight_meal.meal_code%TYPE;
BEGIN

    SELECT flight_mealseq.NEXTVAL INTO vmeal_code FROM dual;

    INSERT INTO flight_meal(meal_code, menu) VALUES(vmeal_code, pmenu);
    
    FLIGHT_meal_BLOB_INSERT(vmeal_code,pmenu_pdf);
    
    DBMS_OUTPUT.PUT_LINE('기내식 : '|| pmenu|| '가 생성되었습니다.');
    
EXCEPTION
    WHEN OTHERS THEN
        -- 오류 발생 시 메시지 출력
        DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다 ' );
END;





--기내식 수정쿼리


CREATE OR REPLACE PROCEDURE dc_flight_meal_03
(
     pmeal_code flight_meal.meal_code%TYPE 
     ,pmenu VARCHAR2
    )
IS
    vcount number;
BEGIN
  SELECT COUNT(*)
  INTO vcount
  FROM flight_meal
  WHERE  meal_code = pmeal_code;
  
  IF vcount =0 THEN
  DBMS_OUTPUT.PUT_LINE('해당 번호가 존재하지 않습니다.');
  ELSE
    
                UPDATE flight_meal
                SET  
                menu =pmenu
                WHERE meal_code = pmeal_code;
    END IF;
    --EXCEPTION
END;




--기내식 삭제쿼리


CREATE OR REPLACE PROCEDURE dc_flight_meal_04
(
    pmeal_code flight_meal.meal_code%TYPE
)
IS
    vcount number;
BEGIN
  SELECT COUNT(*)
  INTO vcount
  FROM flight_meal
  WHERE  meal_code = pmeal_code;
  
    IF VCOUNT = 0 THEN
     DBMS_OUTPUT.PUT_LINE('해당 번호가 존재하지 않습니다.');
    
    ELSE
        DELETE FROM flight_meal 
        WHERE meal_code = pmeal_code;
    END IF;
  
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다 ');
END;



--기프트 카드 생성쿼리
--기프트 카드 생성쿼리

CREATE OR REPLACE FUNCTION dc_giftcard_03 RETURN VARCHAR2 IS
    v_card_number VARCHAR2(19);
    v_count NUMBER; 
BEGIN

    LOOP
        v_card_number := 
            TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(1000, 9999))) || '-' ||
            TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(1000, 9999))) || '-' ||
            TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(1000, 9999))) || '-' ||
            TO_CHAR(TRUNC(DBMS_RANDOM.VALUE(1000, 9999)));

        SELECT COUNT(*)
        INTO v_count
        FROM card_table
        WHERE card_number = v_card_number;

        EXIT WHEN v_count = 0;
    END LOOP;
    
    RETURN v_card_number;
--EXCEPTION
    
END;
-------------------위 function은 직접 실행 X ----
------------------------------------------------------


-----실제 기프트카드 생성 및 선물----------------------------
-----실제 기프트카드 생성 및 선물 ----------------------------
-----실제 기프트카드 생성 및 선물----------------------------

CREATE OR REPLACE PROCEDURE dc_giftcard_02
(
    Pmessage VARCHAR2,
    PRecipient VARCHAR2,
    PRecipient_PNUM VARCHAR2,
    PSENDER VARCHAR2,
    PSENDER_PNUM VARCHAR2,
    Pamount NUMBER
)
IS
    VCARD_NUM VARCHAR2(19);
    VPIN_NUM NUMBER(6);
    v_card_number VARCHAR2(19);
    v_card_code number;
BEGIN

    v_card_number := dc_giftcard_03;
    v_card_code := DC_giftcard_01.NEXTVAL;

    INSERT INTO card_table  VALUES (v_card_code,v_card_number);
    
    DBMS_OUTPUT.PUT_LINE('생성된 카드 번호: ' || v_card_number);



    SELECT FLOOR(DBMS_RANDOM.VALUE(100000, 999999)) INTO VPIN_NUM FROM dual;

    SELECT CARD_NUMBER
    INTO VCARD_NUM
    FROM (
        SELECT CARD_NUMBER
        FROM CARD_TABLE
        ORDER BY DBMS_RANDOM.VALUE
    )
    WHERE ROWNUM = 1;

    INSERT INTO giftcard
    VALUES (VCARD_NUM, Pmessage, VPIN_NUM, PRecipient, PRecipient_PNUM, PSENDER, PSENDER_PNUM, Pamount);
END;





----------------------- 좌석번호 생성
----------------------- 좌석번호 생성
----------------------- 좌석번호 생성

CREATE OR REPLACE PROCEDURE DC_SEAT_NUM
(
    pasnum       VARCHAR2,
    pseat_num    VARCHAR2,
    pseat_grade  VARCHAR2
)

IS
    vseat_code VARCHAR2(20);

BEGIN
     vseat_code := pasnum||'-'||pseat_num;



    INSERT INTO SEAT_NUM(SEAT_CODE,asnum,seat_num,seat_grade) VALUES(vseat_code,pasnum,pseat_num,pseat_grade);
EXCEPTION
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('오류가 발생했습니다' );

END;


-- 생성과 동시에 pdf파일도 입력되게하는 업데이트 프로시저 생성
 CREATE OR REPLACE DIRECTORY BLOB_DIR
 AS 'C:\E\Class\Workspace\OracleClass';
CREATE OR REPLACE PROCEDURE EVENT_BLOB_INSERT
(
pevnum number,
V_FILENAME IN VARCHAR2

)
IS
    V_LOCATOR_BLOB  BLOB;
    
    V_SOURCE_DATA_FILE BFILE := BFILENAME('BLOB_DIR', V_FILENAME);
    
    V_DEST_OFFSET    NUMBER := 1;
    V_SRC_OFFSET      NUMBER := 1;
BEGIN
         UPDATE event
         SET  
         eposter =  empty_blob()
         WHERE EVNUM = PEVNUM
         RETURNING eposter INTO V_LOCATOR_BLOB;
         DBMS_LOB.OPEN(V_SOURCE_DATA_FILE, 
                                  DBMS_LOB.LOB_READONLY);
         DBMS_LOB.LOADBLOBFROMFILE(V_LOCATOR_BLOB,
                                              V_SOURCE_DATA_FILE,
                                              DBMS_LOB.GETLENGTH(V_SOURCE_DATA_FILE),
                                              V_DEST_OFFSET,
                                              V_SRC_OFFSET
                                              );
         DBMS_LOB.CLOSE(V_SOURCE_DATA_FILE);
       
         DBMS_OUTPUT.PUT_LINE('이미지 파일 저장 성공!!!');
           COMMIT;
         EXCEPTION
            WHEN no_data_found THEN 
                DBMS_OUTPUT.PUT_LINE('이미지 파일 저장 실패!!!');
END;


---------------------------------------
---------------------------------------
CREATE OR REPLACE PROCEDURE DC_EVENT
(   pEvcat varchar2,
    pEvname varchar2,
    pstdate date,
    pendate date,
    pAdminID varchar2,
    pEposter varchar2
) 
IS
    vevnum number;
BEGIN
   
    SELECT DC_SEQEVE.NEXTVAL INTO vevnum FROM dual;
    INSERT INTO Event VALUES (vevnum, pEvcat, pEvname, pstdate, pendate, pAdminID, NULL);       
    EVENT_BLOB_INSERT(vevnum, pEposter);
    
EXCEPTION
    WHEN others THEN 
        DBMS_OUTPUT.PUT_LINE('이벤트 추가 중 오류 발생 ' );
END;
-------------------------------------------------------------------
-------------------------------------------------------------------

CREATE OR REPLACE PROCEDURE EnterEvent (
    pUserID IN VARCHAR2,
    pPhoneNumber IN VARCHAR2,
    pEventNum IN Event.Evnum%TYPE
) AS

    vcount number;
BEGIN
       
       
    SELECT COUNT(*) INTO vcount FROM entrys WHERE evnum=pEventNum AND 
    USERID = puserid ;

    
    IF vcount >=1
    THEN
        DBMS_OUTPUT.PUT_LINE('이미 응모하셨습니다.');
    ELSE
        INSERT INTO entrys (Key, PhoneNumber, UserID, Evnum)
        VALUES (KeySequence.NEXTVAL, pPhoneNumber, pUserID, pEventNum);
            DBMS_OUTPUT.PUT_LINE('이벤트 응모가 완료되었습니다.');
    END IF;    

    
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('이벤트 응모 중 오류가 발생했습니다');
END;
----------------------------------경품 추첨 --------------------------------
----------------------------------경품 추첨 --------------------------------

-- 경품추천
--응모자중 랜덤선택해서 WINNER로 이동
---------------------------------------------------


CREATE OR REPLACE PROCEDURE draweventwinners(
    p_evnum  event.evnum%TYPE
)
AS
    v_totalentries NUMBER;
    v_winnercount NUMBER;
    CURSOR v_prizes IS
        SELECT keynum, price1, countnum
        FROM prize
        WHERE evnum = p_evnum;
BEGIN
    SELECT COUNT(*)
    INTO v_totalentries
    FROM entrys
    WHERE evnum = p_evnum; -- 이벤트 응모자수
    
    FOR prizerecord IN v_prizes LOOP
        IF prizerecord.countnum >= v_totalentries THEN
            v_winnercount := v_totalentries;
        ELSE
            v_winnercount := prizerecord.countnum;
        END IF;
        
        FOR I IN 1..v_winnercount LOOP
            INSERT INTO winner (KEY, wingrade, phonenumber, userid, evnum)
            SELECT dcdraw.NEXTVAL, prizerecord.price1, E.phonenumber, E.userid, E.evnum
            FROM (
                SELECT KEY, phonenumber, userid, evnum
                FROM entrys
                WHERE evnum = p_evnum
                AND (KEY,evnum) NOT IN (SELECT KEY,evnum FROM winner)
                ORDER BY dbms_random.VALUE
            ) E
            WHERE ROWNUM = 1;
              COMMIT;
        END LOOP;
    END LOOP;
      dbms_output.put_line(p_evnum ||'번 이벤트의 당첨자가 추첨되었습니다.' );
    FOR  winnerrecord IN (SELECT * FROM winner WHERE evnum = p_evnum) LOOP
  
    dbms_output.put_line('당첨자 : ' || winnerrecord.userid || ', 상품 : ' ||winnerrecord.wingrade  || ' 축하드립니다 !!');
    
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error occurred ' );
        ROLLBACK;
END ;
--------------------------------------------
-- 당첨자 조회 
--- 당첨자 조회 
--- 당첨자 조회 


CREATE OR REPLACE PROCEDURE SELWINNER
    ( pevnum NUMBER )
IS
    vwingrade VARCHAR2(100);
    vphonenumber VARCHAR2(30);
    vuserid VARCHAR2(20);
    vename VARCHAR2(20); -- 추가된 변수
    vnumber VARCHAR2(20);

BEGIN
    FOR SELWIN IN (SELECT * FROM winner WHERE evnum = pevnum)
    LOOP 
        -- 고객 아이디를 마스킹하여 vename 변수에 저장
        vename := 
        SUBSTR(SELWIN.userid, 1, 3) || LPAD('*', LENGTH(SELWIN.userid) - 4, '*')
        || SUBSTR(SELWIN.userid, -3);
        
        
        vnumber :=
        SUBSTR(SELWIN.PHONENUMBER, 1, 3) || LPAD('*', LENGTH(SELWIN.PHONENUMBER)-7 , '*')
        || SUBSTR(SELWIN.PHONENUMBER, -4);
        
        -- 출력
        DBMS_OUTPUT.PUT_LINE('상품이름 : ' || SELWIN.WINGRADE);
        DBMS_OUTPUT.PUT_LINE('고객 아이디 : ' || vename); -- 수정된 부분
        DBMS_OUTPUT.PUT_LINE('고객 전화번호 : ' || vnumber);
    END LOOP; 

END;

-------------------------------대안 프로시저 ------------------------------------------------
-------------------------------대안 프로시저 ------------------------------------------------
-------------------------------대안 프로시저 ------------------------------------------------
-- 
 --         Rfamily insert / userdetail update family_id 
--  회원 가족 신청
CREATE OR REPLACE PROCEDURE pd_da_Rfamily_01
(
    pRelation Rfamily.relation%TYPE,
    pfamily_id Rfamily.family_id%TYPE,
    puserid Rfamily.userid%TYPE
)
IS
    vfamily_id VARCHAR2(20);
BEGIN
    vfamily_id := '$' || pfamily_id ;
    INSERT INTO Rfamily (relation,status, family_id, userid) VALUES(pRelation,'진행중', vfamily_id ,puserid); 
    
    UPDATE userdetail
    SET family_id = vfamily_id
    WHERE userid = puserid; 
    
    COMMIT;
END;


-- 가족 진행 중과 완료 두 가지로 나누고 이 값을 1. 수정 2. 조회 3. 삭제  / 수정할 id -> 진행중 OR 완료 || 조회할 가족 id 만 출력  
CREATE OR REPLACE PROCEDURE pd_da_Rfamily_03
(
    pSearchCondition NUMBER 
    , psearchWord VARCHAR2
    , pupdateWord VARCHAR2 DEFAULT NULL 
)
IS
    vsql VARCHAR2(100);
    vcur SYS_REFCURSOR;
    vrow Rfamily%ROWTYPE;
    vSearchWord VARCHAR2(100);
    fm_id VARCHAR2(10);
BEGIN
    
    IF pSearchCondition = 1 THEN
        vSearchWord := '$' || psearchWord;
        IF pupdateWord = '완료' THEN
            UPDATE Rfamily
            SET status = '완료'
            WHERE family_id = vSearchWord;
        ELSIF pupdateWord = '진행중' THEN
            UPDATE Rfamily
            SET status = '진행중'
            WHERE family_id = vSearchWord;
        END IF;
    ELSIF pSearchCondition = 2 THEN
        vSearchWord := '$' || psearchWord;
    ELSIF pSearchCondition = 3 THEN
        SELECT family_id into fm_id
        FROM Rfamily
        WHERE userid = psearchWord;
        
        vSearchWord := fm_id;
        IF fm_id LIKE '%' || psearchWord || '%' THEN
            DELETE FROM Rfamily
            WHERE family_id = fm_id;
        ELSE  
            DELETE FROM Rfamily
            WHERE userid = psearchWord;
        END IF;
    END IF;
        vsql := 'SELECT * ' ;
        vsql := vsql || ' FROM Rfamily '  ;
        vsql := vsql || ' WHERE family_id = :vSearchWord' ;
        OPEN vcur FOR vsql USING vSearchWord;
        LOOP
            FETCH vcur INTO vrow;
            EXIT WHEN vcur%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE( vrow.family_id || ' ' || vrow.userid || ' ' || vrow.relation || ' ' || vrow.status);
        END LOOP;
        CLOSE vcur;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20001, '> Rfamily data not found...');
            
    COMMIT;
END;



-- 유저 소비 내역 조회 프로시저 
CREATE OR REPLACE PROCEDURE da_Mtracking_04
(
    pUserid VARCHAR2,
    pSearchKeyword VARCHAR2,
    pOrderkeyword NUMBER 
)
IS
    vsql VARCHAR2(200);
    vcur SYS_REFCURSOR;
    vrow mtracking%ROWTYPE;
    
BEGIN
    vsql := 'SELECT * ';
    vsql := vsql || 'FROM Mtracking ' ;
    vsql := vsql || 'WHERE userid = :pUserid AND spendorearned = :pSearchKeyword ';
    
    IF pOrderkeyword = 1 THEN 
    vsql := vsql || 'ORDER BY consumtion_date DESC' ;
    ELSIF pOrderkeyword = 2 THEN
    vsql := vsql || 'ORDER BY consumtion_date' ; 
    END IF; 
    
    OPEN vcur FOR vsql USING pUserid, pSearchKeyword;
    LOOP
        FETCH vcur INTO vrow;
        EXIT WHEN vcur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(vrow.userid || ' ' || vrow.consumtion_date || ' ' || vrow.amount_mileage || ' ' || vrow.spendorearned );
    END LOOP;
    CLOSE vcur;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        RAISE_APPLICATION_ERROR(-20001, ' > NO SEARCH DATA') ; 
END;



-- 유저 정보 조회 프로시저
-- 1. 아이디를 받고, userdetail 에서 찾아주기 
-- 
-- 조회할 거 그냥 커서로 찾아주기 . 
CREATE OR REPLACE PROCEDURE pd_da_userdetail_04 
(   
    pUserid VARCHAR2
)
IS
    vsql VARCHAR2(100);
    vcur SYS_REFCURSOR;
    vrow userdetail%ROWTYPE;
BEGIN
    SELECT userid, usergrade, totalmile, family_id into vrow.userid,vrow.usergrade,vrow.totalmile,vrow.family_id
    FROM userdetail
    WHERE userid LIKE (pUserid);
    
    DBMS_OUTPUT.PUT_LINE(vrow.userid || ' ' || vrow.usergrade || ' ' || vrow.totalmile || ' ' || vrow.family_id);
--EXCEPTION
END;
---------------------------------------------------------
---------------------------------------------------------

CREATE OR REPLACE PROCEDURE da_Mtracking_03 -- EXEC da_Mtracking_03(마일리지값, '항공사이름', '적립 또는 소비' , 'userid' ) 
IS
 vSum NUMBER;
 vamount_earned NUMBER;
 vamount_consume NUMBER;
 vamount_total NUMBER;
 vride NUMBER;
 vGrade VARCHAR2(40);
 vamount_refund NUMBER;
 vgetMile NUMBER ;
 dat DATE;
 vUserid VARCHAR2(40);
 p_Userid Mtracking.userid%TYPE;
CURSOR vCursor 
 IS
 SELECT userid
 FROM userdetail;
BEGIN
--    curtime := TO_DATE(SYSDATE, 'yyyy-mm-dd HH24:MI:SS');
--    INSERT INTO MTracking VALUES (seq_mtracking.NEXTVAL, curtime, pMileage, pAirLineType, p_sore, p_Userid);

-- for문을 돌려서 . userid 

    OPEN vCursor;
    
    LOOP
    FETCH vCursor INTO p_Userid;
    EXIT WHEN vCursor%NOTFOUND;
    SELECT SUM(amount_mileage) into vamount_earned -- 그 사람의 마일리지 총값 
    FROM Mtracking 
    WHERE userid = p_Userid AND spendorearned LIKE '%적립%';
    
    SELECT SUM(amount_mileage) into vamount_consume -- 그 사람의 마일리지 총값 
    FROM Mtracking 
    WHERE userid = p_Userid AND spendorearned LIKE '%소비%';
    
    SELECT SUM(amount_mileage) into vamount_refund
    FROM Mtracking
    WHERE userid = p_Userid AND spendorearned LIKE '%환불%';
    
    SELECT COUNT(*) INTO vride
    FROM Mtracking
    WHERE userid = p_Userid;
    
    UPDATE userdetail
    SET totalmile = NVL(vamount_earned,0) - (NVL(vamount_consume,0) + NVL(vamount_refund,0))
    WHERE userid = p_Userid;
    
    vgetMile := NVL(vamount_earned,0) -  NVL(vamount_refund,0);
    
    SELECT usergrade into vGrade
    FROM userdetail
    WHERE userid = p_Userid;
    
--     등급 체크 
    IF vgetMile >= 50000 OR vride >= 40 THEN 
        IF vgetMile >= 500000 AND vgetMile <= 999999 THEN
            vGrade := '모닝캄 프리미엄 클럽';
        ELSIF vgetMile >= 1000000 THEN
            vGrade := '밀리언 마일러 클럽';
        ELSIF vGrade = '모닝캄 클럽' AND vgetMile <= 499999 THEN
            SELECT grade_date into dat
            FROM userdetail
            WHERE userid = p_Userid;
            IF TO_DATE(SYSDATE, 'YYYY/MM/DD') - TO_DATE(dat, 'YYYY/MM/DD') > 730 THEN 
                vGrade := '스카이패스 클럽';
            END IF;
        ELSE 
        vGrade := '모닝캄 클럽';
        UPDATE userdetail
        SET grade_date = TO_DATE(SYSDATE, 'YYYY/MM/DD')
        WHERE userid = p_Userid;
        END IF;
    END IF;
    
    UPDATE userdetail
    SET usergrade = vGrade
    WHERE userid = p_Userid;
 END LOOP;
     
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            ROLLBACK;
    
       
    CLOSE vCursor; 
    COMMIT;
END;
------------------------------------------------------영은------------------------------------
------------------------------------------------------영은------------------------------------
------------------------------------------------------영은------------------------------------
------------------------------------------------------영은------------------------------------
------------------------------------------------------영은------------------------------------
------------------------------------------------------영은------------------------------------
-----------------------------------영은---------------------------------
-- 공지사항 생성, 수정, 삭제, 조회
-- 공지사항 생성을 위한 프로시저
-- delete notice where 1=1;
CREATE OR REPLACE PROCEDURE ye_Notice_01(
    p_Notice_num IN VARCHAR2,
    p_Notice_title IN VARCHAR2,
    p_Notice_contents IN CLOB,
    p_Notice_topic IN VARCHAR2,
    p_AdminID IN VARCHAR2
)
AS
BEGIN
    INSERT INTO Notice (Notice_num, Notice_title, Notice_contents, Notice_topic, AdminID)
    VALUES (p_Notice_num, p_Notice_title, p_Notice_contents, p_Notice_topic, p_AdminID);
    DBMS_OUTPUT.PUT_LINE('"새로운 공지사항이 추가되었습니다."');
    -- 조회된 공지사항 정보 출력
    DBMS_OUTPUT.PUT_LINE('Notice Number: ' || p_Notice_num);
    DBMS_OUTPUT.PUT_LINE('Notice Title: ' || p_Notice_title);
    DBMS_OUTPUT.PUT_LINE('Notice Contents: ' || p_Notice_contents);
    DBMS_OUTPUT.PUT_LINE('Notice Topic: ' || p_Notice_topic);
    DBMS_OUTPUT.PUT_LINE('Admin ID: ' || p_AdminID);
    --COMMIT;
END;                






----------------공지사항 전체 조회 ----------------------
----------------공지사항 전체 조회 ----------------------
CREATE OR REPLACE PROCEDURE ye_Notice_02 AS
    v_notice_cursor SYS_REFCURSOR;
    v_notice_num notice.notice_num%TYPE;
    v_notice_title notice.notice_title%TYPE;
    v_notice_contents notice.notice_contents%TYPE;
    v_notice_topic notice.notice_topic%TYPE;
BEGIN
    OPEN v_notice_cursor FOR
        SELECT Notice_num, Notice_title, Notice_contents, Notice_topic
        FROM Notice;
    LOOP
        FETCH v_notice_cursor INTO v_notice_num, v_notice_title, v_notice_contents, v_notice_topic;
        EXIT WHEN v_notice_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Notice_num: ' || v_notice_num || ', Notice_title: ' || v_notice_title || ', Notice_contents: ' || v_notice_contents || ', Notice_topic: ' || v_notice_topic);
    END LOOP;
    CLOSE v_notice_cursor;
END;

-- 공지사항 수정을 위한 프로시저
CREATE OR REPLACE PROCEDURE ye_Notice_03(
    p_Notice_num IN VARCHAR2,
    p_New_Title IN VARCHAR2
)
AS
BEGIN
    UPDATE Notice
    SET Notice_title = p_New_Title
    WHERE Notice_num = p_Notice_num;
    DBMS_OUTPUT.PUT_LINE('"공지사항 제목이 성공적으로 변경되었습니다."');
    DBMS_OUTPUT.PUT_LINE('Notice_num: ' || p_Notice_num || ', Notice_title: ' || p_New_Title);
    COMMIT;
END;

-- 공지사항 삭제를 위한 프로시저
CREATE OR REPLACE PROCEDURE ye_Notice_04(
    p_Notice_num IN VARCHAR2
)
AS
BEGIN
    DELETE FROM Notice
    WHERE Notice_num = p_Notice_num;
    DBMS_OUTPUT.PUT_LINE(p_Notice_num || '번 공지사항이 삭제되었습니다.');
    COMMIT;
END;

-- 약관 추가 및 수정
CREATE OR REPLACE PROCEDURE ye_Update_Contract (
    p_Contract_code IN NUMBER,
    p_Essentiality IN VARCHAR2,
    p_Contract_title IN VARCHAR2,
    p_Contract_contents IN VARCHAR2
)
IS
    v_NumUpdated NUMBER;
BEGIN
    UPDATE Contract
    SET Essentiality = p_Essentiality,
        Contract_title = p_Contract_title,
        Contract_contents = p_Contract_contents
    WHERE Contract_code = p_Contract_code;
    v_NumUpdated := SQL%ROWCOUNT;
    IF v_NumUpdated = 0 THEN
        INSERT INTO Contract (Contract_code, Essentiality, Contract_title, Contract_contents)
        VALUES (p_Contract_code, p_Essentiality, p_Contract_title, p_Contract_contents);
        
        SYS.DBMS_OUTPUT.PUT_LINE(p_Contract_code || '번에 새로운 약관이 추가되었습니다.');
    ELSE
        SYS.DBMS_OUTPUT.PUT_LINE(p_Contract_code || '번에 기존 약관 정보가 수정되었습니다.');
    END IF;
-- EXCEPTION
END ye_Update_Contract;



-------------------------------------------- 실제 실행 ------------------------------------------------------------------
-------------------------------------------- 실제 실행 ------------------------------------------------------------------
-------------------------------------------- 실제 실행 ------------------------------------------------------------------
-------------------------------------------- 실제 실행 ------------------------------------------------------------------
-------------------------------------------- 실제 실행 ------------------------------------------------------------------
-------------------------------------------- 실제 실행 ------------------------------------------------------------------
-------------------------------------------- 실제 실행 ------------------------------------------------------------------
-------------------------------------------- 실제 실행 ------------------------------------------------------------------
-------------------------------------------- 실제 실행 ------------------------------------------------------------------
-------------------------------------------- 실제 실행 ------------------------------------------------------------------
-------------------------------------------- 실제 실행 ------------------------------------------------------------------
-------------------------------------------- 실제 실행 ------------------------------------------------------------------
-------------------------------------------- 실제 실행 ------------------------------------------------------------------
-------------------------------------------- 실제 실행 ------------------------------------------------------------------
-------------------------------------------- 실제 실행 ------------------------------------------------------------------
-------------------------------------------- 실제 실행 ------------------------------------------------------------------
-------------------------------------------- 실제 실행 ------------------------------------------------------------------
delete scplane ;
--일정 삽입 
exec mk_scplane_01('202404050800', '202404050925' ,'korea' ,'japan','#admin001','SEOUL.ICN','FUK.FUK');
exec mk_scplane_01('202404200800', '202404200925' ,'korea' ,'japan','#admin001','SEOUL.ICN','FUK.FUK');
exec mk_scplane_01('202404201835', '202404202000' ,'korea' ,'japan','#admin001','SEOUL.ICN','FUK.FUK');
exec mk_scplane_01('202403270625', '202403270715' ,'korea' ,'Korea','#admin001','SEOUL.GMP','JEJU.CJU');
exec mk_scplane_01('202403270915', '202403271025' ,'korea' ,'Korea','#admin001','SEOUL.GMP','JEJU.CJU');
exec mk_scplane_01('202403271330', '202403271445' ,'korea' ,'Korea','#admin001','SEOUL.GMP','JEJU.CJU');
exec mk_scplane_01('202404200640', '202404200750' ,'korea' ,'Korea','#admin002','SEOUL.GMP','JEJU.CJU');
exec mk_scplane_01('202404201300', '202404201410' ,'korea' ,'Korea','#admin002','SEOUL.GMP','JEJU.CJU');
exec mk_scplane_01('202405100905', '202405101025' ,'korea' ,'china','#admin002','SEOUL.ICN','BEIJING.PEK');
exec mk_scplane_01('202405101040', '202405101205' ,'korea' ,'china','#admin002','SEOUL.ICN','BEIJING.PEK');
exec mk_scplane_01('202405101840', '202405102005' ,'korea' ,'china','#admin002','SEOUL.ICN','BEIJING.PEK');
exec mk_scplane_01 ('202404190730','202404190840','korea','korea','#admin001','SEOUL.GMP','JEJU.CJU');
exec mk_scplane_01  ('202404191900','202404192010','korea','korea','#admin001','SEOUL.GMP','JEJU.CJU');
exec mk_scplane_01  ('202404192030','202404192140','korea','korea','#admin001','SEOUL.GMP','JEJU.CJU');
exec mk_scplane_01  ('202404050800','202404050925','korea','JAPAN','#admin001','SEOUL.ICN','FUK.FUK');
exec mk_scplane_01  ('202404051355','202404051525','korea','JAPAN','#admin001','SEOUL.ICN','FUK.FUK');
exec mk_scplane_01  ('202404051835','202404052000','korea','JAPAN','#admin001','SEOUL.ICN','FUK.FUK');
exec mk_scplane_01  ('202404200815','202404200940','korea','JAPAN','#admin001','SEOUL.ICN','BEIJING.PEK');
exec mk_scplane_01  ('202404200905','202404201025','korea','JAPAN','#admin002','SEOUL.ICN','BEIJING.PEK');
exec mk_scplane_01  ('202404201840','202404202005','korea','JAPAN','#admin002','SEOUL.ICN','BEIJING.PEK');
exec mk_scplane_01  ('202404201000','202404210020','korea','USA','#admin002','SEOUL.ICN','NYC.JFK');
exec mk_scplane_01  ('202404201930','202404210930','korea','USA','#admin002','SEOUL.ICN','NYC.JFK');
exec mk_scplane_01  ('202405100930','202405102330','korea','USA','#admin002','SEOUL.ICN','BOS.BOS');
exec mk_scplane_01  ('202405100920','202405110340','korea','USA','#admin002','SEOUL.ICN','BOS.BOS');
exec mk_scplane_01  ('202403271600','202403280633','korea','USA','#admin002','SEOUL.ICN','LAS.LAS');
exec mk_scplane_01  ('202403271430','202403280631','korea','USA','#admin002','SEOUL.ICN','LAS.LAS');
exec mk_scplane_01  ('202403271940','202403281200','korea','USA','#admin002','SEOUL.ICN','LAS.LAS');
delete scplane ;



---------- 회원가입 --------------------------------------------------
---------- 회원가입 --------------------------------------------------
---------- 회원가입 --------------------------------------------------
set serveroutput on;
exec mk_flightuser_01('user001', '홍', '길동', 'Hong', 'GilDong', 'password123', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 'Male', 'user001@example.com', '01012345678', 'Korea', '1234-5678-9012-3456',12,35);
delete flightuser where userid='user001';
drop trigger se_bpass_01
select * from flightuser;
delete flightuser;
select * from userdetail;
----------------회원 탈퇴 ------------------------------
----------------회원 탈퇴 ------------------------------
----------------회원 탈퇴 ------------------------------
----------------회원 탈퇴 ------------------------------
exec mk_flightuser_02('user001','password123');
select * from flightuser;
select * from yesno;
--------------------------------로그아웃 ------
--------------------------------로그아웃 ------
--------------------------------로그아웃 ------
--------------------------------로그아웃 ------

exec mk_loginhis_01;
select * from loginhis;
----------------------로그인 -----------------------------
----------------------로그인 -----------------------------
----------------------로그인 -----------------------------
----------------------로그인 -----------------------------
exec mk_flightuser_03('user001','password123');

select * from loginhis;

--------------------------------------------------예약 조회 기능
--------------------------------------------------예약 조회 기능
--------------------------------------------------예약 조회 기능
--------------------------------------------------예약 조회 기능
--------------------------------------------------예약 조회 기능
exec mk_scplane_02 ('SEOUL','JEJU','240328',1,'일반석');
exec mk_scplane_02 ('SEOUL','LAS','240327',1,'일반석');
exec mk_scplane_02 ('SEOUL','JEJU','240420',1,'일반석');
select * from scplane;
select * from seat_num;
----------------------------- 예약 ( 결제 ) 기능 ------
----------------------------- 예약 ( 결제 ) 기능 ------
----------------------------- 예약 ( 결제 ) 기능 ------
----------------------------- 예약 ( 결제 ) 기능 ------


exec MK_PAYREFUND_01('2403270625','GMP','CJU','20A',1,'정상','카드',3);
exec MK_PAYREFUND_01('2403270915','GMP','CJU','20A',1,'정상','카드',3);
exec MK_PAYREFUND_01('2403271330','GMP','CJU','20A',1,'정상','카드',3);
exec MK_PAYREFUND_01('2403271940','ICN','LAS','22A',1,'정상','카드',3);

select * from scplane;
select S.* ,DDATE,TO_CHAR(DDATE,'HH24:MI') from scplane S;
select * from seat_num;

--------------로그인을 필수로해야함----------------------
--------------로그인을 필수로해야함----------------------
--------------로그인을 필수로해야함----------------------
--------------로그인을 필수로해야함----------------------
--------------로그인을 필수로해야함----------------------
exec mk_flightuser_03('user001','password123');

exec mk_scplane_02 ('SEOUL','FUK','240405',1,'일반석');
exec mk_scplane_02 ('SEOUL','JEJU','240419',1,'일반석');
exec mk_scplane_02 ('SEOUL','BEIJING','240420',1,'일반석');
exec mk_scplane_02 ('SEOUL','NYC','240420',1,'일반석');
---------------------예약  내역 조회-----------------
---------------------예약  내역 조회-----------------

exec mk_payrefund_04 
select * from USERDETAIL;
SELECT * FROM MTRACKING;
delete mtracking;
select * from payrefund;
delete userdetail;
-------------------------------------------------
-------------------------------------------------
-------------------------------------------------
------------------------------예약 환불 ----------------
exec mk_payrefund_03(2);
delete payrefund ;
delete refund;
select * from refund;
--------------------------------예약 후 탑승권 발급
--------------------------------예약 후 탑승권 발급
--------------------------------예약 후 탑승권 발급

EXEC SE_PAYREFUND_01 (3,TO_DATE('2024-03-27 19:40', 'YYYY-MM-DD HH24:MI'),'Hong', 'GilDong');
EXEC SE_PAYREFUND_01 (2,TO_DATE('2024-03-20 10:45', 'YYYY-MM-DD HH24:MI'),'Hong', 'GilDong');

---------------------수화물 규정검색--------------
---------------------수화물 규정검색--------------

EXEC se_lrule_01('국제선 미주');
EXEC se_lrule_01('국제선 동북아시아');


-----------------------수화물 규정 수정 --------------------
-----------------------수화물 규정 수정 --------------------
----------------------수화물 규정 수정 --------------------
EXEC SE_LRULE_02('국제선 미주', '일반석',2,50000);
-----------------------수화물 규정 추가 --------------------
-----------------------수화물 규정 추가 --------------------
-----------------------수화물 규정 추가 --------------------
EXEC SE_LRULE_03(21,'일반석', 5, 250000,'국제선 미주');
----------------------------------------------------------
----------------------추가 수화물 요금 계산 ------------
---------------------

--------------------라운지 조회 ----------------------
--------------------라운지 조회 ----------------------

EXEC SE_LOUNGEINFO_01( '미주','밴쿠버(YVR)');
EXEC SE_LOUNGEINFO_01( '동북아시아' ,'도쿄/나리타');

-----------------------------지역별 서비스 조회------------
-----------------------------지역별 서비스 조회------------

EXEC SE_CSERVICE_01('한국');
EXEC SE_CSERVICE_01('동북아시아');

-----------------지역별 서비스 글 작성
-----------------지역별 서비스 글 작성
EXEC SE_CSERVICE_02 ( '886','동북아시아','대만','02-2518-2200', '','한국어/영어 : 매일 24시간 일본어 : 매일 9:00-19:00(일본 현지시간 기준) 중국어 : 평일 08:30-12:00, 13:00-17:30(대만 현지시간 기준, 주말/공휴일 제외)','#admin002');
EXEC SE_CSERVICE_02 ( '886','동북아시아','대만','02-2518-2200', '','한국어/영어 : 매일 24시간 일본어 : 매일 9:00-19:00(일본 현지시간 기준) 중국어 : 평일 08:30-12:00, 13:00-17:30(대만 현지시간 기준, 주말/공휴일 제외)','#admin002');

---------------------지역별 서비스 작성한 글 조회

EXEC SE_CSERVICE_03('#admin002');
-----------------------
EXEC SE_CSERVICE_04( pnum => '61', pcall1 => '03-9262-6111');


---지역별 서비스 글 삭제
EXEC  SE_CSERVICE_05('61');

---------------------------동찬 ---------------------------------
---------------------------동찬 ---------------------------------


---------------고객의 말씀 작성 ------------------
---------------고객의 말씀 작성 ------------------
---------------고객의 말씀 작성 ------------------ ?
BEGIN 
    dc_customerc_02(
    '칭송', '공항서비스', '이', '동찬', '(82) 10-1234-5678',
    'example@email.com', '칭찬해요 ~', '모두 너무 친절합니다',
    '1232-3456-7890-1323', '34534534', 1,
    '서울', '뉴욕', TO_DATE('2024-03-10', 'YYYY-MM-DD'),
    'KE123'
    );
    END;


--고객의 말씀 조회
EXEC dc_customerc_01(3);

----고객의 말씀 수정 -----------------------
----고객의 말씀 수정 -----------------------

--고객의 말씀 수정 -입력

CALL dc_customerc_03(
     1,   '칭송',    '공항서비스',
     '이',   '호통',    '(82) 10-1234-5678',
     'example@email.com',    '칭찬해요 ~',    '모두 너무 친절합니다',
   '1232-3456-7890-1323',    '34534534',    1,
     '서울',     '뉴욕',     TO_DATE('2024-03-10', 'YYYY-MM-DD'),
    'KE123'
);
--------------------------고객의 말씀 삭제 ---------------------
--------------------------고객의 말씀 삭제 ---------------------
-- 고객의말씀 DELETE -입력

EXEC dc_customerc_04(3);


---------------기내식 조회 ------------------------------------
---------------기내식 조회 ------------------------------------
---------------기내식 조회 ------------------------------------

EXEC dc_flight_meal_01(4);

-------------------------기내식 작성 --------------------------
-------------------------기내식 작성 --------------------------

EXECUTE dc_flight_meal_02('아이스크림');


------------------------------기내식 수정 ------------------------------
------------------------------기내식 수정 ------------------------------

EXECUTE dc_flight_meal_03(1,'아이스크림');

---------------------------기내식 삭제 
---------------------------기내식 삭제 
---------------------------기내식 삭제 
---------------------------기내식 삭제 
exec dc_flight_meal_04(4);


----------------------기프트 카드 자동생성 ------------------------
----------------------기프트 카드 자동생성 ------------------------
----------------------기프트 카드 자동생성 ------------------------

EXEC DC_GIFTCARD_02('항상 고마워','이동찬','01020893028','오동찬','01023938474',500000);
select * from giftcard


------------------------------좌석번호 생성 -----------------------------------
------------------------------좌석번호 생성 -----------------------------------
------------------------------좌석번호 생성 -----------------------------------
------------------------------좌석번호 생성 -----------------------------------

EXEC DC_SEAT_NUM('HL7553','03A','일반석');


------------------------------생성과 동시에 pdf파일도 입력되게하는 업데이트 프로시저
------------------------------생성과 동시에 pdf파일도 입력되게하는 업데이트 프로시저
------------------------------생성과 동시에 pdf파일도 입력되게하는 업데이트 프로시저

EXEC EVENT_BLOB_INSERT('1','fare.pdf');
select * from event;

------------------------------생성과 동시에 pdf파일도 기내식 입력되게하는 업데이트 프로시저
------------------------------생성과 동시에 pdf파일도 기내식입력되게하는 업데이트 프로시저
------------------------------생성과 동시에 pdf파일도 기내식입력되게하는 업데이트 프로시저
EXEC FLIGHT_meal_BLOB_INSERT('meal.htm')
-------------------------------------이벤트 생성
-------------------------------------이벤트 생성
-------------------------------------이벤트 생성


BEGIN
    DC_EVENT
    ('콘서트', '2024 음악축제', '2024-04-15', '2024-04-17', '#admin001', 'meal.htm');
END;

--------------------이벤트 참여 --------------------------

BEGIN
    EnterEvent('user006', '01067890123', 1);
    EnterEvent('user007', '01078901234', 1);
    EnterEvent('user008', '01089012345', 1);
    EnterEvent('user009', '01090123456', 1);
    EnterEvent('user010', '01001234567', 1);
    EnterEvent('user011', '01067890123', 2);
    EnterEvent('user012', '01078901234', 2);
    EnterEvent('user013', '01089012345', 2);
    EnterEvent('user014', '01090123456', 2);
    EnterEvent('user015', '01001234567', 2);
    EnterEvent('user016', '01067890123', 2);
    EnterEvent('user017', '01078901234', 2);
    EnterEvent('user018', '01089012345', 3);
    EnterEvent('user019', '01090123456', 3);
    EnterEvent('user020', '01001234567', 3);
    EnterEvent('user001', '01067890123', 3);
    EnterEvent('user002', '01078901234', 3);
    EnterEvent('user003', '01089012345', 3);
    EnterEvent('user004', '01090123456', 3);
    EnterEvent('user005', '01001234567', 4);
    COMMIT;
END;

-----------------------------당첨자 조회-----------------------------
-----------------------------당첨자 조회-----------------------------

exec DrawEventWinners(1);
exec DrawEventWinners(2);
exec DrawEventWinners(3);
exec DrawEventWinners(4);

EXEC SELWINNER(1);


-----------------------------------------대안------------------------------------
-----------------------------------------대안------------------------------------
-----------------------------------------대안------------------------------------
-----------------------------------------대안------------------------------------
-----------------------------------------대안------------------------------------
---------유저 정보 조회 ---------------------------------
---------유저 정보 조회 ---------------------------------
---------유저 정보 조회 ---------------------------------
EXEC pd_da_userdetail_04('user001');


-----------------------가족 정보 조회,수정,삭제 ---------------------
-----------------------맨 앞의 매개변수로 1.수정 2.조회 3.삭제------------
-----------------------맨 앞의 매개변수로 1.수정 2.조회 3.삭제------------
EXEC pd_da_Rfamily_03(3,'user004');


-----------------------회원 가족 신청 ----------------------
-----------------------회원 가족 신청 ----------------------

EXEC pd_da_Rfamily_01('본','user001','user001');
EXEC pd_da_Rfamily_01('녀','user001','user002');
EXEC pd_da_Rfamily_01('자','user001','user003');
EXEC pd_da_Rfamily_01('모','user001','user004');
EXEC pd_da_Rfamily_01('부','user001','user005');


-----------------------------------------------------------------
---------- userdetail 업데이트 ----------
--- da_Mtracking_03 밑에서 job 으로 자동실행
--- da_Mtracking_03 밑에서 job 으로 자동실행
--- da_Mtracking_03 밑에서 job 으로 자동실행
----------------------------------
----------------------------------
----------------------------------
--- 마일리지 내역 -----
--- 마일리지 내역 -----
EXEC da_Mtracking_04('user001','적립',1);
-----------------------------------------
---------------------------------------------------- job 으로 등록
---------------------------------------------------- job 으로 등록
DECLARE
    vjob_no NUMBER;
BEGIN
DBMS_JOB.SUBMIT(
    job => vjob_no
    ,what => 'da_Mtracking_03;'
    ,next_date => SYSDATE
    ,interval => 'SYSDATE + 1/24/60'
    );
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(' 업데이트 : ' || vjob_no);
END;

BEGIN
  DBMS_JOB.NEXT_DATE(5, SYSDATE + 1/24/60);
END;

BEGIN
    DBMS_JOB.REMOVE(5);
    COMMIT;
END;
select * from userdetail;


--------------------------------------------------------------------
--------------------------------------------------------------------
-----------------------------------영은---------------------------------
-----------------------------------영은---------------------------------

--공지사항 생성을 위한 프로시저
EXEC ye_Notice_01('10', '새로운 공지사항', '새로운 내용', '새로운 주제', '#admin003');


---- 약관 추가 및 수정
---- 약관 추가 및 수정
---- 약관 추가 및 수정
 EXEC ye_Update_Contract(11, '필수', '2023년 02월 14일 추가됨', '추가완료');
 EXEC ye_Update_Contract(11, '선택', '2024년 03월 13일 수정됨', '수정완료');
 
 ---------공지사항 전제 조회--------------
 ---------공지사항 전제 조회--------------
 ---------공지사항 전제 조회--------------
 EXEC ye_Notice_02;
 --공지사항 삭제를 위한 프로시저
 --공지사항 삭제를 위한 프로시저
 EXEC ye_Notice_04('4');

-- 공지사항 수정을 위한 프로시저
-- 공지사항 수정을 위한 프로시저
 EXEC ye_Notice_03('1', '세관신고 절차가 굉장히 복잡해짐');






---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
---------------------------------------------------------------------
delete 
drop trigger
select * from mtracking;
select * from dfare;
select * from loginhis;
select * from adminstrator;
select * from userdetail;
select * from scplane;
SELECT * FROM GIFTCARD;
SELECT * 
FROM user_jobs;





