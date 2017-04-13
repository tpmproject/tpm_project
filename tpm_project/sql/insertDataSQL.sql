--회원 테이블 (회원 idx, 회원 ID(email), 비밀번호, 이름, 성별, 전화번호, 사진 이미지 이름, 테마)
insert into tpm_member values(member_idx.nextval,'abm794@naver.com','1234','안병민','남자','010-999-3331','img',0);
insert into tpm_member values(member_idx.nextval,'whwns5@naver.com','1234','조준현','남자','010-993-6654','img',0);
insert into tpm_member values(member_idx.nextval,'hanjin@naver.com','1234','한진희','남자','010-922-8887','img',0);
insert into tpm_member values(member_idx.nextval,'handa@naver.com','1234','한다예','남자','010-911-3234','img',0);
insert into tpm_member values(member_idx.nextval,'aram@naver.com','1234','권아람','남자','010-955-1234','img',0);
insert into tpm_member values(member_idx.nextval,'hunjin@naver.com','1234','김현진','남자','010-988-5681','img',0);
insert into tpm_member values(member_idx.nextval,'hunjin@naver.com','1234','김현진','남자','010-988-5681','img',0);


--채팅 테이블  (채팅idx, 회원idx, cp코드, cp값, 채팅내용, 채팅 작성일)
INSERT INTO tpm_chat VALUES(chat_idx.nextval, 3, 'P', 2, '안녕하신가', SYSDATE) 
INSERT INTO tpm_chat VALUES(chat_idx.nextval, 2, 'P', 2, '그래 안녕', SYSDATE)
INSERT INTO tpm_chat VALUES(chat_idx.nextval, 3, 'P', 2, 'ㅋㅋㅋㅋㅋ', SYSDATE)
INSERT INTO tpm_chat VALUES(chat_idx.nextval, 2, 'P', 2, '헤헤', SYSDATE)

--체널 테이블 (채널idx, 채널이름)
insert into tpm_channel values(channel_idx.nextval,'myweb');
insert into tpm_channel values(channel_idx.nextval,'final');
insert into tpm_channel values(channel_idx.nextval,'semi'); 
insert into tpm_channel values(channel_idx.nextval,'study'); 

--프로젝트 테이블(프로젝트 idx, 프로젝트이름, 프로젝트 설명, 프로젝트 상태)
insert into tpm_project values(project_idx.nextval,'final','웹 프로그래밍 파이널 프로젝트',0);
insert into tpm_project values(project_idx.nextval,'myweb','웹 프로그래밍 프로젝트',0);
insert into tpm_project values(project_idx.nextval,'semi','웹 프로그래밍 세미 프로젝트',0);
insert into tpm_project values(project_idx.nextval,'study','웹 프로그래밍 수업',0);

--프로젝트 구성원 테이블(프로젝트 idx, 회원 idx, 권한레벨)
insert into tpm_project_member values(2,2,1);
insert into tpm_project_member values(2,3,0);
insert into tpm_project_member values(2,4,0);
insert into tpm_project_member values(2,5,0);
insert into tpm_project_member values(2,6,0);
insert into tpm_project_member values(2,7,0);

insert into tpm_project_member values(3,2,0);
insert into tpm_project_member values(3,3,1);
insert into tpm_project_member values(3,4,0);
insert into tpm_project_member values(3,5,0);
insert into tpm_project_member values(3,6,0);
insert into tpm_project_member values(3,7,0);

insert into tpm_project_member values(4,2,0);
insert into tpm_project_member values(4,3,0);
insert into tpm_project_member values(4,4,1);
insert into tpm_project_member values(4,5,0);
insert into tpm_project_member values(4,6,0);
insert into tpm_project_member values(4,7,0);


--채널 구성원 테이블(채널idx, 회원idx)
insert into tpm_channel_member values(2,2);
insert into tpm_channel_member values(2,3);
insert into tpm_channel_member values(2,4);
insert into tpm_channel_member values(3,2);
insert into tpm_channel_member values(3,3);
insert into tpm_channel_member values(3,4);
insert into tpm_channel_member values(4,5);


--친구목록 테이블(회원idx, 친구idx(회원idx))
insert into tpm_myfriend  values(2,3);
insert into tpm_myfriend  values(2,4);
insert into tpm_myfriend  values(2,5);
insert into tpm_myfriend  values(2,6);
insert into tpm_myfriend  values(2,7);

insert into tpm_myfriend  values(3,2);
insert into tpm_myfriend  values(3,4);
insert into tpm_myfriend  values(3,5);
insert into tpm_myfriend  values(3,6);

