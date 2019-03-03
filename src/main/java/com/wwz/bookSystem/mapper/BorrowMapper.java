package com.wwz.bookSystem.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wwz.bookSystem.pojo.Borrow;

/**
 * 对借阅表borrow进行操作
 * @author ASUS
 *
 */
@Mapper
public interface BorrowMapper {

	//查询所有借阅记录
	public List<Borrow> selectAllBorrow();
	
}
