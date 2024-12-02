package dao;
import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import items.MadeIn;

public class ItemsCrud {
	private final String MAPPER = "itemsMapper.";
	
	//상품코드 중복검사에 사용되는 매퍼를 호출하는 메서드
	public String getCode(String code) {
		SqlSession ss = this.getSession(); String result;
		try {
			result = ss.selectOne(this.MAPPER + "getCode", code); //검색결과가 1건인 경우 selectOne
		} finally {
			ss.close();
		}
		return result;
	}
	
	public List<MadeIn> getNations() {
		SqlSession ss = this.getSession(); List<MadeIn> list = null;
		try {
			list = ss.selectList(this.MAPPER + "getNations");
		} finally {
			ss.close();
		} return list;
	}
	private SqlSession getSession() { 
		//SqlSession을 생성하기 위해 DB정보가 필요하고, DB정보를 XML파일에 작성한다
		// 따라서, SqlSession을 생성할 때 XML파일에서 DB정보를 불러온다.
		String config = "mybatisConfig.xml"; 
		InputStream is = null; //파일을 불러올때(열 때) 필요한 객체 선언
		try {
			is = Resources.getResourceAsStream(config); //XML파일을 연다
		} catch(Exception e) { System.out.println("myBatis환경설정 파일이 없거나 잘못 되었음."); }
		
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		SqlSessionFactory factory = builder.build(is);
		SqlSession ss = factory.openSession(); //SqlSession 인스턴스 생성
		return ss;
	}
}