insert into tpm_myfriend  values(4,2);
insert into tpm_myfriend  values(4,3);
insert into tpm_myfriend  values(4,5);
insert into tpm_myfriend  values(4,6);

insert into tpm_myfriend  values(5,2);
insert into tpm_myfriend  values(5,3);
insert into tpm_myfriend  values(5,4);
insert into tpm_myfriend  values(5,6);

insert into tpm_myfriend  values(6,3); 
insert into tpm_myfriend  values(6,4); 
insert into tpm_myfriend  values(6,2);
insert into tpm_myfriend  values(6,5);
  
insert into tpm_myfriend  values(7,2);

--파일 테이블



--카테고리 테이블 (카테고리idx, 프로젝트idx, 카테고리 이름)

insert into tpm_category values(category_idx.nextval,2,'월요일');
insert into tpm_category values(category_idx.nextval,2,'화요일');
insert into tpm_category values(category_idx.nextval,2,'수요일');
insert into tpm_category values(category_idx.nextval,2,'목요일');
insert into tpm_category values(category_idx.nextval,2,'금요일');

insert into tpm_category values(category_idx.nextval,3,'안병민');
insert into tpm_category values(category_idx.nextval,3,'조준현');
insert into tpm_category values(category_idx.nextval,3,'한진희');
insert into tpm_category values(category_idx.nextval,3,'한다예');
insert into tpm_category values(category_idx.nextval,3,'권아람');
insert into tpm_category values(category_idx.nextval,3,'김현진');

insert into tpm_category values(category_idx.nextval,4,'영업팀');
insert into tpm_category values(category_idx.nextval,4,'마케팅팀');
insert into tpm_category values(category_idx.nextval,4,'개발팀');
insert into tpm_category values(category_idx.nextval,4,'재무팀');
insert into tpm_category values(category_idx.nextval,4,'IT지원팀');

--업무 테이블(업무idx, 카테고리idx, 업무제목, 업무시작일, 업무종료일, 업무완료일, 업무타입(결재여부), 업무상태)
insert into tpm_work values(work_idx.nextval,2,'DB설계',to_date('2017-03-25','yyyy-mm-dd'),to_date('2017-03-30','yyyy-mm-dd'),to_date('2017-03-30','yyyy-mm-dd'),0,0);
insert into tpm_work values(work_idx.nextval,2,'DB설계',to_date('2017-03-25','yyyy-mm-dd'),to_date('2017-03-30','yyyy-mm-dd'),to_date('2017-03-30','yyyy-mm-dd'),0,1);
insert into tpm_work values(work_idx.nextval,2,'DB설계',to_date('2017-03-25','yyyy-mm-dd'),to_date('2017-03-30','yyyy-mm-dd'),to_date('2017-03-30','yyyy-mm-dd'),1,0);
insert into tpm_work values(work_idx.nextval,2,'DB설계',to_date('2017-03-25','yyyy-mm-dd'),to_date('2017-03-30','yyyy-mm-dd'),to_date('2017-03-30','yyyy-mm-dd'),1,1);
insert into tpm_work values(work_idx.nextval,2,'DB설계',to_date('2017-03-25','yyyy-mm-dd'),to_date('2017-03-30','yyyy-mm-dd'),to_date('2017-03-30','yyyy-mm-dd'),0,0);
insert into tpm_work values(work_idx.nextval,2,'DB설계',to_date('2017-03-25','yyyy-mm-dd'),to_date('2017-03-30','yyyy-mm-dd'),to_date('2017-03-30','yyyy-mm-dd'),0,2);
insert into tpm_work values(work_idx.nextval,2,'DB설계',to_date('2017-03-25','yyyy-mm-dd'),to_date('2017-03-30','yyyy-mm-dd'),to_date('2017-03-30','yyyy-mm-dd'),1,1);
insert into tpm_work values(work_idx.nextval,2,'DB설계',to_date('2017-03-25','yyyy-mm-dd'),to_date('2017-03-30','yyyy-mm-dd'),to_date('2017-03-30','yyyy-mm-dd'),1,0);
insert into tpm_work values(work_idx.nextval,2,'DB설계',to_date('2017-03-25','yyyy-mm-dd'),to_date('2017-03-30','yyyy-mm-dd'),to_date('2017-03-30','yyyy-mm-dd'),0,0);

