package bookmall.dao.test;

import java.util.List;

import bookmall.dao.BookDao;
import bookmall.vo.BookVo;

public class BookDaoTest {
	  public static void main(String[] args) {
	       testInsert();
	       testFindAll();

	   }

		private static void testInsert() {
		      BookVo vo = null;
		      BookDao dao = new BookDao();		    
		      
		      vo = new BookVo();
		      vo.setTitle("돈의 속성");
		      vo.setPrice(17800);
		      vo.setCategoryNo(1L);
		      dao.insert(vo);
		      
		      vo = new BookVo();
		      vo.setTitle("나는 당신이 행복했으면 좋겠습니다");
		      vo.setPrice(12400);
		      vo.setCategoryNo(3L);
		      dao.insert(vo);
		      
		      vo = new BookVo();
		      vo.setTitle("궁금한 IT");
		      vo.setPrice(20000);
		      vo.setCategoryNo(2L);
		      dao.insert(vo);
		   }
		
		   private static void testFindAll() {
				List<BookVo> list = new BookDao().findAll();
				for(BookVo vo : list) {
					String result = String.format("[%d] 책제목: %s, 가격: %d, 카테고리: %s", vo.getNo(), vo.getTitle(), vo.getPrice(), vo.getCategoryName());
					System.out.println(result);
				}
		   }
}
