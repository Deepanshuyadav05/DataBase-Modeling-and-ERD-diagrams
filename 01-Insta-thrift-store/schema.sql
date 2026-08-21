CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    address TEXT,

    created_At timestamp,
    updated_At timestamp

)

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    product_type ENUM('Hand made', 'Thrift') DEFAULT 'Hand made',

    created_At timestamp,
    updated_At timestamp

)

CREATE TABLE inventory_items (
    id SERIAL PRIMARY KEY,
    product_id INTEGER ,
    stock INTEGER,
    size VARCHAR(20),
    color VARCHAR(20),
    condition VARCHAR(20),
    product_price DECIMAL(10,2),


    --creating a foreign key
    FOREIGN KEY (product_id) REFERENCES products(id),

    created_At timestamp,
    updated_At timestamp

)

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    total_price DECIMAL(10,2),
    total_item INTEGER,
    order_date timestamp,

    --creating a foreign key
    FOREIGN KEY (customer_id) REFERENCES customers(id),

    created_At timestamp,
    updated_At timestamp

)

CREATE TABLE order_items (
    id SERIAL PRIMARY KEY,
    order_id INTEGER,
    inventory_items_id INTEGER,
    item_price DECIMAL(10,2),
    item_qty INTEGER,

    --creating a foreign key
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (inventory_items_id) REFERENCES inventory_items(id),

    created_At timestamp,
    updated_At timestamp

)

CREATE TABLE payments (
    id SERIAL PRIMARY KEY ,
    order_id INTEGER,
    total_payment DECIMAL(10,2),
    payment_date timestamp,
    payment_status ENUM('pending', 'completed', 'failed') DEFAULT 'pending',
    payment_method ENUM('UPI', 'card', 'cash', 'net_banking'),

    --creating a foreign key
    FOREIGN KEY (order_id) REFERENCES orders(id),

    created_At timestamp,
    updated_At timestamp
)

CREATE TABLE deliveries (
    id SERIAL PRIMARY KEY ,
    order_id INTEGER,
    delivery_date timestamp,
    shipping_address TEXT,
    delivery_status ENUM('delivered', 'shipped', 'dispatched', 'Arriving today'),

    --creating a foreign key
    FOREIGN KEY (order_id) REFERENCES orders(id),

    created_At timestamp,
    updated_At timestamp
)