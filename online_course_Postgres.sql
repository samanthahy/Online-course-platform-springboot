DROP TABLE IF EXISTS CP_ORDER;
DROP TABLE IF EXISTS CP_ORDER_COURSE;

DROP TABLE IF EXISTS CP_COURSE;
DROP TABLE IF EXISTS CP_SECTION;
DROP TABLE IF EXISTS CP_LECTURE;
DROP TABLE IF EXISTS CP_QUIZ;
DROP TABLE IF EXISTS CP_QUIZ_QUESTION;
DROP TABLE IF EXISTS CP_NOTE;

DROP TABLE IF EXISTS CP_USER;
DROP TABLE IF EXISTS CP_USER_DETAIL;
DROP TABLE IF EXISTS CP_PROFILE;
DROP TABLE IF EXISTS CP_USER_PROFILE;

DROP TABLE IF EXISTS CP_WISHLIST;
DROP TABLE IF EXISTS CP_ENROLLMENT;

DROP TABLE IF EXISTS CP_CART;
DROP TABLE IF EXISTS CP_SHOPPING_SESSION;
DROP TABLE IF EXISTS CP_DISCOUNT;
DROP TABLE IF EXISTS CP_PAYMENT;
DROP TABLE IF EXISTS CP_REFUND;
DROP TABLE IF EXISTS CP_REVIEW;



DROP SEQUENCE IF EXISTS CP_ORDER_SEQ;
DROP SEQUENCE IF EXISTS CP_ORDER_COURSE_SEQ;
DROP SEQUENCE IF EXISTS CP_COURSE_SEQ;
DROP SEQUENCE IF EXISTS CP_SECTION_SEQ;
DROP SEQUENCE IF EXISTS CP_LECTURE_SEQ;
DROP SEQUENCE IF EXISTS CP_QUIZ_SEQ;
DROP SEQUENCE IF EXISTS CP_QUIZ_QUESTION_SEQ;
DROP SEQUENCE IF EXISTS CP_NOTE_SEQ;
DROP SEQUENCE IF EXISTS CP_USER_SEQ;
DROP SEQUENCE IF EXISTS CP_USER_DETAIL_SEQ;
DROP SEQUENCE IF EXISTS CP_PROFILE_SEQ;
DROP SEQUENCE IF EXISTS CP_USER_PROFILE_SEQ;
DROP SEQUENCE IF EXISTS CP_CART_SEQ;
DROP SEQUENCE IF EXISTS CP_SHOPPING_SESSION_SEQ;
DROP SEQUENCE IF EXISTS CP_DISCOUNT_SEQ;
DROP SEQUENCE IF EXISTS CP_PAYMENT_SEQ;
DROP SEQUENCE IF EXISTS CP_REFUND_SEQ;
DROP SEQUENCE IF EXISTS CP_REVIEW_SEQ;
--------------------------------------------------------
--  DDL for Table CP_ORDER
--------------------------------------------------------

  CREATE TABLE CP_ORDER
   (ID int, 
  PURCHASE_DATE DATE, 
  USER_ID int,
  TOTAL NUMERIC(5,2)
   );
--------------------------------------------------------
--  DDL for Table CP_ORDER_COURSE
--------------------------------------------------------

  CREATE TABLE CP_ORDER_COURSE
   (ID int, 
  ORDER_ID int, 
  COURSE_ID int
   );

--------------------------------------------------------
--  DDL for Table CP_COURSE
--------------------------------------------------------

  CREATE TABLE CP_COURSE 
   (  ID int, 
  NAME VARCHAR(255) NOT NULL,
  INSTRUCTOR_ID int,
  OVERVIEW TEXT, 
  DESCRIPTION TEXT,
  RATING NUMERIC(2, 1) DEFAULT 0.0,
  CATEGORY VARCHAR(255),
  LEVEL VARCHAR(30),
  PRICE NUMERIC(5, 2), 
  IMAGE VARCHAR(255),
  DISCOUNT int
   );


--------------------------------------------------------
--  DDL for Table CP_SECTION
--------------------------------------------------------

  CREATE TABLE CP_SECTION
   (  ID int, 
  TITLE VARCHAR(255) NOT NULL,
  COURSE_ID int
   );

