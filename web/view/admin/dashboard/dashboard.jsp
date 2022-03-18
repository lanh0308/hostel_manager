<%-- 
    Document   : dashboard
    Created on : Feb 27, 2022, 8:46:17 PM
    Author     : lanh0
--%>

<%@page import="model.RoomRental"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dashboard</title>
        <%
            ArrayList<RoomRental> roomRentals = (ArrayList<RoomRental>) request.getAttribute("roomRentals");
        %>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.7.1/dist/chart.min.js"></script>
    </head>
    <style>
        #chartdiv {
            width: 100%;
            height: 80vh;
        }
    </style>
    <jsp:include page="../base/header.jsp" />
    <body>
        <div class="flex">
            <div class="w-64  bg-gray-50">
                <jsp:include page="../navbar/navbar.jsp" />
            </div>
            <div class="w-full px-10 py-5">
                <div class="grid grid-cols-4 gap-10">
                    <div class="p-6 bg-white rounded-lg border border-gray-200 shadow-md text-center py-10">
                        <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">Room empty</h5>
                        <p class="mt-3 font-normal text-gray-700 font-medium" id="room-quantity-empty">0</p>
                    </div>
                    <div class="p-6 bg-white rounded-lg border border-gray-200 shadow-md text-center py-10">
                        <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">Payment in 1 month</h5>
                        <p class="mt-3 font-normal text-gray-700 font-medium"  id="payment-one-month">0</p>
                    </div>
                    <div class="p-6 bg-white rounded-lg border border-gray-200 shadow-md text-center py-10">
                        <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">In debt</h5>
                        <p class="mt-3 font-normal text-gray-700 font-medium" id="debit-payment">0</p>
                    </div>
                    <div class="p-6 bg-white rounded-lg border border-gray-200 shadow-md text-center py-10">
                        <h5 class="mb-2 text-2xl font-bold tracking-tight text-gray-900">Total Payment</h5>
                        <p class="mt-3 font-normal text-gray-700 font-medium"n id="total-payment">0</p>
                    </div>
                </div>
                <div class="w-full mt-10">
                    <!--                    <div>
                                             <canvas id="myChart" style="max-width: 100%!important; max-height: 80vh!important"></canvas>
                                        </div>-->
                    <script src="https://cdn.amcharts.com/lib/5/index.js"></script>
                    <script src="https://cdn.amcharts.com/lib/5/xy.js"></script>
                    <script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
                    <div id="chartdiv"></div>
                </div>
            </div>
        </div>
    </body>
    <script>
        var totalPaymentMonth = 0;
        var totalDebit = 0;
        var total = 0;
        var dataOfMonth = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        var dataDebitOfMonth = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        <c:forEach items="${roomRentals}" var="roomRental">
            <c:forEach items="${roomRental.services}" var="service">
        total += ${roomRental.getToltalPriceByDate(service.key)}
        if (new Date("${service.key}").getYear() == new Date().getYear() && (new Date("${service.key}").getMonth() == new Date().getMonth() - 1)) {
            totalPaymentMonth += ${roomRental.getToltalPriceByDate(service.key)}
            totalDebit +=${roomRental.getToltalPriceByDateDebit(service.key)};
        }
        if (new Date("${service.key}").getYear() == new Date().getYear()) {
            dataDebitOfMonth[new Date("${service.key}").getMonth()] += ${roomRental.getToltalPriceByMonthDebit(service.key.getMonth())};
            dataOfMonth[new Date("${service.key}").getMonth()] += ${roomRental.getToltalPriceByMonth(service.key.getMonth())};
        }
            </c:forEach>
        </c:forEach>
        $("#payment-one-month").text(totalPaymentMonth.toLocaleString('vi', {style: 'currency', currency: 'VND'}));
        $("#debit-payment").text(totalDebit.toLocaleString('vi', {style: 'currency', currency: 'VND'}));
        $("#total-payment").text(total.toLocaleString('vi', {style: 'currency', currency: 'VND'}))
        var roomEmpty = 0;
        <c:forEach items="${rooms}" var="room">
            <c:if test="${room.isEmpty}">
        roomEmpty += 1;
            </c:if>
        </c:forEach>
        $("#room-quantity-empty").text(roomEmpty);
    </script>

    <script>
        var root = am5.Root.new("chartdiv");

        root.setThemes([
            am5themes_Animated.new(root)
        ]);


        var chart = root.container.children.push(am5xy.XYChart.new(root, {
            panX: true,
            panY: true,
            wheelX: "panX",
            wheelY: "zoomX",
            pinchZoomX: true
        }));

        var cursor = chart.set("cursor", am5xy.XYCursor.new(root, {}));
        cursor.lineY.set("visible", false);



        var xRenderer = am5xy.AxisRendererX.new(root, {minGridDistance: 30});
        xRenderer.labels.template.setAll({
            rotation: -90,
            centerY: am5.p50,
            centerX: am5.p100,
            paddingRight: 15
        });

        var xAxis = chart.xAxes.push(am5xy.CategoryAxis.new(root, {
            maxDeviation: 0.3,
            categoryField: "month",
            renderer: xRenderer,
            tooltip: am5.Tooltip.new(root, {})
        }));

        var yAxis = chart.yAxes.push(am5xy.ValueAxis.new(root, {
            maxDeviation: 0.3,
            renderer: am5xy.AxisRendererY.new(root, {})
        }));


        var series = chart.series.push(am5xy.ColumnSeries.new(root, {
            name: "Series 1",
            xAxis: xAxis,
            yAxis: yAxis,
            valueYField: "value",
            sequencedInterpolation: true,
            categoryXField: "month",
            tooltip: am5.Tooltip.new(root, {
                labelText: "{valueY}"
            })
        }));

        series.columns.template.setAll({cornerRadiusTL: 5, cornerRadiusTR: 5});
        series.columns.template.adapters.add("fill", function (fill, target) {
            return chart.get("colors").getIndex(series.columns.indexOf(target));
        });

        series.columns.template.adapters.add("stroke", function (stroke, target) {
            return chart.get("colors").getIndex(series.columns.indexOf(target));
        });

        var data1 = dataOfMonth.map((item, index) => ({month: "Month "+(index+1), value: item}))
        console.log(data1);

        xAxis.data.setAll(data1);
        series.data.setAll(data1);


