package com.wwz.bookSystem.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.wwz.bookSystem.pojo.Tag;

/**
 * 对图书标签表tag进行操作
 * @author ASUS
 *
 */
@Mapper
public interface TagMapper {

	//添加分类
	public int addTag(Tag tag);
	
	//删除分类
	public void deleteTag(int id);
	
	//通过分类ID删除tagBook表中的对应关系
	public void deleteTagBookByTagId(int id);
	
	//修改分类
	public int updateTag(Tag tag);
	
	//查询所有分类
	public List<Tag> listAllTag();
	
}
