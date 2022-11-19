package kr.carbook.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectKey;
import org.apache.ibatis.annotations.Update;

import kr.carbook.beans.ReviewBean;

public interface ReviewMapper {
	
	// 문의사항 글쓰기
	@SelectKey(statement="select review_seq.nextval from dual", keyProperty = "review_seq", before=true, resultType=int.class)
	@Insert("insert into review values("
			+ "review_seq.nextval, "
			+ "#{review_subject}, "
			+ "#{review_text}, "
			+ "#{review_file, jdbcType=VARCHAR}, "
			+ "#{review_writer_idx}, "
			+ "#{review_car_idx}, "
			+ "sysdate)")
	void writeReview(ReviewBean writeQuestion);
	
	// 문의사항 글 보기
	@Select("select a1.review_seq, a1.review_subject, a1.review_writer_idx, to_char(a1.review_date, 'yyyy-mm-dd') as review_date "
			+ "from review a1, member a2 "
			+ "where a1.review_writer_idx = a2.id")
	List<ReviewBean> getReviewList();
	
	// 글 내용 보기
	@Select("select review_seq, review_subject, review_text, review_file, review_writer_idx, to_char(review_date, 'yyyy-mm-dd') as review_date from review, member "
			+ "where review.review_writer_idx = member.id and review_seq=#{review_seq}" )
	ReviewBean readReview(long review_seq);
	
	// 글 수정하기
	@Update("update review set review_date = to_char(sysdate, 'yyyy-mm-dd'), review_subject = #{review_subject}, "
			+ "review_text = #{review_text}, review_file = #{review_file, jdbcType=VARCHAR} where review_seq = #{review_seq}")
	void modifyReview(ReviewBean modifyReviewBean);
	
	// 글 삭제하기
	@Delete("delete from review where review_seq = #{review_seq}")
	void deleteReview(long review_seq);
	
}
