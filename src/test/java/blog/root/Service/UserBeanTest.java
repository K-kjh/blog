package blog.root.Service;

import java.util.Map;
import java.util.stream.Collectors;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import blog.root.mapper.UserMapper;
import blog.root.model.UserDTO;
import blog.root.service.UserService;
import blog.root.service.User_authService;
import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@WebAppConfiguration
public class UserBeanTest {
	
	@Inject
	private UserService user;
	
	@Inject
	private User_authService user_auth;
	
	@Setter(onMethod_ = @Autowired)
	private UserMapper mapper;
	
	@Setter(onMethod_ =@Autowired)
	private PasswordEncoder pwencoder;
	
	
//	@Test
//	public void read() {
//		String id="kgh2252";
//		
//		UserDTO userdto = user.read(id);
//		log.info(""+userdto.getAuthList());
//		userdto.getAuthList().forEach(User_authDTO -> log.info(""+User_authDTO));
//		
//	}
	
//	@Test
//	public void testInsertuser() {
//		String id="kgh2222";
//		String pw="akzm12";
//		String email="kgh222522252@gmail.com";
//		String nickname="test2";
//
//		pw=pwencoder.encode(pw);
//		log.info("pw :"+pw);
//		
//	}
	
	//private Login_HistoryService login;
	
	
	@Test
	public void singup() {
		String id="kgh22";
		String pw="akzm12";
		String email="kgh2252225222@gmail.com";
		String nickname="2nkgh22522252";
		
		try {
				user.Singup(id, pwencoder.encode(pw), email, nickname) ;
			//	user_auth.userauth_insert(user.getUser_number(id));
		} catch (Exception e) {
		}
	}
	
	
//	
//	@Test
//	public void login() {
//		String id="kgh2252";
//		String pw="akzm12";
//		
//		try {
//			if(user.Login(id, pwencoder.encode(pw)) != 0) {
//				log.info("로그인 성공");
//				
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
//	public void nicknameChe)ck() {
//		try {
//			log.info("------------"+user.nicknameCheck("강정"));
//			if(user.nicknameCheck("강정")!= null) {
//				log.info("닉네임 있음");
//			}els)e {
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
//			String email=user.emailCheck("kgh22522@naver.com");
//			
//			if(email != null)	{
//				log.info("hello++++++++++++++++++++");
//				log.info("hello++++++++++++++++++++");
//				log.info("hello++++++++++++++++++++");
//				log.info("hello++++++++++++++++++++");
//				log.info("hello++++++++++++++++++++");
//			}else {
//				log.info("---------------");
//				log.info("---------------");
//				log.info("---------------");
//				log.info("---------------");
//				log.info("---------------");
//				log.info("---------------");
//			}
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
