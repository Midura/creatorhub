<?php
// Set response headers to accept JSON and allow cross-origin requests
header('Content-Type: application/json');
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');

// Check if request is POST
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Sanitize input
    $name = isset($_POST['name']) ? htmlspecialchars(strip_tags($_POST['name'])) : '';
    $email = isset($_POST['email']) ? filter_var($_POST['email'], FILTER_SANITIZE_EMAIL) : '';
    $subject = isset($_POST['subject']) ? htmlspecialchars(strip_tags($_POST['subject'])) : '';
    $message = isset($_POST['message']) ? htmlspecialchars(strip_tags($_POST['message'])) : '';

    // Validate email
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        http_response_code(400);
        echo json_encode(['status' => 'error', 'message' => 'Invalid email format.']);
        exit;
    }

    // Check if fields are empty
    if (empty($name) || empty($email) || empty($message)) {
        http_response_code(400);
        echo json_encode(['status' => 'error', 'message' => 'Please fill in all required fields.']);
        exit;
    }

    // Simulate sending email or saving to database
    // In a real application, you would use mail() or a library like PHPMailer here.
    $success = true;

    if ($success) {
        http_response_code(200);
        echo json_encode([
            'status' => 'success', 
            'message' => 'Thanks for reaching out, ' . $name . '! We will get back to you shortly.'
        ]);
    } else {
        http_response_code(500);
        echo json_encode(['status' => 'error', 'message' => 'Server error. Please try again later.']);
    }
} else {
    // Not a POST request
    http_response_code(405);
    echo json_encode(['status' => 'error', 'message' => 'Method not allowed.']);
}
?>
