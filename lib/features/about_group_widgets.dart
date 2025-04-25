part of 'home_screen.dart';

Widget basicInfoWidget() {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white.withAlpha(16),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.white, width: 0.2),
    ),
    constraints: BoxConstraints(minWidth: 100.w > 100.h ? 45.w : 100.w - 64, maxWidth: 100.w - 64),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Image.asset('assets/images/avatar.jpeg', width: 128, height: 128),
        ),
        const SizedBox(width: 16),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 256, maxWidth: 100.w - 232.4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dmitriy Ostrovskiy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  height: 1,
                ),
                maxLines: 2,
              ),
              SizedBox(height: 8),
              Text(
                "Middle Flutter Developer (3+ years of flutter experience)",
                style: TextStyle(fontFamily: 'JetBrainsMono'),
                maxLines: 2,
              ),
              SizedBox(height: 4),
              Text(
                "19 y.o. | Russian Federation, Ryazan",
                style: TextStyle(fontFamily: 'JetBrainsMono'),
                maxLines: 2,
              ),
              SizedBox(height: 4),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget summaryWidget() {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white.withAlpha(16),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.white, width: 0.2),
    ),
    constraints: BoxConstraints(maxWidth: 100.w > 100.h ? 45.w : 100.w - 64),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Summary',
          style: TextStyle(fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.w200),
        ),
        const SizedBox(height: 8),
        Text(
          "Results-driven software developer with over three years of experience in software engineering and research. I strive to create intuitive and user-friendly interfaces while writing clean, readable, and maintainable code. I place a strong emphasis on the quality of the solutions I build and their real-world value to end users. Continuously expanding my technical knowledge and skills, I stay up to date with modern technologies and development practices to remain effective in the fast-paced IT industry.",
          style: TextStyle(fontFamily: 'JetBrainsMono'),
        ),
        const SizedBox(height: 4),
      ],
    ),
  );
}

Widget linksWidget() {
  return Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: Colors.white.withAlpha(16),
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.white, width: 0.2),
    ),
    constraints: BoxConstraints(maxWidth: 100.w - 64),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: 72, child: Center(child: Icon(Icons.chat_outlined, size: 36))),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Links',
              style: TextStyle(fontFamily: 'Inter', fontSize: 24, fontWeight: FontWeight.w200),
            ),
            const SizedBox(height: 8),
            Table(
              defaultColumnWidth: FixedColumnWidth(100.w > 100.h ? 15.w : 50.w - 80.2),
              children: [
                TableRow(
                  children: [
                    HoveredWebAnchor(label: "• GitHub", url: 'https://github.com/QUSAD-prod'),
                    HoveredWebAnchor(
                      label: "• Linkedin",
                      url: 'https://www.linkedin.com/in/dmitriy-ostrovskiy-ab6615355/',
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    HoveredWebAnchor(label: "• Telegram", url: 'https://t.me/prodbyqusad'),
                    HoveredWebAnchor(label: "• E-mail", url: 'mailto:qusad.prod@gmail.com'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
