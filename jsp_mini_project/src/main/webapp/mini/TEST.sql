--------------------------------------------------------
--  파일이 생성됨 - 목요일-12월-28-2023   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table STUDENT
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."STUDENT" 
   (	"STU_NO" CHAR(9 BYTE), 
	"STU_NAME" VARCHAR2(12 BYTE), 
	"STU_DEPT" VARCHAR2(20 BYTE), 
	"STU_GRADE" NUMBER, 
	"STU_CLASS" CHAR(1 BYTE), 
	"STU_GENDER" CHAR(1 BYTE), 
	"STU_HEIGHT" NUMBER, 
	"STU_WEIGHT" NUMBER
   ) PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into SYSTEM.STUDENT
SET DEFINE OFF;
Insert into SYSTEM.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20153075 ','옥한빛','기계',1,'C','M',177,81);
Insert into SYSTEM.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20153088 ','이태연','기계',1,'C','F',162,51);
Insert into SYSTEM.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20143054 ','유가인','기계',2,'C','F',155,48);
Insert into SYSTEM.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20152088 ','조민우','전기전자',1,'C','M',188,91);
Insert into SYSTEM.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20142021 ','심수정','전기전자',2,'A','F',168,46);
Insert into SYSTEM.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20132003 ','박희철','전기전자',3,'B','M',170,61);
Insert into SYSTEM.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20151062 ','김인중','컴퓨터정보',1,'B','M',166,68);
Insert into SYSTEM.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20141007 ','진현무','컴퓨터정보',2,'A','M',174,65);
Insert into SYSTEM.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20131001 ','김종헌','컴퓨터정보',3,'C','M',170,61);
Insert into SYSTEM.STUDENT (STU_NO,STU_NAME,STU_DEPT,STU_GRADE,STU_CLASS,STU_GENDER,STU_HEIGHT,STU_WEIGHT) values ('20131025 ','옥성우','컴퓨터정보',3,'A','F',172,63);
--------------------------------------------------------
--  DDL for Index SYS_C007429
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C007429" ON "SYSTEM"."STUDENT" ("STU_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table STUDENT
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."STUDENT" ADD PRIMARY KEY ("STU_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
