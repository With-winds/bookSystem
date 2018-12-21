package com.wwz.bookSystem.test;

import java.util.List;
import java.util.regex.Pattern;

import com.wwz.bookSystem.pojo.Tag;
import com.wwz.bookSystem.pojo.TagBook;
import com.wwz.bookSystem.pojo.TagBookDAO;
import com.wwz.bookSystem.pojo.TagDAO;

import us.codecraft.webmagic.Page;
import us.codecraft.webmagic.Site;
import us.codecraft.webmagic.Spider;
import us.codecraft.webmagic.processor.PageProcessor;
import us.codecraft.webmagic.selector.Html;

//爬虫类
public class WebMagicTest implements PageProcessor {
	
	/**
	 * 利用正则表达式匹配标签下的书籍列表界面URL
	 * 例如：https://book.douban.com/tag/名著
	 */
	static String tagLinks="https://book.douban.com/tag/.*";
	static Pattern tagLinksPattern=Pattern.compile(tagLinks);
	
	static int num=1;
	//书籍详情界面
	static String bookDetail="https://book.douban.com/subject/[0-9]+/";
	static Pattern bookDetailPattern=Pattern.compile(bookDetail);

	// 部分一：抓取网站的相关配置，包括编码、抓取间隔、重试次数等
    private Site site = Site.me().setRetryTimes(3).setSleepTime(1000);

	
	public static void main(String[] args) {
		//启动
		Spider.create(new WebMagicTest()).addUrl("https://book.douban.com/tag/?view=type")
			.thread(1).run();
	}

	// process是定制爬虫逻辑的核心接口，在这里编写抽取逻辑
	@Override
	public void process(Page page) {
		Html html=page.getHtml();
		if (page.getUrl().toString().equals("https://book.douban.com/tag/?view=type")) {
			String douban="https://book.douban.com/tag/";
			System.out.println();
			System.out.println("----分类列表----");
			List<String> tags=html.xpath("//table[@class='tagCol']/tbody/tr/td/a/text()").all();
			for (String string : tags) {
				System.out.println(string);
				page.addTargetRequest(douban+string);
			}
			System.out.println("----分类列表----");
			System.out.println();
		}
		else if(tagLinksPattern.matcher(page.getUrl().toString()).matches()) {
			System.out.println();
			System.out.println("----分类界面----");
			String tag=html.xpath("//div[@id='content']/h1/text()").get();
			String[] tagSplit=tag.split(" ");
			System.out.println("<----"+tagSplit[1]+"---->");
			//向数据库tag表插入数据
			new TagDAO().add(new Tag(num, tagSplit[1]));
			List<String> circles=html.xpath("//li[@class='subject-item']/div[@class='info']/h2/a/text()").all();
			List<String> circleUrls=html.xpath("//li[@class='subject-item']/div[@class='info']/h2/a/@href").all();
			for (int k=0;k<circles.size();k++) {
				System.out.print("序号： "+(k+1)+" 书名：");
				System.out.print(circles.get(k)+" 地址：");
				System.out.print(circleUrls.get(k)+" ID：");
				String[] ids=circleUrls.get(k).split("/");
				System.out.println(ids[ids.length-1]);
				//向数据表tagBook插入数据
				int book_id=Integer.parseInt(ids[ids.length-1]);
				new TagBookDAO().add(new TagBook(num,book_id ));
			}
			System.out.println();
			System.out.println("----分类界面----");
			System.out.println();
			num++;
		}

	}

	//返回抓取网站的相关配置
	@Override
	public Site getSite() {
		return site;
	}

}
