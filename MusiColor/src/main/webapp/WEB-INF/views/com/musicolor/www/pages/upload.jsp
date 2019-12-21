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
    <link rel="stylesheet" href="/www/css/upload.css" />

    <!-- Font Awesome 5 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

    <title>upload</title>
  </head>

  <body class="sadbody">
    <!-- nav -->
    <nav class="navbar navbar-expand-sm navbar-dark bg-primary fixed-top">
      <a class="navbar-brand ml-5" href="#"><h3 class="logo">musicolor</h3></a>

      <ul class="nav navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="#"><i class="fas fa-search f-20"></i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><i class="fas fa-random f-20"></i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><i class="fas fa-cloud-upload-alt f-20"></i></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"><i class="fas fa-user f-20"></i></a>
        </li>
      </ul>
    </nav>

    <div class="container" id="main">
      <h1 class="text-center white mb-5">UPLOAD YOUR MUSIC</h1>

      <!-- 감정상태 -->
      <div class="row form-group ml-2 mr-2">
        <div class="col custom-control custom-radio text-center">
          <input type="radio" id="customRadio1" name="customRadio" class="custom-control-input" checked="" />
          <label class="custom-control-label" for="customRadio1">EMO</label>
        </div>
        <div class="col custom-control custom-radio text-center">
          <input type="radio" id="customRadio2" name="customRadio" class="custom-control-input" />
          <label class="custom-control-label" for="customRadio2">EMO</label>
        </div>
        <div class="col custom-control custom-radio text-center">
          <input type="radio" id="customRadio3" name="customRadio" class="custom-control-input" />
          <label class="custom-control-label" for="customRadio3">EMO</label>
        </div>
        <div class="col custom-control custom-radio text-center">
          <input type="radio" id="customRadio4" name="customRadio" class="custom-control-input" />
          <label class="custom-control-label" for="customRadio4">EMO</label>
        </div>
        <div class="col custom-control custom-radio text-center">
          <input type="radio" id="customRadio5" name="customRadio" class="custom-control-input" />
          <label class="custom-control-label" for="customRadio5">EMO</label>
        </div>
        <div class="col custom-control custom-radio text-center">
          <input type="radio" id="customRadio6" name="customRadio" class="custom-control-input" />
          <label class="custom-control-label" for="customRadio6">EMO</label>
        </div>
      </div>

      <div class="row form-group text-center d-flex justify-content-center">
        <input type="text" class="form-control w-100 bg-primary" placeholder="가수 또는 음악 제목을 입력해주세요" id="inputDefault" />
      </div>
      <!-- <div class="row mb-3">
        <button type="button" class="btn btn-block btn-black" data-toggle="modal" data-target="#myModal1">SEARCH</button>
      </div> -->

      <div class="text-center mb-4">
        <span class="badge badge-pill badge-info" data-toggle="modal" data-target="#myModal1">SEARCH MUSIC</span>
      </div>

      <div class="row mb-3">
        <textarea class="form-control bg-primary" id="exampleTextarea" rows="10" placeholder="WRITE!"></textarea>
      </div>

      <div class="row mb-3 d-flex justify-content-center">
        <button type="button" class="btn btn-black btn-block">WRITE</button>
      </div>
    </div>

    <!-- first modal, search music -->
    <div class="modal" id="myModal1">
      <div class="modal-dialog">
        <div class="modal-content bg-primary">
          <!-- Modal body -->
          <div class="modal-body">
            <h1 class="white text-center mt-3 mb-3">SEARCH MUSIC</h1>
            <table class="table-sm table-hover white text-center">
              <thead>
                <tr>
                  <th style="width: 20%;">SINGER</th>
                  <th style="width: 75%;">SONG</th>
                  <th style="width: 5%;">link</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Shawn Mendes, Camila Cabello</td>
                  <td>Senorita</td>
                  <td><i class="fab fa-youtube"></i></td>
                </tr>
                <tr>
                  <td>Rockabye</td>
                  <td>Clean Bandit</td>
                  <td><i class="fab fa-youtube"></i></td>
                </tr>
                <tr>
                  <td>Juice</td>
                  <td>Rizzo</td>
                  <td><i class="fab fa-youtube"></i></td>
                </tr>
              </tbody>
            </table>
            <hr class="white" />
            <div class="text-center">
              <button type="button" class="btn btn-black btn-block" id="more">찾으시는 노래가 없나요?</button>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- second modal, music add -->
    <div class="modal" id="myModal2">
      <div class="modal-dialog">
        <div class="modal-content bg-primary">
          <!-- Modal body -->
          <div class="modal-body">
            <div class="card text-white bg-primary mb-3" id="sad">
              <h1 class="card-header text-center mt-3">ADD MUSIC</h1>
              <div class="card-body">
                <div class="form-group">
                  <label for="exampleInputEmail1">SINGER</label>
                  <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="가수 이름을 입력해주세요" />
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">SONG</label>
                  <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="노래 이름을 입력해주세요" />
                </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">YOUTUBE</label>
                  <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="유튜브 링크를 입력해주세요" />
                </div>
                <div class="form-group">
                  <label for="exampleInputFile">ALBUM COVER</label>
                  <input type="file" class="form-control-file" id="exampleInputFile" aria-describedby="fileHelp" />
                </div>
                <div class="text-center mt-5">
                  <button type="button" class="btn btn-black btn-block" id="add">등록</button>
                </div>
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
        $("#more").click(function() {
          $("#myModal1").modal("hide") //닫기
          $("#myModal2").modal("show") //열기
        })

        $("#add").click(function() {
          $("#myModal2").modal("hide") //열기
        })
      })
    </script>
  </body>
</html>
