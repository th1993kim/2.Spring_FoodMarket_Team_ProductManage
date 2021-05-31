package com.market.common.base;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.market.event_product.dto.EventProductDTO;

public abstract class BaseController {

	private EventProductDTO eventproductDTO;
	private static String CURR_IMAGE_REPO_PATH = "C:\\project\\fileRepo";
	
	protected List<EventProductDTO> upload(MultipartHttpServletRequest multipartRequest) throws Exception {
		
		List<EventProductDTO> fileList = new ArrayList<EventProductDTO>();
		
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		CURR_IMAGE_REPO_PATH = eventproductDTO.event_product_img_path;
		
		while(fileNames.hasNext()) {
			String event_product_img_name = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(event_product_img_name);
			String originalFilename = mFile.getOriginalFilename();
			eventproductDTO.setEvent_product_img_name(originalFilename);
			fileList.add(eventproductDTO);
			
			File file = new File(eventproductDTO.event_product_img_path+"\\"+event_product_img_name);
			if( mFile.getSize()!=0  ) { //첨부된 파일이 존재하면
				if( !file.exists()  ) {//존재하지않는다면
					if(  file.getParentFile().mkdirs() ) { //경로에 해당하는 디렉토리들을 생성
						file.createNewFile();//파일생성
					}
				}
				mFile.transferTo(new File(eventproductDTO.event_product_img_path+"\\"+"temp"+"\\"+originalFilename ));
			
		}
		
		
	}
		return fileList;
}
}

