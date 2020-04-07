package blog.root.security;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import blog.root.model.CustomUser;
import blog.root.model.UserDTO;
import blog.root.service.UserService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomUserDetailsService implements UserDetailsService {
	
	@Inject
	private UserService user;
	
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info(" load user by UserName : "+username);
		
		UserDTO dto = user.read(username);
		
		return dto == null ? null : new CustomUser(dto);
	}

}
