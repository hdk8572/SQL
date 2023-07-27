DROP SEQUENCE seq_board_bno;
CREATE SEQUENCE seq_board_bno;
delete from board;

-- DESC MEMBER;
INSERT INTO MEMBER VALUES ('kh1', '11', 'kh1name', 'kh1@a.co.kr')
;
INSERT INTO MEMBER VALUES ('admin', 'admin', 'adminname', 'admin@a.co.kr')
;
INSERT INTO MEMBER VALUES ('biz1', '11', 'bizname', 'biz@a.co.kr')
;

-- DESC BOARD;
--COMMENT ON COLUMN "BOARD"."BNO" IS 'SEQ_BOADRD_BNO  사용';
--COMMENT ON COLUMN "BOARD"."BTITLE" IS '제목';
--COMMENT ON COLUMN "BOARD"."BCONTENT" IS '글내용';
--COMMENT ON COLUMN "BOARD"."BWRITE_DATE" IS '작성시간';
--COMMENT ON COLUMN "BOARD"."MID" IS '작성자';
--COMMENT ON COLUMN "BOARD"."BREF" IS 'BNO=BREF:원본글,BNO<>BREF::답_글';
--COMMENT ON COLUMN "BOARD"."BRE_LEVEL" IS '0:원본글, 1:답글, 2:답답글..';
--COMMENT ON COLUMN "BOARD"."BRE_STEP" IS '0:원본글, 1~N  원본글기준답..글들의순서';
-- 원본글
INSERT INTO BOARD VALUES (SEQ_BOARD_BNO.nextval, 'title1', 'content1', default, 'kh1', SEQ_BOARD_BNO.nextval, 0,0) ;
INSERT INTO BOARD VALUES (SEQ_BOARD_BNO.nextval, 'title2', 'content2', default, 'kh1', SEQ_BOARD_BNO.nextval, 0,0) ;
INSERT INTO BOARD VALUES (SEQ_BOARD_BNO.nextval, 'title3', 'content3', default, 'kh1', SEQ_BOARD_BNO.nextval, 0,0) ;
INSERT INTO BOARD VALUES (SEQ_BOARD_BNO.nextval, 'title4', 'content4', default, 'kh1', SEQ_BOARD_BNO.nextval, 0,0) ;

-- 원1 - 답글
INSERT INTO BOARD VALUES (SEQ_BOARD_BNO.nextval, '1-답', '1-답', default, 'kh1', 1, 1, 1) ;
-- 원1- 5답-답답글
INSERT INTO BOARD VALUES (SEQ_BOARD_BNO.nextval, '5-답', '5-답', default, 'kh1', 1, 2, 2) ;
update board set bre_step = bre_step + 1 where bre_step > 0;
-- 원1 - 답글
INSERT INTO BOARD VALUES (SEQ_BOARD_BNO.nextval, '1-답', '1-답', default, 'kh1', 1, 1, 1) ;
-- 원1 - 7-답답글
update board set bre_step = bre_step + 1 where bre_step > 1; -- 
INSERT INTO BOARD VALUES (SEQ_BOARD_BNO.nextval, '1-답', '1-답', default, 'kh1', 1, 2, 2) ;

------ UI 설계시 UI007 게시글 목록
-- n글의 답글
update board set bre_step = bre_step + 1
    where bre_step > (select bre_step from board where bno='&n글')
        and bref = (select bre3 from board where bno='&n글')
; 
insert into board2 values (SEQ_BOARD_BNO.nextval, '&n글 제목', '&n글 내용', default, 'kh1'
    , (select bref from board where bno='&n글')
    , (select bre_level+1 from board where bno='&n글')
    , (select bre_step+1 from board where bno='&n글')
    );

desc board;

select * from board order by bref desc, bre_level asc;
commit;


