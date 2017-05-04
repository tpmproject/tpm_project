--회원 테이블 (회원 idx, 회원 ID(email), 비밀번호, 이름, 성별, 전화번호, 사진 이미지 이름, 테마)
insert into tpm_member values(member_idx.nextval,'abm794@naver.com','1234','안병민','남자','010-9993-3331','default_man.jpg','black');
insert into tpm_member values(member_idx.nextval,'whwns5@naver.com','1234','조준현','남자','010-9931-6654','default_man.jpg','black');
insert into tpm_member values(member_idx.nextval,'hanjin@naver.com','1234','한진희','여자','010-9223-8887','default_woman.jpg','black');
insert into tpm_member values(member_idx.nextval,'handa@naver.com','1234','한다예','여자','010-9115-3234','default_woman.jpg','black');
insert into tpm_member values(member_idx.nextval,'aram@naver.com','1234','권아람','남자','010-9556-1234','default_man.jpg','black');
insert into tpm_member values(member_idx.nextval,'hunjin@naver.com','1234','김현진','남자','010-9878-5681','default_man.jpg','black');
insert into tpm_member values(member_idx.nextval,'hunjin2@naver.com','1234','김현진','남자','010-9818-5681','default_man.jpg','black');

--프로젝트 테이블(프로젝트 idx, 프로젝트이름, 프로젝트 설명, 프로젝트 상태)
insert into tpm_project values(0,'개인 성향','개인 성향 체크 값',0);

--성향 테이블(회원idx, 프로젝트idx, 평가자idx, 외향성, 내향성, 감각형, 직감형, 사고형, 감정형, 판단형, 인식형)
insert into tpm_tendency values(2,0,0,5,3,3,1,3,2,3,1);
insert into tpm_tendency values(3,0,0,5,1,2,4,3,1,2,5);
insert into tpm_tendency values(4,0,0,1,2,3,4,5,1,2,3);
insert into tpm_tendency values(5,0,0,2,3,5,3,2,1,3,5);
insert into tpm_tendency values(6,0,0,3,2,5,4,3,4,2,1);
insert into tpm_tendency values(7,0,0,4,3,5,4,2,5,4,1);
insert into tpm_tendency values(8,0,0,1,4,3,2,1,4,3,4);









