<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>그래프</title>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
        <style>
                    #relative{
            position:relative;
          }
          #absolute{
            position:absolute;
          }
          .out{
            width:1000px;
            height:700px;
           
          }
          .inner1{
            width:400px;
            height:400px;
           
            left:1%;
            top:1%;
          }
          .inner2{
            width:300px;
            height:300px;
            left:40%;
            top:1%;
           
          }
          .inner3{
            width:300px;
            height:200px;
            left:72%;
            top:1%;
          
          }
          .inner4{
            width:300px;
            height:200px;
            left:40%;
            top:50%;
           
          }
          .inner5{
            width:300px;
            height:300px;
            left:72%;
            top:50%;
        
          }
          .inner6{
            width:1000px;
            height:500px;
            left:1.5%;
            top:57%;
          
          }
          canvas {
            width: 100%;
            height: 100%;
        }
        </style>
    </head>
    <body>
        <div id="relative" class="out">
            <div id="absolute" class="inner1">
                
                <canvas id="myChart" width="400" height="400"></canvas>
            </div>
            <div id="absolute" class="inner2">
                <canvas id="pieChart" width="400" height="400"></canvas>
            </div>
            <div id="absolute" class="inner3">
                <canvas id="reservationChart"></canvas>
            </div>
            <div id="absolute" class="inner4">
                <canvas id="bookmarkChart"></canvas>
            </div>
            <div id="absolute" class="inner5">
                <canvas id="ratingChart"></canvas>
            </div>
    
        </div>
        <script>
            const ctx1 = document.getElementById('myChart').getContext('2d');
const myChart = new Chart(ctx1, {
    type: 'line',
    data: {
        labels: ['2023-08-01', '2023-08-02', '2023-08-03', '2023-08-04', '2023-08-05', '2023-08-06'],
        datasets: [{
            label: 'sales1',
            data: [1000000, 950000, 500000, 1700000, 1800000, 1500000],
            backgroundColor: ['red'],
            borderColor: ['red'],
            borderWidth: 2
        },
        {
            label: 'sales2',
            data: [800000, 1200000, 700000, 1600000, 1300000, 1000000],
            backgroundColor: ['blue'],
            borderColor: ['blue'],
            borderWidth: 2
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        },
        animation: {
            delay: function(context) {
                // 예: 데이터셋 인덱스에 따라 다른 지연 시간 설정
            if (context.datasetIndex === 0) {
                return 500; // 첫 번째 데이터셋의 경우 500ms 지연
            } else {
                return 1000; // 그 외 데이터셋의 경우 1000ms 지연
            }
                }
        }
    }
});

            </script>
            <script>
                const ctx2 = document.getElementById('pieChart').getContext('2d');
                const myPieChart = new Chart(ctx2, {
                    type: 'pie',
                    data: {
                        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple'],
                        datasets: [{
                            data: [12, 19, 3, 5, 2],
                            backgroundColor: [
                                'rgba(255, 99, 132, 0.6)',
                                'rgba(54, 162, 235, 0.6)',
                                'rgba(255, 206, 86, 0.6)',
                                'rgba(75, 192, 192, 0.6)',
                                'rgba(153, 102, 255, 0.6)'
                            ],
                            borderColor: [
                                'rgba(255, 99, 132, 1)',
                                'rgba(54, 162, 235, 1)',
                                'rgba(255, 206, 86, 1)',
                                'rgba(75, 192, 192, 1)',
                                'rgba(153, 102, 255, 1)'
                            ],
                            borderWidth: 1
                        }]
                    },
                    options: {
                        animation: {
                            delay: function(context) {
                                // 각 조각에 대해 500ms씩 증가하는 지연 시간 설정
                                return context.dataIndex * 500;
                            }
                        }
                    }
                });
            </script>
            <script>
                // 전월 대비 북마크 수 증가량 (막대 차트)
                const bookmarkCtx = document.getElementById('bookmarkChart').getContext('2d');
                const bookmarkChart = new Chart(bookmarkCtx, {
                    type: 'bar',
                    data: {
                        labels: ['January', 'February', 'March', 'April'],
                        datasets: [{
                            label: 'Bookmark Increase',
                            data: [5, 10, 3, 7],
                            backgroundColor: 'rgba(75, 192, 192, 0.6)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        }]
                    }
                });
                </script>
                <script>
                    // 사용자 평점 비율 (파이 차트)
        const ratingCtx = document.getElementById('ratingChart').getContext('2d');
        const ratingChart = new Chart(ratingCtx, {
            type: 'pie',
            data: {
                labels: ['5 Stars', '4 Stars', '3 Stars', '2 Stars', '1 Star'],
                datasets: [{
                    data: [50, 25, 10, 10, 5],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.6)',
                        'rgba(54, 162, 235, 0.6)',
                        'rgba(255, 206, 86, 0.6)',
                        'rgba(75, 192, 192, 0.6)',
                        'rgba(153, 102, 255, 0.6)'
                    ]
                }]
            }
        });
                </script>
                <script>
                    // 객실별 예약 빈도 (스택 바 차트)
        const reservationCtx = document.getElementById('reservationChart').getContext('2d');
        const reservationChart = new Chart(reservationCtx, {
            type: 'bar',
            data: {
                labels: ['Room A', 'Room B', 'Room C', 'Room D'],
                datasets: [{
                    label: 'January',
                    data: [5, 7, 3, 4],
                    backgroundColor: 'rgba(255, 99, 132, 0.6)'
                }, {
                    label: 'February',
                    data: [8, 6, 7, 5],
                    backgroundColor: 'rgba(54, 162, 235, 0.6)'
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true,
                        stacked: true
                    },
                    x: {
                        stacked: true
                    }
                }
            }
        });
                </script>
    
    </body>
</html>