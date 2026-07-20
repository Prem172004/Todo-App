<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Login</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

<!-- Bootstrap Icons -->
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">

<style>
body {
    background: linear-gradient(135deg, #4e73df, #1cc88a);
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

.login-container {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
}

.card {
    border: none;
    border-radius: 15px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.2);
}

.card-header {
    background: #4e73df;
    color: white;
    text-align: center;
    font-size: 28px;
    font-weight: bold;
    border-radius: 15px 15px 0 0 !important;
}

.form-control {
    height: 48px;
}

.input-group-text {
    background: white;
}

.btn-login {
    background: #4e73df;
    color: white;
    font-weight: bold;
    height: 48px;
}

.btn-login:hover {
    background: #2e59d9;
}

.footer-text {
    text-align: center;
    margin-top: 20px;
}
</style>

</head>

<body>

    <jsp:include page="../common/header.jsp"></jsp:include>

    <div class="login-container">

        <div class="card col-lg-5 col-md-7 col-sm-10">

            <div class="card-header">
                <i class="bi bi-person-circle"></i> Login
            </div>

            <div class="card-body p-4">

                <form action="<%=request.getContextPath()%>/login" method="post">

                    <!-- Username -->
                    <div class="mb-3">
                        <label class="form-label">Username</label>

                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-person-fill"></i>
                            </span>

                            <input type="text"
                                   class="form-control"
                                   id="username"
                                   name="username"
                                   placeholder="Enter Username"
                                   required
                                   autofocus>
                        </div>
                    </div>

                    <!-- Password -->
                    <div class="mb-3">
                        <label class="form-label">Password</label>

                        <div class="input-group">
                            <span class="input-group-text">
                                <i class="bi bi-lock-fill"></i>
                            </span>

                            <input type="password"
                                   class="form-control"
                                   id="password"
                                   name="password"
                                   placeholder="Enter Password"
                                   required>

                            <button class="btn btn-outline-secondary"
                                    type="button"
                                    onclick="togglePassword()">
                                <i class="bi bi-eye" id="eyeIcon"></i>
                            </button>
                        </div>
                    </div>

                    <!-- Remember Me -->
                    <div class="form-check mb-3">
                        <input class="form-check-input"
                               type="checkbox"
                               id="remember">

                        <label class="form-check-label" for="remember">
                            Remember Me
                        </label>
                    </div>

                    <!-- Login Button -->
                    <div class="d-grid">
                        <button type="submit" class="btn btn-login">
                            <i class="bi bi-box-arrow-in-right"></i>
                            Login
                        </button>
                    </div>

                </form>

                <div class="footer-text">
                    <p class="mt-3 mb-1">
                        Forgot your password?
                        <a href="#">Reset Password</a>
                    </p>

                    <p>
                        Don't have an account?
                        <a href="<%=request.getContextPath()%>/register">
                            Register Here
                        </a>
                    </p>
                </div>

            </div>

        </div>

    </div>

    <jsp:include page="../common/footer.jsp"></jsp:include>

    <script>
    function togglePassword() {
        var password = document.getElementById("password");
        var icon = document.getElementById("eyeIcon");

        if (password.type === "password") {
            password.type = "text";
            icon.classList.remove("bi-eye");
            icon.classList.add("bi-eye-slash");
        } else {
            password.type = "password";
            icon.classList.remove("bi-eye-slash");
            icon.classList.add("bi-eye");
        }
    }
    </script>

</body>
</html>