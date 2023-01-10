CREATE TABLE "ORDER_MAIN" (
	"ORDER_MAIN_NUM"	NUMBER,							/* �ֹ���ȣ */
	"ORDER_MAIN_NAME"	VARCHAR2(600)		NOT NULL,	/* ��ǰ�̸� */
	"ORDER_MAIN_TOTAL"	NUMBER(7)		NOT NULL,		/* �� ���� */
	"PAYMENT"	NUMBER(1)		NOT NULL,				/* ������� */
	"STATUS"	NUMBER(1)	DEFAULT 1	NOT NULL,		/* ��ۻ��� */
	"RECEIVE_NAME"	VARCHAR2(30)		NOT NULL,		/* ������ �̸� */
	"RECEIVE_ZIPCODE"	VARCHAR2(5)		NOT NULL,		/* ������ ������ȣ */
	"RECEIVE_ADDRESS1"	VARCHAR2(90)		NOT NULL,	/* ������ �ּ� */
	"RECEIVE_ADDRESS2"	VARCHAR2(90)		NOT NULL,	/* ������ ���ּ� */
	"RECEIVE_PHONE"	VARCHAR2(15)		NOT NULL,		/* ������ ��ȣ */
	"NOTICE"	VARCHAR2(4000),							/* �޸� */
	"ORDER_MAIN_DATE"	DATE	DEFAULT SYSDATE	NOT NULL,	/* �ֹ���¥ */
	"MODIFY_DATE" DATE,									/* ������¥ */
	"MEM_NUM"	NUMBER		NOT NULL,
	
	CONSTRAINT ORDER_MAIN_PK PRIMARY KEY (ORDER_MAIN_NUM),
	CONSTRAINT ORDER_MAIN_FK FOREIGN KEY (MEM_NUM) REFERENCES MEMBER_DETAIL (MEM_NUM)
);

CREATE TABLE "ORDER_DETAIL" (
	"ORDER_DETAIL_NUM"	NUMBER,						/* ���ֹ���ȣ */
	"PRO_NUM"	NUMBER			NOT NULL,			/* ��ǰ��ȣ */
	"PRO_NAME"	VARCHAR2(50)		NOT NULL,		/* ��ǰ�̸� */
	"PRO_PRICE"	NUMBER(8)		NOT NULL,			/* ��ǰ���� */
	"PRO_TOTAL"	NUMBER(8)		NOT NULL,			/* ��ǰ �� ���� */
	"ORDER_MAIN_COUNT"	NUMBER(7)		NOT NULL,	/* ��ǰ ���� */
	"ORDER_MAIN_NUM"	NUMBER		NOT NULL,		/* �ֹ���ȣ */
	
	CONSTRAINT ORDER_DETAIL_PK PRIMARY KEY (ORDER_DETAIL_NUM),
	CONSTRAINT ORDER_DETAIL_FK FOREIGN KEY (ORDER_MAIN_NUM) REFERENCES ORDER_MAIN (ORDER_MAIN_NUM)
);

CREATE SEQUENCE ORDER_MAIN_SEQ;
CREATE SEQUENCE ORDER_DETAIL_SEQ;