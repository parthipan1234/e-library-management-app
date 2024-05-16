package dto;

public class Books {
	private int bookid;
public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
private String bookName;
private String keyWords;
private  byte[]bookFile;

public Books() {
	super();
	// TODO Auto-generated constructor stub
}
public Books(int bookid,String bookName, String keyWords, byte[] bookFile) {
	
	this.bookid=bookid;
	this.bookName = bookName;
	this.keyWords = keyWords;
	this.bookFile = bookFile;
}
public String getBookName() {
	return bookName;
}
public void setBookName(String bookName) {
	this.bookName = bookName;
}
public String getKeyWords() {
	return keyWords;
}
public void setKeyWords(String keyWords) {
	this.keyWords = keyWords;
}
public byte[] getBookFile() {
	return bookFile;
}
public void setBookFile(byte[] bookFile) {
	this.bookFile = bookFile;
}


}
