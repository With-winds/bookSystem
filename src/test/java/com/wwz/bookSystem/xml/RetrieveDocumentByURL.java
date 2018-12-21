package com.wwz.bookSystem.xml;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Random;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.DefaultHttpClient;

import com.wwz.bookSystem.pojo.TudouBookInfo;
 

public class RetrieveDocumentByURL {
	

  
  public static TudouBookInfo retrieveDocumentByURL(String url) throws ClientProtocolException, IOException{
    DefaultHttpClient client = new DefaultHttpClient();
    HttpGet get = new HttpGet(url);
    HttpResponse response = client.execute(get);
        HttpEntity entity = response.getEntity();
        InputStream is = entity.getContent();
        TudouBookInfo book = new BookXMLParser(is).getBook();
        return book;
  }

  
  public static void main(String[] args) throws ClientProtocolException, IOException  {
	 String douban= "http://api.douban.com/book/subject/isbn/";
	 retrieveDocumentByURL("http://api.douban.com/book/subject/isbn/9787020042494");
	 String[] isbn= {"9787810514156","9787108010964","9787506312820","9787534405501","9787563345137","9787507104455","9787563350032","9787532729951","9787806572511","9787508603599","9787500433026","9787806608050"};
	 for (int i = 0; i < isbn.length; i++) {
		douban+=isbn[i];
		retrieveDocumentByURL(douban);
		douban= "http://api.douban.com/book/subject/isbn/";
	}
	  
  }

 
}
