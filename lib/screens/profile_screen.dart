import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Map<String, dynamic> vehicleProfile = {
    'owner': 'John Doe',
    'model': 'Skoda Octavia',
    'vin': '7512BE4D',
    'warranty': 'Active until 2026',
    'odometer': '45,230 km',
    'lastService': '2024-08-15',
  };

  final Map<String, dynamic> activeIssue = {
    'title': 'Critical Misfire Detected – P0301',
    'severity': 'Critical',
    'confidence': 92,
    'rca': {
      'rootCause':
          'Ignition coil overheating due to resistance spikes. The coil shows degradation pattern consistent with thermal stress from prolonged high-load operation.',
      'evidence': [
        'DTC Code: P0301 (Cylinder 1 Misfire)',
        'RPM spikes detected: 1128 → 1450 → 1128 (pattern repeats)',
        'Coolant deviation: 76.1°C (normal: 82-88°C)',
        'Historical match: 87% similarity with 23 previous cases',
      ],
      'telemetry': {
        'timeframe': 'Last 10 minutes',
        'rpm': [1128, 1150, 1128, 1200, 1180, 1128, 1100, 1150, 1128],
        'coolant': [74, 75, 76, 76.1, 75.5, 76, 75.8, 76.1, 75.9],
      },
    },
    'capa': {
      'corrective': [
        'Replace ignition coil #1',
        'Inspect spark plug condition',
        'Verify fuel injector operation',
      ],
      'preventive': [
        'Improve coil insulation design',
        'Update ignition timing map for high-load scenarios',
        'Add thermal monitoring for coil temperature',
      ],
    },
    'manufacturing': {
      'insight':
          'Recurring ignition coil heat stress observed across 23 similar cases. Pattern indicates insufficient thermal management during high-load operation.',
      'recommendation':
          'Recommend harness insulation revision + connector upgrade to IP67 spec. Consider adding thermal sensors to coil assembly.',
      'priority': 'High',
    },
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Vehicle Profile
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Vehicle Profile',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildProfileItem('Owner', vehicleProfile['owner']),
                  _buildProfileItem('Model', vehicleProfile['model']),
                  _buildProfileItem('VIN', vehicleProfile['vin']),
                  _buildProfileItem('Warranty', vehicleProfile['warranty']),
                  _buildProfileItem('Odometer', vehicleProfile['odometer']),
                  _buildProfileItem(
                      'Last Service', vehicleProfile['lastService']),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Active Issues
          const Text(
            'Active Issues',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          _buildIssueCard(),

          const SizedBox(height: 24),

          // UEBA Section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.security,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.blue.shade300
                            : Colors.blue.shade700,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'UEBA – Agent Security Layer',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildUEBAItem(
                    'All agent actions',
                    'Verified',
                    Colors.green,
                  ),
                  _buildUEBAItem(
                    'Suspicious attempts',
                    '0',
                    Colors.green,
                  ),
                  _buildUEBAItem(
                    'Blocked abnormal actions',
                    '0',
                    Colors.green,
                  ),
                  const Divider(),
                  const SizedBox(height: 8),
                  const Text(
                    'Recent Agent Actions',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  _buildAgentAction(
                    'DiagnosisAgent',
                    'Analyzed misfire pattern',
                    '2 min ago',
                    Colors.green,
                  ),
                  _buildAgentAction(
                    'SchedulingAgent',
                    'Created service booking',
                    '5 min ago',
                    Colors.green,
                  ),
                  _buildAgentAction(
                    'DataAnalysisAgent',
                    'Processed telemetry data',
                    '10 min ago',
                    Colors.green,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.amber.shade900.withOpacity(0.3)
                          : Colors.amber.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.amber.shade700
                            : Colors.amber.shade200,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.amber.shade300
                              : Colors.amber.shade800,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'SchedulingAgent attempted unauthorized access to raw sensor dump. UEBA blocked action. Master Agent notified.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? Colors.amber.shade200
                                  : Colors.amber.shade900,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: Colors.grey.shade600),
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildIssueCard() {
    return Card(
      child: ExpansionTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.red.shade100,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.warning, color: Colors.red.shade700),
        ),
        title: Text(activeIssue['title']),
        subtitle: Text('Confidence: ${activeIssue['confidence']}%'),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.red.shade700,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            activeIssue['severity'],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // RCA Section
                _buildRCASection(),
                const SizedBox(height: 24),
                // CAPA Section
                _buildCAPASection(),
                const SizedBox(height: 24),
                // Manufacturing Insights
                _buildManufacturingSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRCASection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.search, color: Colors.blue.shade700),
            const SizedBox(width: 8),
            const Text(
              'RCA (Root Cause Analysis)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Root Cause Summary
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Root Cause Summary',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(activeIssue['rca']['rootCause']),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Evidence
        const Text(
          'Evidence',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...(activeIssue['rca']['evidence'] as List).map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.check_circle,
                      size: 16, color: Colors.green.shade700),
                  const SizedBox(width: 8),
                  Expanded(child: Text(item)),
                ],
              ),
            )),
        const SizedBox(height: 16),
        // Telemetry Snapshot
        const Text(
          'Last 10 Minutes Telemetry',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('RPM: ${activeIssue['rca']['telemetry']['rpm'].join(', ')}'),
              const SizedBox(height: 4),
              Text(
                  'Coolant: ${activeIssue['rca']['telemetry']['coolant'].join(', ')}°C'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCAPASection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.build, color: Colors.orange.shade700),
            const SizedBox(width: 8),
            const Text(
              'CAPA (Corrective & Preventive Actions)',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Corrective Actions
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Corrective Actions',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...(activeIssue['capa']['corrective'] as List).map((action) =>
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_forward,
                            size: 16, color: Colors.red.shade700),
                        const SizedBox(width: 8),
                        Expanded(child: Text(action)),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Preventive Actions
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Preventive Actions',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ...(activeIssue['capa']['preventive'] as List).map((action) =>
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.shield,
                            size: 16, color: Colors.blue.shade700),
                        const SizedBox(width: 8),
                        Expanded(child: Text(action)),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildManufacturingSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.purple.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purple.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.factory, color: Colors.purple.shade700),
              const SizedBox(width: 8),
              const Text(
                'Manufacturing Insights',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(activeIssue['manufacturing']['insight']),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Priority: ${activeIssue['manufacturing']['priority']}',
                        style: TextStyle(
                          color: Colors.red.shade800,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(activeIssue['manufacturing']['recommendation']),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Insights sent to Manufacturing team'),
                  ),
                );
              },
              icon: const Icon(Icons.send),
              label: const Text('Send to Manufacturing'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
            ),
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

  Widget _buildAgentAction(String agent, String action, String time, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              '$agent: $action',
              style: const TextStyle(fontSize: 12),
            ),
          ),
          Text(
            time,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }
}