--------------------------------------------------------
--  DDL for Table CP_LECTURE
--------------------------------------------------------

  CREATE TABLE CP_LECTURE
   ( ID int,
  SECTION_ID int,
  TITLE VARCHAR(255) NOT NULL,
  VIDEO_URL VARCHAR(255),
  DURATION INTERVAL
   );

--------------------------------------------------------
--  DDL for Table CP_QUIZ
--------------------------------------------------------
  
  CREATE TABLE CP_QUIZ
   (  ID int, 
  SECTION_ID int,
  TITLE VARCHAR(255) NOT NULL
   );


--------------------------------------------------------
--  DDL for Table CP_QUIZ_QUESTION
--------------------------------------------------------

  CREATE TABLE CP_QUIZ_QUESTION
   (  ID int,
  QUIZ_ID int, 
  QUESTION VARCHAR(255),
  CHOICE1 VARCHAR(255),
  CHOICE2 VARCHAR(255),
  CHOICE3 VARCHAR(255),
  ANSWER int CHECK (ANSWER IN (1,2,3))
   );

--------------------------------------------------------
--  DDL for Table CP_NOTE
--------------------------------------------------------

CREATE TABLE CP_NOTE
   (  ID int,
  USER_ID int,
  LECTURE_ID int,
  NOTE_TIME interval NOT NULL,
  CONTENT TEXT NOT NULL,
  CREATE_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  UPDATE_TIME TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   );

--------------------------------------------------------
--  DDL for Table CP_USER
--------------------------------------------------------

  CREATE TABLE CP_USER
   (  ID int,
    USERNAME VARCHAR(100), 
  PASSWORD VARCHAR(100),
  EMAIL VARCHAR(100) NOT NULL
   );

--------------------------------------------------------
--  DDL for Table CP_USER_DETAIL
--------------------------------------------------------

  CREATE TABLE CP_USER_DETAIL 
   (ID int, 
  NAME VARCHAR(100), 
  PHONE VARCHAR(20), 
  DESCRIPTION TEXT,
  PERSONAL_LINK VARCHAR(100),
  IMAGE VARCHAR(255),
  USER_ID int,
  PAYMENT_ID int
   );
--------------------------------------------------------
--  DDL for Table CP_USER_PROFILE
--------------------------------------------------------

  CREATE TABLE CP_USER_PROFILE 
   (ID int, 
  USER_ID int, 
  PROFILE_ID int
   );
--------------------------------------------------------
--  DDL for Table CP_PROFILE
--------------------------------------------------------

  CREATE TABLE CP_PROFILE 
   (ID int, 
  TYPE VARCHAR(30)
   );

-------------------------------------------------------
--  DDL for Table CP_WISHLIST
--------------------------------------------------------

  CREATE TABLE CP_WISHLIST  
   (USER_ID int, 
   COURSE_ID int
   );


-------------------------------------------------------
--  DDL for Table CP_ENROLLMENT
--------------------------------------------------------

  CREATE TABLE CP_ENROLLMENT  
   (  USER_ID int, 
   COURSE_ID int,
   PROGRESS NUMERIC(4,2) DEFAULT 0.00,
   ENROLL_DATE DATE,
   REFUND int
   );

-------------------------------------------------------
--  DDL for Table CP_CART
--------------------------------------------------------

  CREATE TABLE CP_CART 
   (ID int, 
   SHOPPING_SESSION_ID int,
   COURSE_ID int
   );

-------------------------------------------------------
--  DDL for Table CP_SHOPPING_SESSION
--------------------------------------------------------

  CREATE TABLE CP_SHOPPING_SESSION  
   (ID int, 
   USER_ID int,
   TOTAL NUMERIC(5, 2)
   );

-------------------------------------------------------
--  DDL for Table CP_DISCOUNT
--------------------------------------------------------

  CREATE TABLE CP_DISCOUNT  
   (ID int, 
   NAME VARCHAR(100),
   DESCRIPTION VARCHAR(100),
   DISCOUNT_PERCENT DECIMAL
   );

-------------------------------------------------------
--  DDL for Table CP_PAYMENT
--------------------------------------------------------

  CREATE TABLE CP_PAYMENT
   (ID int, 
   USER_ID int,
   TYPE VARCHAR(30),
   PROVIDER VARCHAR(100),
   ACCOUNT_NO VARCHAR(50),
   EXPIRY DATE
   );

