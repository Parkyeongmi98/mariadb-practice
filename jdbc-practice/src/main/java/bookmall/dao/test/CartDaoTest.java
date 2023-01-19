package bookmall.dao.test;

import java.util.List;

import bookmall.dao.CartDao;
import bookmall.vo.CartVo;

public class CartDaoTest {
	   public static void main(String[] args) {
		      testInsert();
		      orderBookInsert();
		      testFindCart();
		      testFindOrderBook();
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
		      vo.setUserNo(1L);
		      dao.insert(vo);
		   }
		   
		   private static void orderBookInsert() {
			  CartVo vo = null;
			  CartDao dao = new CartDao();	      
		      
		      vo = new CartVo();
		      vo.setNo(1L);
		      vo.setBookNo(1L);
		      dao.orderBookInsert(vo);
		      
		      vo = new CartVo();
		      vo.setNo(2L);
		      vo.setBookNo(2L);
		      dao.orderBookInsert(vo);
		   }
		   
		   private static void testFindCart() {
				List<CartVo> list = new CartDao().findAll();
				for(CartVo vo : list) {
					String result = String.format("도서제목: %s, 수량: %d, 가격: %s", vo.getTitle(), vo.getCount(), vo.getPrice());
					System.out.println(result);
				}
		   }
		   
		   private static void testFindOrderBook() {
				List<CartVo> list = new CartDao().OrderBookFind();
				for(CartVo vo : list) {
					String result = String.format("[%d] 도서제목: %s, 수량: %d", vo.getNo(), vo.getTitle(), vo.getCount());
					System.out.println(result);
				}
		   }
}
