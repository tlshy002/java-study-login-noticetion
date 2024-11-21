

2024.11.20(수)
- nov19 프로젝트 기반으로 작성
- nov19 첫 마이바티스 시작
- 공지글 수정,삭제 작업까지 되어있었음 (update, delete)

<nov20>
- nov20부터 공지글 삽입,조회(insert, select) 기능을 JDBC에서 --> MyBatis로 변경하는 작업 
- 주로 사용한 파일 이름
- dao.Crud
- mapper.noticeMapper
- notice.NoticeDTO
- notice.WriteNoticeServlet



- 페이지네이션을 위한 rownum(랭킹정렬) 쿼리문

select last_name, salary 
from(select rownum rank, last_name, salary from employees order by salary desc) where rank <= 3;

==> 위 쿼리문이 오라클버전에따라 결과가 다를 수도 있음. 
저 쿼리문으로 원하는 값을 조회하려면 order by가 먼저 선행된후 rownum이 적용돼야 하는데 오라클 버전에 따라 rownum이 먼저 실행되는 버전이 있음

따라서 버전과 상관없이 order by가 항상 먼저 적용되는 쿼리문을 작성한다

Rownum을 쓸때의 권장사항

select num, title, writer, w_date
from (select num, title, writer, to_char(write_date, 'YYYY/MM/DD HH24:MI:SS') w_date
	from notice_tbl order by num desc) a)
where rank > #{} and rank <![CDATA[ < ]]> #{}

from(select 
	from (select last_name, salary from employees order by salary desc) a)
	
=================================================================
- 페이지네이션을 위한 쿼리문에 삽입할 데이터를 저장할 DTO만들기
- notice.FromTo 클래스	
- NoticeListServlet
마이바티스는 '<'를 엘리먼트 시작기호로 인식함. <연산자로 사용하고싶으면 <![CDATA[<]]>이렇게 써야됨