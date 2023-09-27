<%@ page contentType = "text/html;charset=utf-8" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
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
                for (int i = 0; i < listOfProducts.size(); i++) {
                    Product product = listOfProducts.get(i);
            %>
            <div class="col-md-4">
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%>
				<p><%=product.getUnitPrice()%>원
			</div>
            <%
                }
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