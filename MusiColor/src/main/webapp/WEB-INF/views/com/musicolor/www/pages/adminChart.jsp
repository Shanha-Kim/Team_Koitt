<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS & theme -->
<link rel="stylesheet" href="/css/bootstrap-lux.css">
<link rel="stylesheet" href="/css/bootstrap.custom.css">
<style>
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
	width: 100%;
}

.chart--container {
	height: 100%;
	width: 100%;
	min-height: 150px;
}

.zc-ref {
	display: none;
}
</style>
<!-- Font Awesome 5 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<title>Chart</title>
</head>

<body class="bg-primary">
	<jsp:include page="adminNav.jsp" flush="false" />

	<div class="container-fluid" style="margin-top: 100px;">
		<div class="row ml-3 mr-3">
			<div class="col alert alert-dismissible alert-warning ml-2 mr-2">
				<h4 class="alert-heading">TODAY'S MEMBER</h4>
				<p>${COUNT.todayMember}</p>
			</div>

			<div class="col alert alert-dismissible alert-warning ml-2 mr-2">

				<h4 class="alert-heading">TOTAL MEMBER</h4>
				<p>${COUNT.totalMember}</p>
			</div>
			<div class="col alert alert-dismissible alert-success ml-2 mr-2">

				<h4 class="alert-heading">TODAY'S POST</h4>
				<p>${COUNT.todayBoard}</p>
			</div>
			<div class="col alert alert-dismissible alert-success ml-2 mr-2">

				<h4 class="alert-heading">TOTAL POST</h4>
				<p>${COUNT.totalBoard}</p>
			</div>
		</div>
		<div id="myChart" class="chart--container">
			<a class="zc-ref" href="https://www.zingchart.com/">Powered by
				ZingChart</a>
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="https://cdn.zingchart.com/zingchart.min.js"></script>
	<script>
		let chartConfig = {
			backgroundColor : '#191919',
			graphset : [
					{
						type : 'bar',
						backgroundColor : '#333333',
						borderWidth : '1px',
						borderColor : '#444444',
						width : '96%',
						height : '30%',
						x : '2%',
						y : '3%',
						title : {
							text : 'BEST SINGER',
							marginTop : '7px',
							marginLeft : '9px',
							backgroundColor : 'none',
							fontColor : '#707d94',
							fontFamily : 'Arial',
							fontSize : '15px',
							fontWeight : 'bold',
							shadow : false,
							textAlign : 'left'
						},
						plot : {
							tooltip : {
								padding : '5px 10px',
								backgroundColor : '#707e94',
								borderRadius : '6px',
								fontColor : '#fff',
								fontFamily : 'Arial',
								fontSize : '11px',
								shadow : false
							},
							animation : {
								delay : 500,
								effect : 'ANIMATION_SLIDE_BOTTOM'
							},
							barWidth : '33px',
							hoverState : {
								visible : false
							}
						},
						plotarea : {
							margin : '45px 20px 38px 45px'
						},
						scaleX : {
							values : [ '${VOCAL[0].v_name}', '${VOCAL[1].v_name}', '${VOCAL[2].v_name}',
									'${VOCAL[3].v_name}', '${VOCAL[4].v_name}', '${VOCAL[5].v_name}', '${VOCAL[6].v_name}',
									'${VOCAL[7].v_name}' ],
							guide : {
								visible : false
							},
							item : {
								paddingTop : '2px',
								fontColor : '#8391a5',
								fontFamily : 'Arial',
								fontSize : '11px'
							},
							itemsOverlap : true,
							lineColor : '#d2dae2',
							maxItems : 9999,
							offsetY : '1px',
							tick : {
								lineColor : '#d2dae2',
								visible : false
							}
						},
						scaleY : {
							values : '0:150:75',
							guide : {
								rules : [ {
									lineWidth : '0px',
									rule : '%i == 0'
								}, {
									alpha : 0.4,
									lineColor : '#d2dae2',
									lineStyle : 'solid',
									lineWidth : '1px',
									rule : '%i > 0'
								} ]
							},
							item : {
								paddingRight : '5px',
								fontColor : '#8391a5',
								fontFamily : 'Arial',
								fontSize : '10px'
							},
							lineColor : 'none',
							maxItems : 4,
							maxTicks : 4,
							tick : {
								visible : false
							}
						},
						series : [ {
							values : [ ${VOCAL[0].chart}, ${VOCAL[1].chart}, ${VOCAL[2].chart}, ${VOCAL[3].chart}, ${VOCAL[4].chart}, ${VOCAL[5].chart}, ${VOCAL[6].chart}, ${VOCAL[7].chart} ],
							styles : [ {
								backgroundColor : '#4dbac0'
							}, {
								backgroundColor : '#25a6f7'
							}, {
								backgroundColor : '#ad6bae'
							}, {
								backgroundColor : '#707d94'
							}, {
								backgroundColor : '#f3950d'
							}, {
								backgroundColor : '#e62163'
							}, {
								backgroundColor : '#4e74c0'
							}, {
								backgroundColor : '#9dc012'
							} ]
						} ]
					},
					{
						type : 'line',
						backgroundColor : '#333333',
						borderColor : '#444444',
						borderWidth : '1px',
						width : '96%',
						height : '63%',
						x : '2%',
						y : '35.2%',
						title : {
							text : 'MONTHLY POST',
							marginTop : '7px',
							marginLeft : '12px',
							backgroundColor : 'none',
							fontColor : '#707d94',
							fontFamily : 'Arial',
							fontSize : '15px',
							shadow : false,
							textAlign : 'left'
						},
						plot : {
							animation : {
								delay : 500,
								effect : 'ANIMATION_SLIDE_LEFT'
							}
						},
						plotarea : {
							margin : '50px 25px 70px 46px'
						},
						scaleY : {
							values : '0:100:25',
							guide : {
								alpha : 0.5,
								lineColor : '#d2dae2',
								lineStyle : 'solid',
								lineWidth : '1px'
							},
							item : {
								paddingRight : '5px',
								fontColor : '#8391a5',
								fontFamily : 'Arial',
								fontSize : '10px'
							},
							lineColor : 'none',
							tick : {
								visible : false
							}
						},
						scaleX : {
							values : [ '${NUMBER[11]}', '${NUMBER[10]}', '${NUMBER[9]}', '${NUMBER[8]}', '${NUMBER[7]}',
									'${NUMBER[6]}', '${NUMBER[5]}', '${NUMBER[4]}', '${NUMBER[3]}', '${NUMBER[2]}', '${NUMBER[1]}',
									'${NUMBER[0]}' ],
							guide : {
								visible : false
							},
							item : {
								paddingTop : '5px',
								fontColor : '#8391a5',
								fontFamily : 'Arial',
								fontSize : '10px'
							},
							lineColor : '#d2dae2',
							lineWidth : '2px',
							tick : {
								lineColor : '#d2dae2',
								lineWidth : '1px'
							}
						},
						legend : {
							margin : 'auto auto 15 auto',
							backgroundColor : 'none',
							borderWidth : '0px',
							item : {
								margin : '0px',
								padding : '0px',
								fontColor : '#707d94',
								fontFamily : 'Arial',
								fontSize : '9px'
							},
							layout : 'x4',
							marker : {
								type : 'match',
								padding : '3px',
								fontFamily : 'Arial',
								fontSize : '10px',
								lineWidth : '2px',
								showLine : 'true',
								size : 4
							},
							shadow : false
						},
						scaleLabel : {
							padding : '5px 10px',
							backgroundColor : '#707d94',
							borderRadius : '5px',
							fontColor : '#ffffff',
							fontFamily : 'Arial',
							fontSize : '10px'
						},
						crosshairX : {
							lineColor : '#707d94',
							lineWidth : '1px',
							plotLabel : {
								padding : '5px 10px',
								alpha : 1,
								borderRadius : '5px',
								fontColor : '#000',
								fontFamily : 'Arial',
								fontSize : '10px',
								shadow : false
							}
						},
						tooltip : {
							visible : false
						},
						series : [
								{
									text : 'ALL',
									values : [ ${CHART[11]}, ${CHART[10]}, ${CHART[9]}, ${CHART[8]}, ${CHART[7]}, ${CHART[6]}, ${CHART[5]}, ${CHART[4]},
										${CHART[3]}, ${CHART[2]}, ${CHART[1]}, ${CHART[0]} ],
									lineColor : '#cccccc',
									lineWidth : '2px',
									marker : {
										backgroundColor : '#fff',
										borderColor : '#cccccc',
										borderWidth : '1px',
										shadow : false,
										size : 3
									},
									palette : 0,
									shadow : false
								},
								{
									text : 'LOVE',
									values : [ ${CHART1[11]}, ${CHART1[10]}, ${CHART1[9]}, ${CHART1[8]}, ${CHART1[7]}, ${CHART1[6]}, ${CHART1[5]}, ${CHART1[4]},
										${CHART1[3]}, ${CHART1[2]}, ${CHART1[1]}, ${CHART1[0]} ],
									lineColor : '#ee9ca7',
									lineWidth : '2px',
									marker : {
										backgroundColor : '#fff',
										borderColor : '#ee9ca7',
										borderWidth : '1px',
										shadow : false,
										size : 3
									},
									palette : 1,
									shadow : false
								},
								{
									text : 'HAPPY',
									values : [ ${CHART2[11]}, ${CHART2[10]}, ${CHART2[9]}, ${CHART2[8]}, ${CHART2[7]}, ${CHART2[6]}, ${CHART2[5]}, ${CHART2[4]},
										${CHART2[3]}, ${CHART2[2]}, ${CHART2[1]}, ${CHART2[0]} ],
									lineColor : '#fb872b',
									lineWidth : '2px',
									marker : {
										backgroundColor : '#fff',
										borderColor : '#fb872b',
										borderWidth : '1px',
										shadow : false,
										size : 3
									},
									palette : 2,
									shadow : false
								},
								{
									text : 'PEACEFUL',
									values : [ ${CHART3[11]}, ${CHART3[10]}, ${CHART3[9]}, ${CHART3[8]}, ${CHART3[7]}, ${CHART3[6]}, ${CHART3[5]}, ${CHART3[4]},
										${CHART3[3]}, ${CHART3[2]}, ${CHART3[1]}, ${CHART3[0]} ],
									lineColor : '#11998e',
									lineWidth : '2px',
									marker : {
										backgroundColor : '#fff',
										borderColor : '#11998e',
										borderWidth : '1px',
										shadow : false,
										size : 3
									},
									palette : 3,
									shadow : false
								},
								{
									text : 'SAD',
									values : [ ${CHART4[11]}, ${CHART4[10]}, ${CHART4[9]}, ${CHART4[8]}, ${CHART4[7]}, ${CHART4[6]}, ${CHART4[5]}, ${CHART4[4]},
										${CHART4[3]}, ${CHART4[2]}, ${CHART4[1]}, ${CHART4[0]} ],
									lineColor : '#24c6dc',
									lineWidth : '2px',
									marker : {
										backgroundColor : '#fff',
										borderColor : '#24c6dc',
										borderWidth : '1px',
										shadow : false,
										size : 3
									},
									palette : 4,
									shadow : false
								},
								{
									text : 'ANGRY',
									values : [ ${CHART5[11]}, ${CHART5[10]}, ${CHART5[9]}, ${CHART5[8]}, ${CHART5[7]}, ${CHART5[6]}, ${CHART5[5]}, ${CHART5[4]},
										${CHART5[3]}, ${CHART5[2]}, ${CHART5[1]}, ${CHART5[0]} ],
									lineColor : '#ff5e62',
									lineWidth : '2px',
									marker : {
										backgroundColor : '#fff',
										borderColor : '#ff5e62',
										borderWidth : '1px',
										shadow : false,
										size : 3
									},
									palette : 5,
									shadow : false
								}]
					} ]
		};

		zingchart.render({
			id : 'myChart',
			data : chartConfig,
			height : '483px',
			width : '100%'
		});
	</script>
</body>
</html>