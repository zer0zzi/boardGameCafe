--게임 소개
CREATE TABLE "PRODUCT" (
	"PRO_NUM"	NUMBER		NOT NULL,
	"PRO_NAME"	VARCHAR2(50)		NOT NULL,
	"PRO_PRICE"	NUMBER(6)		NOT NULL,
	"PRO_PICTURE"	VARCHAR2(500)		NOT NULL,
	"PRO_COUNT"	NUMBER(2)		NOT NULL,
	"PRO_LEVEL"	VARCHAR2(10)		NOT NULL,
	CONSTRAINT PRODUCT_PK PRIMARY KEY (PRO_NUM)
);

CREATE SEQUENCE PRODUCT_SEQ;


--게임 상세페이지 리뷰
CREATE TABLE "REVIEW" (
	"REV_NUM"	NUMBER		NOT NULL,
	"MEM_NUM"	NUMBER		NOT NULL,
	"PRO_NUM"	NUMBER		NOT NULL,
	"REV_CONTENT"	VARCHAR2(50)		NOT NULL,
	"REV_STAR"	NUMBER(1)		NOT NULL,
	"REV_DATE"	DATE		NOT NULL,
	CONSTRAINT REVIEW_PK PRIMARY KEY (REV_NUM),
	CONSTRAINT REVIEW_FK FOREIGN KEY (MEM_NUM) REFERENCES MEMBER_DETAIL (MEM_NUM),
	CONSTRAINT REVIEWA_FK FOREIGN KEY (PRO_NUM) REFERENCES PRODUCT (PRO_NUM)
);

CREATE SEQUENCE REVIEW_SEQ;