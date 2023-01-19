package bookmall.dao.test;

import java.util.List;

import bookmall.dao.OrderDao;
import bookmall.vo.OrderVo;

public class OrderDaoTest {
	   public static void main(String[] args) {
		      testInsert();
		      testFindAll();

		   }

		   private static void testInsert() {
			   OrderVo vo = null;
			   OrderDao dao = new OrderDao();
		      
		      vo = new OrderVo();
		      vo.setOrderNo("20230113-0000002");
		      vo.setPrice(0);
		      vo.setAddress("부산시 수영구 남천동");
		      vo.setUserNo(1L);
		      vo.setOrderBookNo(1L);
		      dao.insert(vo);

		   }
		   
		   private static void testFindAll() {
				List<OrderVo> list = new OrderDao().findAll();
				for(OrderVo vo : list) {
					String result = String.format("[%d] 주문번호: %s, 주문자: %s, 결제금액: %s, 배송지: %s", vo.getNo(), vo.getOrderNo(), vo.getOrderName() + "/" + vo.getOrderEmail(), vo.getPrice(), vo.getAddress());
					System.out.println(result);
				}
		   }

}
