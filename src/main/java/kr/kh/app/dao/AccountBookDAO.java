package kr.kh.app.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;

import kr.kh.app.model.dto.DayAmountDTO;
import kr.kh.app.model.vo.AccountBookVO;
import kr.kh.app.model.vo.AccountTypeVO;
import kr.kh.app.model.vo.MemberVO;
import kr.kh.app.model.vo.PaymentPurposeVO;
import kr.kh.app.model.vo.PaymentTypeVO;

public interface AccountBookDAO {

	List<PaymentPurposeVO> selectPaymentPurposeList();

	List<PaymentTypeVO> selectPaymentTypeList();

	void insertAccountBook(@Param("ab") AccountBookVO newAB);

	List<AccountBookVO> selectAccountBookList(@Param("user") MemberVO user, @Param("date")String searchDate);

	List<AccountTypeVO> selectAccountTypeList();

	List<AccountBookVO> selectAccountBookListFromDate(@Param("me_id")String me_id, @Param("searchBegin")String searchBegin, @Param("searchEnd")String searchEnd, @Param("isIncome")int isIncome);

	List<AccountBookVO> selectExportList(@Param("me_id")String me_id);
	
	List<DayAmountDTO> getAmountList(@Param("me_id")String me_id, @Param("date")String date_amount);

	int deleteAccountBook(@Param("me_id")String me_id, @Param("ab_num")String ab_numStr);

	AccountBookVO selectAccountBook(@Param("me_id")String me_id, @Param("ab_num")String ab_numStr);

	int updateAccountBook(@Param("ab")AccountBookVO newAB);

	List<AccountBookVO> getAccountBookListWithRegularity(@Param("me_id")String me_id);

}
