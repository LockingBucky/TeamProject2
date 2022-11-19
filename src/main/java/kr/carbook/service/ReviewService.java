package kr.carbook.service;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.carbook.beans.MemberBean;
import kr.carbook.beans.ReviewBean;
import kr.carbook.dao.ReviewDao;

@Service
@PropertySource("/WEB-INF/properties/option.properties")
public class ReviewService {
	
	@Autowired
	private ReviewDao reviewDao;
	
	@Resource(name = "loginUserBean")
	private MemberBean loginUserBean;
	
	@Value("${path.upload}")
	private String path_upload;
	
	private String saveUploadFile(MultipartFile upload_file) {
		System.out.println("saveUploadFile : " + upload_file);
		//파일명 추출
		String file_name = System.currentTimeMillis() + "_" +  
				FilenameUtils.getBaseName(upload_file.getOriginalFilename()) + "." + 
						FilenameUtils.getExtension(upload_file.getOriginalFilename());

		//파일을 지정된 경로에 저장
		try {
			System.out.println("saveUploadFile 경로저장 : " + upload_file);
			upload_file.transferTo(new File(path_upload + "/" + file_name));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return file_name;
	}
	
	// services
    public List<ReviewBean> getReviewList(){
    	return reviewDao.getReviewList();
    }
    
    // read
	public ReviewBean readReview(long review_seq) {
		return reviewDao.readReview(review_seq);
	}
	
	// write
    public void writeReview(ReviewBean writeQuestion) {
    	MultipartFile upload_file = writeQuestion.getUpload_file();
		
		if(upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			writeQuestion.setReview_file(file_name);
		}
		
		writeQuestion.setReview_writer_idx(loginUserBean.getId());
		reviewDao.writeReview(writeQuestion);
    }
    
    // modify
	public void modifyReview(ReviewBean modifyReviewBean) {
		
		// 이미지 처리
				MultipartFile upload_file = modifyReviewBean.getUpload_file();
				if(upload_file.getSize() > 0) {
					String file_name = saveUploadFile(upload_file);
					modifyReviewBean.setReview_file(file_name);
				}
		
		reviewDao.modifyReview(modifyReviewBean);
	}
	
	// delete
	public void deleteReview(long review_seq) {
		reviewDao.deleteReview(review_seq);
	}
	
}