-------------------------------------------------------
--  DDL for Table CP_REFUND
--------------------------------------------------------

  CREATE TABLE CP_REFUND
  
   (ID int, 
   REQUEST BOOLEAN,
   STATUS VARCHAR(20),
   DESCRIPTION VARCHAR(255)
   );

-------------------------------------------------------
--  DDL for Table CP_REVIEW
--------------------------------------------------------

  CREATE TABLE CP_REVIEW
  
   (ID int, 
   COURSE_ID int,
   STUDENT_ID int,
   RATING int DEFAULT 0,
   CONTENT TEXT NOT NULL
   );

--------------------------------------------------------
--  DDL for Sequence CP_ORDER_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.CP_ORDER_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.CP_ORDER_SEQ
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Sequence MSI_ORDER_PRODUCT_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.CP_ORDER_COURSE_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.CP_ORDER_COURSE_SEQ
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Sequence CP_COURSE_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.CP_COURSE_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.CP_COURSE_SEQ
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Sequence CP_SECTION_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.CP_SECTION_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.CP_SECTION_SEQ
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Sequence CP_LECTURE_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.CP_LECTURE_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.CP_LECTURE_SEQ
    OWNER TO postgres;

--------------------------------------------------------
--  DDL for Sequence CP_QUIZ_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.CP_QUIZ_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.CP_QUIZ_SEQ
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Sequence CP_QUIZ_QUESTION_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.CP_QUIZ_QUESTION_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.CP_QUIZ_QUESTION_SEQ
    OWNER TO postgres;

--------------------------------------------------------
--  DDL for Sequence CP_NOTE_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.CP_NOTE_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.CP_NOTE_SEQ
    OWNER TO postgres;

--------------------------------------------------------
--  DDL for Sequence CP_USER_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.CP_USER_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.CP_USER_SEQ
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Sequence CP_USER_DETAIL_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.CP_USER_DETAIL_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.CP_USER_DETAIL_SEQ
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Sequence CP_PROFILE_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.CP_PROFILE_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.CP_PROFILE_SEQ
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Sequence CP_USER_PROFILE_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.CP_USER_PROFILE_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.CP_USER_PROFILE_SEQ
    OWNER TO postgres;

--------------------------------------------------------
--  DDL for Sequence CP_CART_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.CP_CART_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.CP_CART_SEQ
    OWNER TO postgres;

--------------------------------------------------------
--  DDL for Sequence CP_SHOPPING_SESSION_SEQ;
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.CP_SHOPPING_SESSION_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.CP_SHOPPING_SESSION_SEQ
    OWNER TO postgres;

--------------------------------------------------------
--  DDL for Sequence CP_DISCOUNT_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.CP_DISCOUNT_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.CP_DISCOUNT_SEQ
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Sequence CP_PAYMENT_SEQ
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.CP_PAYMENT_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.CP_PAYMENT_SEQ
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Sequence CP_REFUND_SEQ;
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.CP_REFUND_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.CP_REFUND_SEQ
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Sequence CP_REVIEW_SEQ;
--------------------------------------------------------
CREATE SEQUENCE IF NOT EXISTS public.CP_REVIEW_SEQ
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

ALTER SEQUENCE public.CP_REVIEW_SEQ
    OWNER TO postgres;

