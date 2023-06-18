<!DOCTYPE html>
<html>
<head>
  <title>My To-Do List</title>
  <style>
    table {
      border-collapse: collapse;
      width: 70%;
      margin-left: auto;
      margin-right: auto;
    }

    th, td {
      text-align: left;
      padding: 8px;
    }

    th {
      background-color: black;
      color: white;
    }

    tr {
      background-color: white;
      border: 1px solid black;
    }

    body{
            padding-top : 500 px;
            padding-bottom : 500px;
            background-image: url("https://c4.wallpaperflare.com/wallpaper/83/667/620/blue-computer-backgrounds-wallpaper-preview.jpg");
            background-position: center;
            background-size: 200% ;
            position: relative;
            font-family: sans-serif;
        }

            .feedback-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #3498db;
            color: #fff;
            font-size: 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .feedback-button:hover {
            background-color: #2980b9;
        }
  </style>
</head>
<body>

<?php
// Connect to the database
$db = mysqli_connect("localhost", "root", "", "profile_builder");
session_start();
include 'mentee_header.php';
?>
<h1 style="text-align: center; color: white;">My To-Do List</h1>
<?php
// Retrieve uname from session
if (isset($_SESSION["uname"])) {
  $uname = $_SESSION["uname"];
} else {
  // Redirect to signup page if uname is not set
  header("Location: signup_mentee.php");
  exit;
}

// Select areas of interest for the current user
$sql_interests = "SELECT areas_of_interest FROM mentee WHERE uname = '$uname'";
$result_interests = mysqli_query($db, $sql_interests);
$row_interests = mysqli_fetch_assoc($result_interests);
$areas_of_interest = $row_interests['areas_of_interest'];

// Retrieve the courses that match the mentee's areas_of_interest from the course_names table
$sql_courses = "SELECT id, course_name FROM course_names WHERE areas_of_interest = '$areas_of_interest'";
$result_courses = mysqli_query($db, $sql_courses);

// Check if there are any matching courses
if ($result_courses) {
  if (mysqli_num_rows($result_courses) > 0) {
    // Display the to-do list
    echo '<table>';
    echo '<tr><th>Course</th><th>Status</th></tr>';
    while ($row_courses = mysqli_fetch_assoc($result_courses)) {
      $id = $row_courses['id'];
      
      // Get the status of the course for the current user
      $sql_status = "SELECT status FROM user_courses WHERE uname = '$uname' AND course_id = $id";
      $result_status = mysqli_query($db, $sql_status);
      if (mysqli_num_rows($result_status) > 0) {
        $row_status = mysqli_fetch_assoc($result_status);
        $status = $row_status['status'];
      } else {
        $status = "Not Started";
      }
    
    // Display the course and its status
    echo '<tr><td>' . $row_courses['course_name'] . '</td><td>' . $status . '</td></tr>';
  }
  
  echo '</table>';
} else {
  echo '<p>No matching courses found.</p>';
}
}
echo '</table>';
//$db->close();
?>
  <div>
    <?php
        $sql = "SELECT status, COUNT(*) AS count FROM user_courses WHERE uname = '$uname' GROUP BY status";
        $result = $db->query($sql);

        if (!$result) {
            // Handle query error
            echo "Error executing query: " . mysqli_error($db);
        } else if ($result->num_rows > 0) {
            $courses = array();
            $totalCourses = 0;

            while ($row = mysqli_fetch_assoc($result)) {
                $status = trim($row['status']);
                $count = (int) $row['count'];
                $courses[$status] = $count;
                $totalCourses += $count;
            }

            $completed = isset($courses['completed']) ? $courses['completed'] : 0;
            $inprogress = isset($courses['on_progress']) ? $courses['on_progress'] : 0;
            $justset = isset($courses['on_set']) ? $courses['on_set'] : 0;

            $data = array(
                array('Task', 'Completion Level'),
                array('Completed', $completed),
                array('In Progress', $inprogress),
                array('On Set', $justset),
            );

            $data_json = json_encode($data);

            // Display pie chart using Google Charts API
            echo "<script type='text/javascript' src='https://www.gstatic.com/charts/loader.js'></script>
            <script type='text/javascript'>
                google.charts.load('current', {'packages':['corechart']});
                google.charts.setOnLoadCallback(drawChart);

                function drawChart() {
                    var data = google.visualization.arrayToDataTable($data_json);

                    var options = {
                        title: 'Course Completion Status',
                        pieHole: 0.5,
                        slices: {
                            0: { color: '#2ecc71' },
                            1: { color: '#e74c3c' },
                            2: { color: '#3498db' },
                        }
                    };

                    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                }
            </script>
            <div id='chart_div' style='width:35%; height: 300px; position: absolute; top: 90%; right: 50; left: 33%;'></div>";

            /*// Display completion status and remaining tasks
            echo "<p>Out of $totalCourses courses:</p>";
            echo "<p>$completed courses are complete.</p>";
            echo "<p>$inprogress courses are in progress.</p>";
            echo "<p>$justset courses are on set.</p>";*/

            //$db->close();
        } else {
            #echo "User info not found";
        }
    ?>
    </div>
<br/>
    <h2 style="text-align: center; color: white;">Feedback from Mentor:</h2>-->

    <div id="feedbackDiv" style="display: none; text-align: center; color: white;">
    <?php
        // Retrieve feedback from the feedback table
        $feedbackSql = "SELECT feedback FROM feedback1 WHERE mentee_name = '$uname'";
        $feedbackResult = mysqli_query($db, $feedbackSql);

        // Check if the query executed successfully
        if ($feedbackResult) {
            // Check if there is any feedback
            if (mysqli_num_rows($feedbackResult) > 0) {
                while ($feedbackRow = mysqli_fetch_assoc($feedbackResult)) {
                    echo $feedbackRow['feedback'] . '<br>';
                }
            } else {
                echo '<p>No feedback available.</p>';
            }
        } else {
            echo "Error executing query: " . mysqli_error($db);
        }
    ?>
    </div>

    <button id="feedbackButton" class="feedback-button" onclick="toggleFeedback()" style="margin-top: 20px; margin-bottom: 20px;">Show Feedback</button>

    <script>
        function toggleFeedback() {
            var feedbackDiv = document.getElementById('feedbackDiv');
            var feedbackButton = document.getElementById('feedbackButton');

            if (feedbackDiv.style.display === 'none') {
                feedbackDiv.style.display = 'block';
                feedbackButton.textContent = 'Hide Feedback';
            } else {
                feedbackDiv.style.display = 'none';
                feedbackButton.textContent = 'Show Feedback';
            }
        }
    </script>

</body>
</html>
