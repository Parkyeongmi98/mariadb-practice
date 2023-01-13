package bookmall.dao.test;

import java.util.List;

import bookmall.dao.UserDao;
import bookmall.vo.UserVo;

public class UserDaoTest {
	   public static void main(String[] args) {
		      testInsert();
		      testFindAll();

		   }

		   private static void testInsert() {
			   UserVo vo = null;
			   UserDao dao = new UserDao();
		      
		      vo = new UserVo();
		      vo.setName("둘리");
		      vo.setNumber("010-1234-5678");
		      vo.setEmail("dooly@naver.com");
		      vo.setPassword("1234");
		      dao.insert(vo);
		      
		      vo = new UserVo();
		      vo.setName("마이콜");
		      vo.setNumber("010-5678-1234");
		      vo.setEmail("michol@naver.com");
		      vo.setPassword("12345");
		      dao.insert(vo);
		      
		   }
		   
		   private static void testFindAll() {
				List<UserVo> list = new UserDao().findAll();
				for(UserVo vo : list) {
					String result = String.format("[%d] 이름: %s, 폰번호: %s, 이메일: %s, 비밀번호: %s", vo.getNo(), vo.getName(), vo.getNumber(), vo.getEmail(), vo.getPassword());
					System.out.println(result);
				}
		   }
}
