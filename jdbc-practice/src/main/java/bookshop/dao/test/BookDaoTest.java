package bookshop.dao.test;

public class BookDaoTest {

	public static void main(String[] args) {
		testInsert();

	}

	private static void testInsert() {
		BookVo vo = null;
		BookDao dao = new BookDao();
		
		vo = new BookVo();
		vo.setTitle("트와일라잇");
		vo.setAuthorVo();
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setTitle("뉴문");
		vo.setAuthorVo();
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setTitle("이클립스");
		vo.setAuthorVo();
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setTitle("브레이킹던");
		vo.setAuthorVo();
		dao.insert(vo);
		
		vo = new BookVo();
		vo.setTitle("아리랑");
		vo.setAuthorVo();
		dao.insert(vo);
	}

}