--업무 구성원 테이블(업무 idx, 회원idx)
insert into tpm_work_member values(2,2);
insert into tpm_work_member values(2,3);
insert into tpm_work_member values(2,4);
insert into tpm_work_member values(2,5);
insert into tpm_work_member values(2,6);
insert into tpm_work_member values(3,2);
insert into tpm_work_member values(3,3);
insert into tpm_work_member values(3,4);
insert into tpm_work_member values(3,5);
insert into tpm_work_member values(3,6);
insert into tpm_work_member values(4,2);
insert into tpm_work_member values(4,3);
insert into tpm_work_member values(4,4);

--업무 체크리스트 테이블(업무 체크리스트 idx, 업무idx, 체크리스트 내용, 체크리스트 상태)
insert into tpm_checklist values(checklist_idx.nextval,2,'회원테이블','1');
insert into tpm_checklist values(checklist_idx.nextval,2,'로그인','1');
insert into tpm_checklist values(checklist_idx.nextval,2,'파일','0');
insert into tpm_checklist values(checklist_idx.nextval,3,'스케줄러','0');
insert into tpm_checklist values(checklist_idx.nextval,3,'채팅','0');
insert into tpm_checklist values(checklist_idx.nextval,4,'타임리프','0');

--업무 코멘트 테이블(업무코멘트 idx, 업무dix, 회원idx, 코멘트내용, 코멘트 작성일)
insert into tpm_comment values(comment_idx.nextval,2,2,'DB설계 파일 입니다.',to_date('2017-03-25','yyyy-mm-dd'));
insert into tpm_comment values(comment_idx.nextval,2,3,'안녕하세요.',to_date('2017-03-25','yyyy-mm-dd'));
insert into tpm_comment values(comment_idx.nextval,2,4,'수고하세요.',to_date('2017-03-25','yyyy-mm-dd'));
insert into tpm_comment values(comment_idx.nextval,2,5,'업무 파일 요청.',to_date('2017-03-26','yyyy-mm-dd'));
insert into tpm_comment values(comment_idx.nextval,3,2,'안녕하세요.',to_date('2017-03-26','yyyy-mm-dd'));
insert into tpm_comment values(comment_idx.nextval,3,3,'안녕하세요 .',to_date('2017-03-26','yyyy-mm-dd'));
insert into tpm_comment values(comment_idx.nextval,3,5,'안녕하세요.',to_date('2017-03-26','yyyy-mm-dd'));

--알림 테이블 (알림idx, 회원idx, 업무idx, 알림등록일, 알림타입(알림내용), 알림읽음 상태)
insert into tpm_notice values(notice_idx.nextval,2,2,to_date('2017-03-26','yyyy-mm-dd'),0,0);
insert into tpm_notice values(notice_idx.nextval,2,2,to_date('2017-03-26','yyyy-mm-dd'),1,0);
insert into tpm_notice values(notice_idx.nextval,2,2,to_date('2017-03-26','yyyy-mm-dd'),2,0);
insert into tpm_notice values(notice_idx.nextval,2,2,to_date('2017-03-26','yyyy-mm-dd'),0,1);
insert into tpm_notice values(notice_idx.nextval,2,2,to_date('2017-03-26','yyyy-mm-dd'),1,1);
insert into tpm_notice values(notice_idx.nextval,2,2,to_date('2017-03-26','yyyy-mm-dd'),2,1);

--성향 테이블(회원idx, 프로젝트idx, 평가자idx, 외향성, 내향성, 감각형, 직감형, 사고형, 감정형, 판단형, 인식형)
insert into tpm_tendency values(2,0,0,5,3,3,1,3,2,3,1);
insert into tpm_tendency values(2,2,5,2,3,1,4,3,5,1,2);
insert into tpm_tendency values(3,0,0,5,3,2,4,3,1,2,5);
insert into tpm_tendency values(3,2,5,5,5,5,4,3,1,4,3);
insert into tpm_tendency values(4,0,0,1,2,3,4,5,1,2,3);
insert into tpm_tendency values(4,2,5,3,1,3,4,2,5,5,1);
insert into tpm_tendency values(5,0,0,2,3,5,3,2,1,3,5);
insert into tpm_tendency values(6,0,0,3,1,5,3,4,2,1,2);
insert into tpm_tendency values(6,2,5,3,2,5,4,3,4,2,1);
insert into tpm_tendency values(7,0,0,1,3,5,4,2,5,4,1);
insert into tpm_tendency values(7,2,5,5,5,5,4,3,3,4,5);
insert into tpm_tendency values(2,2,5,2,3,1,4,3,3,4,5);
insert into tpm_tendency values(3,2,5,3,5,1,4,3,3,4,5);
insert into tpm_tendency values(4,2,5,4,5,3,4,3,3,4,5);
insert into tpm_tendency values(6,2,2,5,2,1,4,3,3,4,5);








