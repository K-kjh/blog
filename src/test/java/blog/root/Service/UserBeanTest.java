package blog.root.Service;

import javax.inject.Inject;

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
	
	@Autowired
	private UserService user;
	private Login_HistoryService login;
	
	
	@Test
	public void singup() {
		String id="test1";
		String pw="tset1";
		String email="test1";
		String nickname="test1";
		
		try {
			user.Singup(id, pw, email, nickname) ;
		} catch (Exception e) {
		}
	}
	
	@Test
	public void login() {
		String id="kgh2252";
		String pw="akzm12";
		
		try {
			if(user.Login(id, pw) != 0) {
				log.info("로그인 성공& 기록 성공");
				
			}else {
				log.info("기록 실패" );
			}
		} catch (Exception e) {

			log.info("로그인 실패");
		}
	}
	
	
	
	
	
	

}
