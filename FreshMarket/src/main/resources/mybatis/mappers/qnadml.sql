
create table qa_board(
qa_id number,
member_id number,
email varchar2(50),
created_at date,
title varchar2(100),
content varchar2(2500),
isshow number,
open number);

create table qa_board_comment(
qa_comment_id number,
qa_id number,
member_id number,
email varchar2(50),
created_at date,
content varchar2(2500),
isshow number);

CREATE SEQUENCE QNA_BOARD_SEQ
    START WITH 1
    INCREMENT BY 1;

		
CREATE SEQUENCE QNA_COMMENT_BOARD_SEQ
    START WITH 1
    INCREMENT BY 1;

    
select * from QA_BOARD;
select * from QA_BOARD_COMMENT;

insert into qa_board values(1,1,'test','2021/04/10','질문질문','질문질문질문',1,1);
insert into qa_board values(2,1,'test','2021/04/10','질문질문11','질문질문질문11',1,1);
insert into qa_board values(3,1,'test','2021/04/10','질문질문22','질문질문질문22',1,1);
insert into qa_board values(4,1,'test','2021/04/10','질문질문33','질문질문질문33',1,1);
insert into qa_board values(5,1,'test','2021/04/10','질문질문44','질문질문질문44',1,1);
insert into qa_board values(6,1,'test','2021/04/10','질문질문55','질문질문질문55',1,1);
insert into qa_board values(7,1,'test','2021/04/10','질문질문66','질문질문질문66',1,0);
insert into qa_board values(QNA_BOARD_SEQ.nextval,1,'test','2021/04/10','질문질문77','질문질문질문77',1,0);

insert into QA_BOARD_COMMENT values(1,1,2,'admin','2021/04/11','답답답',1);
insert into QA_BOARD_COMMENT values(2,3,2,'admin','2021/04/11','답답답',1);
insert into QA_BOARD_COMMENT values(3,4,2,'admin','2021/04/11','답답답',1);
insert into QA_BOARD_COMMENT values(4,5,2,'admin','2021/04/11','답답답',1);
insert into QA_BOARD_COMMENT values(5,6,2,'admin','2021/04/11','답답답',1);
insert into QA_BOARD_COMMENT values(6,7,2,'admin','2021/04/11','답답답',1);
insert into QA_BOARD_COMMENT values(7,8,2,'admin','2021/04/11','답답답',1);

--문의 글 조회
SELECT 	qa_id,member_id,email,created_at,title,content,isshow,open
FROM 		QA_BOARD
WHERE		isshow = 1;

--문의 답글 조회
SELECT 	qa_comment_id,qa_id,member_id,email,created_at,content,isshow
FROM 		QA_BOARD_COMMENT
WHERE		isshow = 1;

--문의 글 쓰기
insert into qa_board values(8,1,'test','2021/04/10','질문질문77','질문질문질문77',1,0);

--글 답글 쓰기
insert into QA_BOARD_COMMENT values(7,8,2,'admin','2021/04/11','답답답',1);

--문의 글 수정하기
update QA_BOARD
set title='이거맛있나요?',content='가격은 얼마인가요?'
WHERE qa_id=1;

--문의 답글 수정하기
update QA_BOARD_COMMENT
set content=?
WHERE		member_id = id? and qa_comment_id=?;

--문의 글 삭제하기
update QA_BOARD
set isshow = 0
WHERE		member_id = ? and qa_id=?;

--문의 답글 삭제하기
update QA_BOARD_COMMENT
set isshow = 0
WHERE		member_id = id? and qa_comment_id=?;

SELECT 	qa_id,member_id,email,created_at,title,content,isshow,open
		FROM 	QA_BOARD
		WHERE	isshow = 1;	
		
		

