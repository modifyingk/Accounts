<%@page import="accounts_db.BusinessDAO"%>
<%@page import="accounts_db.BusinessVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bsn_id = request.getParameter("bsn_id");
	String bsn_name = request.getParameter("bsn_name");
	String bsn_rep = request.getParameter("bsn_rep");
	String bsn_addr = request.getParameter("bsn_addr");
	String bsn_indus = request.getParameter("bsn_indus");
	String bsn_type = request.getParameter("bsn_type");
	
	BusinessVO vo = new BusinessVO();
	vo.setBsn_id(bsn_id);
	vo.setBsn_name(bsn_name);
	vo.setBsn_rep(bsn_rep);
	vo.setBsn_addr(bsn_addr);
	vo.setBsn_indus(bsn_indus);
	vo.setBsn_type(bsn_type);
	
	BusinessDAO dao = new BusinessDAO();
	dao.update(vo);
%>