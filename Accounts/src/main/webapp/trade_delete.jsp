<%@page import="accounts_db.TradeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int trd_id = Integer.parseInt(request.getParameter("trd_id"));
	
	TradeDAO dao = new TradeDAO();
	dao.delete(trd_id);
%>