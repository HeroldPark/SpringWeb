-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.0-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- board 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `board` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `board`;

-- 테이블 board.comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `comment` (
  `ID` int(11) DEFAULT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL,
  `REGDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `WRITER_ID` varchar(50) DEFAULT NULL,
  `NOTICE_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 board.comment:~0 rows (대략적) 내보내기
DELETE FROM `comment`;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;

-- 테이블 board.member_role 구조 내보내기
CREATE TABLE IF NOT EXISTS `member_role` (
  `MEMBER_ID` varchar(50) DEFAULT NULL,
  `ROLE_ID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 board.member_role:~0 rows (대략적) 내보내기
DELETE FROM `member_role`;
/*!40000 ALTER TABLE `member_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_role` ENABLE KEYS */;

-- 테이블 board.notice 구조 내보내기
CREATE TABLE IF NOT EXISTS `notice` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(100) DEFAULT NULL,
  `WRITER_ID` varchar(50) DEFAULT NULL,
  `CONTENT` varchar(300) DEFAULT NULL,
  `REGDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `HIT` int(11) DEFAULT NULL,
  `FILES` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 테이블 데이터 board.notice:~0 rows (대략적) 내보내기
DELETE FROM `notice`;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` (`ID`, `TITLE`, `WRITER_ID`, `CONTENT`, `REGDATE`, `HIT`, `FILES`) VALUES
	(1, 'JSP Servlet 연습', 'admin', 'JSP를 이용한 Web Servlet 개발을 연습합니다.', '2021-02-14 00:24:09', 1234567, 'test.zip, abc.gif, pub.txt'),
	(2, 'Query Practice', 'yrpark', 'MySQL을 이용한 CRUD', '2021-02-14 09:11:21', 2, 'SELECT * FROM'),
	(3, 'JSTL 과정', 'wilson', 'JSTL을 이용한 JSP Syntax 작성', '2021-02-14 09:12:34', 5, 'core, format, function'),
	(4, 'Service 추가', 'admin', 'Spring service 추가', '2021-02-14 09:14:24', 3, 'controller, service, entity'),
	(5, 'Model', 'admin', 'Model 방법론', '2021-02-14 09:15:10', 3, 'Controller-Service-DAO'),
	(6, 'Spring을 이용한 Web', 'admin', 'Spring Web 구현', '2021-02-14 09:16:10', 8, 'Spring Web'),
	(7, 'NewLecture 갖와', 'admin', 'NewLecture', '2021-02-14 09:16:44', 10, 'NewLecture 강좌 좋아요'),
	(8, NULL, NULL, NULL, '2021-02-14 09:17:20', NULL, NULL);
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;

-- 테이블 board.role 구조 내보내기
CREATE TABLE IF NOT EXISTS `role` (
  `ID` varchar(50) DEFAULT NULL,
  `DISCRIPTION` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 board.role:~0 rows (대략적) 내보내기
DELETE FROM `role`;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;

-- 테이블 board.tb_board 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_board` (
  `idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '번호 (PK)',
  `title` varchar(100) NOT NULL COMMENT '제목',
  `content` varchar(3000) NOT NULL COMMENT '내용',
  `writer` varchar(20) NOT NULL COMMENT '작성자',
  `view_cnt` int(11) NOT NULL DEFAULT 0 COMMENT '조회 수',
  `notice_yn` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '공지글 여부',
  `secret_yn` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '비밀글 여부',
  `delete_yn` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '삭제 여부',
  `insert_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  `update_time` datetime DEFAULT NULL COMMENT '수정일',
  `delete_time` datetime DEFAULT NULL COMMENT '삭제일',
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='게시판';

-- 테이블 데이터 board.tb_board:~99 rows (대략적) 내보내기
DELETE FROM `tb_board`;
/*!40000 ALTER TABLE `tb_board` DISABLE KEYS */;
INSERT INTO `tb_board` (`idx`, `title`, `content`, `writer`, `view_cnt`, `notice_yn`, `secret_yn`, `delete_yn`, `insert_time`, `update_time`, `delete_time`) VALUES
	(1, '1번 게시글 제목을 수정합니다.', '1번 게시글 내용을 수정합니다.', '홍길동', 0, 'N', 'N', 'Y', '2020-11-29 18:20:18', '2020-11-29 18:42:02', '2020-12-01 08:10:39'),
	(55, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-11-29 19:38:54', NULL, '2020-11-30 16:25:17'),
	(56, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-11-30 11:44:36', '2020-11-30 16:00:17', NULL),
	(57, 'Test', 'Board Test', '더오리', 0, 'N', 'N', 'Y', '2020-11-30 13:22:45', NULL, '2020-11-30 18:08:57'),
	(58, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-11-30 16:29:56', NULL, '2020-11-30 16:30:07'),
	(59, '게시판 글쓰기 시험 2', '게시판 글쓰기  테스트 입니다. 2', '홍길동', 0, 'N', 'N', 'Y', '2020-11-30 21:29:34', NULL, '2020-11-30 21:31:16'),
	(60, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:48:28', NULL, NULL),
	(61, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:48:28', NULL, NULL),
	(62, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:48:28', NULL, NULL),
	(63, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:48:47', NULL, NULL),
	(64, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:48:47', NULL, NULL),
	(65, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:48:47', NULL, NULL),
	(66, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:48:47', NULL, NULL),
	(67, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:48:47', NULL, NULL),
	(68, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:48:47', NULL, NULL),
	(70, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(71, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(72, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(73, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(74, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(75, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(76, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(77, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(78, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(79, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(80, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(81, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:48:59', NULL, NULL),
	(85, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(86, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(87, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(88, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(89, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(90, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(91, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(92, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(93, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(94, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(95, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(96, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(97, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(98, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(99, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(100, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(101, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(102, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(103, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(104, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(105, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(106, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(107, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(108, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:15', NULL, NULL),
	(116, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(117, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(118, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(119, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(120, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(121, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(122, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(123, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(124, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(125, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(126, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(127, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(128, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(129, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(130, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(131, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(132, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(133, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(134, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(135, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(136, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(137, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(138, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(139, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(140, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(141, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(142, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(143, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(144, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(145, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(146, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(147, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(148, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(149, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(150, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(151, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(152, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(153, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정 - 두번째', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', '2020-12-01 21:56:40', NULL),
	(154, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(155, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(156, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(157, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(158, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(159, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(160, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(161, 'n번 게시글 제목', 'n번 게시글 내용', '테스터', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(162, '게시판 글쓰기 시험', 'Spring boot Board 를 제작하고 있습니다. - 글 내용 수정', '홍길동', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL),
	(163, '게시판 글쓰기 시험 1', '게시판 테스트 1', '더오리', 0, 'N', 'N', 'N', '2020-12-01 18:49:20', NULL, NULL);
/*!40000 ALTER TABLE `tb_board` ENABLE KEYS */;

-- 테이블 board.tb_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_comment` (
  `idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '번호 (PK)',
  `board_idx` int(11) NOT NULL COMMENT '게시글 번호 (FK)',
  `content` varchar(3000) NOT NULL COMMENT '내용',
  `writer` varchar(20) NOT NULL COMMENT '작성자',
  `delete_yn` enum('Y','N') NOT NULL DEFAULT 'N' COMMENT '삭제 여부',
  `insert_time` datetime NOT NULL DEFAULT current_timestamp() COMMENT '등록일',
  `update_time` datetime DEFAULT NULL COMMENT '수정일',
  `delete_time` datetime DEFAULT NULL COMMENT '삭제일',
  PRIMARY KEY (`idx`),
  KEY `fk_comment_board_idx` (`board_idx`),
  CONSTRAINT `fk_comment_board_idx` FOREIGN KEY (`board_idx`) REFERENCES `tb_board` (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='댓글';

-- 테이블 데이터 board.tb_comment:~21 rows (대략적) 내보내기
DELETE FROM `tb_comment`;
/*!40000 ALTER TABLE `tb_comment` DISABLE KEYS */;
INSERT INTO `tb_comment` (`idx`, `board_idx`, `content`, `writer`, `delete_yn`, `insert_time`, `update_time`, `delete_time`) VALUES
	(6, 55, '1번 댓글을 추가합니다!', '1번 회원', 'N', '2020-12-05 10:04:53', NULL, NULL),
	(8, 55, '1번 댓글을 추가합니다!', '1번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(9, 55, '2번 댓글을 추가합니다!', '2번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(10, 55, '3번 댓글을 추가합니다!', '3번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(11, 55, '4번 댓글을 추가합니다!', '4번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(12, 55, '5번 댓글을 추가합니다!', '5번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(13, 55, '6번 댓글을 추가합니다!', '6번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(14, 55, '7번 댓글을 추가합니다!', '7번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(15, 55, '8번 댓글을 추가합니다!', '8번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(16, 55, '9번 댓글을 추가합니다!', '9번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(17, 55, '10번 댓글을 추가합니다!', '10번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(18, 55, '11번 댓글을 추가합니다!', '11번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(19, 55, '12번 댓글을 추가합니다!', '12번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(20, 55, '13번 댓글을 추가합니다!', '13번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(21, 55, '14번 댓글을 추가합니다!', '14번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(22, 55, '15번 댓글을 추가합니다!', '15번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(23, 55, '16번 댓글을 추가합니다!', '16번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(24, 55, '17번 댓글을 추가합니다!', '17번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(25, 55, '18번 댓글을 추가합니다!', '18번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(26, 55, '19번 댓글을 추가합니다!', '19번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL),
	(27, 55, '20번 댓글을 추가합니다!', '20번 회원', 'N', '2020-12-05 10:06:13', NULL, NULL);
/*!40000 ALTER TABLE `tb_comment` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
