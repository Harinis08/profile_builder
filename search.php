<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    * { box-sizing: border-box; }
    
    body {
      margin: 0;
      font-family: Arial, Helvetica, sans-serif;
    }
    
    .search-container {
      padding: 20px;
      text-align: center;
      border: 10px;
    }
    
    .search-container input[type=text] {
      padding: 10px;
      width: 300px;
      border: none;
      border-radius: 4px;
    }
    
    .search-container button {
      padding: 10px 20px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    
    .search-container button:hover {
      background-color: #45a049;
    }
    
    .results-container {
      margin-top: 20px;
      padding: 20px;
      border: 30px;

    }
    
    .result {
      margin-bottom: 10px;
      padding: 10px;
      border: 4px solid white;
      border-radius: 4px;
    }
    /*body{
    padding-top : 500 px;
    padding-bottom : 500px;
    background-image: url("https://c4.wallpaperflare.com/wallpaper/83/667/620/blue-computer-backgrounds-wallpaper-preview.jpg");

    background-size: 100% ;
    position: relative;
    font-family: sans-serif;
}*/
body{
    padding-top : 500 px;
    padding-bottom : 500px;
    background-image: url("https://c4.wallpaperflare.com/wallpaper/83/667/620/blue-computer-backgrounds-wallpaper-preview.jpg");
    background-position: center;
    background-size: 100% 100%;
    position: relative;
    font-family: sans-serif;
}
  </style>
</head>
<h1 style="text-align: center;">Search Findings</h1>
<body>

  <div class="results-container">
    <?php
    // Check if the search form is submitted
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
      $search = $_POST["search"];
      
      // Connect to your MySQL database
      $conn = mysqli_connect("localhost:3307", "root", "", "profile_builder");
      
      // Perform the search query for mentors
      $mentorQuery = "SELECT uname FROM mentor WHERE uname LIKE '%$search%'";
      $mentorResult = mysqli_query($conn, $mentorQuery);
      
      // Perform the search query for mentees
      $menteeQuery = "SELECT uname FROM mentee WHERE uname LIKE '%$search%'";
      $menteeResult = mysqli_query($conn, $menteeQuery);
      
      // Display the search results
      while ($mentorRow = mysqli_fetch_assoc($mentorResult)) {
        echo "<div class='result'>";
        echo "<h3>Mentor:</h3>";
        //echo "<h3 style=' color: white;'>Mentor</h1>";
        //echo "<h3>Name: <a href='dash_search_mentor.php?uname=" . $mentorRow["uname"] . "'>" . $mentorRow["uname"] . "</a></h3>";
        echo "<h3>Name: <a href='dash_search_mentor.php?uname=" . $mentorRow["uname"] . "' style='color: white;'>" . $mentorRow["uname"] . "</a></>";
        echo "</div>";
      }
    
      while ($menteeRow = mysqli_fetch_assoc($menteeResult)) {
        echo "<div class='result'>";
        echo "<h3>Mentee:</h3>";
        echo "<h3>Name: <a href='dash_search_mentee.php?uname=" . $menteeRow["uname"] . "' style='color: white;'>" . $menteeRow["uname"] . "</a></>";

        echo "</div>";
        
      }
      
      // Close the database connection
      mysqli_close($conn);
    }
    ?>
  </div>
</body>
</html>
