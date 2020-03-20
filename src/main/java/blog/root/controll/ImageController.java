package blog.root.controll;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ImageController {
	
	@GetMapping(value = "/download", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
	@ResponseBody 
	public ResponseEntity<Resource> downloadFile(String fileName){
		File file2 = new File("/home/kang/file.txt");
		try {
			file2.createNewFile();
			FileWriter fw = new FileWriter(file2.getAbsoluteFile());
			BufferedWriter bw = new BufferedWriter(fw);
			
	        System.out.println(this.getClass().getResource("").getPath());
	        System.out.println(this.getClass().getResource("/").getPath());
	        
	        System.out.println(new File("").getAbsolutePath());
	      
	        
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String currDir = ImageController.class.getResource(".").getPath();
		log.info("현재 클래스 경로 :"+currDir);
		
		return null;
	}
	
	@PostMapping(value="/uploads")
	@ResponseBody
	public void uploads(MultipartFile[] uploadFile,String Time) {
		log.info("time : "+Time);
		log.info(" update ajax post ...... ");
		
		for(MultipartFile multipartFile : uploadFile) {
			
			log.info("-------------------------------1");
			
			log.info("upload file name "+ multipartFile.getOriginalFilename());
			log.info("Upload File Size: "+ multipartFile.getSize());
			
			String uploadFileName = Time+"_"+multipartFile.getOriginalFilename();
			
			String currDir = ImageController.class.getResource(".").getPath();
			String path=projectImageStr(currDir);
			
			String uploadImageFile = path + uploadFileName;

			log.info("origName : "+multipartFile);
			log.info("currDir : "+ currDir);
			log.info("path : "+path);
			log.info("uploadImage FIle Path :::"+uploadImageFile);
			
			try {
				multipartFile.transferTo(new File(uploadImageFile));
			
			}catch(Exception e) {
				e.getMessage();
				log.info("error");
				log.error(e.getMessage());
				
			}
		}
	}
	
	
	private static boolean stris(int j,String str,String str2) {
		
		for(int z=0;z<str2.length();z++) {
			if(str2.charAt(z) != str.charAt(j+z)) {return true;}
		}
		return false;
	}
	
	
	private static String projectImageStr(String str) {
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
	
}
