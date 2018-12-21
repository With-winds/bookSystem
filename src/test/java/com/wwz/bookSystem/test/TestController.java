package com.wwz.bookSystem.test;

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;

import com.wwz.bookSystem.pojo.Book;
import com.wwz.bookSystem.pojo.BookDAO;
import com.wwz.bookSystem.pojo.TudouBookInfo;
import com.wwz.bookSystem.xml.RetrieveDocumentByURL;


public class TestController {
	
	public static void main(String[] args) throws ClientProtocolException, IOException
	{
		String douban="http://api.douban.com/book/subject/";
		
		String [] isbn= {"5952531","1159821","2073245","4816562","3987476","26820803","4146246","25711852","2068931","1676259","5491932","26388161","1894881","6346890","2309050","21797398","1220922","1550130","26264642","3420221","10561367","2377310","25899625","3628911","3132277","4719230","2032343","3360807","3142280","1787855","3012828","1141154"};
		
		 for (int i = 0; i < isbn.length; i++) {
			douban+=isbn[i];
			TudouBookInfo result=RetrieveDocumentByURL.retrieveDocumentByURL(douban);
			douban= "http://api.douban.com/book/subject/";
			
			//保存数据
			Book realBook=new Book();
			realBook.setId(Integer.parseInt(isbn[i]));
			realBook.setName(result.getTitle());
			realBook.setAuthor(result.getAuthor());
			realBook.setPublisher(result.getPublisher());
			realBook.setPubdate(result.getPubdate());
			realBook.setIsbn(result.getIsbn13());
			realBook.setImagePath(result.getImagePath());
			realBook.setSummary(result.getSummary());
			new BookDAO().add(realBook);
			
			try{
			    Thread thread = Thread.currentThread();
			    thread.sleep(200);//暂停1秒后程序继续执行
			}
			catch (InterruptedException e) {
			   
			    e.printStackTrace();
			}
			
		}
		
	}
	
}
