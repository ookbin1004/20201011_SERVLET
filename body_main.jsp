<%@ page contentType = "text/html;charset=utf-8" %>
<%! String greeting = "Welcome to Web Shooping Mall";
        String tagline = "Welcome to Web Market!";%>
    <div class="jumbotron">
        <div class="container">
            <h1 class="display-3">
                <%=greeting%>
            </h1>
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