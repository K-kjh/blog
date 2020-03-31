package blog.root.service;

import javax.inject.Inject;

import blog.root.mapper.Login_HistoryMapper;

public class Login_HistoryServiceImpl implements Login_HistoryService{

	@Inject
	private Login_HistoryMapper loginMapper;
	
	@Override
	public int loginTimeCheck(int user_number) throws Exception {
		return loginMapper.loginTimeCheck(user_number);
	}

}
