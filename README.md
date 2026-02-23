# 📚 Ctrl Vault Project

A collaborative web-based project documentation platform built with Java
(Servlet + JSP), MySQL, and Apache Tomcat.

## 👩‍💻 Collaborators

- Alice Lombardi - https://github.com/aliceslombardi
- Camila Rial - https://github.com/rialcamila
- Vissolela Cundi - https://github.com/DowncastFool6

------------------------------------------------------------------------

## 🚀 Overview

Ctrl Vault is a multi-user documentation system where users can:

-   🧑 Register and manage profiles
-   🔐 Login securely with encrypted passwords
-   📁 Create and manage documentation projects
-   🧱 Add structured content blocks (Text, Code, Images, Videos, GIFs)
-   🔄 Drag and drop to reorder content blocks
-   💬 Submit messages via a contact form

This project demonstrates full-stack Java web development using MVC
architecture.

------------------------------------------------------------------------

## 🛠 Tech Stack

-   ☕ Java (Servlet + JSP)
-   🗄 MySQL
-   🐱 Apache Tomcat
-   🌐 HTML5, CSS3, JavaScript
-   🎨 Bootstrap 5
-   🔀 SortableJS (Drag & Drop)
-   💻 Prism.js (Syntax Highlighting)
-   🧰 NetBeans IDE
-   🐙 Git & GitHub

------------------------------------------------------------------------

## 🧱 Architecture

This project follows MVC architecture:

Controller → Servlet Layer\
Model → Java Classes\
DAO → Database Interaction\
View → JSP Pages

------------------------------------------------------------------------

## 🔐 Security Features

-   BCrypt password hashing
-   Session-based authentication
-   Input validation
-   Secure file uploads
-   Authorization checks

------------------------------------------------------------------------

## 📦 Database Tables

-   Users
-   Projects
-   Blocks
-   ContactMessages

------------------------------------------------------------------------

## ☁ Deployment

Recommended: - Microsoft Azure (via GitHub Student Developer Pack) -
Render or Railway as alternatives

------------------------------------------------------------------------

## 📌 Future Enhancements

-   Comments system
-   Project likes
-   Admin dashboard
-   Markdown support

------------------------------------------------------------------------

## 📁 Project Folder Structure

```text
Ctrl Vault/
│
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   ├── controller/
│   │   │   │   ├── AuthServlet.java
│   │   │   │   ├── ProjectServlet.java
│   │   │   │   ├── BlockServlet.java
│   │   │   │   └── ContactServlet.java
│   │   │   │
│   │   │   ├── dao/
│   │   │   │   ├── UserDAO.java
│   │   │   │   ├── ProjectDAO.java
│   │   │   │   ├── BlockDAO.java
│   │   │   │   └── ContactDAO.java
│   │   │   │
│   │   │   ├── model/
│   │   │   │   ├── User.java
│   │   │   │   ├── Project.java
│   │   │   │   ├── Block.java
│   │   │   │   └── ContactMessage.java
│   │   │   │
│   │   │   └── util/
│   │   │       ├── DBConnection.java
│   │   │       ├── PasswordUtil.java
│   │   │       └── FileUploadUtil.java
│   │   │
│   │   ├── webapp/
│   │   │   ├── WEB-INF/
│   │   │   │   └── web.xml
│   │   │   │
│   │   │   ├── assets/
│   │   │   │   ├── css/
│   │   │   │   ├── js/
│   │   │   │   └── images/
│   │   │   │
│   │   │   ├── uploads/
│   │   │   │
│   │   │   ├── index.jsp
│   │   │   ├── about.jsp
│   │   │   ├── service.jsp
│   │   │   ├── projects.jsp
│   │   │   ├── contact.jsp
│   │   │   ├── login.jsp
│   │   │   ├── register.jsp
│   │   │   ├── profile.jsp
│   │   │   └── project-detail.jsp
│   │
│   └── pom.xml
│
└── README.md
