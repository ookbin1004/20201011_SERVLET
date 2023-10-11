<%@ page contentType = "text/html;charset=utf-8" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Product"%>
<%@ page import="dao.ProductRepository"%>

<%! String greeting = "현재 페이지는 상품 목록입니다.";
        String tagline = "하단 페이지 : 확인";%>
<div class="container">
    <div class="jumbotron">
        <div class="container">
            <h3 class="display-4">
                <%=greeting%>
            </h3>
        </div>
    </div>
    <%
        ProductRepository dao = ProductRepository.getInstance();
        ArrayList<Product> listOfProducts = dao.getAllProducts();
    %>
    <div class="container">
        <div class="row" align="center">
            <%
                for (int i = 0; i < listOfProducts.size(); i++) {
                    Product product = listOfProducts.get(i);
            %>
            <div class="col-md-4">
                <div class="card bg-dark text-dark">
                    <img src="../img/<%=product.getFilename()%>" class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <h5 class="card-title">
                            스마트폰 이미지 샘플
                        </h5>
                        <p class="card-text">
                            출처 : 구글 검색
                        </p>
                    </div>
                </div>
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%>
				<p><%=product.getUnitPrice()%>원
                <p>
                    <a href="product_detail_ad.jsp?id=<%=product.getProductId()%>" class = "btn btn-secondary" role ="button"> 상품 상세 정보 &ge;</a>
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