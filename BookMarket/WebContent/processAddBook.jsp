<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository" %>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String filename="";
	String realFolder = "c:\\upload";
	int maxSize = 5*1024*1024;
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request,realFolder,maxSize,new DefaultFileRenamePolicy());
	
	String bookId = multi.getParameter("bookId");
	String bookName= multi.getParameter("bookName");
	String unitPrice = multi.getParameter("unitPrice");
	String author = multi.getParameter("author");
	String publisher = multi.getParameter("publisher");
	String releaseDate = multi.getParameter("releaseDate");
	String totalPages = multi.getParameter("totalPages");
	String description = multi.getParameter("description");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition");
	
	Integer price;
	
	if(unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);
	
	long stock,Tpage;
	
	if(unitsInStock.isEmpty())
		stock =0;
	else
		stock = Long.valueOf(unitsInStock);
	
	if(totalPages.isEmpty())
		Tpage = 0;
	else
		Tpage = Long.valueOf(totalPages);
	
	Enumeration files = multi.getFileNames();
	String fname = (String)files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	BookRepository dao = BookRepository.getInstance();
	
	Book newBook = new Book();
	newBook.setBookId(bookId);
	newBook.setName(bookName);
	newBook.setUnitPrice(price);
	newBook.setAuthor(author);
	newBook.setPublisher(publisher);
	newBook.setReleaseDate(releaseDate);
	newBook.setTotalPages(Tpage);
	newBook.setDescription(description);
	newBook.setCategory(category);
	newBook.setUnitsInStock(stock);
	newBook.setCondition(condition);
	newBook.setFilename(fileName);
	
	dao.addBook(newBook);
	response.sendRedirect("books.jsp");
%>



<!-- 
	private Integer unitPrice; //가격  unitPrice >> price
	private long unitsInStock; //재고 수 unitsInStock >> stock
	private long totalPages; //페이지 수 totalPages >>Tpage
 
 -->