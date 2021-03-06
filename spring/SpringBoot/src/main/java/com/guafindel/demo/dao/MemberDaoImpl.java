package com.guafindel.demo.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import com.guafindel.demo.entity.MemberEntity;

public class MemberDaoImpl implements MemberDao<MemberEntity> {

	private EntityManager entityManager;

	public MemberDaoImpl() {
	}

	public MemberDaoImpl(EntityManager entityManager) {
		super();
		this.entityManager = entityManager;
	}

	@Override
	public List<MemberEntity> getAll() {

		Query query = entityManager.createQuery("from MemberEntity");

		List<MemberEntity> list = query.getResultList();
		
		entityManager.close();

		return list;
	}

	@Override
	public MemberEntity findByIdx(long idx) {

		Query query = entityManager.createQuery("from MemberEntity where idx=" + idx);

		MemberEntity entity = (MemberEntity)query.getSingleResult();

		return entity;
	}

	@Override
	public List<MemberEntity> findByMname(String name) {

		Query query = entityManager.createQuery("from MemberEntity where mname='"+name + "'");

		List<MemberEntity> list = query.getResultList();

		return list;
	}

	@Override
	public List<MemberEntity> find(String fstr) {

		List<MemberEntity> list = null;

		String qSql = "from MemberEntity where idx=:fidx or mname like : fname or mid like :fid";
		
		Long fIdx = 0L;
		
		try {
			fIdx = Long.parseLong(fstr);
		} catch (Exception e) {}
		
		Query query = entityManager.createQuery(qSql).setParameter("fidx", fIdx).setParameter("fname", "%"+fstr+"%").setParameter("fid", "%"+fstr);
		
		list = query.getResultList();
		
		return list;
	}

	@Override
	public List<MemberEntity> findall() {
		// TODO Auto-generated method stub
		return null;
	}

	

}
