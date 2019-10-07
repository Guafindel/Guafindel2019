package com.guafindel.demo.controller;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.guafindel.demo.dao.MemberDaoImpl;
import com.guafindel.demo.domain.MemberInfo;
import com.guafindel.demo.entity.MemberEntity;
import com.guafindel.demo.mapper.MemberMapper;
import com.guafindel.demo.repository.MemberRepository;

@Controller
public class IndexController {
	
	@Autowired
	private MemberRepository repository;
	
	@Autowired
	private SqlSessionTemplate template;
	
	private MemberMapper mapper;

	@RequestMapping("/")
	@ResponseBody
	public List<MemberEntity> index() {

		List<MemberEntity> list = repository.findall();
		
		return list;
	}

	@RequestMapping("/hello")
	public void hello() {

	}
	
	@RequestMapping("/memberInfo")
	public void selectById() {
		
		mapper = template.getMapper(MemberMapper.class);
		
		MemberInfo info = mapper.selectMemberById("guafindel@gmail.com");
		
		System.out.println(info);
		
	}
	
	@RequestMapping("/members")
	public void selectMembers() {
		
		mapper = template.getMapper(MemberMapper.class);
		
		List<MemberInfo> info = mapper.selectAll();
		
		for(MemberInfo memberInfo : info) {
			System.out.println(memberInfo);
		}
		
	}
	
	@RequestMapping("/member/list")
	@ResponseBody
	public List<MemberEntity> getMemberList() {
		
		List<MemberEntity> list = null;
		
		list = repository.findAll();
		
		for (MemberEntity memberEntity : list) {
			System.out.println(memberEntity);
		}
		
		return list;
		
	}
	
	@RequestMapping("/member/insert")
	@ResponseBody
	public String insertMember() {
		
		MemberEntity entity = new MemberEntity();
		
		entity.setMid("cool@hot");
		entity.setMname("COOLin");
		entity.setMpw("12345");
		
		return repository.saveAndFlush(entity).toString();
		
	}
	
	@RequestMapping("/member/edit/{idx}")
	@ResponseBody
	public String editMember(
			@PathVariable("id") int idx
			) {
		
		MemberEntity entity = new MemberEntity();
		entity.setIdx(idx);
		entity.setMid("cool@hot.com");
		entity.setMname("COOLinHOT");
		entity.setMpw("54321");
		
		return repository.saveAndFlush(entity).toString();
		
	}
	
	@RequestMapping("/member/delete/{idx}")
	@ResponseBody
	public String deleteMember(
			@PathVariable("id") int idx
			) {
		
		MemberEntity entity = new MemberEntity();
		entity.setIdx(idx);
		
		repository.delete(entity);
		
		return "delete success";
		
	}
	
	@RequestMapping("/member/member/{idx}")
	public MemberEntity getMemberInfo(
			@PathVariable("idx") long idx
			) {
		
		MemberEntity entity = null;
		
		entity = repository.findByIdx(idx);
		
		System.out.println(entity);
		
		return entity;
		
	}
	
	@RequestMapping("/member/memberbyname/{name}")
	public List<MemberEntity> getMemberInfo(
			@PathVariable("name") String name
			) {
		
		List<MemberEntity> entitys = null;
		
		entitys = repository.findByMnameLike("%"+name+"%");
		
		System.out.println(entitys);
		
		return entitys;
		
	}
	
	@PersistenceContext
	EntityManager entityManager;
	
	private MemberDaoImpl dao;
	
	public IndexController() {
		this.dao = new MemberDaoImpl(entityManager);
	}
	
	@RequestMapping("/listall")
	@ResponseBody
	public List<MemberEntity> memberListAll() {
		
		this.dao = new MemberDaoImpl(entityManager);
		
		List<MemberEntity> list = dao.getAll();
		
		for(MemberEntity memberEntity : list) {
			System.out.println(memberEntity);
		}
		
		return list;
		
	}
	
	@RequestMapping("/listbyidx/{idx}")
	@ResponseBody
	public MemberEntity memberByIdx(
			@PathVariable("idx") long idx
			) {
		
		this.dao = new MemberDaoImpl(entityManager);
		
		MemberEntity entity = dao.findByIdx(idx);
	
		System.out.println(entity);
			
		return entity;
	
	}
	
	@RequestMapping("/listbyname/{name}")
	@ResponseBody
	public List<MemberEntity> memberByName(
			@PathVariable("name") String name
			) {
		
		this.dao = new MemberDaoImpl(entityManager);
		
		List<MemberEntity> list = dao.findByMname(name);
	
		for(MemberEntity memberEntity : list) {
			System.out.println(memberEntity);
		}
			
		return list;
		
	}
	
	@RequestMapping("/listfind/{str}")
	@ResponseBody
	public List<MemberEntity> memberByStr(
			@PathVariable("str") String str
			) {
		
		this.dao = new MemberDaoImpl(entityManager);
		
		List<MemberEntity> entity = dao.find(str);
	
		System.out.println(entity);
			
		return entity;
		
	}
	
	
}
