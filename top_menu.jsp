<%@ page contentType = "text/html;charset=utf-8" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="./index.jsp">
        <img src="../img/coupang.png" alt="Logo" style="height: 30px;">
        상품목록(Home)
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="./login/login.jsp">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./BoardListAction.do?pageNum=1">게시판(고객센터)</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./signup/signup.jsp">SignUp</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="./index.jsp">CS</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="admin/index_ad.jsp">관리자모드</a>
            </li>
        </ul>
    </div>
</nav>