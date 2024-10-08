package kr.kh.app.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.vo.AccountBookVO;
import kr.kh.app.model.vo.AccountTypeVO;
import kr.kh.app.model.vo.CommunityVO;
import kr.kh.app.model.vo.PostVO;
import kr.kh.app.pagination.Criteria;

public interface PostDAO {

	List<CommunityVO> selectCommunityList();

	CommunityVO selectCommunity(@Param("co_num")String num);

	List<PostVO> selectPostList(@Param("cri")Criteria cri);

	int selectPostTotalCount(@Param("cri")Criteria cri);

	boolean insertPost(@Param("post")PostVO post);

	void updatePostView(@Param("po_num")String po_num);

	PostVO selectPost(@Param("po_num")String po_num);

	boolean updatePost(@Param("post")PostVO post);

	void deletePost(@Param("po_num")String po_num);

	List<AccountTypeVO> selectPaymentPurposeList();

	List<AccountTypeVO> selectPaymentTypeList();

	void insertAccountBook(@Param("ab") AccountBookVO newAB);

}
