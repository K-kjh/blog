package blog.root.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;

public interface User_authMapper {

	
	@Insert("insert into user_auth(user_number,auth) values(#{user_number},'ROLE_MEMBER')")
	public void userauth_insert(@Param("user_number")int user_number);
	

	@Insert("insert into user_auth(user_number,auth) values(#{user_number},'ROLE_ADMIN')")
	public void userauth_insert_admin(@Param("user_number")int user_number);
	
}
