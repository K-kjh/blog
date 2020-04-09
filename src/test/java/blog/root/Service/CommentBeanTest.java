package blog.root.Service;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import blog.root.model.CommentDTO;
import blog.root.service.CommentService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
public class CommentBeanTest {
	
	@Inject
	private CommentService comment;
	
	@Test
	public void commenttest1() {
		try {
			List<CommentDTO> com =comment.selectCommentList(1);
			log.info("::"+com.get(0).getUser_authList().get(0).getAuth());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
