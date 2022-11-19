package kr.carbook.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.carbook.beans.ReviewBean;
import kr.carbook.mapper.ReviewMapper;

@Repository
public class ReviewDao {

	@Autowired
	private ReviewMapper reviewMapper;
	
	// services
	public List<ReviewBean> getReviewList(){
		
		return reviewMapper.getReviewList();
	}
	
	// write
	public void writeReview(ReviewBean writeQuestion) {
		reviewMapper.writeReview(writeQuestion);
	}

	// read
	public ReviewBean readReview(long review_seq) {
		return reviewMapper.readReview(review_seq);
	}
	
	// modify
	public void modifyReview(ReviewBean modifyReviewBean) {
		reviewMapper.modifyReview(modifyReviewBean);
	}
	
	// delete
	public void deleteReview(long review_seq) {
		reviewMapper.deleteReview(review_seq);
	}
	
}
