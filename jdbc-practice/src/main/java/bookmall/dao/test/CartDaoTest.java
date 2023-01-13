package bookmall.dao.test;

import java.util.List;

import bookmall.dao.CartDao;
import bookmall.vo.CartVo;

public class CartDaoTest {
	   public static void main(String[] args) {
		      testInsert();
		      testFindAll();

		   }

		   private static void testInsert() {
			  CartVo vo = null;
			  CartDao dao = new CartDao();	      
		      
		      vo = new CartVo();
		      vo.setCount(3L);
		      vo.setBookNo(2L);
		      vo.setUserNo(1L);
		      dao.insert(vo);
		      
		      vo = new CartVo();
		      vo.setCount(1L);
		      vo.setBookNo(1L);
		      vo.setUserNo(2L);
		      dao.insert(vo);
		   }
		   
		   private static void testFindAll() {
				List<CartVo> list = new CartDao().findAll();
				for(CartVo vo : list) {
					String result = String.format("[%d] 도서제목: %s, 수량: %d, 가격: %s", vo.getNo(), vo.getTitle(), vo.getCount(), vo.getPrice());
					System.out.println(result);
				}
		   }
}
