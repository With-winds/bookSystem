package date;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.junit.Test;

public class DateTest {

	@Test
	public void getdate() // //获取前后日期 i为正数 向后推迟i天，负数时向前提前i天
	 {
		SimpleDateFormat dformat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		int i=17;
		 String specifiedDay="2018-11-20 19:43:39";
		 System.out.println("此时时间："+specifiedDay);
		 Date dat = null;
		 try {
			dat=dformat.parse(specifiedDay);
		} 
		 catch (ParseException e) {
			e.printStackTrace();
		}
		 //Calendar这个专门用于对日期进行操作的类
		 Calendar cd = Calendar.getInstance();
		cd.setTime(dat);
		cd.set(Calendar.DAY_OF_YEAR, cd.get(Calendar.DAY_OF_YEAR) + i);
		 System.out.println(i+"天后时间"+dformat.format(cd.getTime()));
		 
	 }
	
}
