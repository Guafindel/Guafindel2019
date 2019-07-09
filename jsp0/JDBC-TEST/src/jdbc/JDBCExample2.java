package jdbc;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class JDBCExample2 {

	public static void main(String[] args) {
		
		Connection conn = null;
		
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "SCOTT";
		String pw = "tiger";
		
		try {
			//1. 데이터베이스 드라이버 로드
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//2. 데이터베이스 연결
			conn = DriverManager.getConnection(jdbcUrl, user, pw);
			
			System.out.println("데이터베이스 접속 성공");
			System.out.println("------------------------------");
			
			//3. Statement 객체 생성
			Statement stmt = conn.createStatement();
			String sqlInsert = "insert into emp values(?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pstmt = conn.prepareStatement(sqlInsert);
			
			pstmt.setInt(1, 7969);
			pstmt.setString(2, "JOHSUA");
			pstmt.setString(3, "CLERK");
			pstmt.setInt(4, 7566);
			pstmt.setDate(5, Date.valueOf("2019-03-27"));
			pstmt.setInt(6, 2400);
			pstmt.setInt(7, 150);
			pstmt.setInt(8, 30);
			int resultCnt = pstmt.executeUpdate();
			if(resultCnt > 0) {
				System.out.println("새로운 사원 정보 입력 성공");
				System.out.println("------------------------------");
			}
			
			String scottsal = "update emp set sal = 1000 where ename = 'SCOTT'";
			stmt.executeUpdate(scottsal);
			System.out.println("스콧 급여 정보 수정 성공");
			System.out.println("------------------------------");
			
			
			String sql1 = "select * from emp";
			
			
			ResultSet rs = stmt.executeQuery(sql1);
			
			//5. 결과 출력
			System.out.println("모든 사원 정보 출력");
			System.out.println("------------------------------");
			while(rs.next()) {
				System.out.println("사원번호" + rs.getInt(1));
				System.out.println("사원이름" + rs.getString(2));
				System.out.println("담당업무" + rs.getString(3));
				System.out.println("상사번호" + rs.getInt(4));
				System.out.println("입사날짜" + rs.getDate(5));
				System.out.println("급여" + rs.getInt(6));
				System.out.println("커미션" + rs.getInt(7));
				System.out.println("부서번호" + rs.getInt(8));
				System.out.println("------------------------------");
			}
					
			//EMP 테이블에 서 “SCOTT” 사원의 급여(sal) 정보를 1000으로 바꾸는 프로그램을 작성해보자
//			String sqlInsert2 = "update emp set sal = ? where ename ='SCOTT'";
//			PreparedStatement pstmt2 = conn.prepareStatement(sqlInsert2);
//			pstmt2.setInt(1, 1000);
//			int resultCnt2 = pstmt2.executeUpdate();
//			
//			if(resultCnt2 > 0) {
//				System.out.println("정보 수정 성공");
//				System.out.println("------------------------------");
//			}
			
	
			//EMP 테이블에 서 “SCOTT” 이름으로 검색한 결과를 출력하는 프로그램을 작성해보자.
			String sql2 = "select * from emp where ename='SCOTT'";
			ResultSet rs2 = stmt.executeQuery(sql2);
			
			System.out.println("스콧만 출력하기");
			System.out.println("------------------------------");
			
			while(rs2.next()) {
				System.out.println("사원번호" + rs2.getInt(1));
				System.out.println("사원이름" + rs2.getString(2));
				System.out.println("담당업무" + rs2.getString(3));
				System.out.println("상사번호" + rs2.getInt(4));
				System.out.println("입사날짜" + rs2.getDate(5));
				System.out.println("급여" + rs2.getInt(6));
				System.out.println("커미션" + rs2.getInt(7));
				System.out.println("부서번호" + rs2.getInt(8));
				System.out.println("------------------------------");
			}
			
			
			//5.모든 사원정보를 출력하되 부서정보를 함께 출력하는 프로그램을 작성해보자.
			String sql3 = "select e.*, d.dname, d.loc from emp e, dept d where e.deptno = d.deptno";
			ResultSet rs3 = stmt.executeQuery(sql3);
			
			System.out.println("모든 사원정보를 부서정보와 함께 출력");
			System.out.println("------------------------------");
			while(rs3.next()) {
				System.out.println("사원번호" + rs3.getInt(1));
				System.out.println("사원이름" + rs3.getString(2));
				System.out.println("담당업무" + rs3.getString(3));
				System.out.println("상사번호" + rs3.getInt(4));
				System.out.println("입사날짜" + rs3.getDate(5));
				System.out.println("급여" + rs3.getInt(6));
				System.out.println("커미션" + rs3.getInt(7));
				System.out.println("부서번호" + rs3.getInt(8));
				System.out.println("부서명" + rs3.getString(9));
				System.out.println("부서지역" + rs3.getString(10));
				System.out.println("------------------------------");
			}
			
			//6. 사용객체 CLOSE()
			rs.close();
			stmt.close();
			pstmt.close();
			conn.close();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
}
