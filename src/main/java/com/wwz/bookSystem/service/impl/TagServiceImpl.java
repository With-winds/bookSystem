package com.wwz.bookSystem.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wwz.bookSystem.mapper.TagMapper;
import com.wwz.bookSystem.pojo.Tag;
import com.wwz.bookSystem.service.TagService;

/**
 * 业务逻辑层，与TagMapper对应的实现类
 * @author ASUS
 *
 */
@Service("tagService")
public class TagServiceImpl implements TagService {

	@Autowired
	TagMapper tagMapper;
	
	//添加标签
	@Override
	public void addTag(Tag tag) throws Exception {
		int result=tagMapper.addTag(tag);
		if (result==0) {
			throw new Exception("修改用户信息失败");
		}
	}

	//删除标签
	@Override
	public void deleteTag(int id) {
		//删除标签
		tagMapper.deleteTag(id);
		//通过标签ID删除tagBook表中的对应关系
		tagMapper.deleteTagBookByTagId(id);
		
	}

	//修改标签
	@Override
	public void updateTag(Tag tag) throws Exception {
		int result=tagMapper.updateTag(tag);
		if (result==0) {
			throw new Exception("修改用户信息失败");
		}
	}

	//查询所有标签
	@Override
	public List<Tag> listAllTag() {
		return tagMapper.listAllTag();
	}

}
