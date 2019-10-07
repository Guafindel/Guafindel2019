package com.ngh.donate.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.ngh.donate.dao.DonateDaoInterface;
import com.ngh.donate.domain.DonateInfo;
import com.ngh.donate.domain.DonateListInfo;
import com.ngh.donate.domain.SearchParam;

@Service("donateListService")
public class DonateListService implements DonationService {

		private DonateDaoInterface dao;
		
		@Inject
		private SqlSessionTemplate template;
		
		public List<DonateListInfo> getList(
				String uid,
				int pageNumber,
				SearchParam sp
				){
			
			dao = template.getMapper(DonateDaoInterface.class);
			
			Map<String, Object> param = new HashMap<String, Object>();
			
			int COUNT_PER_PAGE = 5;
			
			
			param.put("uid", uid);
			
			param.put("startN", COUNT_PER_PAGE*(pageNumber-1));
			param.put("endN", COUNT_PER_PAGE);

			param.put("sp", sp);
			
			List<DonateListInfo> resultList = dao.getList(param);
			
			return resultList;
		}
		
		
		public int getCount(
				String uid,
				int pageNumber,
				SearchParam sp
				){
			
			dao = template.getMapper(DonateDaoInterface.class);
			
			Map<String, Object> param = new HashMap<String, Object>();
			
			int COUNT_PER_PAGE = 5;
			
			param.put("uid", uid);
			param.put("startN", COUNT_PER_PAGE*(pageNumber-1));
			param.put("endN", COUNT_PER_PAGE*(pageNumber));
			param.put("sp", sp);
			
			int resultCnt = dao.getListCount(param);
			
			return resultCnt;
		}
		

}
