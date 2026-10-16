
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  static const Color purple = Color(0xFF6A1B9A);
  static const Color lightPurple = Color(0xFFF4ECFA);
  static const Color darkText = Color(0xFF171717);

  int _selectedIndex = 0;

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  Widget _buildEmptyState({
    required IconData icon,
    required String title,
    required String message,
  }) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: const BoxDecoration(
                color: lightPurple,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 48, color: purple),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: darkText,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black54,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboard() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              color: purple,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Your Agency',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Your delivery management workspace.',
                  style: TextStyle(
                    color: Color(0xFFE1BEE7),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          const Text(
            'Delivery Overview',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: darkText,
            ),
          ),
          const SizedBox(height: 12),
          _buildEmptyState(
            icon: Icons.inventory_2_outlined,
            title: 'No deliveries yet',
            message:
            'Your delivery information and live tracking details '
                'will appear here when connected to your database.',
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () => setState(() => _selectedIndex = 1),
              icon: const Icon(Icons.local_shipping_outlined),
              label: const Text('View Deliveries'),
              style: OutlinedButton.styleFrom(
                foregroundColor: purple,
                side: const BorderSide(color: purple),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrders() {
    return _buildEmptyState(
      icon: Icons.inventory_2_outlined,
      title: 'No deliveries added',
      message:
      'Once your delivery database is connected, '
          'your delivery records will appear here.',
    );
  }

  Widget _buildAgents() {
    return _buildEmptyState(
      icon: Icons.people_outline,
      title: 'No delivery agents yet',
      message:
      'Your registered delivery agents will appear here '
          'when agent management is set up.',
    );
  }

  Widget _buildProfile() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 28),
            decoration: BoxDecoration(
              color: purple,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 38,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.business_outlined,
                    size: 42,
                    color: purple,
                  ),
                ),
                SizedBox(height: 14),
                Text(
                  'Agency Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Your business information',
                  style: TextStyle(
                    color: Color(0xFFE1BEE7),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          const Text(
            'Business Information',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: darkText,
            ),
          ),
          const SizedBox(height: 14),
          _profileOption(
            icon: Icons.business,
            title: 'Agency Name',
            subtitle: 'Not added yet',
          ),
          _profileOption(
            icon: Icons.person_outline,
            title: 'Authorized Representative',
            subtitle: 'Not added yet',
          ),
          _profileOption(
            icon: Icons.email_outlined,
            title: 'Email Address',
            subtitle: 'Not added yet',
          ),
          _profileOption(
            icon: Icons.phone_outlined,
            title: 'Phone Number',
            subtitle: 'Not added yet',
          ),
          _profileOption(
            icon: Icons.location_on_outlined,
            title: 'Business Address',
            subtitle: 'Not added yet',
          ),
          const SizedBox(height: 20),
          const Text(
            'Account Settings',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: darkText,
            ),
          ),
          const SizedBox(height: 14),
          _profileOption(
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            subtitle: 'Delivery update preferences',
            onTap: () => _showMessage(
              'Notification settings will be added next.',
            ),
          ),
          _profileOption(
            icon: Icons.security_outlined,
            title: 'Security',
            subtitle: 'Account security settings',
            onTap: () => _showMessage(
              'Security settings will be added next.',
            ),
          ),
          _profileOption(
            icon: Icons.help_outline,
            title: 'Help and Support',
            subtitle: 'Get help with your account',
            onTap: () => _showMessage(
              'Help and support will be added later.',
            ),
          ),
        ],
      ),
    );
  }

  Widget _profileOption({
    required IconData icon,
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFEDE5F3)),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 5,
        ),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: lightPurple,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: purple),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: darkText,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.black45,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final titles = [
      'Dashboard',
      'Deliveries',
      'Delivery Agents',
      'Agency Profile',
    ];

    final pages = [
      _buildDashboard(),
      _buildOrders(),
      _buildAgents(),
      _buildProfile(),
    ];

    final icons = [
      Icons.dashboard_outlined,
      Icons.inventory_2_outlined,
      Icons.people_outline,
      Icons.business_outlined,
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: purple,
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          titles[_selectedIndex],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            tooltip: 'Notifications',
            onPressed: () => _showMessage(
              'Delivery notifications will be connected later.',
            ),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: SafeArea(
        child: pages[_selectedIndex],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        indicatorColor: lightPurple,
        backgroundColor: Colors.white,
        destinations: [
          NavigationDestination(
            icon: Icon(icons[0]),
            selectedIcon: const Icon(Icons.dashboard),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(icons[1]),
            label: 'Deliveries',
          ),
          NavigationDestination(
            icon: Icon(icons[2]),
            label: 'Agents',
          ),
          NavigationDestination(
            icon: Icon(icons[3]),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
