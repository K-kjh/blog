package blog.root.controll;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SingupController {

	@GetMapping(value = "/singup")
	public String singup() {
		return "singup";
	}
}
