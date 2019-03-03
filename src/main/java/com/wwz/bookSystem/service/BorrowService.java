package com.wwz.bookSystem.service;

import java.util.List;

import com.wwz.bookSystem.pojo.Borrow;

/**
 * 业务逻辑层，与BorrowMapper对应
 * @author ASUS
 *
 */
public interface BorrowService {

	//查询所有借阅记录
	public List<Borrow> selectAllBorrow();
	
}
