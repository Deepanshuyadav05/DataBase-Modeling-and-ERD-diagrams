## Instructions
A small creator has started an Instagram-based store where they sell thrifted fashion items and handmade products. At first, the business is very small and receives orders through Instagram DMs and WhatsApp. Over time, the store starts growing and now the owner wants to manage products better, keep track of available stock, handle customer orders properly, and maintain basic information about delivery and payments.
Some products are thrifted and only have one piece available. Some are handmade and can have multiple units. Some items may have size, color or condition details. The business owner may also want to store customer details, order history, payment status and shipping status.
Your task is to design the ER diagram for the database of this business.
This is not just a “shop” problem. You should think carefully about how thrift and handmade products may differ. For example, a thrift item may be unique, while a handmade item may be created in batches or in multiple pieces. A good design should reflect the business properly.
---

## What You Have to Do
You have to design a database model that can support this business in a practical way.

---

## Your ER diagram should help answer questions like:

- What products are being sold?
- Are they thrifted items or handmade items?
- How many pieces are available?
- Which customer placed which order?
- What all items were part of one order?
- Was the order paid for?
- Has the order been shipped or delivered?
- Can one customer place multiple orders?
- Can one order contain multiple products?
- How do we store product-specific details like size, category, color, condition, or price?
- What to Make
- Design an ER diagram for this platform.

---

## Your diagram must include:

- all important entities
- attributes for each entity
- primary key for every main entity
- foreign keys wherever relationships exist
- proper relationships between entities
- cardinality wherever relevant
- any junction table required for many-to-many relations
- Keep these points in mind while designing:
---
- A customer can place multiple orders.
- One order can contain multiple products.
- Some products may be unique pieces.
- Some products may have reusable inventory.
- You should think about whether product condition should be stored.
- You should think about how payment and shipping details should be represented.
- Avoid putting too much unrelated information in one entity.
- Try to keep your design normalized and clean.
- Use meaningful names for entities and attributes.
