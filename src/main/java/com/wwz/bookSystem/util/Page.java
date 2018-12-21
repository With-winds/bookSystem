package com.wwz.bookSystem.util;

/**
 * 用来分页
 * @author ASUS
 *
 */
public class Page {
	int start=0;              //start: 开始位置
    int count = 7;           //count: 每页的个数
    int last = 0;             //last: 最后一页的位置,先预设一个值，后面通过caculateLast计算赋值
    int index=1;              //当前页码
    int total=1;                //总数
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
	//通过总数total和每页的个数计算出最后一页的位置
	public void caculateLast(int total) {
        // 假设总数是50，是能够被5整除的，那么最后一页的开始就是45
        if (0 == total % count)
            last = total - count;
        // 假设总数是51，不能够被5整除的，那么最后一页的开始就是50
        else
            last = total - total % count;      
    }
	
	//设置页码
	public void setUpIndex(int start,int count) {
		index=start/count+1;
	}	
}
