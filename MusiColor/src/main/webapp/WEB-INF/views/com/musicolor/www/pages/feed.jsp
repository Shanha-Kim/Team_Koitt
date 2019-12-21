<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS & theme -->
    <link rel="stylesheet" href="/www/css/bootstrap-lux.css" />
    <link rel="stylesheet" href="/www/css/bootstrap.custom.css" />

    <!-- Font Awesome 5 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

    <title>index</title>
  </head>

  <body class="bg-primary">
    <jsp:include page="nav.jsp" flush="false" />

    <div class="container" id="main">
      <!-- content1 -->
      <div class="card mb-3 bg-primary mb-5" id="angry">
        <h3 class="card-header"><img class="profile" src="/www/img/profile1.jpg" />USERNAME</h3>
        <!-- video -->
        <div class="youtube">
          <iframe src="https://www.youtube.com/embed/4l2jpzPDtuQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
        <!-- body -->
        <div class="card-body pb-0">
          <span class="ml-auto"><i class="far fa-heart"></i> <strong>5 likes</strong></span>
          <h6 class="card-subtitle text-muted mb-2 mt-2">Dua Lipa - New Rules</h6>
          <p class="card-text">
            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,
            but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
          </p>
        </div>
        <!-- comment -->
        <ul class="list-group list-group-flush">
          <li class="list-group-item pt-3 pb-1 active"><strong>USERNAME</strong> Cras justo odio</li>
          <li class="list-group-item pt-0 pb-1 active"><strong>USERNAME</strong> Dapibus ac facilisis in</li>
          <li class="list-group-item pt-0 pb-3 active"><strong>USERNAME</strong> Vestibulum at eros</li>
        </ul>
        <div class="card-footer">
          <form method="POST" action="#">
            <input class="comment-write-dark" type="text" placeholder="댓글을 입력해주세요" />
          </form>
        </div>
      </div>

      <!-- content2 -->
      <div class="card mb-3 bg-primary mb-5" id="sad">
        <h3 class="card-header"><img class="profile" src="/www/img/profile2.jpg" />USERNAME</h3>
        <!-- video -->
        <div class="youtube">
          <iframe width="1268" height="713" src="https://www.youtube.com/embed/QYh6mYIJG2Y" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
        <!-- body -->
        <div class="card-body pb-0">
          <span class="ml-auto"><i class="far fa-heart"></i> <strong>10 likes</strong></span>
          <h6 class="card-subtitle text-muted mb-2 mt-2">Ariana Grande - 7 rings</h6>
          <p class="card-text">
            Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,
            but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
          </p>
        </div>
        <!-- comment -->
        <ul class="list-group list-group-flush">
          <li class="list-group-item pt-3 pb-1 comment-dark active"><strong>USERNAME</strong> Cras justo odio</li>
          <li class="list-group-item pt-0 pb-1 comment-dark active"><strong>USERNAME</strong> Dapibus ac facilisis in</li>
          <li class="list-group-item pt-0 pb-3 comment-dark active"><strong>USERNAME</strong> Vestibulum at eros</li>
        </ul>
        <div class="card-footer">
          <form method="POST" action="#">
            <input class="comment-write-dark" type="text" placeholder="댓글을 입력해주세요" />
          </form>
        </div>
      </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>
