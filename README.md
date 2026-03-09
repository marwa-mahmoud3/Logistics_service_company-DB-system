# 🚚 Logistics Service Company DB System (2023)
### Comprehensive Database Architecture for Supply Chain & Freight Management
<br>

<p>
  <img src="https://img.shields.io/badge/Database-SQL_Server_%7C_Oracle-red?style=for-the-badge" alt="DB Stack">
  <img src="https://img.shields.io/badge/Language-T--SQL_%7C_PL--SQL-blue?style=for-the-badge" alt="Language">
</p>

---

## 📝 Project Overview
**Logistics Service Company DB System** is a full-scale relational database solution developed and delivered in **2023**. It is engineered to manage the complex data workflows of logistics providers, covering everything from customer relationship management (CRM) and contracting to shipment tracking, warehouse storage, and multi-modal transport monitoring.

This project showcases advanced SQL engineering skills, providing specialized implementations for both **Microsoft SQL Server** and **Oracle SQL** environments.

<p align="center">
  <img src="https://github.com/user-attachments/assets/ef5b812d-e899-44f4-bed7-73646151618d" width="90%" alt="Logistics Database Diagram">
</p>
---

## 🏗️ System Architecture
The database schema is designed to handle the core operations of a logistics firm:
* **Customer Management**: Detailed profiles and contact tracking.
* **Contracting System**: Management of shipping agreements, costs, and expiry dates.
* **Shipment Lifecycle**: Real-time tracking of shipment weight, location, and status.
* **Transport Coordination**: Monitoring of different transport types (Trucks, Trains) including maintenance and inspection logs.
* **Storage & Inventory**: Warehouse management with quality examination workflows (`Pass`/`Unpass`).

---

## 💻 Technical Features

### 1️⃣ Dual-Platform Implementation
* **SQL Server**: Full DDL and DML scripts using T-SQL standards.
* **Oracle SQL**: Optimized scripts utilizing Oracle-specific features like `GENERATED ALWAYS AS IDENTITY` and advanced date formatting.

### 2️⃣ Programmability (Stored Procedures)
* **Dynamic Reporting**: Custom procedures (e.g., `GetStorageExamination`) using **SYS_REFCURSOR** to fetch filtered results dynamically.
* **Data Maintenance**: Standardized procedures for secure updates to customer and system records.

### 3️⃣ Analytical Querying
* Implementation of complex **Inner/Outer Joins** to generate business insights.
* Advanced filtering for operational monitoring (e.g., identifying high-weight shipments or storage issues).

---

## 🛠️ Technical Stack
* **RDBMS**: SQL Server & Oracle SQL.
* **Languages**: T-SQL, PL/SQL.
* **Core Skills**: Database Design, Data Integrity, Stored Procedures, Relational Mapping.

---

## 📂 Repository Structure
* **/SQLServer_Scripts**: Core schema and data for SQL Server (`script.sql`).
* **/Oracle_Scripts**: Schema, data, and Stored Procedures optimized for Oracle (`Oracle_Schema.sql`, `Procedures.sql`).
* **/Queries**: A collection of analytical SQL queries for logistics reporting (`Analytical_Queries.sql`).

---

## 👤 Developer
**Marwa Mahmoud Mohamed** *Senior Software Engineer* 
**📧 Email**: [marwa.sw.eng@outlook.com](mailto:marwa.sw.eng@outlook.com)  
**🔗 LinkedIn**: [marwa-mahmoud123](https://www.linkedin.com/in/marwa-mahmoud123)  
**💻 Portfolio**: [marwa-mahmoud-sw-eng.vercel.app](https://marwa-mahmoud-sw-eng.vercel.app/)

---
*Disclaimer: This database system was developed as a technical implementation case study for logistics management in 2023.*
