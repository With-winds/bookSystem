package com.wwz.bookSystem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wwz.bookSystem.mapper.BorrowMapper;
import com.wwz.bookSystem.pojo.Borrow;
import com.wwz.bookSystem.service.BorrowService;

/**
 * 业务逻辑层，与BorrowMapper对应的实现类
 * @author ASUS
 *
 */
@Service("borrowService")
public class BorrowServiceImpl implements BorrowService {
	
	@Autowired
	BorrowMapper borrowMapper;

	//查询所有借阅记录
	@Override
	public List<Borrow> selectAllBorrow() {
		return borrowMapper.selectAllBorrow();
	}

}
