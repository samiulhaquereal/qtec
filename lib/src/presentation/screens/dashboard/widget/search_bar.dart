import 'package:ecommerce/src/app_config/imports/import.dart';

class DashboardSearchBar extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onSortPressed;

  const DashboardSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onSortPressed,
  });

  @override
  State<DashboardSearchBar> createState() => _DashboardSearchBarState();
}

class _DashboardSearchBarState extends State<DashboardSearchBar> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: TextField(
                controller: widget.controller,
                decoration: const InputDecoration(
                  hintText: "Search Anything...",
                  border: InputBorder.none,
                  icon: Icon(Icons.search),
                ),
                onChanged: widget.onChanged,
                onTap: () => setState(() => isFocused = true),
                onEditingComplete: () => setState(() => isFocused = false),
              ),
            ),
          ),
          if (isFocused)
            IconButton(
              icon: Icon(Icons.sort, color: AppColors.primaryColor),
              onPressed: widget.onSortPressed,
            ),
        ],
      ),
    );
  }
}
