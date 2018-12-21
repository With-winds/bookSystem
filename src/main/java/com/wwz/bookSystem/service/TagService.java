package com.wwz.bookSystem.service;

import java.util.List;

import com.wwz.bookSystem.pojo.Tag;

/**
 * 业务逻辑层，与TagMapper对应
 * @author ASUS
 *
 */
public interface TagService {
	
	//添加标签
	public void addTag(Tag tag) throws Exception;
	
	//删除标签
	public void deleteTag(int id);
	
	//修改标签
	public void updateTag(Tag tag) throws Exception;
	
	//查询所有标签
	public List<Tag> listAllTag();
	
}
