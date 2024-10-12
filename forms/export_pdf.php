<?php
require('fpdf/fpdf.php');

// Start output buffering
ob_start();

// Database connection
$con = mysqli_connect("localhost", "root", "", "mrf");

if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $start_date = $_POST['start_date'];
    $end_date = $_POST['end_date'];

    // Prepare and bind
    $stmt = $con->prepare("SELECT sales.sale_id, sales.pid, products1.name, products1.batchNo, sales.quantity_sold, sales.sale_price, sales.sale_date, sales.customer_id 
                           FROM sales 
                           JOIN products1 ON sales.pid = products1.pid
                           WHERE sales.sale_date BETWEEN ? AND ?");
    $stmt->bind_param("ss", $start_date, $end_date);

    // Execute statement
    $stmt->execute();

    // Get result
    $result = $stmt->get_result();

    // Create instance of FPDF
    $pdf = new FPDF();
    $pdf->AddPage();

    // Set font
    $pdf->SetFont('Arial', 'B', 16);

    // Title
    $pdf->Cell(0, 10, 'Sales Report from ' . $start_date . ' to ' . $end_date, 0, 1, 'C');
    $pdf->Ln(10);

    // Column headers
    $pdf->SetFont('Arial', 'B', 12);
    $pdf->Cell(10, 10, 'SN', 1);
    $pdf->Cell(30, 10, 'Batch No', 1);
    $pdf->Cell(60, 10, 'Product Name', 1);
    $pdf->Cell(30, 10, 'Qty Sold', 1);
    $pdf->Cell(30, 10, 'Sale Price', 1);
    $pdf->Cell(30, 10, 'Sale Date', 1);
    $pdf->Ln();

    // Data rows
    $pdf->SetFont('Arial', '', 12);
    $sn = 1;
    while ($row = $result->fetch_assoc()) {
        $pdf->Cell(10, 10, $sn, 1);
        $pdf->Cell(30, 10, $row['batchNo'], 1);
        $pdf->Cell(60, 10, $row['name'], 1);
        $pdf->Cell(30, 10, $row['quantity_sold'], 1);
        $pdf->Cell(30, 10, $row['sale_price'], 1);
        $pdf->Cell(30, 10, $row['sale_date'], 1);
        $pdf->Ln();
        $sn++;
    }

    // Output the PDF
    $pdf->Output('D', 'Sales_Report_' . $start_date . '_to_' . $end_date . '.pdf');

    // Close the statement and connection
    $stmt->close();
    mysqli_close($con);
    
    // End buffering and clean output
    ob_end_flush();
}
?>