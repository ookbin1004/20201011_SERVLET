<%@ page contentType="text/html; charset=utf-8"%>
<html>
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="../top_menu.jsp" />
        <div class="jumbotron">
            <div class ="container">
                <h1 class="display-3">
                    상품 등록 페이지 접근 - 회원가입이 필요합니다.
                </h1>
            </div>
        </div>
        <div class="container" align="center">
            <div class="col-md-4 col-md-offset-4">
                <h3 class="form-signin-heading">
                    Please sign up
                </h3>
                <form class="form-signin" action="SignUpAction.do" method="post">
                    <div class="form-group">
                        <label for="inputUserName" class="sr-only">User Name</label>
                        <input type="text" class="form-control" placeholder="ID" name='id' required autofocus>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="sr-only">Password</label>
                        <input type="password" class="form-control" placeholder="Password" name='pwd' required>
                    </div>
                    <div class="form-group">
                        <label for="inputName" class="sr-only">Name</label>
                        <input type="text" class="form-control" placeholder="Name" name='name' required>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="sr-only">Email</label>
                        <input type="email" class="form-control" placeholder="Email" name='email' required>
                    </div>
                    <button class="btn btn-lg btn-primary btn-block" type="submit">회원가입</button>
                </form>
            </div>
        </div>
        <jsp:include page="../footer.jsp" />
    </body>
</html>