--------------------------------------------------------
--  DDL for Index CP_ORDER_PK
--------------------------------------------------------
ALTER TABLE CP_ORDER ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index CP_ORDER_COURSE_PK
--------------------------------------------------------
ALTER TABLE CP_ORDER_COURSE ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index CP_COURSE_PK
--------------------------------------------------------
ALTER TABLE CP_COURSE ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index CP_SECTION_PK
--------------------------------------------------------
ALTER TABLE CP_SECTION ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index CP_LECTURE_PK
--------------------------------------------------------
ALTER TABLE CP_LECTURE ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index CP_QUIZ_PK
--------------------------------------------------------
ALTER TABLE CP_QUIZ ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index CP_QUIZ_QUESTION_PK
--------------------------------------------------------
ALTER TABLE CP_QUIZ_QUESTION ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index CP_NOTE_PK
--------------------------------------------------------
ALTER TABLE CP_NOTE ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index CP_USER_PK
--------------------------------------------------------
ALTER TABLE CP_USER ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index CP_USER_DETAIL_PK
--------------------------------------------------------
ALTER TABLE CP_USER_DETAIL ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index CP_PROFILE_PK
--------------------------------------------------------
ALTER TABLE CP_PROFILE ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index CP_USER_PROFILE_PK
--------------------------------------------------------
ALTER TABLE CP_USER_PROFILE ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index CP_WISHLIST_PK
--------------------------------------------------------
ALTER TABLE CP_WISHLIST ADD PRIMARY KEY (USER_ID, COURSE_ID);
--------------------------------------------------------
--  DDL for Index CP_ENROLLMENT_PK
--------------------------------------------------------
ALTER TABLE CP_ENROLLMENT ADD PRIMARY KEY (USER_ID, COURSE_ID);
--------------------------------------------------------
--  DDL for Index CP_CART_PK
--------------------------------------------------------
ALTER TABLE CP_CART ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index CP_SHOPPING_SESSION_PK
--------------------------------------------------------
ALTER TABLE CP_SHOPPING_SESSION ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index CP_DISCOUNT_PK
--------------------------------------------------------
ALTER TABLE CP_DISCOUNT ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index CP_PAYMENT_PK
--------------------------------------------------------
ALTER TABLE CP_PAYMENT ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index CP_REFUND_PK
--------------------------------------------------------
ALTER TABLE CP_REFUND ADD PRIMARY KEY (ID);
--------------------------------------------------------
--  DDL for Index CP_REVIEW_PK
--------------------------------------------------------
ALTER TABLE CP_REVIEW ADD PRIMARY KEY (ID);

--------------------------------------------------------
--  DDL for Trigger Function CP_ORDER_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.ORDER_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   New.id:=nextval('CP_ORDER_SEQ');
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.ORDER_ID()
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Trigger Function CP_ORDER_COURSE_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.ORDER_COURSE_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   New.id:=nextval('CP_ORDER_COURSE_SEQ');
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.ORDER_COURSE_ID()
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Trigger Function CP_COURSE_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.COURSE_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   New.id:=nextval('CP_COURSE_SEQ');
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.COURSE_ID()
    OWNER TO postgres;

--------------------------------------------------------
--  DDL for Trigger Function CP_SECTION_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.SECTION_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   New.id:=nextval('CP_SECTION_SEQ');
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.SECTION_ID()
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Trigger Function CP_LECTURE_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.LECTURE_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   New.id:=nextval('CP_LECTURE_SEQ');
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.LECTURE_ID()
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Trigger Function CP_QUIZ_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.QUIZ_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   New.id:=nextval('CP_QUIZ_SEQ');
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.QUIZ_ID()
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Trigger Function CP_QUIZ_QUESTION_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.QUIZ_QUESTION_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   New.id:=nextval('CP_QUIZ_QUESTION_SEQ');
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.QUIZ_QUESTION_ID()
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Trigger Function CP_NOTE_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.NOTE_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   New.id:=nextval('CP_NOTE_SEQ');
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.NOTE_ID()
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Trigger Function CP_USER_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.USER_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   New.id:=nextval('CP_USER_SEQ');
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.USER_ID()
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Trigger Function CP_USER_DETAIL_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.USER_DETAIL_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   New.id:=nextval('CP_USER_DETAIL_SEQ');
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.USER_DETAIL_ID()
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Trigger Function CP_PROFILE_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.PROFILE_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   IF New.id IS null THEN
   New.id:=nextval('CP_PROFILE_SEQ');
   END IF;
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.PROFILE_ID()
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Trigger Function CP_USER_PROFILE_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.USER_PROFILE_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   New.id:=nextval('CP_USER_PROFILE_SEQ');
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.USER_PROFILE_ID()
    OWNER TO postgres;

--------------------------------------------------------
--  DDL for Trigger Function CP_CART_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.CART_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   IF New.id IS null THEN
   New.id:=nextval('CP_CART_SEQ');
   END IF;
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.CART_ID()
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Trigger Function CP_SHOPPING_SESSION_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.SHOPPING_SESSION_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   IF New.id IS null THEN
   New.id:=nextval('CP_SHOPPING_SESSION_SEQ');
   END IF;
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.SHOPPING_SESSION_ID()
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Trigger Function CP_DISCOUNT_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.DISCOUNT_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   IF New.id IS null THEN
   New.id:=nextval('CP_DISCOUNT_SEQ');
   END IF;
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.DISCOUNT_ID()
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Trigger Function CP_PAYMENT_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.PAYMENT_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   IF New.id IS null THEN
   New.id:=nextval('CP_PAYMENT_SEQ');
   END IF;
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.PAYMENT_ID()
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Trigger Function CP_REFUND_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.REFUND_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   IF New.id IS null THEN
   New.id:=nextval('CP_REFUND_SEQ');
   END IF;
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.REFUND_ID()
    OWNER TO postgres;
