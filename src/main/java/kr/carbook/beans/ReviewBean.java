package kr.carbook.beans;

import javax.validation.constraints.NotBlank;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @NoArgsConstructor
public class ReviewBean {
	

	private long review_seq;        
	@NotBlank
	private String review_subject;
	@NotBlank
	private String review_text;
	private String review_file;       
	private String review_writer_idx; 
    private int review_car_idx;
    private String review_date;       
        
    
    private MultipartFile upload_file; // 첨부이미지 저장(브라우저에서 처리)
    
}
