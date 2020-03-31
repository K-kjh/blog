package blog.root.service;

public interface UserService {
	public int Singup(String id,String pw,String email,String nickname)throws Exception;
	public int Login(String id ,String pw)throws Exception;
	public int nicknameCheck(String nickname)throws Exception;
	public int idCheck(String id)throws Exception;
	public int emailCheck(String email)throws Exception;
	
	
}
