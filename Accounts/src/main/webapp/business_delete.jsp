<%@page import="accounts_db.BusinessDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String bsn_id = request.getParameter("bsn_id");
	
	BusinessDAO dao = new BusinessDAO();
	dao.delete(bsn_id);
%>