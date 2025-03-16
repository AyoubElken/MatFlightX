# Rocket/Missile Guidance, Navigation, and Control (GNC) System Simulation

This repository contains a **complete Guidance, Navigation, and Control (GNC) system** for simulating the flight dynamics of a rocket or missile. The system is designed to guide the vehicle from a random initial position to a specified target using advanced control and estimation techniques, including **Linear Quadratic Regulator (LQR)**, **Linear Quadratic Gaussian (LQG)**, and **Kalman Filtering**. The simulation is implemented in **Simulink** using the **Aerospace Blockset** for high-fidelity 3-DOF modeling.

## Key Features

1. **Guidance System**:
   - Calculates **azimuth, latitude, and longitude** for precise target tracking.
   - Generates **guidance commands** to steer the vehicle toward the target.
   - Computes **range, miss distance, and elevation** for real-time trajectory adjustments.

2. **Control System**:
   - Implements a **Linear Quadratic Regulator (LQR)** for optimal control of a 2D state-space model.
   - Utilizes **Kalman Filtering** for accurate state estimation and noise reduction.

3. **3-DOF Simulation**:
   - Simulates the full flight dynamics of a rocket or missile using the **Aerospace Blockset** in Simulink.
   - Models **takeoff, ascent, mid-flight guidance, and target interception**.

4. **Full Flight Simulation**:
   - Simulates a complete rocket flight, including:
     - **Gravity turn** during ascent.
     - **Deorbit descent phase** for re-entry.
     - **Boostback and entry burn** for controlled descent.
     - **Pitch angle control** for a precise vertical touchdown.

## How It Works

- The system starts by calculating the initial conditions and target parameters.
- The **guidance algorithm** generates commands to minimize the miss distance and ensure the vehicle reaches the target.
- The **control system** uses LQR and Kalman filtering to stabilize the vehicle and account for uncertainties.
- The **3-DOF simulation** models the vehicle's motion in three dimensions, incorporating aerodynamic forces, gravity, and control inputs.
- The **full flight simulation** demonstrates the entire flight profile, from liftoff to landing, with realistic dynamics and control strategies.

## Repository Structure

- **/Simulink_Models**: Contains the Simulink models for the GNC system and full flight simulation.
- **/Scripts**: Includes MATLAB scripts for initializing parameters, running simulations, and analyzing results.
- **/Documentation**: Provides detailed explanations of the algorithms and system architecture.

## Requirements

- MATLAB R2021a or later.
- Simulink.
- Aerospace Blockset.
- Control System Toolbox.


## Contributions

Contributions are welcome! If you have suggestions for improvements or new features, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

