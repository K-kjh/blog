package blog.root.service;

import java.io.File;

public interface ImageService {

	public String imgType(String str);
	public String projectImageStr(String str);
	
	//2020 03 26 add
	public void todayImageTempDelete();
	public void fileDateDelete(String name);
	public long srcTimeNumber(String fileOriginName);
	public boolean fileDelte(File file);
	public void fileMove(String fileName);
	
}
