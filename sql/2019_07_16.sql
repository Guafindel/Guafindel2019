-- adver
ALTER TABLE adver
	DROP CONSTRAINT FK_company_TO_adver; -- company -> adver

-- adver
ALTER TABLE adver
	DROP CONSTRAINT PK_adver; -- adver 기본키

-- adver
DROP TABLE adver;

-- adver
CREATE TABLE adver (
	adver_ID      NUMBER(4)    NOT NULL, -- adver_ID
	company_ID    VARCHAR2(50)  NOT NULL,     -- company_ID
	adver_Title   VARCHAR2(255) NOT NULL, -- adver_Title
	adver_Content LONG         NOT NULL,     -- adver_Content
	adver_Date    DATE         DEFAULT SYSDATE,     -- adver_Date
	adver_Photo   VARCHAR2(150) NOT NULL      -- adver_Photo
);

CREATE SEQUENCE adver_adver_ID_seq;

DROP SEQUENCE adver_adver_ID_seq;

INSERT INTO adver (adver_ID, company_ID, adver_Title, adver_Content, adver_Date, adver_Photo)
VALUES (adver_adver_ID_SEQ.nextval, ?, ?, ?, ?, ?);


-- adver 기본키
CREATE UNIQUE INDEX PK_adver
	ON adver ( -- adver
		adver_ID ASC -- adver_ID
	);

-- adver
ALTER TABLE adver
	ADD
		CONSTRAINT PK_adver -- adver 기본키
		PRIMARY KEY (
			adver_ID -- adver_ID
		);

-- adver
ALTER TABLE adver
	ADD
		CONSTRAINT FK_company_TO_adver -- company -> adver
		FOREIGN KEY (
			company_ID -- company_ID
		)
		REFERENCES company ( -- company
			company_ID -- company_ID
		);


----------------------------------------------------------  
        
-- company
ALTER TABLE company
	DROP CONSTRAINT PK_company; -- company 기본키

-- company
DROP TABLE company;

-- company
CREATE TABLE company (
	company_ID    VARCHAR2(50) NOT NULL, -- company_ID
	company_Pw    VARCHAR2(30) NOT NULL,     -- company_Pw
	company_Name  VARCHAR2(50) NOT NULL,     -- company_Name
	company_Email VARCHAR2(40) NOT NULL,     -- company_Email
	company_Num   VARCHAR2(20) NOT NULL      -- company_Num
);

DROP TABLE company;

-- company 기본키
CREATE UNIQUE INDEX PK_company
	ON company ( -- company
		company_ID ASC -- company_ID
	);

-- company
ALTER TABLE company
	ADD
		CONSTRAINT PK_company -- company 기본키
		PRIMARY KEY (
			company_ID -- company_ID
		);