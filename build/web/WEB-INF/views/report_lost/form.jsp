<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Report Lost Item | iFound</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <style>
    body {
      background-color: #f8f9fa;
    }
    .sidebar {
      min-height: 100vh;
      background: #e3f2fd;
      border-right: 1px solid #cfd8dc;
    }
    .sidebar .nav-link {
      color: #0d47a1;
      border-radius: 0.25rem;
      margin: 0.25rem 0;
      font-weight: 500;
    }
    .sidebar .nav-link:hover,
    .sidebar .nav-link.active {
      color: white;
      background: #1976d2;
    }
    .sidebar .nav-link i {
      width: 20px;
      margin-right: 10px;
      text-align: center;
    }
    .form-card {
      border-radius: 0.5rem;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }
    #location-suggestions {
      position: absolute;
      background: white;
      width: 100%;
      border: 1px solid #ddd;
      max-height: 200px;
      overflow-y: auto;
      z-index: 1000;
      display: none;
    }
    #location-suggestions div {
      padding: 10px;
      cursor: pointer;
    }
    #location-suggestions div:hover {
      background-color: #f8f9fa;
    }
  </style>
</head>
<body>
  <div class="container-fluid">
    <div class="row">
      <!-- Sidebar -->
      <div class="col-md-3 col-lg-2 sidebar">
        <div class="position-sticky pt-3">
          <ul class="nav flex-column">
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/dashboard">
                <i class="fas fa-home"></i> Dashboard
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="${pageContext.request.contextPath}/report/lost">
                <i class="fas fa-search-minus"></i> Report Lost Item
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/report/found">
                <i class="fas fa-search-plus"></i> Report Found Item
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <i class="fas fa-file-alt"></i> My Reports
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <i class="fas fa-link"></i> Matches
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <i class="fas fa-comments"></i> Messages
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <i class="fas fa-star"></i> Trust & Ratings
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link " href="${pageContext.request.contextPath}/profile/view">
                <i class="fas fa-user"></i> Profile
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/logout">
                <i class="fas fa-sign-out-alt"></i> Logout
              </a>
            </li>
          </ul>
        </div>
      </div>

      <!-- Main Content -->
      <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
        <div class="d-flex justify-content-between align-items-center pt-3 pb-2 mb-3 border-bottom">
          <h1 class="h2 text-danger"><i class="fas fa-search-minus me-2"></i>Report Lost Item</h1>
          <div class="btn-toolbar">
            <span class="navbar-text me-3 text-secondary">
              Welcome, ${user.username} <span class="badge bg-primary">User</span>
            </span>
            <a class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/logout">
              <i class="fas fa-sign-out-alt"></i> Logout
            </a>
          </div>
        </div>

        <!-- Form Card -->
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="card form-card mb-4">
              <div class="card-header bg-danger text-white">
                <h5 class="mb-0"><i class="fas fa-clipboard-list me-2"></i>Lost Item Details</h5>
              </div>
              <div class="card-body">
                <form action="${pageContext.request.contextPath}/lost/add" method="post" id="lostItemForm">
                  <div class="mb-3">
                    <label for="title" class="form-label">Item Name <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="e.g. Blue Backpack" required>
                  </div>

                  <div class="mb-3">
                    <label for="description" class="form-label">Description and Rewards <span class="text-danger">*</span></label>
                    <textarea class="form-control" id="description" name="description" rows="3"
                      placeholder="Please provide detailed description including brand, color, distinguishing features, etc." required></textarea>
                  </div>

                  <div class="mb-3 position-relative">
                    <label for="location" class="form-label">Lost Location <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="location" name="location" placeholder="e.g. Kigali" required>
                    <input type="hidden" id="latitude" name="latitude" required>
                    <input type="hidden" id="longitude" name="longitude" required>
                    <div id="location-suggestions"></div>
                  </div>

                  <div class="mb-3">
                    <label for="photo" class="form-label">Photo URL <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="photo" name="photo" placeholder="Paste the URL of the image" required>
                    <div class="form-text">Paste a URL of the image of the item.</div>
                  </div>

                  <!-- Hidden field for user ID, populated from session -->
                  <input type="hidden" name="userId" value="${sessionScope.user.id}">

                  <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                    <a href="${pageContext.request.contextPath}/report/lost" class="btn btn-outline-secondary me-md-2">
                      <i class="fas fa-times me-2"></i>Cancel
                    </a>
                    <button type="submit" class="btn btn-danger">
                      <i class="fas fa-paper-plane me-2"></i>Submit Report
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
   $(document).ready(function() {
  // Preloaded Kigali locations database
  const commonLocations = [
    // Kigali Districts and Neighborhoods
    { name: "Kigali, Rwanda", lat: -1.9415, lon: 30.0428 },
    { name: "Nyarugenge, Kigali, Rwanda", lat: -1.9565, lon: 30.0448 },
    { name: "Kicukiro, Kigali, Rwanda", lat: -1.9778, lon: 30.0889 },
    { name: "Gasabo, Kigali, Rwanda", lat: -1.8944, lon: 30.0989 },
    { name: "Kimihurura, Kigali, Rwanda", lat: -1.9520, lon: 30.0843 },
    { name: "Kimironko, Kigali, Rwanda", lat: -1.9331, lon: 30.1147 },
    { name: "Remera, Kigali, Rwanda", lat: -1.9433, lon: 30.1139 },
    { name: "Nyamirambo, Kigali, Rwanda", lat: -1.9827, lon: 30.0423 },
    { name: "Gikondo, Kigali, Rwanda", lat: -1.9661, lon: 30.0889 },
    { name: "Kacyiru, Kigali, Rwanda", lat: -1.9367, lon: 30.0914 },
    { name: "Gisozi, Kigali, Rwanda", lat: -1.9228, lon: 30.0561 },
    { name: "Nyarutarama, Kigali, Rwanda", lat: -1.9278, lon: 30.0994 },

    // Popular Landmarks
    { name: "Kigali Convention Centre, Kigali, Rwanda", lat: -1.9536, lon: 30.0910 },
    { name: "Kigali Golf Club, Kigali, Rwanda", lat: -1.9241, lon: 30.0943 },
    { name: "Kigali International Airport, Kigali, Rwanda", lat: -1.9694, lon: 30.1394 },
    { name: "Kigali Genocide Memorial, Kigali, Rwanda", lat: -1.8954, lon: 30.1017 },
    { name: "Amahoro Stadium, Kigali, Rwanda", lat: -1.9461, lon: 30.1139 },
    { name: "Kigali Public Library, Kigali, Rwanda", lat: -1.9533, lon: 30.0911 },
    { name: "Kigali City Tower, Kigali, Rwanda", lat: -1.9502, lon: 30.0589 },
    { name: "Rwanda Parliament, Kigali, Rwanda", lat: -1.9483, lon: 30.0708 },

    // Shopping Areas
    { name: "Kigali City Market (Kimironko Market), Kigali, Rwanda", lat: -1.9306, lon: 30.1167 },
    { name: "Kigali Heights, Kigali, Rwanda", lat: -1.9535, lon: 30.0910 },
    { name: "Union Trade Center, Kigali, Rwanda", lat: -1.9507, lon: 30.0594 },
    { name: "Nyabugogo Market, Kigali, Rwanda", lat: -1.9436, lon: 30.0439 },

    // Schools and Universities
    { name: "University of Rwanda - College of Science and Technology (CST), Nyarugenge Campus", lat: -1.9446, lon: 30.0619 },
    { name: "University of Rwanda - Gikondo Campus (Former SFB)", lat: -1.9732, lon: 30.0787 },
    { name: "University of Kigali (Main Campus), Kigali, Rwanda", lat: -1.9509, lon: 30.0589 },
    { name: "UNILAK - Kigali Campus, Kicukiro, Rwanda", lat: -1.9993, lon: 30.1168 },
    { name: "Mount Kenya University, Kigali Campus", lat: -1.9325, lon: 30.1089 },
    { name: "Kepler Kigali Campus", lat: -1.9301, lon: 30.0642 },
    { name: "Adventist University of Central Africa (AUCA), Kigali, Rwanda", lat: -1.9203, lon: 30.0496 },
    { name: "Kigali Independent University (ULK), Kigali, Rwanda", lat: -1.9153, lon: 30.1017 },
    { name: "Kigali International Community School (KICS)", lat: -1.9396, lon: 30.1304 },
    { name: "Kigali Institute of Management (KIM)", lat: -1.9504, lon: 30.1145 },
    { name: "UR CST - Block A", lat: -1.9447, lon: 30.0618 },
    { name: "UR CST - Block B", lat: -1.9448, lon: 30.0620 },
    { name: "UR CST - Admin Block", lat: -1.9445, lon: 30.0615 },
    { name: "UR CST - Main Library", lat: -1.9449, lon: 30.0617 },
    { name: "UR Gikondo - Auditorium", lat: -1.9733, lon: 30.0785 },
    { name: "UR Gikondo - ICT Center", lat: -1.9734, lon: 30.0789 },

    // Hotels
    { name: "Kigali Marriott Hotel, Kigali, Rwanda", lat: -1.9541, lon: 30.0642 },
    { name: "Kigali Serena Hotel, Kigali, Rwanda", lat: -1.9568, lon: 30.0697 },
    { name: "Radisson Blu Hotel & Convention Centre, Kigali, Rwanda", lat: -1.9536, lon: 30.0910 },
    { name: "Hotel des Mille Collines, Kigali, Rwanda", lat: -1.9480, lon: 30.0658 },

    // Hospitals
    { name: "King Faisal Hospital, Kigali, Rwanda", lat: -1.9544, lon: 30.0908 },
    { name: "Rwanda Military Hospital, Kigali, Rwanda", lat: -1.9861, lon: 30.0975 },
    { name: "CHUK Hospital, Kigali, Rwanda", lat: -1.9600, lon: 30.0594 },
    { name: "Kibagabaga Hospital, Kigali, Rwanda", lat: -1.9203, lon: 30.1075 },

    // Transport Hubs
    { name: "Nyabugogo Bus Terminal, Kigali, Rwanda", lat: -1.9433, lon: 30.0447 },
    { name: "Kigali Bus Park, Kigali, Rwanda", lat: -1.9494, lon: 30.0603 },

    // Parks and Recreation
    { name: "Kigali Car Free Zone, Kigali, Rwanda", lat: -1.9507, lon: 30.0594 },
    { name: "Inema Arts Center, Kigali, Rwanda", lat: -1.9367, lon: 30.0914 }
  ];

  // Master location database (will be populated with API results)
  let locationDatabase = [...commonLocations];

  const $location = $('#location');
  const $suggestions = $('#location-suggestions');
  const $latitude = $('#latitude');
  const $longitude = $('#longitude');

  // Update the suggestions box style
  $suggestions.css({
    'border-radius': '0 0 4px 4px',
    'box-shadow': '0 4px 8px rgba(0,0,0,0.1)',
    'max-height': '250px'
  });

  // Function to filter locations based on query
  function filterLocations(query) {
    if (query.length < 1) {
      $suggestions.hide();
      return;
    }

    // Case-insensitive search
    const searchTerms = query.toLowerCase().split(' ');

    // Filter locations that match all search terms
    const filteredLocations = locationDatabase.filter(location => {
      const locationName = location.name.toLowerCase();
      return searchTerms.every(term => locationName.includes(term));
    }).slice(0, 7); // Limit to 7 results for performance

    displayResults(filteredLocations);

    // If we have few results, fetch more from the API
    if (filteredLocations.length < 3 && query.length > 2) {
      fetchMoreLocations(query);
    }
  }

  // Function to fetch more locations from API and add to database
  function fetchMoreLocations(query) {
    $.ajax({
      url: 'https://nominatim.openstreetmap.org/search',
      data: {
        format: 'json',
        q: query + ' kigali rwanda', // Focus on Kigali results
        limit: 5
      },
      success: function(data) {
        if (data && data.length) {
          // Convert API results to our format
          const newLocations = data.map(item => ({
            name: item.display_name,
            lat: parseFloat(item.lat),  // Make sure we have numbers, not strings
            lon: parseFloat(item.lon)   // Make sure we have numbers, not strings
          }));

          // Add to the database, avoiding duplicates
          newLocations.forEach(newLoc => {
            if (!locationDatabase.some(loc => loc.name === newLoc.name)) {
              locationDatabase.push(newLoc);
            }
          });

          // Re-filter with new data
          filterLocations($location.val().trim());
        }
      }
    });
  }

  // Function to display results
  function displayResults(locations) {
    $suggestions.empty();

    if (locations.length > 0) {
      locations.forEach(location => {
        const $item = $('<div>')
          .attr('data-lat', location.lat)
          .attr('data-lon', location.lon)
          .attr('data-name', location.name) // Store original name as data attribute
          .addClass('p-2 location-item')
          .html('<i class="fas fa-map-marker-alt me-2 text-danger"></i>' + location.name)
          .hover(function() {
            $(this).addClass('bg-light');
          }, function() {
            $(this).removeClass('bg-light');
          });
        $suggestions.append($item);
      });
      $suggestions.show();
    } else {
      $suggestions.html('<div class="p-2 text-secondary">No matching locations found</div>');
      $suggestions.show();
    }
  }

  // Super responsive input handler (no debounce)
  $location.on('input', function() {
    const query = $(this).val().trim();
    filterLocations(query);

    // Clear lat/lon values when user types something new
    $latitude.val('');
    $longitude.val('');
  });

  // Show popular Kigali locations on focus when empty
  $location.on('focus', function() {
    const query = $(this).val().trim();
    if (query.length === 0) {
      // Show popular Kigali locations on empty focus
      const popularKigaliLocations = commonLocations
        .filter(loc => loc.name.includes("Kigali"))
        .slice(0, 7);
      displayResults(popularKigaliLocations);
    } else if (query.length >= 1) {
      filterLocations(query);
    }
  });

  // Click handler for suggestions
  $(document).on('click', '.location-item', function() {
    // Use the stored data-name attribute instead of parsing text content
    const locationText = $(this).data('name');
    const lat = $(this).data('lat');
    const lon = $(this).data('lon');

    // Set the values
    $location.val(locationText);
    $latitude.val(lat);
    $longitude.val(lon);
    $suggestions.hide();

    // Log the latitude and longitude to the console for debugging
    console.log('Selected Location:', locationText);
    console.log('Latitude:', lat);
    console.log('Longitude:', lon);
    console.log('Latitude Input Value:', $latitude.val());
    console.log('Longitude Input Value:', $longitude.val());
  });

  // Hide suggestions when clicking outside
  $(document).on('click', function(e) {
    if (!$(e.target).closest('#location, #location-suggestions').length) {
      $suggestions.hide();
    }
  });

  // Add keyboard navigation for suggestions
  $location.on('keydown', function(e) {
    const $items = $suggestions.find('.location-item');
    const $highlighted = $suggestions.find('.bg-light');
    let index = $highlighted.index();

    // Down arrow
    if (e.keyCode === 40) {
      e.preventDefault();
      if (!$suggestions.is(':visible')) {
        filterLocations($(this).val().trim());
        return;
      }
      if (index < $items.length - 1) {
        $items.removeClass('bg-light');
        $items.eq(index + 1).addClass('bg-light');
        scrollToVisible($items.eq(index + 1), $suggestions);
      } else {
        $items.removeClass('bg-light');
        $items.eq(0).addClass('bg-light');
        scrollToVisible($items.eq(0), $suggestions);
      }
    }
    // Up arrow
    else if (e.keyCode === 38) {
      e.preventDefault();
      if (index > 0) {
        $items.removeClass('bg-light');
        $items.eq(index - 1).addClass('bg-light');
        scrollToVisible($items.eq(index - 1), $suggestions);
      } else {
        $items.removeClass('bg-light');
        $items.eq($items.length - 1).addClass('bg-light');
        scrollToVisible($items.eq($items.length - 1), $suggestions);
      }
    }
    // Enter key
    else if (e.keyCode === 13 && $highlighted.length) {
      e.preventDefault();
      // When using keyboard navigation and pressing Enter,
      // manually set the coordinates from the highlighted item
      const selectedName = $highlighted.data('name');
      const selectedLat = $highlighted.data('lat');
      const selectedLon = $highlighted.data('lon');

      $location.val(selectedName);
      $latitude.val(selectedLat);
      $longitude.val(selectedLon);
      $suggestions.hide();

      console.log('Keyboard selected:', selectedName);
      console.log('Coordinates set - Lat:', selectedLat, 'Lon:', selectedLon);
    }
    // Escape key
    else if (e.keyCode === 27) {
      e.preventDefault();
      $suggestions.hide();
    }
  });

  // Function to ensure highlighted item is visible in scrollable container
  function scrollToVisible($element, $container) {
    if (!$element.length) return;

    const containerTop = $container.scrollTop();
    const containerBottom = containerTop + $container.height();
    const elementTop = $element.position().top + containerTop;
    const elementBottom = elementTop + $element.outerHeight();

    if (elementTop < containerTop) {
      $container.scrollTop(elementTop);
    } else if (elementBottom > containerBottom) {
      $container.scrollTop(elementBottom - $container.height());
    }
  }

  // Add some CSS for smooth transitions
  $('<style>')
    .text(`
      #location-suggestions {
        transition: opacity 0.15s ease;
        border-top: none;
        background: white;
        width: 100%;
        border: 1px solid #ddd;
        overflow-y: auto;
        z-index: 1000;
      }
      #location-suggestions .location-item {
        transition: background-color 0.1s ease;
        cursor: pointer;
        padding: 8px 10px;
        border-bottom: 1px solid #f0f0f0;
      }
      #location-suggestions .location-item:last-child {
        border-bottom: none;
      }
      #location-suggestions .location-item:hover {
        background-color: #f0f0f0;
      }
      #location-suggestions .location-item .fa-map-marker-alt {
        color: #dc3545;
      }
      #location {
        background-color: #fff;
        transition: border-color 0.15s ease-in-out;
      }
      #location:focus {
        border-color: #80bdff;
        box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
      }
    `)
    .appendTo('head');

  // Form validation handler
  $('#lostItemForm').on('submit', function(e) {
    // Check if coordinates are set
    if (!$latitude.val() || !$longitude.val()) {
      e.preventDefault();

      // Try to find a location match in our database
      const locationText = $location.val().trim();
      const matchedLocation = locationDatabase.find(loc =>
        loc.name.toLowerCase() === locationText.toLowerCase()
      );

      if (matchedLocation) {
        // Set the values from our database
        $latitude.val(matchedLocation.lat);
        $longitude.val(matchedLocation.lon);
        console.log('Found match in database:', matchedLocation);
        console.log('Set values - Latitude:', $latitude.val(), 'Longitude:', $longitude.val());
        // Now submit the form
        this.submit();
      } else {
        // If no direct match, show an error
        alert('Please select a location from the suggestions list.');
        $location.focus();
      }
    } else {
      // Coordinates are set, proceed normally
      console.log('Form Data on Submit:');
      console.log('Location:', $location.val());
      console.log('Latitude:', $latitude.val());
      console.log('Longitude:', $longitude.val());
    }
  });

  // Add a manual "select first match" feature
  $location.on('blur', function() {
    // If we have coordinates, don't override
    if ($latitude.val() && $longitude.val()) {
      return;
    }

    // Try to find a match in our database
    const locationText = $(this).val().trim();
    if (locationText.length > 0) {
      // First try exact match
      let matchedLocation = locationDatabase.find(loc =>
        loc.name.toLowerCase() === locationText.toLowerCase()
      );

      // If no exact match, try partial match
      if (!matchedLocation) {
        const searchTerms = locationText.toLowerCase().split(' ');
        const possibleMatches = locationDatabase.filter(location => {
          const locationName = location.name.toLowerCase();
          return searchTerms.every(term => locationName.includes(term));
        });

        if (possibleMatches.length > 0) {
          matchedLocation = possibleMatches[0]; // Take first match
        }
      }

      if (matchedLocation) {
        // Set the values from our database
        $latitude.val(matchedLocation.lat);
        $longitude.val(matchedLocation.lon);
        // Update the location text to the full match
        $(this).val(matchedLocation.name);
        console.log('Auto-matched to:', matchedLocation.name);
        console.log('Set values - Latitude:', $latitude.val(), 'Longitude:', $longitude.val());
      }
    }
  });
});
  </script>
</body>
</html>