--------------------------------------------------------
--  DDL for Trigger Function CP_REVIEW_TRG
--------------------------------------------------------
CREATE OR REPLACE FUNCTION public.REVIEW_ID()
    RETURNS trigger
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE NOT LEAKPROOF
AS $BODY$
 BEGIN
   IF New.id IS null THEN
   New.id:=nextval('CP_REVIEW_SEQ');
   END IF;
   Return NEW;
 END;
 
$BODY$;

ALTER FUNCTION public.REVIEW_ID()
    OWNER TO postgres;

--------------------------------------------------------
--  DDL for Trigger Function CP_ORDER_TRG
--------------------------------------------------------
CREATE TRIGGER cp_order_id_gen_trg
    BEFORE INSERT
    ON public.CP_ORDER
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.order_id();

--------------------------------------------------------
--  DDL for Trigger Function CP_ORDER_COURSE_TRG
--------------------------------------------------------
CREATE TRIGGER cp_order_course_id_gen_trg
    BEFORE INSERT
    ON public.CP_ORDER_COURSE
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.order_course_id();

--------------------------------------------------------
--  DDL for Trigger Function CP_COURSE_TRG
--------------------------------------------------------
CREATE TRIGGER cp_course_id_gen_trg
    BEFORE INSERT
    ON public.CP_COURSE
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.course_id();

--------------------------------------------------------
--  DDL for Trigger Function CP_SECTION_TRG
--------------------------------------------------------
CREATE TRIGGER cp_section_id_gen_trg
    BEFORE INSERT
    ON public.CP_SECTION
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.section_id();

--------------------------------------------------------
--  DDL for Trigger Function CP_LECTURE_TRG
--------------------------------------------------------
CREATE TRIGGER cp_lecture_id_gen_trg
    BEFORE INSERT
    ON public.CP_LECTURE
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.lecture_id();

--------------------------------------------------------
--  DDL for Trigger Function CP_QUIZ_TRG
--------------------------------------------------------
CREATE TRIGGER cp_quiz_id_gen_trg
    BEFORE INSERT
    ON public.CP_QUIZ
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.quiz_id();

--------------------------------------------------------
--  DDL for Trigger Function CP_QUIZ_QUESTION_TRG
--------------------------------------------------------
CREATE TRIGGER cp_quiz_id_gen_trg
    BEFORE INSERT
    ON public.CP_QUIZ_QUESTION
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.quiz_question_id();

--------------------------------------------------------
--  DDL for Trigger Function CP_USER_TRG
--------------------------------------------------------
CREATE TRIGGER cp_user_id_gen_trg
    BEFORE INSERT
    ON public.CP_USER
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.user_id();

--------------------------------------------------------
--  DDL for Trigger Function CP_USER_DETAIL_TRG
--------------------------------------------------------
CREATE TRIGGER cp_user_detail_id_gen_trg
    BEFORE INSERT
    ON public.CP_USER_DETAIL
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.user_detail_id();

--------------------------------------------------------
--  DDL for Trigger Function CP_PROFILE_TRG
--------------------------------------------------------
CREATE TRIGGER cp_profile_id_gen_trg
    BEFORE INSERT
    ON public.CP_PROFILE
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.profile_id();

--------------------------------------------------------
--  DDL for Trigger Function CP_USER_PROFILE_TRG
--------------------------------------------------------
CREATE TRIGGER cp_user_profile_id_gen_trg
    BEFORE INSERT
    ON public.CP_USER_PROFILE
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.user_profile_id();

--------------------------------------------------------
--  DDL for Trigger Function CP_CART_TRG
--------------------------------------------------------
CREATE TRIGGER cp_cart_id_gen_trg
    BEFORE INSERT
    ON public.CP_CART
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.cart_id();

