<%@ page contentType = "text/html;charset=utf-8" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>
<%@ page import="java.sql.*" %>
<%@ include file="db/db_conn.jsp"%>
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />

<%! String greeting = "Welcome to Web Shooping Mall";
        String tagline = "Welcome to Web Market!";%>
<div class="container">
    <div class="jumbotron">
        <div class="container">
            <h3 class="display-4">
                <%=greeting%>
            </h3>
        </div>
    </div>
    <%
        ArrayList<Product> listOfProducts = productDAO.getAllProducts();
    %>
    <div class="container">
        <div class="row" align="center">
            <%
                String sql = "select * from product";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();
                while (rs.next()) {
            %>
            <div class="col-md-4">
                <div class="card bg-dark text-dark"> 
                    <img src="img/<%=rs.getString("p_filename")%>" class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <h5 class="card-title">
                            스마트폰 이미지 샘플
                        </h5>
                        <p class="card-text">
                            출처 : 구글 검색
                        </p>
                    </div>
                </div>
				    <h3><%=rs.getString("p_name")%></h3>
		            <p><%=rs.getString("p_description")%>
		            <p><%=rs.getString("p_unitprice")%>원
		            <p><a href="product_detail.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-secondary" role="button"> 상세 정보 &ge;></a>
			</div>
            <%
                    }
                if (rs != null)
                    rs.close();
                if (pstmt != null)
                    pstmt.close();
                if (conn != null)
                    conn.close();
            %>
        </div>
        <hr>
    </div>
</div>
    <div class = "card bg-dark text-white">
        <img src="img\cm_03.jpg" class="card-img" alt = "...">
        <div class = "card-img-overlay">
            <h5 class="card-title">
                회원가입 이벤트
            </h5>
            <p class="card-text">
                출처 : 쿠팡
            </p>
        </div>
</div>
<div class="list-group">
    <a href="#" class="list-group-item-action active" aria-current="true">
        회원가입 바로가기
    </a>
    <a href="#" class="list-group-item-action active" aria-current="true">
        다른 혜택 알아보기
    </a>
</div>
    <%--<div class="container">
        <div class="text-center">
            <h3>
                <%=tagline
            </h3>
        </div>
        <hr>
    </div>--%>