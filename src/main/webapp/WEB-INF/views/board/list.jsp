<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/page_header.jsp" %>
<script>
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/board/write.do";
	});
});
function list(page){
	location.href="${path}/board/list.do?curPage="+page
			+"&search_option=${map.search_option}" //검색 관련 옵션
			+"&keyword=${map.keyword}";	//검색 관련 옵션
}
</script>
</head>
<body>
<h2>게시판</h2><br>
<!-- 검색 옵션 태그 -->
<form name="form1" method="post" action="${path}/board/list.do">
<select name="search_option">
<!-- 검색을 한 후 option이 풀려버려 이름+내용+제목 으로 돌아가는 것을 방지하는 코드 -->
<c:choose>
	<c:when test="${map.search_option == 'all' }">
	<option value="all" selected>이름+내용+제목</option>
	<option value="writer">이름</option>
	<option value="content">내용</option>
	<option value="title">제목</option>
	</c:when>
	
	<c:when test="${map.search_option == 'writer' }">
	<option value="all">이름+내용+제목</option>
	<option value="writer" selected>이름</option>
	<option value="content">내용</option>
	<option value="title">제목</option>
	</c:when>
	
	<c:when test="${map.search_option == 'content' }">
	<option value="all">이름+내용+제목</option>
	<option value="writer">이름</option>
	<option value="content" selected>내용</option>
	<option value="title">제목</option>
	</c:when>
	
	<c:when test="${map.search_option == 'title' }">
	<option value="all">이름+내용+제목</option>
	<option value="writer">이름</option>
	<option value="content">내용</option>
	<option value="title" selected>제목</option>
	</c:when>
</c:choose>
</select>
<input name="keyword" value="${map.keyword}">
<input type="submit" value="조회">
</form>

<button type="button" id="btnWrite">글쓰기</button>
${map.count} 개의 게시물이 있습니다.
<table border="1" width="600px">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>이름</th>
		<th>날짜</th>
		<th>조회수</th>
	</tr>
	<tr>
	
	<c:forEach var="row" items="${map.list}">
	<tr>	
		<td>${row.bno}</td>
		<td>
		<!-- title을 클릭했을때 상세 페이지로 가져가는 값 : bno,curPage,search_option,keyword 
			searc_option과 keyword를 함께 보내주어야 검색상태가 풀리지 않는다.-->
	<a href="${path}/board/view.do?bno=${row.bno}
	&curPage=${map.pager.curPage }
	&search_option=${map.search_option}
	&keyword=${map.keyword}">
		${row.title}</a>
		
		<!-- 댓글의 갯수 -->
		<c:if test="${row.cnt > 0 }">
			<span style="color:red;">(${row.cnt})</span>
		</c:if>
		
		</td>
		<td>${row.name}</td>
		<td>
<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
		</td>
		<td>${row.viewcnt}</td>
	</tr>
	</c:forEach>
	
	</tr>
	<tr>
		<td colspan="5" align="center">
			<!-- 현재 블록이 1번째 블록이 아니라면( 그 이상 이라면) -->
			<c:if test="${map.pager.curBlock > 1}">
				<a href="javascript:list('1')">[처음]</a>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="javascript:list('${map.pager.prevPage}')">
				[이전]</a>
			</c:if>
			<c:forEach var="num" begin="${map.pager.blockBegin}"
			end="${map.pager.blockEnd}">
			<!-- ####choose 태그 안에는 주석을 쓰면 에러가 난다... -->
			<!-- 현재 페이지라면 링크를 빼고 빨간색으로 처리 -->
				<c:choose>
					<c:when test="${num == map.pager.curPage}">
						<span style="color:red;">${num}</span>&nbsp;
					</c:when>
					<c:otherwise>
						<a href="javascript:list('${num}')">${num}</a>&nbsp;
					</c:otherwise>
				</c:choose>
			</c:forEach>
			
			<c:if test="${map.pager.curBlock <= map.pager.totBlock}">
				<a href="javascript:list('${map.pager.nextPage}')">
				[다음]</a>
			</c:if>
			<c:if test="${map.pager.curPage <= map.pager.totPage}">
				<a href="javascript:list('${map.pager.totPage}')">
				[끝]</a>
			</c:if>				
		</td>
	</tr>
</table>
</body>
</html>