-- 테이블 삭제
DROP TABLE PROCEEDING;
DROP TABLE PROJECT;
DROP TABLE EMPLOYEE;
DROP TABLE DEPARTMENT;

-- 부서 테이블 생성
CREATE TABLE DEPARTMENT(
    DEPT_NO       VARCHAR2(15 BYTE) NOT NULL,
    DEPT_NAME     VARCHAR2(30 BYTE),
    DEPT_LOCATION VARCHAR2(50 BYTE),
    CONSTRAINT PK_DEPARTMENT PRIMARY KEY(DEPT_NO)
);

-- 사원 테이블 생성
CREATE TABLE EMPLOYEE(
    EMP_NO    NUMBER             NOT NULL,
    DEPT_NO   VARCHAR2(15 BYTE),
    POSITION  CHAR(10 BYTE),
    NAME      VARCHAR2(15 BYTE),
    HIRE_DATE DATE,
    SALARY    NUMBER,
    CONSTRAINT PK_EMPLOYEE PRIMARY KEY(EMP_NO),
    CONSTRAINT FK_EMPLOYEE_DEPARTMENT FOREIGN KEY(DEPT_NO) REFERENCES DEPARTMENT(DEPT_NO)
);

-- 프로젝트 테이블 생성
CREATE TABLE PROJECT(
    PJT_NO     NUMBER            NOT NULL,
    PJT_NAME   VARCHAR2(30 BYTE),
    BEGIN_DATE DATE,
    END_DATE   DATE,
    CONSTRAINT PK_PROJECT PRIMARY KEY(PJT_NO)
);

-- 프로젝트진행 테이블 생성
CREATE TABLE PROCEEDING(
    PCD_NO    NUMBER NOT NULL,
    EMP_NO    NUMBER,
    PJT_NO    NUMBER,
    PJT_STATE NUMBER NOT NULL,
    CONSTRAINT PK_PROCEEDING PRIMARY KEY(PCD_NO),
    CONSTRAINT FK_PROCEEDING_EMPLOYEE FOREIGN KEY(EMP_NO) REFERENCES EMPLOYEE(EMP_NO),
    CONSTRAINT FK_PROCEEDING_PROJECT FOREIGN KEY(PJT_NO) REFERENCES PROJECT(PJT_NO)
);