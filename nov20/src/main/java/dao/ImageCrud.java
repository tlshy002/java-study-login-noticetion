package dao;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import image.ImageBBS;

public class ImageCrud {
	private final String MAPPER="imageMapper"; //매퍼의 이름을 선언
	
	
	public int insertImageBBS(ImageBBS dto) {
		SqlSession ss = this.getSession();
		int result = 0;
		try {
			result = ss.insert(MAPPER + ".putImageBBS", dto);
			if(result > 0) ss.commit();
			else ss.rollback();
		} finally {
			ss.close();
		}
		return result;
	}
	
	public Integer getMaxNum() {
		SqlSession ss = this.getSession();
		Integer maxNum = 0;
		try {
			maxNum = ss.selectOne(MAPPER + ".getMaxNum");
			if(maxNum == null) maxNum = 0;
		} finally {
			ss.close();
		}
		return maxNum;
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
