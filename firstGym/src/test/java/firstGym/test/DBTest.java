//package firstGym.test;
//
//import java.util.List;
//
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.ContextConfiguration;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.test.context.web.WebAppConfiguration;
//
//import kr.co.firstgym.bmiresult.mapper.IBmiResultListMapper;
//import kr.co.firstgym.command.ProductVO;
//import kr.co.firstgym.product.mapper.IProductMapper;
//
//@WebAppConfiguration
//@RunWith(SpringJUnit4ClassRunner.class)
//@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
//public class DBTest {
//
//	@Autowired
//	private IBmiResultListMapper mapper;
//	
//	@Autowired
//	private IProductMapper productMapper;
//	
//	@Test
//	public void bmiTest() {
//		System.out.println(mapper.getList("userId"));
//	}
//	
//	@Test
//	public void productTest() {
//		
//		List<ProductVO> products = productMapper.getList( searchpaging);
//		for(ProductVO vo : products) {
//			System.out.println(vo);
//		}
//	}
//}
