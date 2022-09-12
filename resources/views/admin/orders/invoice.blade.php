<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body { font-family: DejaVu Sans, sans-serif; }
        .table {
            width: 100%;
            margin-bottom: 20px;
        }
        h2 {
            color: blue;
        }
    </style>
</head>
<body>
    
    <table class="table">
        <tr>
            <td>Order Number</td>
            <td>{{ $order->id }}</td>
            <td>Order Date</td>
            <td>{{ $order->created_at }}</td>
        </tr>
        <tr>
            <td>Customer Name</td>
            <td>{{ $order->first_name }} {{ $order->last_name }}</td>
            <td>Status</td>
            <td>{{ $order->status }}</td>
        </tr>
    </table>
    <h2>{{ $ar->utf8Glyphs('تفاصيل الطلب') }}</h2>
    <table class="table">
        <thead>
            <tr>
                <th>Item</th>
                <th>Qty</th>
                <th>Unit Price</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($order->items as $item)
            <tr>
                <td>{{ $item->product->name }}</td>
                <td>{{ $item->quantity }}</td>
                <td>{{ $item->price }}</td>
                <td>{{ $item->price * $item->quantity }}</td>
            </tr>
            @endforeach
        </tbody>
    </table>

</body>
</html>