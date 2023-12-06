<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%
// 세션에 사용자 정보를 저장하는 맵을 가져옵니다.
Map<String, String> users = (Map<String, String>) session.getAttribute("users");
if (users == null) {
// 맵이 없다면 새로 만듭니다.
users = new HashMap<>();
session.setAttribute("users", users);
}

// 폼에서 제출된 아이디와 비밀번호를 가져옵니다.
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

if (users.containsKey(id)) {
// 이미 같은 아이디의 사용자가 있다면 에러 메시지를 보여줍니다.
out.println("<script>alert('이미 존재하는 아이디입니다.'); history.go(-1);</script>");
} else {
// 그렇지 않다면 사용자 정보를 저장하고 성공 메시지를 보여줍니다.
users.put(id, pwd);
out.println("<script>alert('회원가입이 완료되었습니다.'); location.href='./index.jsp';</script>");
}
%>