<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/page_header.jsp" %>

<!-- 헤더에 있는 jquery 가 연동이 안되는것 같음. 일일히 파일마다 연결해주어야 할듯. -->
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<script>
$(function(){
	$("#btnWrite").click(function(){
		location.href="${path}/board/writeForm";
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
    <div id="loading">
        <div class="spinner">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
        </div>
    </div>

    <div id="page-wrapper">
        <div id="page-content-wrapper">
            <div id="page-content">

                    <div class="container">


<!-- Uniform -->

<!--<link rel="stylesheet" type="text/css" href="../resources/assets/widgets/uniform/uniform.css">-->
<script type="text/javascript" src="../resources/assets/widgets/uniform/uniform.js"></script>
<script type="text/javascript" src="../resources/assets/widgets/uniform/uniform-demo.js"></script>

<div class="row mailbox-wrapper">

<div class="col-md-9">

<div class="content-box">
<div class="mail-header clearfix row">
    <div class="col-md-5">
        <span class="mail-title">BOARD</span>

    </div>
    <!-- 검색 옵션 메뉴 -->
    <div>
    <form name="form1" method="post" action="${path}/board/list.do">
    
<select name="search_option" style="height:33px;">
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
&nbsp;&nbsp;&nbsp;&nbsp;
    
    <div class="float-right col-md-7 pad0A">
        <div class="input-group">
            <input type="text" class="form-control" name="keyword" value="${map.keyword}">
            <div class="input-group-btn">
                <button type="submit" class="btn btn-default" tabindex="-1">
                    <i class="glyph-icon icon-search"></i>
                </button>
            </div>
        </div>
    </div>
</form>
    </div>
</div>

<table class="table table-hover text-center">
<tbody>
<tr>

    <th>
        No
    </th>
    <th>
        Writer
    </th>
    <th class="email-body">
        Title
    </th>
    <th>
        Count
    </th>
    <th>
        Date
    </th>
</tr>
<c:forEach var="row" items="${map.list}">
<tr>
    <td>
        ${row.bno}
    </td>
    <td class="email-title">
        ${row.name}
    </td>
    <td class="email-body">
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
    <td>
        ${row.viewcnt}
    </td>
    <td>
        <fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm" />
    </td>
</tr>
</c:forEach>
<tr>
<!-- 맨 밑 div택 -->
<td colspan="5" align="center" class="mail-toolbar clearfix">
			<!-- 현재 블록이 1번째 블록이 아니라면( 그 이상 이라면) -->
			<c:if test="${map.pager.curBlock > 1}">
				<a href="javascript:list('1')" class="btn btn-default">
				<i class="glyph-icon icon-angle-double-left"></i></a>
			</c:if>
			<c:if test="${map.pager.curBlock > 1}">
				<a href="javascript:list('${map.pager.prevPage}')" class="btn btn-default">
				 <i class="glyph-icon icon-angle-left"></i></a>
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
				<a href="javascript:list('${map.pager.nextPage}')" class="btn btn-default">
				<i class="glyph-icon icon-angle-right"></i></a>
			</c:if>
			<c:if test="${map.pager.curPage <= map.pager.totPage}">
				<a href="javascript:list('${map.pager.totPage}')" class="btn btn-default">
				<i class="glyph-icon icon-angle-double-right"></i></a>
			</c:if>
			<!-- 글쓰기 기능은 로그인 상태에서만 제공한다. -->
			<c:if test="${sessionScope.userid != null}">
			<button type="button" class="btn btn-purple float-right col-md-2" id="btnWrite" >Write</button>
			</c:if>				
		</td>
		</tr>

</tbody>
</table>
</div>
</div>
</div>
                    </div>



            </div>
        </div>
    </div>
</body>
</html>