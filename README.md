# Nova Ride 🚗

**Nova Ride** is a ride-booking app built using **Spring Boot** and designed with a robust **microservices architecture**. This project showcases the use of several advanced technologies and best practices that have shaped the backend development of the application.

## 🔑 Key Microservices Developed:

### 1. Entity Service
- Managed entities such as **OTP**, **Passenger**, **Driver**, and more.
- Used **Flyway migrations** for managing database versioning.
- Followed **DTOs** and structured **APIs** for efficient data transfer and maintainable code.

### 2. Location Service
- Fetched and cached nearby drivers using **Redis geospatial data** to ensure real-time performance.
- After receiving the passenger’s location, it returns available drivers from the cache, reducing the database load.
- **Source Code**: [NovaRideLocationService](https://github.com/prahulk46a/NovaRideLocationService).

### 3. Booking Service
- Created new bookings and assigned drivers.
- Utilized **Retrofit** for asynchronous communication to fetch nearby drivers.
- Integrated **WebSockets** using the **STOMP protocol** for real-time updates.
- Implemented **Kafka** to handle high-volume asynchronous requests for smoother performance.
- **Source Code**:[NovaRideBookingService](https://github.com/prahulk46a/NovaRideBookingService)

### 4. Auth Service
- Used **JWT** for user authentication and **bcrypt** for password encryption.
- Developed custom **filters** to validate users and secure communication across services.
- **Source Code**:[NovaRideAuthService](https://github.com/prahulk46a/NovaRideAuthService)

### 5. Review Service
- Handled **reviews** between passengers and drivers, ensuring that reviews are only created for completed bookings.
- **Source Code**:[NovaRideReviewService](https://github.com/prahulk46a/NovaRideReviewService)

### 6. Netflix Eureka Discovery Service
- Implemented **Netflix Eureka** for seamless service discovery, enabling dynamic communication between microservices.
- **Source Code**:[NovaRideDiscoveryService](https://github.com/prahulk46a/NovaRideDiscoveryService)

### 7. WebSockets and Asynchronous Communication
- Real-time messaging between services using **WebSockets** and **STOMP protocol**.
- Used **Kafka** to manage asynchronous communication during high-load times for better scalability.
- **Source Code**:[NovaRideSocketService](https://github.com/prahulk46a/NovaRideSocketService)

## 💡 Design Patterns & Best Practices
- Followed **SOLID principles** to ensure a clean and maintainable codebase.
- Implemented **MVC architecture** to separate concerns and improve the structure.
- Used **Builder** and **Adapter patterns** for efficient service integration and object creation.

---

## 🚀 Technologies & Tools Used:
- **Spring Boot** for building microservices
- **JWT** for authentication and **bcrypt** for security
- **Redis** for caching and geospatial data
- **Kafka** for asynchronous communication and high-volume processing
- **Retrofit** for async API calls
- **Flyway migrations** for managing database versions
- **Spring Data JPA** for database interaction
- **WebSockets (STOMP)** for real-time communication
- **Netflix Eureka** for service discovery

---


