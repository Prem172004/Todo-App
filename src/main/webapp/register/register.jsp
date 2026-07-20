<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>User Registration</title>

<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<style>
body {
    background: linear-gradient(135deg, #f8f9fa, #e9ecef);
    min-height: 100vh;
}

.register-card {
    margin-top: 60px;
    border: none;
    border-radius: 15px;
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
}

.card-header {
    background: tomato;
    color: white;
    text-align: center;
    font-size: 28px;
    font-weight: bold;
    border-radius: 15px 15px 0 0 !important;
    padding: 20px;
}

.form-control {
    border-radius: 10px;
    height: 45px;
}

.btn-register {
    background: tomato;
    border: none;
    border-radius: 30px;
    font-size: 18px;
    font-weight: bold;
    width: 100%;
    padding: 10px;
    transition: .3s;
}

.btn-register:hover {
    background: #e5533d;
    transform: translateY(-2px);
}

.alert {
    border-radius: 10px;
}
</style>

</head>

<body>

    <jsp:include page="../common/header.jsp"></jsp:include>

    <div class="container">

        <div class="row justify-content-center">

            <div class="col-md-6">

                <div class="card register-card">

                    <div class="card-header">
                        Create Account
                    </div>

                    <div class="card-body">

                        <c:if test="${not empty NOTIFICATION}">
                            <div class="alert alert-success">
                                ${NOTIFICATION}
                            </div>
                        </c:if>

                        <form action="<%=request.getContextPath()%>/register"
                            method="post">

                            <div class="form-group">
                                <label>First Name</label>
                                <input type="text"
                                    class="form-control"
                                    name="firstName"
                                    placeholder="Enter First Name"
                                    required>
                            </div>

                            <div class="form-group">
                                <label>Last Name</label>
                                <input type="text"
                                    class="form-control"
                                    name="lastName"
                                    placeholder="Enter Last Name"
                                    required>
                            </div>

                            <div class="form-group">
                                <label>Username</label>
                                <input type="text"
                                    class="form-control"
                                    name="username"
                                    placeholder="Choose Username"
                                    required>
                            </div>

                            <div class="form-group">
                                <label>Password</label>
                                <input type="password"
                                    class="form-control"
                                    name="password"
                                    placeholder="Create Password"
                                    required>
                            </div>

                            <button type="submit" class="btn btn-register">
                                Register
                            </button>

                        </form>

                        <hr>

                        <p class="text-center mb-0">
                            Already have an account?
                            <a href="<%=request.getContextPath()%>/login">
                                Login here
                            </a>
                        </p>

                    </div>

                </div>

            </div>

        </div>

    </div>

    <jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>