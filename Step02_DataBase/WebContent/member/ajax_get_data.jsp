<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.json.JSONObject"%>
<%@page import="test.member.dto.MemberDto"%>
<%@page import="test.member.dao.MemberDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	//1. 수정할 회원의 번호를 얻어온다.
	int num=Integer.parseInt(request.getParameter("num"));
	//2. MemberDao 를 이용해서 수정할 회원의 정보를 얻어온다.
	MemberDto dto=MemberDao.getInstance().getData(num);
	//3. MemberDto 객체 안에 있는 내용을 JSONObject 를 이용해서 JSON 문자열로 만든다.
	/*
	Map<String, Object> map=new HashMap<>();
	map.put("num", dto.getNum());
	map.put("name", dto.getName());
	map.put("addr", dto.getAddr());
	String json=JSONObject.valueToString(map);
	*/
	
	//JSONObject 객체를 생성하면서 생성자의 인자로  dto 를 전달하고
	JSONObject obj=new JSONObject(dto);
	//toString() 메소드를 호출하면 JSON 문자열로 변환된다.
	String json=obj.toString();
%>
<%=json %>
