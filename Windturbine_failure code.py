import numpy as np
import pandas as pd
from datetime import datetime, timedelta
import random

# Number of data points to be generated
no_of_values = 3000
#failure values below range
failure_values_br = 500
#failure values above range
failure_values_ar = 500

# Generating random dates within a range
start_date = datetime(2023, 1, 1)
end_date = datetime(2023, 12, 31)
date_range = end_date - start_date
random_dates = [start_date + timedelta(seconds=random.randint(0, int(date_range.total_seconds()))) for _ in range(no_of_values)]

# Generating random values for each parameter
wind_speed = np.concatenate([
    np.random.uniform(3, 25, no_of_values - failure_values_br - failure_values_ar),
    np.random.uniform(0, failure_values_br, failure_values_br),
    np.random.uniform(26, 50, failure_values_ar)
])
gearbox_oil_temp = np.concatenate([
    np.random.uniform(50, 55, no_of_values-failure_values_br - failure_values_ar), #gearbox oil temp values from 50-55°C(90–100°F)
    np.random.uniform(0, 50, failure_values_br),
    np.random.uniform(55,100 , failure_values_ar)
])
vibration_levels = np.concatenate([
    np.random.uniform(0.5, 15, no_of_values- failure_values_br - failure_values_ar), #vibration levels range from 0.5 - 15hz
    np.random.uniform(-10, 0.5, failure_values_br),
    np.random.uniform(15, 30, failure_values_ar)
])
oil_pressure = np.concatenate([
    np.random.uniform(28, 65, no_of_values- failure_values_br - failure_values_ar), #28- 65 PSI range values
    np.random.uniform(0, 27, failure_values_br),
    np.random.uniform(66, 100, failure_values_ar)
])
torque = np.concatenate([
    np.random.uniform(100, 7000, no_of_values- failure_values_br - failure_values_ar), #torque values range from 100-7000 values
    np.random.uniform(0, 99, failure_values_br),
    np.random.uniform(7001, 10000, failure_values_ar)
])
shaft_speed = np.concatenate([
    np.random.uniform(10, 20, no_of_values- failure_values_br - failure_values_ar), #10-20 RPM (generates 1800) values shaft speed in a wind turbine engine
    np.random.uniform(0, 9, failure_values_br),
    np.random.uniform(21, 40, failure_values_ar)
])
oil_level = np.concatenate([
    np.random.uniform(200, 300, no_of_values- failure_values_br - failure_values_ar), #200-300 liters of petrol consumes
    np.random.uniform(301, 500, failure_values_ar),
    np.random.uniform(0, 199, failure_values_br)
])
shock_pulse = np.concatenate([
    np.random.uniform(0, 60, no_of_values- failure_values_br - failure_values_ar),  #shock pulse values range from 0-60db
    np.random.uniform(-60, 0, failure_values_br),
    np.random.uniform(61, 100, failure_values_ar)
])
vibration_spectra = np.concatenate([
    np.random.uniform(122.3, 657, no_of_values- failure_values_br - failure_values_ar), #vibration levels from 122.3-657Hz
    np.random.uniform(0, 122.2, failure_values_br),
    np.random.uniform(658, 10000, failure_values_ar)
])
generator_speed = np.concatenate([
    np.random.uniform(40, 72, no_of_values- failure_values_br - failure_values_ar), #40-72 mph speed of the generator
    np.random.uniform(0, 39, failure_values_br),
    np.random.uniform(73, 100, failure_values_ar)
])
power_output = np.concatenate([
    np.random.uniform(20, 500000, no_of_values- failure_values_br - failure_values_ar), #20 watt to 5 megawatt values
    np.random.uniform(0, 19, failure_values_br),
    np.random.uniform(500001, 1000000, failure_values_ar)
])
torque_eng = power_output * wind_speed #torque = power*speed
coolant_temp = np.concatenate([
    np.random.uniform(-20, 50, no_of_values), #coolant temperature -20-50°C
    np.random.uniform(-50, -20, failure_values_br),
    np.random.uniform(50, 100, failure_values_ar)
])
oil_temp = np.concatenate([
    np.random.uniform(-15, 95, no_of_values),  #oil temperature must be between -15 to 95°C
    np.random.uniform(-25, -16, failure_values_br),
    np.random.uniform(96, 150, failure_values_ar)
])
oil_pressure_ratio = np.concatenate([
    np.random.uniform(0, 2, no_of_values), #oil pressure is from 0 to 2 pressurte ratio
    np.random.uniform(-10, 1, failure_values_br),
    np.random.uniform(3, 5, failure_values_ar)
])
bearing_temp = np.concatenate([
    np.random.uniform(0, 180, no_of_values), #must be below 180°F
    np.random.uniform(-50, 179, failure_values_br),
    np.random.uniform(181, 250, failure_values_ar)
])
pitch_yaw_angle = np.concatenate([
    np.random.uniform(-180, 180, no_of_values), #range from -180 to 180°C
np.random.uniform(-250, 179, failure_values_br),
    np.random.uniform(181, 250, failure_values_ar)
])
housing_temp = np.random.uniform(-20, 50, no_of_values) #range from -20 to 50°C
housing_temp = np.random.uniform(-50, -21, failure_values_br)
housing_temp = np.random.uniform(51, 100, failure_values_ar)
strain_gauges = np.random.uniform(30, 3000, no_of_values) #range from 30 to 3000(Ω)ohms
strain_gauges = np.random.uniform(0, 30, failure_values_br)
strain_gauges = np.random.uniform(3001, 5000, failure_values_ar)


# Create DataFrame
df = pd.DataFrame({
    'Timestamp': random_dates,
    'Wind Speed': wind_speed,
    'gearbox oil Temperature': gearbox_oil_temp,
    'Vibration levels': np.random.uniform(0.5, 15, no_of_values),
    'oil pressure': oil_pressure,
    'torque': torque,
    'shaft speed': shaft_speed,
    'Oil level': oil_level,
    'shock pulse': shock_pulse,
    'vibration spectra': vibration_spectra,
    'generator speed': generator_speed,
    'power output': power_output,
    'tourque engine': torque_eng,
    'coolant temp': coolant_temp,
    'oil temp': oil_temp,
    'oil pressure ratio': oil_pressure_ratio,
    'bearing temperature': bearing_temp,
    'pitch and yaw angle': pitch_yaw_angle,
    'housing temperature': housing_temp,
    'strain gauges': strain_gauges,
})
df['data'] = [random.choice(['Yes', 'No']) for _ in range(no_of_values)]

# Function to add additional rows above and below the data range for each variable
def add_extra_rows(column, no_of_extra_rows):
    extra_values_above = np.random.uniform(column.max(), column.max() * 1.5, no_of_extra_rows)
    extra_values_below = np.random.uniform(column.min() * 0.5, column.min(), no_of_extra_rows)
    return np.concatenate([extra_values_above, extra_values_below])

# Adding 500 rows above and below the existing data range for each column
no_of_extra_rows = 500
extra_data = {}
for column in df.columns:
    if column != 'Timestamp' and column != 'data':
        extra_values = add_extra_rows(df[column], no_of_extra_rows)
        extra_data[column] = extra_values[:no_of_values]  # Trim to match the original length

# Extend the DataFrame with additional data
df_extra = pd.DataFrame(extra_data)
df_extended = pd.concat([df, df_extra], axis=1)

# Exporting DataFrame to CSV
df_extended.to_csv('unexpected_failure_of_wind_turbine_with_extra_data.csv', index=False)