<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Todo Management</title>

<link rel="stylesheet"
    href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
    crossorigin="anonymous">

<style>
body{
    background:#f8f9fa;
}

.card{
    border:none;
    border-radius:10px;
}

.table th{
    background:#343a40;
    color:white;
}

.badge{
    font-size:90%;
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

            <a class="nav-link"
               href="${pageContext.request.contextPath}/list">
                Todos
            </a>

        </li>

    </ul>

    <ul class="navbar-nav ml-auto">

        <li class="nav-item">

            <a class="nav-link"
               href="${pageContext.request.contextPath}/logout">
                Logout
            </a>

        </li>

    </ul>

</nav>

</header>

<div class="container mt-5">

    <div class="card shadow">

        <div class="card-body">

            <div class="d-flex justify-content-between align-items-center mb-4">

                <h3 class="mb-0">
                    Todo List
                </h3>

                <a href="${pageContext.request.contextPath}/new"
                   class="btn btn-success">

                    + Add Todo

                </a>

            </div>

            <c:choose>

                <c:when test="${empty listTodo}">

                    <div class="alert alert-info text-center">

                        No todos found.
                        Click <strong>Add Todo</strong> to create one.

                    </div>

                </c:when>

                <c:otherwise>

                    <table class="table table-bordered table-hover">

                        <thead>

                            <tr>

                                <th>Title</th>
                                <th>Target Date</th>
                                <th>Status</th>
                                <th width="170">Actions</th>

                            </tr>

                        </thead>

                        <tbody>

                            <c:forEach var="todo" items="${listTodo}">

                                <tr>

                                    <td>
                                        <c:out value="${todo.title}" />
                                    </td>

                                    <td>
                                        <c:out value="${todo.targetDate}" />
                                    </td>

                                    <td>

                                        <c:choose>

                                            <c:when test="${todo.status}">

                                                <span class="badge badge-success">
                                                    Complete
                                                </span>

                                            </c:when>

                                            <c:otherwise>

                                                <span class="badge badge-warning">
                                                    In Progress
                                                </span>

                                            </c:otherwise>

                                        </c:choose>

                                    </td>

                                    <td>

                                        <a href="${pageContext.request.contextPath}/edit?id=${todo.id}"
                                           class="btn btn-sm btn-primary">

                                            Edit

                                        </a>

                                        <a href="${pageContext.request.contextPath}/delete?id=${todo.id}"
                                           class="btn btn-sm btn-danger"
                                           onclick="return confirm('Are you sure you want to delete this todo?');">

                                            Delete

                                        </a>

                                    </td>

                                </tr>

                            </c:forEach>

                        </tbody>

                    </table>

                </c:otherwise>

            </c:choose>

        </div>

    </div>

</div>

<jsp:include page="../common/footer.jsp"/>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>

</html>