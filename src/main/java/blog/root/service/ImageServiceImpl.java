package blog.root.service;

import org.springframework.stereotype.Service;

@Service
public class ImageServiceImpl implements ImageService{

	public String imgType(String str) {
		String type="";
		boolean ty=false;
		for(int i=0;i<str.length();i++) {
			if(str.charAt(i)=='.' || ty==true) {
				type+=str.charAt(i);
				ty=true;
			}
		}
		return ty == true ? type : null;
	}
	
	
	public String projectImageStr(String str) {
		String ser=".metadata";
		String proj="KangBlog";
		
		String imagestr="/";

		boolean s=false;
		boolean sis=false;
		for(int i=0;i<str.length()-1;i++) {
			
			if( str.charAt(i) == '/') {
				for(int j=i+1;j<str.length();j++) {
					if(s == false && ser.charAt(0) == str.charAt(j)) {
						if(stris(j,str,ser)==false) {
							s=true;
							break;
						}
					}
					if(s == true && proj.charAt(0) == str.charAt(j)) {
						if(stris(j,str,proj)==false) {
							s=false;
							sis=true;
						}
					}
					if(s==false) {
						imagestr+=str.charAt(j);
						if(str.charAt(j)=='/') {
							break;
						}
					}
					
				}
			}
			if(sis==true) {
				break;
			}
		}//for -end 
		imagestr+="src/main/webapp/resources/image/";
		System.out.println(imagestr);

		return imagestr;
		
	}
	
	private static boolean stris(int j,String str,String str2) {
		
		for(int z=0;z<str2.length();z++) {
			if(str2.charAt(z) != str.charAt(j+z)) {return true;}
		}
		return false;
	}
	
}
