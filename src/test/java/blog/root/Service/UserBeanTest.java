package blog.root.Service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import blog.root.service.Login_HistoryService;
import blog.root.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class UserBeanTest {
//	
//	@Autowired
//	private UserService user;
//	private Login_HistoryService login;
//	
//	
//	@Test
//	public void singup() {
//		String id="test1";
//		String pw="tset1";
//		String email="test1";
//		String nickname="test1";
//		
//		try {
//			user.Singup(id, pw, email, nickname) ;
//		} catch (Exception e) {
//		}
//	}
//	
//	@Test
//	public void login() {
//		String id="kgh2252";
//		String pw="akzm12";
//		
//		try {
//			if(user.Login(id, pw) != 0) {
//				log.info("로그인 성공");
//				login.loginTimeCheck(user.Login(id, pw));
//			}else {
//			}
//		} catch (Exception e) {
//
//			log.info("로그인 실패");
//		}
//	}
//	
//	@Test
//	public void loginCheck() {
//
//		try {
//			login.loginTimeCheck(1);
//		} catch (Exception e) {
//			log.info("회원 정보 없음");
//		}
//	}
//	
//	@Test
//	public void nicknameCheck() {
//		try {
//			log.info("------------"+user.nicknameCheck("강정"));
//			if(user.nicknameCheck("강정")!= null) {
//				log.info("닉네임 있음");
//			}else {
//				log.info("닉네임 없음 -------------------------------------------");
//			}
//		} catch (Exception e) {
//
//			log.info("닉네임 없음");
//		}
//	}
//	
//	@Test
//	public void emailCheck() {
//		try {
//			user.emailCheck("kgh2252@naver.com");
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//	
//	
//	
//	

}
