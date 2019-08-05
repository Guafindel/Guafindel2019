package membermanager.service;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import membermanager.dao.MemberInfoDao;
import membermanager.model.RequestMemberInfo;

public class MemberRegService implements MemberManagerService {

	@Override
	public String getViewName(HttpServletRequest request, HttpServletResponse response) {

		/*
		 * String mId = request.getParameter("mId"); String mPw =
		 * request.getParameter("mPw"); String mName = request.getParameter("mName");
		 * 
		 * RequestMemberInfo requestMemberInfo = new RequestMemberInfo(mId, mPw, mName,
		 * null);
		 * 
		 * 
		 * 
		 * MemberInfoDao dao = MemberInfoDao.getInstance();
		 * 
		 * Connection conn = null;
		 * 
		 * int rCnt = 0;
		 * 
		 * try { conn = jdbc.ConnectionProvider.getConnection();
		 * 
		 * rCnt = dao.insert(conn, requestMemberInfo.toMemberInfo());
		 * 
		 * } catch (SQLException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 * 
		 * request.setAttribute("rCnt", rCnt);
		 * 
		 * String viewName = "/WEB-INF/view/member/memberReg.jsp";
		 * 
		 * 
		 * 
		 * return viewName;
		 */

		RequestMemberInfo requestmemberinfo = new RequestMemberInfo();
		
		String uploadURI = "/uploadfile";
		
		String dir = request.getSession().getServletContext().getRealPath(uploadURI);

		boolean isMultipart = ServletFileUpload.isMultipartContent(request);

		DiskFileItemFactory factory = new DiskFileItemFactory();

		ServletFileUpload upload = new ServletFileUpload(factory);

		// FileItem <- 폼 페이지에서 전송한 데이터들 , uName, sNumber, report
		List<FileItem> items;

		try {
			items = upload.parseRequest(request);

			Iterator<FileItem> itr = items.iterator();

			while (itr.hasNext()) {

				FileItem fileItem = itr.next();

				// 일반 폼 또는 파일 작성
				
				//파일이 아닐 때
				if (fileItem.isFormField()) {

					if (fileItem.getFieldName().contentEquals("mId")) {
						requestmemberinfo.setmId(fileItem.getString("utf-8"));

					}

					if (fileItem.getFieldName().contentEquals("mPw")) {
						requestmemberinfo.setmPw(fileItem.getString("utf-8"));

					}

					if (fileItem.getFieldName().contentEquals("mName")) {
						requestmemberinfo.setmName(fileItem.getString("utf-8"));

					}

				} else {
					
					if(fileItem.getFieldName().equals("mPhoto")) {
						//새로운 저장 파일 이름
						String newFileName = "user_" + System.nanoTime();
						//지정된 폴더에 파일 쓰기
						fileItem.write(new File(dir, newFileName));
						//파일 이름을 자바빈에 저장하기.
						requestmemberinfo.setmPhoto(newFileName);
						System.out.println(dir);
					}
				}
				
				request.setAttribute("requestmemberinfo", requestmemberinfo);
			}

			
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		MemberInfoDao dao = MemberInfoDao.getInstance();
		  
		  Connection conn = null;
		  
		  int rCnt = 0;
		  
		  try { conn = jdbc.ConnectionProvider.getConnection();
		  
		  rCnt = dao.insert(conn, requestmemberinfo.toMemberInfo());
		  
		  } catch (SQLException e) { // TODO Auto-generated catch block
		  e.printStackTrace(); }
		  
		  
		  
		  request.setAttribute("rCnt", rCnt);
		  
		  String viewName = "/WEB-INF/view/member/memberReg.jsp";
		  
		  
		  
		  
		  
		  return viewName;
		
		

	}

}
