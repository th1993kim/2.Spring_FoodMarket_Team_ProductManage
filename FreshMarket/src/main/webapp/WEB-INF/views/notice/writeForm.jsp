<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- pageContext를 이용하여 request객체를 얻고
         얻어진 request객체를 이용하여   contextPath를 얻어 변수에 저장
<c:set var="변수명"       value="값" />  --%>        
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>


<head>
    <meta charset="UTF-8">
    <title>게시글 작성하기</title>
    <!-- css 가져오기 -->
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/no/semantic.min.css">
    <style type="text/css">
/*         body {	
            background-color: #DADADA;
        }
 */
        body.grid {
            height: 400%;
        }

        .image {
            margin-top: -100px;
        }

        .column {
            max-width: 900px;
        }


    </style>
    <style>
    .divMargin{
	margin:100px auto; 	
}
    </style>
</head>

<body>
    <div class="ui middle aligned center aligned grid ">
        <div class="column divMargin">
            <h2 class="ui teal image header">
                공지작성
            </h2>
            <form class="ui large form" method="GET"
				action="${contextPath}/notice/writeNotice.do">
                <div class="ui stacked segment">
                    <div class="field">
                        <input type="text" id="title" name ="title" placeholder="공지 제목" autocomplete="off" autofocus="autofocus">
                    </div>
                    <div class="field">
                        <div class="ui left icon input">
                            <textarea style="resize: vertical;" id="content" name ="content" placeholder="게시글 내용" rows="8"></textarea>
                        </div>
                    
                    <button class="ui fluid large teal submit button ">작성</button> 
				</div>
                </div>
				</form>

   			<a href="${contextPath}/notice/noticeList.do"><button class="ui fluid large teal submit button">공지리스트</button></a>
     
        </div>
    </div>
 
	
</body>
</html>









