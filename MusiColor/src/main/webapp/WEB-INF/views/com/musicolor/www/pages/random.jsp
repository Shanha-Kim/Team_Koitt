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
    <link rel="stylesheet" href="/www/css/random.css" />

    <!-- Font Awesome 5 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

    <title>random</title>
  </head>

  <body class="bg-primary">
    <jsp:include page="nav.jsp" flush="false" />

    <div class="container" id="main">
      <h1 class="text-muted text-center">YOU LOOK SO EMO</h1>
      <!-- 감정 선택 버튼 -->
      <div class="btn-group btn-block mb-2" role="group" aria-label="Basic example">
        <button type="button" class="btn btn-primary selected">EMO</button>
        <button type="button" class="btn btn-primary text-muted">EMO</button>
        <button type="button" class="btn btn-primary text-muted">EMO</button>
        <button type="button" class="btn btn-primary text-muted">EMO</button>
      </div>

      <div class="text-center mb-3">
        <span class="badge badge-pill badge-danger">REFRESH THIS PAGE</span>
      </div>

      <!-- 앨범 이미지 -->
      <div class="row">
        <div class="col-4 big-square">
          <div class="square small-angry"><img class="album" src="/www/img/album1.jpg" /></div>
        </div>
        <div class="col-4 big-square">
          <div class="square small-sad"><img class="album" src="/www/img/album2.jpg" /></div>
        </div>
        <div class="col-4 big-square">
          <div class="square small-happy"><img class="album" src="/www/img/album3.jpg" /></div>
        </div>
      </div>

      <div class="row">
        <div class="col-4 big-square">
          <div class="square small-angry"><img class="album" src="/www/img/album1.jpg" /></div>
        </div>
        <div class="col-4 big-square">
          <div class="square small-sad"><img class="album" src="/www/img/album2.jpg" /></div>
        </div>
        <div class="col-4 big-square">
          <div class="square small-happy"><img class="album" src="/www/img/album3.jpg" /></div>
        </div>
      </div>

      <div class="row">
        <div class="col-4 big-square">
          <div class="square small-angry"><img class="album" src="/www/img/album1.jpg" /></div>
        </div>
        <div class="col-4 big-square">
          <div class="square small-sad"><img class="album" src="/www/img/album2.jpg" /></div>
        </div>
        <div class="col-4 big-square">
          <div class="square small-happy"><img class="album" src="/www/img/album3.jpg" /></div>
        </div>
    </div>

    <!-- modal, content detail -->
    <div class="modal" id="myModal1">
      <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content bg-primary">
          <!-- Modal body -->
          <div class="modal-body">
            <div class="row">
              <!-- Modal left, 일정 크기 이상 작아지면 안보이는 유튜브 -->
              <div class="col desktop-youtube" style="padding: 10px; border-right: 1px solid #282828;">
                <div style="height: 25%; width:100%;"></div>
                <div class="youtube text-left" style="height: 50%; width:100%;">
                  <iframe src="https://www.youtube.com/embed/4l2jpzPDtuQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
              </div>
              <!-- Modal right -->
              <div class="col text-left" style="padding: 10px;">
                <h3 class="card-header" style="padding: 10px;"><img class="profile" src="/www/img/profile1.jpg" />USERNAME</h3>
                <!-- 일정 크기 이상 작아지면 보이는 유튜브-->
                <div class="youtube mobile-youtube mb-3">
                  <iframe src="https://www.youtube.com/embed/4l2jpzPDtuQ" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="card-body" style="padding: 0px;">
                  <span class="ml-auto"><i class="far fa-heart"></i> <strong>5 likes</strong></span>
                  <h6 class="card-subtitle text-muted mb-2 mt-2">Dua Lipa - New Rules</h6>
                  <div class="body-scroll mb-3">
                    <p class="card-text">
                      Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five
                      centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including
                      versions of Lorem Ipsum.
                    </p>
                  </div>
                </div>
                <!-- comment -->
                <div class="bg-primary comment-scroll">
                  <ul class="list-group list-group-flush p-0 m-p">
                    <li class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong>USERNAME</strong> Cras justo odio</li>
                    <li class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong>USERNAME</strong> Dapibus ac facilisis in</li>
                    <li class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong>USERNAME</strong> Vestibulum at eros</li>
                    <li class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong>USERNAME</strong> Cras justo odio</li>
                    <li class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong>USERNAME</strong> Dapibus ac facilisis in</li>
                    <li class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong>USERNAME</strong> Vestibulum at eros</li>
                    <li class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong>USERNAME</strong> Cras justo odio</li>
                    <li class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong>USERNAME</strong> Dapibus ac facilisis in</li>
                    <li class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong>USERNAME</strong> Vestibulum at eros</li>
                  </ul>
                </div>
                <form class="pt-3" method="POST" action="#">
                  <input class="comment-write-dark" type="text" placeholder="댓글을 입력해주세요" />
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script>
      $(function() {
        $(".square").click(function() {
          $("#myModal1").modal("show") //앨범 이미지 누르면 모달창 열림
        })
      })
    </script>
  </body>
</html>
