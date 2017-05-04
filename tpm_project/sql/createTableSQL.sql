-- 회원 테이블-------------------------------------------------------
CREATE TABLE tpm_member (
	member_idx    NUMBER        primary key NOT NULL, -- 회원 IDX
	member_id     VARCHAR2(20)  ,     -- 회원 아이디
	member_pwd    VARCHAR2(40)  ,     -- 회원 비밀번호
	member_name   VARCHAR2(20)  ,     -- 회원 이름
	member_gender VARCHAR2(10)   ,    -- 회원 성별
	member_tel    VARCHAR2(30)  ,     -- 회원 연락처
	member_img    VARCHAR2(300) ,     -- 회원 사진 경로
	member_thema  NUMBER              -- 회원 테마
);

create sequence member_idx
minvalue 0 start with 1;

-- 채팅 테이블[O]-------------------------------------------------------

CREATE TABLE tpm_chat (
	chat_idx      NUMBER        primary key NOT NULL, -- 채팅 IDX
	member_idx    NUMBER        ,     -- 회원 IDX, (외래키)
	chat_cp_code  VARCHAR2(5)   ,     -- CP 코드
	chat_cp_value NUMBER        ,     -- CP 값
	chat_content  VARCHAR2(500) ,     -- 채팅 내용
	chat_date     DATE          ,      -- 채팅 작성일
	
	CONSTRAINT tpm_member_member_idx_fk
 	FOREIGN KEY (member_idx)
	REFERENCES tpm_member(member_idx) ON DELETE CASCADE
);



create sequence chat_idx
minvalue 0 start with 1;


-- 채널 테이블[x]-------------------------------------------------------
CREATE TABLE tpm_channel (
	channel_idx  NUMBER       primary key NOT NULL, -- 채널 IDX
	channel_name VARCHAR2(20)       -- 채널 이름
);

create sequence channel_idx
minvalue 0 start with 1;


-- 프로젝트 테이블[x]-------------------------------------------------------
CREATE TABLE tpm_project (
	project_idx     NUMBER        primary key NOT NULL, -- 프로젝트 IDX
	project_name    VARCHAR2(100) ,     -- 프로젝트 이름
	project_content VARCHAR2(300) ,     -- 프로젝트 설명
	project_state   NUMBER              -- 프로젝트 상태
);

create sequence project_idx
minvalue 0 start with 1;


-- 프로젝트 구성원 테이블[0]-------------------------------------------------------

CREATE TABLE tpm_project_member (
	project_idx   NUMBER , -- 프로젝트 IDX
	member_idx    NUMBER , -- 회원 IDX
	project_level NUMBER,   -- 권한 레벨


 	FOREIGN KEY (member_idx)
	REFERENCES tpm_member(member_idx)ON DELETE CASCADE,

	
 	FOREIGN KEY (project_idx)
	REFERENCES tpm_project(project_idx)ON DELETE CASCADE
);


-- 채널 구성원 테이블[0]-------------------------------------------------------
 
CREATE TABLE tpm_channel_member (
	channel_idx NUMBER , -- 채널 IDX
	member_idx  NUMBER ,  -- 회원 IDX
	
	FOREIGN KEY (channel_idx)
	REFERENCES tpm_channel(channel_idx)ON DELETE CASCADE,


 	FOREIGN KEY (member_idx)
	REFERENCES tpm_member(member_idx)ON DELETE CASCADE
);


-- 친구목록 테이블[0]-------------------------------------------------------

CREATE TABLE tpm_myfriend (
	member_idx   NUMBER , -- 회원 IDX
	myfriend_idx NUMBER ,  -- 친구 IDX(회원 IDX)
	
	FOREIGN KEY (member_idx)
	REFERENCES tpm_member(member_idx)ON DELETE CASCADE
);


-- 카테고리 테이블[0]-------------------------------------------------------
CREATE TABLE tpm_category (
	category_idx  NUMBER        primary key NOT NULL, -- 카테고리 IDX
	project_idx   NUMBER        ,     -- 프로젝트 IDX
	category_name VARCHAR2(300) ,      -- 카테고리 이름
	
 	FOREIGN KEY (project_idx)
	REFERENCES tpm_project(project_idx)ON DELETE CASCADE
	
);

create sequence category_idx
minvalue 0 start with 1;



-- 업무 테이블[0]-------------------------------------------------------
CREATE TABLE tpm_work (
	work_idx      NUMBER        primary key NOT NULL, -- 업무 IDX
	category_idx  NUMBER        ,     -- 카테고리 IDX
	work_title    VARCHAR2(300) ,     -- 업무 제목
	work_start    DATE          ,     -- 업무 시작일
	work_end      DATE          ,     -- 업무 종료일
	work_complete DATE          ,     -- 업무 완료일
	work_confirm  NUMBER        ,     -- 업무 타입(결제 여부)
	work_state    NUMBER        ,      -- 업무 상태
	
    	FOREIGN KEY (category_idx)
	REFERENCES tpm_category(category_idx)ON DELETE CASCADE
);

