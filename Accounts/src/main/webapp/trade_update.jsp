<%@page import="accounts_db.TradeDAO"%>
<%@page import="accounts_db.TradeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int trd_id = Integer.parseInt(request.getParameter("trd_id"));
	String trd_date = request.getParameter("trd_date");
	String trd_client = request.getParameter("trd_client");
	String trd_item = request.getParameter("trd_item");
	int trd_total = Integer.parseInt(request.getParameter("trd_total").replaceAll(",", ""));
	
	TradeVO vo = new TradeVO();
	vo.setTrd_id(trd_id);
	vo.setTrd_date(trd_date);
	vo.setTrd_client(trd_client);
	vo.setTrd_item(trd_item);
	vo.setTrd_total(trd_total);
	
	TradeDAO dao = new TradeDAO();
	dao.update(vo);
%>