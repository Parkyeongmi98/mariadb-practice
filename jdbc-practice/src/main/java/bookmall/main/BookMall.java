package bookmall.main;

import java.util.List;

import bookmall.dao.BookDao;
import bookmall.dao.CartDao;
import bookmall.dao.CategoryDao;
import bookmall.dao.OrderDao;
import bookmall.dao.UserDao;
import bookmall.vo.BookVo;
import bookmall.vo.CartVo;
import bookmall.vo.CategoryVo;
import bookmall.vo.OrderVo;
import bookmall.vo.UserVo;

public class BookMall {
	public static void main(String[] args) {
	
		System.out.println("##### 회원리스트 #####");
		findAllUser();
		
		System.out.println();
		
		System.out.println("##### 카테고리 #####");
		findAllCategory();
		
		System.out.println();
		
		System.out.println("##### 상품 #####");
		findAllBook();
		
		System.out.println();
		
		System.out.println("##### 카트 #####");
		findAllCart();
		
		System.out.println();
		
		System.out.println("##### 주문 #####");
		findAllOrder();
		
		System.out.println();
		
		System.out.println("##### 주문 도서 리스트 #####");
		findAllOrderBook();
		
	}
	
	private static void findAllUser() {
		List<UserVo> list = new UserDao().findAll();
		for(UserVo vo : list) {
			String result = String.format("[%d] 이름: %s, 폰번호: %s, 이메일: %s, 비밀번호: %s", vo.getNo(), vo.getName(), vo.getNumber(), vo.getEmail(), vo.getPassword());
			System.out.println(result);
		}
	}
	
	private static void findAllCategory() {
		List<CategoryVo> list = new CategoryDao().findAll();
		for(CategoryVo vo : list) {
			String result = String.format("[%d] 카테고리: %s", vo.getNo(), vo.getName());
			System.out.println(result);
		}
	}
	
	private static void findAllBook() {
		List<BookVo> list = new BookDao().findAll();
		for(BookVo vo : list) {
			String result = String.format("[%d] 책제목: %s, 가격: %d, 카테고리: %s", vo.getNo(), vo.getTitle(), vo.getPrice(), vo.getCategoryName());
			System.out.println(result);
		}
	}
	
	private static void findAllCart() {
		List<CartVo> list = new CartDao().findAll();
		for(CartVo vo : list) {
			String result = String.format("[%d] 도서제목: %s, 수량: %d, 가격: %s", vo.getNo(), vo.getTitle(), vo.getCount(), vo.getPrice());
			System.out.println(result);
		}
	}
	
	private static void findAllOrder() {
		List<OrderVo> list = new OrderDao().findAll();
		for(OrderVo vo : list) {
			String result = String.format("[%d] 주문번호: %s, 주문자: %s, 결제금액: %s, 배송지: %s", vo.getNo(), vo.getOrderNo(), vo.getOrderName() + "/" + vo.getOrderEmail(), vo.getPrice(), vo.getAddress());
			System.out.println(result);
		}
	}
	
	private static void findAllOrderBook() {
		List<OrderVo> list = new OrderDao().findAll();
		for(OrderVo vo : list) {
			String result = String.format("[%d] 도서번호: %s, 도서제목: %s, 수량: %d", vo.getNo(), vo.getBookNumber(), vo.getBookTitle(), vo.getCount());
			System.out.println(result);
		}
	}

}


