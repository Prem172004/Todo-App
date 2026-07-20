<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="action" value="insert" />
<c:if test="${todo != null}">
    <c:set var="action" value="update" />
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>User Management Application</title>

<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">

<style>
body {
    background-color: #f8f9fa;
}

.card {
    border: none;
    border-radius: 10px;
}

.required {
    color: red;
}
</style>

</head>

<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark bg-danger">

        <a class="navbar-brand"
            href="${pageContext.request.contextPath}/">
            Todo App
        </a>

        <ul class="navbar-nav">
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/list"
                    class="nav-link">
                    Todos
                </a>
            </li>
        </ul>

        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a href="${pageContext.request.contextPath}/logout"
                    class="nav-link">
                    Logout
                </a>
            </li>
        </ul>

    </nav>
</header>

<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-7">

            <div class="card shadow">

                <div class="card-body">

                    <h2 class="mb-4 text-center">

                        <c:choose>
                            <c:when test="${todo != null}">
                                Edit Todo
                            </c:when>

                            <c:otherwise>
                                Add New Todo
                            </c:otherwise>
                        </c:choose>

                    </h2>

                    <form action="${action}" method="post">

                        <c:if test="${todo != null}">
                            <input type="hidden"
                                   name="id"
                                   value="<c:out value='${todo.id}'/>">
                        </c:if>

                        <!-- Title -->

                        <div class="form-group">

                            <label for="title">
                                Todo Title
                                <span class="required">*</span>
                            </label>

                            <input
                                type="text"
                                id="title"
                                name="title"
                                class="form-control"
                                placeholder="Enter todo title"
                                value="<c:out value='${todo.title}'/>"
                                required
                                minlength="5"
                                maxlength="100">

                        </div>

                        <!-- Description -->

                        <div class="form-group">

                            <label for="description">
                                Todo Description
                            </label>

                            <textarea
                                id="description"
                                name="description"
                                class="form-control"
                                rows="4"
                                placeholder="Enter description"
                                maxlength="500"><c:out value="${todo.description}"/></textarea>

                        </div>

                        <!-- Status -->

                        <div class="form-group">

                            <label for="status">
                                Status
                            </label>

                            <select
                                id="status"
                                name="isDone"
                                class="form-control">

                                <option value="false"
                                    <c:if test="${todo != null && !todo.isDone}">
                                        selected
                                    </c:if>>
                                    In Progress
                                </option>

                                <option value="true"
                                    <c:if test="${todo != null && todo.isDone}">
                                        selected
                                    </c:if>>
                                    Complete
                                </option>

                            </select>

                        </div>

                        <!-- Target Date -->

                        <div class="form-group">

                            <label for="targetDate">
                                Target Date
                                <span class="required">*</span>
                            </label>

                            <input
                                type="date"
                                id="targetDate"
                                name="targetDate"
                                class="form-control"
                                value="<c:out value='${todo.targetDate}'/>"
                                required>

                        </div>

                        <!-- Buttons -->

                        <div class="text-center">

                            <button
                                type="submit"
                                class="btn btn-success">

                                Save Todo

                            </button>

                            <a href="${pageContext.request.contextPath}/list"
                               class="btn btn-secondary ml-2">

                                Cancel

                            </a>

                        </div>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

<jsp:include page="../common/footer.jsp"/>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>