--------------------------------------------------------
--  DDL for Trigger Function CP_SHOPPING_SESSION_TRG
--------------------------------------------------------
CREATE TRIGGER cp_shopping_session_id_gen_trg
    BEFORE INSERT
    ON public.CP_SHOPPING_SESSION
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.shopping_session_id();

--------------------------------------------------------
--  DDL for Trigger Function CP_DISCOUNT_TRG
--------------------------------------------------------
CREATE TRIGGER cp_discount_id_gen_trg
    BEFORE INSERT
    ON public.CP_DISCOUNT
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.discount_id();

--------------------------------------------------------
--  DDL for Trigger Function CP_REFUND_TRG
--------------------------------------------------------
CREATE TRIGGER cp_refund_id_gen_trg
    BEFORE INSERT
    ON public.CP_REFUND
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.refund_id();

--------------------------------------------------------
--  DDL for Trigger Function CP_REVIEW_TRG
--------------------------------------------------------
CREATE TRIGGER cp_review_id_gen_trg
    BEFORE INSERT
    ON public.CP_REVIEW
    FOR EACH ROW
    WHEN (New.id is null)
    EXECUTE FUNCTION public.review_id();
------------------------------------------------------------
------------------------------------------------------------


Insert into CP_ORDER (ID,PURCHASE_DATE,USER_ID,TOTAL) values (1,'2022-02-22',2,14.99);
Insert into CP_ORDER (ID,PURCHASE_DATE,USER_ID,TOTAL) values (2,'2022-02-23',1,18.99);
Insert into CP_ORDER (ID,PURCHASE_DATE,USER_ID,TOTAL) values (3,'2022-02-25',3,32.98);


Insert into CP_ORDER_COURSE (ID,ORDER_ID,COURSE_ID) values (1,1,1);
Insert into CP_ORDER_COURSE (ID,ORDER_ID,COURSE_ID) values (2,2,3);
Insert into CP_ORDER_COURSE (ID,ORDER_ID,COURSE_ID) values (3,3,2);
Insert into CP_ORDER_COURSE (ID,ORDER_ID,COURSE_ID) values (4,3,4);


