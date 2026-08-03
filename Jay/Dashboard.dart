
Flutter Task: Super Mart Billing Application

Objective

Develop a Super Mart Billing Application in Flutter that generates a professional bill and supports PDF printing.

Requirements

1. Product List

Display the following products on the Home Screen:

- Milk – ₹35
- Bread – ₹40
- Butter – ₹60
- Rice – ₹90/kg
- Sugar – ₹50/kg
- Tea – ₹120

2. Cart Management

- Display quantity controls (+ / -) for each product.
- Add products to the cart.
- Allow users to update or remove items from the cart.

3. Cart Screen

Display the following details:

- Product Name
- Quantity
- Unit Price
- Total Price

4. Bill Calculation

Calculate and display:

- Subtotal
- GST (18%)
- Discount
  - 10% if the subtotal is greater than ₹1000
  - Otherwise, 5%
- Grand Total

5. Bill Preview

Generate a bill in the following format:

=========================
       SUPER MART
    Rajkot, Gujarat
=========================

Milk          2 × 35 = 70
Bread         1 × 40 = 40
Butter        3 × 60 = 180

-------------------------
Subtotal       ₹290
GST (18%)      ₹52.20
Discount       ₹14.50
-------------------------
Grand Total    ₹327.70

Thank You!
Visit Again 😊

6. Print Bill

- Generate the bill as a PDF.
- Add a Print Bill button to print or share the generated PDF.

Concepts Covered

- ListView
- Model Class
- Stateful Widgets / Provider
- Navigation
- TextField
- PDF Generation
- Printing Package
- Date & Time
- Cart Calculations
- Clean and Responsive UIThis task provides hands-on experience with real-world Flutter development by combining UI design, state management, calculations, PDF generation, and printing functionality into a single application