create sequence work_idx
minvalue 0 start with 1;


-- 업무 구성원 테이블[0]-------------------------------------------------------
CREATE TABLE tpm_work_member (
	work_idx   NUMBER , -- 업무 IDX
	member_idx NUMBER ,  -- 회원 IDX
	
	FOREIGN KEY (work_idx)
	REFERENCES tpm_work(work_idx)ON DELETE CASCADE,
	
	FOREIGN KEY (member_idx)
	REFERENCES tpm_member(member_idx)ON DELETE CASCADE
);


-- 업무 체크리스트 테이블[0]-------------------------------------------------------
CREATE TABLE tpm_checklist (
	checklist_idx     NUMBER        primary key NOT NULL, -- 업무 체크리스트 IDX
	work_idx          NUMBER        ,     -- 업무 IDX
	checklist_content VARCHAR2(500) ,     -- 체크리스트 내용
	checklist_state   NUMBER        ,      -- 체크리스트 상태
	
	FOREIGN KEY (work_idx)
	REFERENCES tpm_work(work_idx)ON DELETE CASCADE
);

create sequence checklist_idx
minvalue 0 start with 1;


-- 업무 코멘트 테이블[0]-------------------------------------------------------
CREATE TABLE tpm_comment (
	comment_idx     NUMBER        primary key NOT NULL, -- 업무 코멘트 IDX
	work_idx        NUMBER        ,     -- 업무 IDX
	member_idx      NUMBER        ,     -- 회원 IDX
	comment_content VARCHAR2(500) ,     -- 코멘트 내용
	comment_date    DATE          ,     -- 코멘트 작성일
	
	FOREIGN KEY (work_idx)
	REFERENCES tpm_work(work_idx)ON DELETE CASCADE,
	
	FOREIGN KEY (member_idx)
	REFERENCES tpm_member(member_idx)ON DELETE CASCADE
	
);

create sequence comment_idx
minvalue 0 start with 1;

-- 알림 테이블[0]-------------------------------------------------------
CREATE TABLE tpm_notice (
	notice_idx   NUMBER primary key NOT NULL, -- 알림 IDX
	member_idx   NUMBER ,     -- 회원 IDX
	work_idx     NUMBER ,     -- 업무 IDX
	notice_date  DATE   ,     -- 알림 등록일
	notice_type  NUMBER ,     -- 알림 타입(알림 내용)
	notice_state NUMBER ,      -- 알림 읽음 상태
	
		
	FOREIGN KEY (member_idx)
	REFERENCES tpm_member(member_idx)ON DELETE CASCADE,
	
	FOREIGN KEY (work_idx)
	REFERENCES tpm_work(work_idx)ON DELETE CASCADE
);


create sequence notice_idx
minvalue 0 start with 1;


-- 성향 테이블[0]-------------------------------------------------------
CREATE TABLE tpm_tendency (
	member_idx    NUMBER , -- 회원 IDX
	project_idx   NUMBER , -- 프로젝트 IDX
	appraiser_idx NUMBER , -- 평가자 IDX
	tendency_E    NUMBER , -- 외향성
	tendency_I    NUMBER , -- 내향성
	tendency_S    NUMBER , -- 감각형
	tendency_N    NUMBER , -- 직감형
	tendency_T    NUMBER , -- 사고형
	tendency_F    NUMBER , -- 감정형
	tendency_J    NUMBER , -- 판단형
	tendency_P    NUMBER ,  -- 인식형
	
	
 	FOREIGN KEY (member_idx)
	REFERENCES tpm_member(member_idx)ON DELETE CASCADE,


 	FOREIGN KEY (project_idx)
	REFERENCES tpm_project(project_idx)ON DELETE CASCADE
);
-- 파일 테이블[0]-------------------------------------------------------

CREATE TABLE tpm_file (
	file_idx    NUMBER        primary key NOT NULL, -- 파일 IDX
	project_idx NUMBER        ,     -- 프로젝트 IDX
	work_idx    NUMBER        ,     -- 업무 IDX
	member_idx  NUMBER        ,     -- 회원 IDX
	file_name   VARCHAR2(40)  ,     -- 파일 이름
	file_size   VARCHAR2(20)  ,     -- 파일 크기
	file_date   DATE          ,     -- 파일 공유날짜
	file_path   VARCHAR2(300) ,      -- 파일 경로
	
	FOREIGN KEY (project_idx)
	REFERENCES tpm_project(project_idx)ON DELETE CASCADE,
	
	FOREIGN KEY (work_idx)
	REFERENCES tpm_work(work_idx)ON DELETE CASCADE,
	
	FOREIGN KEY (member_idx)
	REFERENCES tpm_member(member_idx)ON DELETE CASCADE
);


create sequence file_idx
minvalue 0 start with 1;