Insert into CP_COURSE (ID,NAME,INSTRUCTOR_ID,OVERVIEW,DESCRIPTION,RATING,CATEGORY,LEVEL,PRICE,IMAGE,DISCOUNT) values (1,'100 Days of Code:The Complete Python Pro Bootcamp for 2023',11,'Master Python by building 100 projects in 100 days. Learn data science, automation, build websites, games and apps!
You will master the Python programming language by building 100 unique projects over 100 days.
You will learn automation, game, app and web development, data science and machine learning all using Python.
You will be able to program in Python professionally','Welcome to the 100 Days of Code - The Complete Python Pro Bootcamp, the only course you need to learn to code with Python. With over 500,000 5 STAR reviews and a 4.8 average, my courses are some of the HIGHEST RATED courses in the history of Udemy!  
100 days, 1 hour per day, learn to build 1 project per day, this is how you master Python.
At 60+ hours, this Python course is without a doubt the most comprehensive Python course available anywhere online. Even if you have zero programming experience, this course will take you from beginner to professional. Here/''s why: The course is taught by the lead instructor at the App Brewery, London/''s best in-person programming Bootcamp.
The course has been updated to be 2023 ready and you/''ll be learning the latest tools and technologies used at large companies such as Apple, Google and Netflix.
This course doesn/''t cut any corners, there are beautiful animated explanation videos and tens of real-world projects which you will get to build. e.g. Tinder auto swiper, Snake game, Blog Website, LinkedIn Auto Submit Job Application
The curriculum was developed over a period of 2 years, with comprehensive student testing and feedback.
We/''ve taught over 600,000 students how to code and many have gone on to change their lives by becoming professional developers or starting their own tech startup.
You/''ll save yourself over $12,000 by enrolling, and still get access to the same teaching materials and learn from the same instructor and curriculum as our in-person programming Bootcamp.
The course is constantly updated with new content, with new projects and modules determined by students - that/''s you!
We/''ll take you step-by-step through engaging video tutorials and teach you everything you need to know to succeed as a Python developer.
The course includes over 65 hours of HD video tutorials and builds your programming knowledge while making real-world Python projects.',4.7, 'Programming Language','advanced',14.99,'https://miro.medium.com/v2/resize:fit:1400/1*UbJL966TZmMTnnn7EVeS8g.jpeg',null);

Insert into CP_COURSE (ID,NAME,INSTRUCTOR_ID,OVERVIEW,DESCRIPTION,RATING,CATEGORY,LEVEL,PRICE,IMAGE,DISCOUNT) values (2,'System Design Interview Guide for Software Architecture',12,'Learn to code and become a Web Developer in 2023 with HTML, CSS, Javascript, React, Node.js, Machine Learning & more!
Skills that will allow you to apply for jobs like: Web Developer, Software Developer, Front End Developer, Javascript Developer, and Full Stack Developer
Learn modern technologies that are ACTUALLY being used behind tech companies in 2023
Build 10+ real world Web Development projects you can show off','Are you preparing for a System Design interview? Do you want to learn the best practices and techniques for designing scalable and distributed systems? Look no further!
Our course on System Design is designed to give you a comprehensive understanding of key concepts and frameworks to help you ace your interview and excel in your career.
You should go through this course in five scenarios:
1.If you have a System Design interview coming up and want a quick crash course.
2.To learn about Software Architecture, Data modeling, Distributed systems, Databases, Microservices based architecture, and Cloud architecture.
3.If you are designing a new system at work, and want to make sure you get it right.
4.If you want to look at some case studies of how some of FAANGs and other companies have built their systems.
5.Look at solutions to some of the most common Interview questions
As part of this course, we/''ll go through some of the conceptual things, some do/''s and don/''ts, and most importantly we/''ll be looking at some of the biggest systems out there and how you could design those. There is a good probability that your next interview has one of these questions either exactly, or with some small variation.',4.4, 'System Design Interview','intermediate',14.99,'https://img-c.udemycdn.com/course/750x422/4105414_eb61.jpg',null);

Insert into CP_COURSE (ID,NAME,INSTRUCTOR_ID,OVERVIEW,DESCRIPTION,RATING,CATEGORY,LEVEL,PRICE,IMAGE,DISCOUNT) values (3,'Angular - The Complete Guide (2023 Edition)
',13,'Master Angular (formerly "Angular 2") and build awesome, reactive web apps with the successor of Angular.js','Join the most comprehensive and bestselling Angular course on Udemy and learn all about this amazing framework from the ground up, in great depth!
This course starts from scratch, you neither need to know Angular 1 nor Angular 2!
From Setup to Deployment, this course covers it all! You/''ll learn all about Components, Directives, Services, Forms, Http Access, Authentication, Optimizing an Angular App with Modules and Offline Compilation and much more - and in the end: You/''ll learn how to deploy an application!
But that/''s not all! This course will also show you how to use the Angular CLI and feature a complete project, which allows you to practice the things learned throughout the course!
And if you do get stuck, you benefit from an extremely fast and friendly support - both via direct messaging or discussion. You have my word! ;-)
Angular is one of the most modern, performance-efficient and powerful frontend frameworks you can learn as of today. It allows you to build great web apps which offer awesome user experiences! Learn all the fundamentals you need to know to get started developing Angular applications right away.',4.6, 'Web Development Framework','intermediate',18.99,'https://img-c.udemycdn.com/course/750x422/1247828_32bb.jpg',null);

Insert into CP_COURSE (ID,NAME,INSTRUCTOR_ID,OVERVIEW,DESCRIPTION,RATING,CATEGORY,LEVEL,PRICE,IMAGE,DISCOUNT) values (4,'The Ultimate React Course 2023',14,'Master modern React from beginner to advanced! Context API, React Query, Redux Toolkit, Tailwind, advanced patterns
Become an advanced, confident, and modern React developer from scratch
Build 8+ beautiful projects, including one HUGE professional real-world app
Become job-ready by working with libraries and tools used in professional projects','In 2023, React is still the #1 skill to learn if you want to become a successful front-end developer!
But it can be hard. There are so many moving parts, so many different libraries, so many tutorials out there.
That/''s why you came here... And you came to the right place! This is THE ultimate React course for 2023 and beyond.
A practice-heavy approach to master React by building polished apps, backed up by diagrams, theory, and looks under the hood of React.
The all-in-one package that takes you from zero to truly understanding React and building modern, powerful, and professional web applications.
Real projects. Real explanations. Real React.',4.9, 'Web Development Framework','intermediate',16.99,'https://img-b.udemycdn.com/course/480x270/4471614_361e_5.jpg',null);


Insert into CP_SECTION (ID,TITLE,COURSE_ID) values (1,'Day1-Beginner-Working with Variables in Python to Manage Data',1);
Insert into CP_SECTION (ID,TITLE,COURSE_ID) values (2,'Introduction',2);


Insert into CP_LECTURE (ID,SECTION_ID,TITLE,VIDEO_URL,DURATION) values (1,1,'Where you/''re going to get from this course',null,INTERVAL '3 minutes 27 seconds');
Insert into CP_LECTURE (ID,SECTION_ID,TITLE,VIDEO_URL,DURATION) values (2,2,'Introduction',null,INTERVAL '32 seconds');


Insert into CP_QUIZ (ID,SECTION_ID,TITLE) values (1,1,'Variable Naming Quiz');
Insert into CP_QUIZ_QUESTION (ID,QUIZ_ID,QUESTION,CHOICE1,CHOICE2,CHOICE3,ANSWER) values (1,1,'Which of the following is Python reserved keyword','None','default','class',3);


Insert into CP_NOTE (ID,USER_ID,LECTURE_ID,NOTE_TIME,CONTENT,CREATE_TIME,UPDATE_TIME) values (1,1,1,INTERVAL '49 seconds','Web Scraping','2022-02-24 13:56:20.00 PDT',null);


Insert into CP_USER (ID,USERNAME,PASSWORD,EMAIL) values (1, 'admin','$2a$11$aL.ou06hFDE1p23WLTf6..yeq879FxCWZEE8ATEzkU/lw/Utaut2m','admin@gmail.com');
Insert into CP_USER (ID,USERNAME,PASSWORD,EMAIL) values (2,'student','$2a$11$D031sn4yBKa8m3KmUc.fGuvjCwwyadyrVgfU3SH23McMenLj9chF.','student@hotmail.com');
Insert into CP_USER (ID,USERNAME,PASSWORD,EMAIL) values (3, 'instructor','$2a$11$xl.dxghxe1js92tQdT57s.jzstyjHCdxZgeEx7d45jnx/hgajkkum','instructor@hotmail.com');



Insert into CP_USER_PROFILE (ID,USER_ID,PROFILE_ID) values (1,1,1);
Insert into CP_USER_PROFILE (ID,USER_ID,PROFILE_ID) values (2,2,2);
Insert into CP_USER_PROFILE (ID,USER_ID,PROFILE_ID) values (3,3,3);


Insert into CP_PROFILE (ID,TYPE) values (1,'ROLE_ADMIN');
Insert into CP_PROFILE (ID,TYPE) values (2,'ROLE_STUDENT');
Insert into CP_PROFILE (ID,TYPE) values (3,'ROLE_INSTRUCTOR');


Insert into CP_WISHLIST (USER_ID, COURSE_ID) values (2,1);
Insert into CP_WISHLIST (USER_ID, COURSE_ID) values (2,3);


Insert into CP_ENROLLMENT (USER_ID, COURSE_ID,PROGRESS,ENROLL_DATE,REFUND) values (2,1,20.50,'2022-02-22',null);
Insert into CP_ENROLLMENT (USER_ID, COURSE_ID,PROGRESS,ENROLL_DATE,REFUND) values (1,3,7.00,'2022-02-23',null);
Insert into CP_ENROLLMENT (USER_ID, COURSE_ID,PROGRESS,ENROLL_DATE,REFUND) values (3,2,5.00,'2022-02-24',null);
Insert into CP_ENROLLMENT (USER_ID, COURSE_ID,PROGRESS,ENROLL_DATE,REFUND) values (3,4,37.50,'2022-02-24',null);


Insert into CP_DISCOUNT (ID,NAME,DESCRIPTION,DISCOUNT_PERCENT) values (1,'Time-limited Promotion', 'All web development courses get reduced rate 10%',0.9);
Insert into CP_REFUND (ID,REQUEST,STATUS,DESCRIPTION) values (1,true,'pending','The course is too difficult to me for now, I want to get my money back!');


Insert into CP_REVIEW (ID,COURSE_ID,STUDENT_ID,RATING, CONTENT) values (1,1, 2, 5,'It almost like having someone pour out an under-the-carpet knowledge in full. Angela does it for the best of her students. Someone I would be proud to verbalize as my python instructor anywhere, anytime.')

