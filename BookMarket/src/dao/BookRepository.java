package dao;
import java.util.ArrayList;
import dto.Book;

public class BookRepository {
	private ArrayList<Book> listOfBooks = new ArrayList<Book>();
	private static BookRepository instance = new BookRepository();
	
	public static BookRepository getInstance() {
		return instance;
	}
	
	public void addBook(Book book) {
		listOfBooks.add(book);
	}
	
	public BookRepository() { //���� ���̵�, ���� ��, ����
		Book html = new Book("P1234","[Hello Coding] HTML5+CSS3",15000);
		html.setDescription("���峪 PPT ������ ���� �� �ֳ���? �׷��� ���� �����ϴ�. ���� �ٷ� �������� ���ۿ� �����غ�����. ���� ����"
				+ "��ǻ�Ͱ� ��� �������ϴ�. �ڵ�� ���� ȭ���� �ٷ� ������ ������...");
		html.setCategory("HTML5 + CSS3");
		html.setAuthor("Ȳ��ȣ");
		html.setPublisher("�Ѻ��̵��");
		html.setUnitsInStock(1000);
		html.setTotalPages(300);
		html.setReleaseDate("2018/03/05");
		html.setCondition("New");
		html.setFilename("P1234.png");
		
		Book java = new Book("P1235","[IT �����] ���� ���� �ڹ� ���α׷���",27000);
		java.setDescription("��ü ������ �ٽɰ� �ڹ��� ������ ����� ����� �ٷ�鼭�� �ʺ��ڰ� ���� �н��� �� �ְ� �����߽��ϴ�."
				+ "�ð�ȭ ������ Ȱ���� ���� ����� �������� ���� �ٽ� �ڵ带 ���� ����� ����...");
		java.setCategory("JAVA");
	 	java.setAuthor("������");
	 	java.setPublisher("�Ѻ���ī����");
	 	java.setUnitsInStock(1000);
	 	java.setTotalPages(300);
	 	java.setReleaseDate("2017/07/25");
	 	java.setCondition("Old");
	 	java.setFilename("P1235.png");
	 	
		Book spring = new Book("P1236","[IT �����] ������4 �Թ�",27000);
		spring.setDescription("�������� �ܼ��� ��� ����� ������ �ͺ��� ��Ű��ó�� ��� �����ϰ� �����ϴ����� �� �߿��մϴ�. ������ ���翡 �ٿ��ִ�"
				+ "�����δ� ���� ���߿��� �������� ����� Ȱ���� �� �����ϴ�.");
		spring.setCategory("Spring");
		spring.setAuthor("�ϼ����� ����ġ, ������ ��Ÿ��, ��Ű ������(����ö, ���μ�)");
		spring.setPublisher("�Ѻ��̵��");
		spring.setUnitsInStock(1000);
		spring.setTotalPages(300);
		spring.setReleaseDate("2014/08/25");
		spring.setCondition("used");
		spring.setFilename("P1236.png");
		
		listOfBooks.add(html);
		listOfBooks.add(java);
		listOfBooks.add(spring);
	}
	
	public ArrayList<Book> getAllBooks(){
		return listOfBooks;
	}
	
	public Book getBookById(String bookId) {
		Book bookById = null;
		
		for(int i=0; i< listOfBooks.size(); i++) {
			Book book = listOfBooks.get(i);
			if(book!=null && book.getBookId()!=null && book.getBookId().equals(bookId)) {
				bookById = book;
				break;
			}
		}
		return bookById;
	}
}