// Make stuff animate on load
// https://www.amcharts.com/docs/v5/concepts/animations/
        series.appear(1000);
        chart.appear(1000, 100);
    </script>



    <!--    <script>
            CHART_COLORS = {
                red: 'rgb(255, 99, 132)',
                orange: 'rgb(255, 159, 64)',
                yellow: 'rgb(255, 205, 86)',
                green: 'rgb(75, 192, 192)',
                blue: 'rgb(54, 162, 235)',
                purple: 'rgb(153, 102, 255)',
                grey: 'rgb(201, 203, 207)'
            };
    
            const labels = [
                'Tháng 1',
                'Tháng 2',
                'Tháng 3',
                'Tháng 4',
                'Tháng 5',
                'Tháng 6',
                'Tháng 7',
                'Tháng 8',
                'Tháng 9',
                'Tháng 10',
                'Tháng 11',
                'Tháng 12',
            ];
            const data = {
                labels: labels,
                datasets: [
                    {
                        label: 'Debit',
                        data: dataDebitOfMonth,
                        borderColor: CHART_COLORS.red,
                        backgroundColor: CHART_COLORS.red,
                        stack: 'combined',
                        type: 'bar'
                    },
                    {
                        label: 'Thu nhập',
                        data: dataOfMonth,
                        borderColor: CHART_COLORS.blue,
                        backgroundColor: CHART_COLORS.blue,
                        stack: 'combined'
                    }
                ]
            };
    
            const config = {
                type: 'line',
                data: data,
                options: {
                    plugins: {
                        title: {
                            display: true,
                            text: 'Thu nhập'
                        }
                    },
                    scales: {
                        y: {
                            stacked: true
                        }
                    }
                },
            };
    
            const myChart = new Chart(document.getElementById('myChart'), config);
        </script>-->
    <jsp:include page="../base/footer.jsp" />
</html>
