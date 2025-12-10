import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/agent_provider.dart';
import '../widgets/red_alert_box.dart';
import '../widgets/kpi_card.dart';
import '../widgets/telemetry_chart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // Hardcoded telemetry data
  final Map<String, dynamic> telemetry = {
    'speed': 54,
    'rpm': 1128,
    'dtcCount': 0,
    'coolant': 76.1,
    'intake': 28.9,
    'load': 22,
    'gpsFix': 2.9,
    'satellites': 14,
    'fuel': 32,
    'torque': 16,
    'distance': 28,
    'fuelRate': 2,
    'altitude': 105,
    'ambient': 19.7,
  };

  final bool hasCriticalAlert = true; // Hardcoded for demo

  @override
  Widget build(BuildContext context) {
    final agentProvider = Provider.of<AgentProvider>(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Agent Status Banner
          if (!agentProvider.isAgentActive)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.amber.shade900.withOpacity(0.3)
                    : Colors.amber.shade50,
                border: Border.all(color: Colors.amber),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline, 
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.amber.shade300
                        : Colors.amber.shade800,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Agentic AI paused—No predictions or automation active.',
                      style: TextStyle(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.amber.shade300
                            : Colors.amber.shade800,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // Red Alert Box
          if (hasCriticalAlert) const RedAlertBox(),

          const SizedBox(height: 24),

          // Vehicle Info Card
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.directions_car, 
                      size: 40,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Skoda Octavia',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'VIN: 7512BE4D',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 16,
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Trelleborg, Sweden',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // KPI Grid
          const Text(
            'Live Telemetry',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.5,
            children: [
              KPICard(
                title: 'Speed',
                value: '${telemetry['speed']}',
                unit: 'km/h',
                icon: Icons.speed,
                color: Colors.green,
              ),
              KPICard(
                title: 'RPM',
                value: '${telemetry['rpm']}',
                unit: '',
                icon: Icons.speed_outlined,
                color: Colors.blue,
              ),
              KPICard(
                title: 'DTC Count',
                value: '${telemetry['dtcCount']}',
                unit: '',
                icon: Icons.warning_amber,
                color: telemetry['dtcCount'] == 0 ? Colors.green : Colors.red,
              ),
              KPICard(
                title: 'Coolant',
                value: '${telemetry['coolant']}',
                unit: '°C',
                icon: Icons.thermostat,
                color: Colors.orange,
              ),
              KPICard(
                title: 'Intake',
                value: '${telemetry['intake']}',
                unit: '°C',
                icon: Icons.air,
                color: Colors.blue,
              ),
              KPICard(
                title: 'Load',
                value: '${telemetry['load']}',
                unit: '%',
                icon: Icons.speed,
                color: Colors.purple,
              ),
            ],
          ),

          const SizedBox(height: 24),

          // GPS Info
          Row(
            children: [
              Expanded(
                child: KPICard(
                  title: 'GPS Fix',
                  value: '${telemetry['gpsFix']}',
                  unit: '',
                  icon: Icons.gps_fixed,
                  color: Colors.green,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: KPICard(
                  title: 'Satellites',
                  value: '${telemetry['satellites']}',
                  unit: '',
                  icon: Icons.satellite,
                  color: Colors.green,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          // Charts Section
          Text(
            'Telemetry Charts',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          TelemetryChart(
            title: 'Speed (km/h)',
            data: [45, 52, 48, 54, 58, 54, 50, 52, 54],
          ),
          const SizedBox(height: 16),
          TelemetryChart(
            title: 'RPM',
            data: [1100, 1150, 1128, 1200, 1180, 1128, 1100, 1150, 1128],
          ),
          const SizedBox(height: 16),
          TelemetryChart(
            title: 'Coolant Temperature (°C)',
            data: [74, 75, 76, 76.1, 75.5, 76, 75.8, 76.1, 75.9],
          ),

          const SizedBox(height: 24),

          // Map Placeholder
          Card(
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.map,
                          size: 48,
                          color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.5),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Vehicle Route Map',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Trelleborg → Beder-Malling',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.7),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.green.shade900.withOpacity(0.3)
                            : Colors.green.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Route: 28 km',
                        style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.green.shade300
                              : Colors.green.shade800,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Event Timeline
          Text(
            'Event Timeline',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          _buildEventItem(
            'Misfire pattern detected',
            '2 minutes ago',
            Icons.warning,
            Colors.orange,
          ),
          _buildEventItem(
            'Temperature spike',
            '15 minutes ago',
            Icons.thermostat,
            Colors.red,
          ),
          _buildEventItem(
            'Vibration anomaly',
            '28 minutes ago',
            Icons.vibration,
            Colors.amber,
          ),

          const SizedBox(height: 24),

          // UEBA Status
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.green.shade900.withOpacity(0.3)
                          : Colors.green.shade100,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.shield,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.green.shade300
                          : Colors.green.shade700,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'UEBA Status',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Normal - All agent actions verified',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.info_outline),
                    onPressed: () {
                      _showUEBAModal(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventItem(String title, String time, IconData icon, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        title: Text(title),
        subtitle: Text(time),
        trailing: TextButton(
          onPressed: () {},
          child: const Text('View RCA'),
        ),
      ),
    );
  }

  void _showUEBAModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('UEBA Security Status'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUEBAItem('All agent actions', 'Verified', Colors.green),
            _buildUEBAItem('Suspicious attempts', '0', Colors.green),
            _buildUEBAItem('Blocked actions', '0', Colors.green),
            const SizedBox(height: 16),
            const Text(
              'Last 24 hours: All operations within permitted scope.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildUEBAItem(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              value,
              style: TextStyle(color: color, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

