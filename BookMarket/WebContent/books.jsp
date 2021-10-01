<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<!--<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session"></jsp:useBean>-->
<%@ page import="dao.BookRepository"%>

<html>
<head>
	<link rel = "stylesheet" href="./css/bootstrap.min.css">
	<title>도서 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 목록</h1>
		</div>
	</div>
	<%	
		BookRepository dao = BookRepository.getInstance();
		ArrayList<Book> listOfBooks = dao.getAllBooks();
	%>
	<div class="container">
		<div class="row" align="left">
			<%
				for(int i=0; i<listOfBooks.size();i++){
					Book book = listOfBooks.get(i);
			%>
			<div class="col-md-3">
				<img src="c:/upload_book/<%=book.getFilename()%>"
				style="width:100%">
			</div>
			<div class="col-md-6">
				<h4><%=book.getName()%></h4><br>
				<p><%=book.getDescription()%>
				<p><%=book.getAuthor() +"|" + book.getPublisher() +"|" + book.getUnitPrice() %>
				<hr>
			</div>
			<div class="col-md-3 col align-self-center">
				<a href="./product.jsp?id=<%=book.getBookId()%>" class="btn btn-secondary" role="button">
				상세 정보 &raquo;</a>
			</div>
			<%
				}
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>