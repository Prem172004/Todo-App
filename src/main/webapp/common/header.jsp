<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger shadow-sm">
        <div class="container">

            <!-- Brand -->
            <a class="navbar-brand fw-bold d-flex align-items-center"
               href="https://www.javaguides.net">
                <i class="bi bi-check2-square me-2"></i>
                Todo App
            </a>

            <!-- Mobile Toggle Button -->
            <button class="navbar-toggler" type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- Navigation -->
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">

                    <li class="nav-item me-2">
                        <a href="<%= request.getContextPath() %>/login"
                           class="nav-link">
                            Login
                        </a>
                    </li>

                    <li class="nav-item">
                        <a href="<%= request.getContextPath() %>/register"
                           class="btn btn-light text-danger fw-bold px-3">
                            Sign Up
                        </a>
                    </li>

                </ul>
            </div>

        </div>
    </nav>
</header>