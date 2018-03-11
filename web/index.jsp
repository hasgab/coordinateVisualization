<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="resources/processing.js"></script>
    <title>shapes</title>
</head>
<body>
<canvas id="canvas1"></canvas>

<script id="script1" type="text/javascript">
    $(document).ready(getAllPoints) ;

    function getAllPoints() {
        $.getJSON('/getPoints', function (points) {
            console.log(points)
            dd(points)
        });
    }
    function dd(nodes) {
        var sketch = new Processing.Sketch();
        sketch.use3DContext = true;
        sketch.attachFunction = function (processing) {
            var backgroundColour = processing.color(255, 255, 255);
            var nodeColour = processing.color(40, 168, 107);
            var edgeColour = processing.color(34, 68, 204);
            var nodeSize = 16;
            //
            //        var nodes = [{
            //            "x": -100.0,
            //            "y": -100.0,
            //            "z": -100.0
            //        },
            //            {"x": -100.0, "y": -100.0, "z": 100.0}, {"x": -100.0, "y": 100.0, "z": -100.0}, {
            //                "x": -100.0,
            //                "y": 100.0,
            //                "z": 100.0
            //            }, {"x": 100.0, "y": -100.0, "z": -100.0}, {"x": 100.0, "y": -100.0, "z": 100.0}, {
            //                "x": 100.0,
            //                "y": 100.0,
            //                "z": -100.0
            //            }, {"x": 100.0, "y": 100.0, "z": 100.0}];


//        var edge0 = [0, 1];
//        var edge1 = [1, 3];
//        var edge2 = [3, 2];
//
//        var edge3 = [2, 0];
//        var edge4 = [4, 5];
//        var edge5 = [5, 7];
//        var edge6 = [7, 6];
//        var edge7 = [6, 4];
//        var edge8 = [0, 4];
//        var edge9 = [1, 5];
//        var edge10 = [2, 6];
//        var edge11 = [3, 7];
//        var edges = [edge0, edge1, edge2, edge3, edge4, edge5, edge6, edge7, edge8, edge9, edge10, edge11];

            var edge0 = [0, 1];
            var edge1 = [1, 2];
            var edge2 = [2, 3];
            var edge3 = [3, 4];
            var edge4 = [4, 5];
            var edge5 = [5, 6];
            var edge6 = [6, 7];
            var edge7 = [0, 7];

            var edge8 = [8, 9];
            var edge9 = [9, 10];
            var edge10 = [10, 11];
            var edge11 = [11, 12];
            var edge12 = [12, 13];
            var edge13 = [13, 14];
            var edge14 = [14, 15];
            var edge15 = [8, 15];

            var edge16 = [0, 8];
            var edge17 = [1, 9];
            var edge18 = [2, 10];
            var edge19 = [3, 11];
            var edge20 = [4, 12];
            var edge21 = [5, 13];
            var edge22 = [6, 14];
            var edge23 = [7, 15];


            var edges = [edge0, edge1, edge2, edge3, edge4, edge5, edge6, edge7, edge8, edge9, edge10, edge11, edge12, edge13, edge14, edge15, edge16, edge17, edge18, edge19, edge20, edge21, edge22, edge23];

            // Rotate shape around the z-axis
            function rotateZ3D(theta) {
                var sin_t = processing.sin(theta);
                var cos_t = processing.cos(theta);

                for (var n = 0; n < nodes.length; n++) {
                    var node = nodes[n];
                    var x = node["x"];
                    var y = node["y"];
                    node["x"] = x * cos_t - y * sin_t;
                    node["y"] = y * cos_t + x * sin_t;
                }
            }

            function rotateY3D(theta) {
                var sin_t = processing.sin(theta);
                var cos_t = processing.cos(theta);

                for (var n = 0; n < nodes.length; n++) {
                    var node = nodes[n];
                    var x = node["x"];
                    var z = node["z"];
                    node["x"] = x * cos_t - z * sin_t;
                    node["z"] = z * cos_t + x * sin_t;
                }
            }

            function rotateX3D(theta) {
                var sin_t = processing.sin(theta);
                var cos_t = processing.cos(theta);

                for (var n = 0; n < nodes.length; n++) {
                    var node = nodes[n];
                    var y = node["y"];
                    var z = node["z"];
                    node["y"] = y * cos_t - z * sin_t;
                    node["z"] = z * cos_t + y * sin_t;
                }
            }

            processing.draw = function () {
                processing.background(backgroundColour);
                processing.translate(400, 400);


                processing.stroke(edgeColour);
                // Draw edges
                for (var e = 0; e < edges.length; e++) {
                    var n0 = edges[e][0];
                    var n1 = edges[e][1];
                    var node0 = nodes[n0];
                    var node1 = nodes[n1];
                    processing.line(node0["x"], node0["y"], node1["x"], node1["y"]);
                }
                processing.fill(nodeColour);

                processing.noStroke();
                for (var n = 0; n < nodes.length; n++) {
                    var node = nodes[n];
                    processing.ellipse(node["x"], node["y"], nodeSize, nodeSize);
                }

            };
            processing.setup = function () {
                processing.size(800, 800, processing.P3D);

                rotateZ3D(30);
                rotateY3D(30);
                rotateX3D(30);
            }


            processing.mouseDragged = function () {
                rotateY3D(processing.mouseX - processing.pmouseX);
                rotateX3D(processing.mouseY - processing.pmouseY);
            };

        };
        var canvas = document.getElementById("canvas1");
        var p = new Processing(canvas, sketch);

    }



</script>

</body>
</html>
