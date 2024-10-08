<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:include page="/WEB-INF/views/common/header.sub.jsp" />
<link rel="stylesheet" href="<c:url value="/resources/css/calendar.css"/>">
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="d-flex account-book-container justify-content-between">
	<div class="calendar-wrapper">
		<div class="mt-3 mb-3 p-3 d-flex justify-content-between">
			<span><a class="btn btn-outline-dark btn-sm"
				href="<c:url value="/accountbook?year=${cal.year}&month=${cal.month-1}&btncheck=true"/>">이전달</a>
			</span> 
			<span class="fw-bold fs-3">${cal.year}년 ${cal.month+1}월</span> 
			<span>
				<a class="btn btn-outline-dark btn-sm"
				href="<c:url value="/accountbook?year=${cal.year}&month=${cal.month+1}&btncheck=true"/>">다음달</a>
			</span>
		</div>
		
		<table class="table text-center table-bordered calendar">
			<tr class="table-light text-center fs-5 tr-h">
				<th class="text-danger">일</th>
				<th>월</th>
				<th>화</th>
				<th>수</th>
				<th>목</th>
				<th>금</th>
				<th class="text-primary">토</th>
			</tr>
			<c:forEach begin="1" end="${cal.tdCnt}" step="7" var="i">
				<tr>
					<c:forEach begin="${i }" end="${i + 6}" step="1" var="j">
					<td>
						<c:if test="${selected ne null }">
							<c:choose>
								<c:when test="${selected.dayOfMonth == (j - cal.startBlankCnt)}">
									<c:set var="cls" value="selected" />
								</c:when>
								<c:otherwise>
									<c:set var="cls" value="" />
								</c:otherwise>
							</c:choose>
						</c:if>
						
						
							<c:if test="${(j > cal.startBlankCnt) && (j <= cal.startBlankCnt + cal.lastDate)}">
								<c:choose>
									<c:when test="${j % 7 == 0 }">
										<a href="<c:url value="/accountbook?year=${cal.year}&month=${cal.month}&day=${j - cal.startBlankCnt}&searchType=0"/>">
										<span class="text-primary ${cls}">${j - cal.startBlankCnt }</span><br></a>
										<c:forEach  items="${amount_list }" var="amount" >
										<c:if test="${(j - cal.startBlankCnt) eq amount.day}">
											<span><c:if test="${amount.totalIncome ne 0}"> 
												<a class="btn btn-primary btn-amount text-white" href="<c:url value="/accountbook?year=${cal.year}&month=${cal.month}&day=${j - cal.startBlankCnt}&searchType=1"/>">
												<fmt:formatNumber value="${amount.totalIncome}" type="number" groupingUsed="true"/>
												</a> 
											</c:if></span><br>
											<span><c:if test="${amount.totalExpense ne 0}">  
												<a class="btn btn-danger btn-amount text-white" href="<c:url value="/accountbook?year=${cal.year}&month=${cal.month}&day=${j - cal.startBlankCnt}&searchType=2"/>">
												<fmt:formatNumber value="${amount.totalExpense}" type="number" groupingUsed="true"/>
												</a>
											</c:if></span>
										</c:if>
										</c:forEach>
										
									</c:when>
									<c:when test="${j % 7 == 1 }">
										<a href="<c:url value="/accountbook?year=${cal.year}&month=${cal.month}&day=${j - cal.startBlankCnt}&searchType=0"/>">
										<span class="text-danger ${cls}">${j - cal.startBlankCnt } </span><br></a>
										<c:forEach  items="${amount_list }" var="amount" >
										<c:if test="${(j - cal.startBlankCnt) eq amount.day}">
											<span><c:if test="${amount.totalIncome ne 0}"> 
												<a class="btn btn-primary btn-amount text-white" href="<c:url value="/accountbook?year=${cal.year}&month=${cal.month}&day=${j - cal.startBlankCnt}&searchType=1"/>">
												<fmt:formatNumber value="${amount.totalIncome}" type="number" groupingUsed="true"/>
												</a> 
											</c:if></span><br>
											<span><c:if test="${amount.totalExpense ne 0}"> 
												<a class="btn btn-danger btn-amount text-white" href="<c:url value="/accountbook?year=${cal.year}&month=${cal.month}&day=${j - cal.startBlankCnt}&searchType=2"/>">
												<fmt:formatNumber value="${amount.totalExpense}" type="number" groupingUsed="true"/>
												</a>
											</c:if></span>
										</c:if>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<a href="<c:url value="/accountbook?year=${cal.year}&month=${cal.month}&day=${j - cal.startBlankCnt}&searchType=0"/>">
										<span class="${cls}"> ${j - cal.startBlankCnt } </span><br></a>
										<c:forEach  items="${amount_list }" var="amount" >
										<c:if test="${(j - cal.startBlankCnt) eq amount.day}">
											<span><c:if test="${amount.totalIncome ne 0}"> 
												<a class="btn btn-primary btn-amount text-white" href="<c:url value="/accountbook?year=${cal.year}&month=${cal.month}&day=${j - cal.startBlankCnt}&searchType=1"/>">
												<fmt:formatNumber value="${amount.totalIncome}" type="number" groupingUsed="true"/>
												</a> 
											</c:if></span><br>
											<span><c:if test="${amount.totalExpense ne 0}"> 
												 <a class="btn btn-danger btn-amount text-white" href="<c:url value="/accountbook?year=${cal.year}&month=${cal.month}&day=${j - cal.startBlankCnt}&searchType=2"/>">
												 <fmt:formatNumber value="${amount.totalExpense}" type="number" groupingUsed="true"/>
												 </a>
											</c:if></span>
										</c:if>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</c:if>
						
					</td>
				</c:forEach>
				</tr>
			</c:forEach>
			
		</table>
	</div>
	<div class="list-wrapper ml-3">
		<h3>${search } 내역</h3>
		<div class="overflow-auto mt-3 mb-3" style="max-height: 70vh;">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>유형</th>
						<th>분류</th>
						<th>금액</th>
						<th>수단</th>
						<c:if test="${btnCheck eq 'true' }">
						<th>날짜</th>
						</c:if> 
						<th>메모</th>
						<th>정기 결제</th>
						<th></th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ab_list }" var="ab">
						<%-- ${comments[n].name} --%>
						<tr>
							<c:if test="${searchType eq '0' || ab.ab_at_num eq searchType}">
							<td class="text-center">${at_list[ab.ab_at_num-1].at_name}</td>
							<td class="text-center">${pp_list[ab.ab_pp_num-1].pp_name}</td>
							<td class="text-right"><fmt:formatNumber value="${ab.ab_amount}" pattern="#,###"/></td>
							<td class="text-center">${pt_list[ab.ab_pt_num-1].pt_name}</td>
							<c:if test="${btnCheck eq 'true' }">
							<td><fmt:formatDate value="${ab.ab_date}" pattern="MM/dd"/></td>
							</c:if>
							<td>${ab.ab_detail }</td>
							<td class="text-center">
								<c:if test="${ab.ab_period eq 1}"> 매주 </c:if> 
								<c:if test="${ab.ab_period eq 2}"> 격주 </c:if> 
								<c:if test="${ab.ab_period eq 3}"> 매달 </c:if>
							</td>
							<td>
								<a class="btn btn-outline-dark d-block p-0 accountbook-update" href="javascript: void(0);" onclick="openUpdate(${ab.ab_num})" data-toggle="modal" data-target="#modal">수정</a>
								<a class="btn btn-outline-dark d-block p-0 accountbook-delete" href="<c:url value="/accountbook/delete?ab_num=${ab.ab_num}"/>">삭제</a>
							</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<c:choose>
			<c:when test="${user ne null }"><button type="button" class="btn btn-primary w-100" data-toggle="modal" data-target="#modal" onclick="openInsert();">내역 등록</button></c:when>
			<c:otherwise><a href="<c:url value="/login"/>" class="btn btn-dark">로그인</a></c:otherwise>
		</c:choose>
	</div>
</div>

<script>
function openInsert(){
	$.ajax({
		url: '<c:url value="/accountbook/insert" />',
		type: 'get',
		data: {
			date: '${selected}'
		},
		success: function(data){
			$('.modal').addClass('show');
			$('.modal-content').html('');
			$('.modal-content').html(data);
		},
		error : function(xhr){
			console.log(xhr);
		}
	})
}

function openUpdate(num){
	$.ajax({
		url: '<c:url value="/accountbook/update"/>',
		type: 'get',
		data: {
			ab_num : num
		},
		success: function(data){
			$('.modal').addClass('show');
			$('.modal-content').html('');
			$('.modal-content').html(data);
		},
		error : function(xhr){
			console.log(xhr);
		}
	})
}

$('.accountbook-delete').click(function(e){
	if (${user.me_id == null || user.me_id == ab_me_id}) {
		return false;
	}
	if (confirm('정말 삭제하시겠습니까?'))
		return true;
	else
		return false;
})
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<jsp:include page="/WEB-INF/views/common/footer.sub.jsp" />