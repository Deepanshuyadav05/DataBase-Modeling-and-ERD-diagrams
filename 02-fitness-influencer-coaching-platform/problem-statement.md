## Instructions
A fitness influencer has started an online coaching business. Initially, they train a few people through Insta DMs and Meet video calls. As their brand grows, they now want a platform where they can onboard clients, sell fitness plans, schedule consultations, manage subscriptions, track client progress and maintain regular check-ins.
Some users join only for consultation. Some buy long-term coaching plans. Some may attend live sessions, while others may only receive a training routine and diet guidance. The platform should also be able to track progress information such as weight, body measurements, check-in reports and trainer notes.
Your job is to design the ER diagram for this platform.
This is not a gym management problem. This is more of an online coaching ecosystem where one or more trainers/influencers manage multiple clients and provide structured online fitness support.

---

## What You Have to Do
Your database design should support questions like:

- Who are the trainers and who are the clients?
- What plans or coaching programs exist?
- Which client purchased which plan?
- When does a client’s plan start and end?
- Are there consultations or sessions being scheduled?
- Are clients submitting check-ins weekly?
- How is progress being tracked?
- Can multiple clients enroll in the same program?
- Can one trainer handle many clients?
- How should payment and subscription information be stored?
- What to Make
- Design an ER diagram for this business.

---

## Your ER diagram should include:

- user/client related entities
- trainer or coach related entities
- plans/programs/subscriptions
- sessions or consultations
- progress tracking or check-in related structure
- payment related structure if needed
- primary keys and foreign keys
- relationships and cardinality
- Things to think about while designing:
---
- A trainer can coach many clients.
- A client may buy more than one plan over time.
- One plan can be subscribed to by many clients.
- Progress tracking should not be mixed directly into the user table.
- Sessions and check-ins are not the same thing.
- You should decide whether trainer notes or feedback should be stored separately.
- Think about whether diet plans and workout plans should be modeled directly or abstractly.
- Keep the design practical and not overcomplicated.
- You do not need to write SQL queries.
- You do not need to build frontend or backend.
- This task is only about database design.