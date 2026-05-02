import 'package:flutter/material.dart';

void main() {
  runApp(const PresentationApp());
}

class PresentationApp extends StatelessWidget {
  const PresentationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BA Presentation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const PresentationScreen(),
    );
  }
}

class SlideData {
  final String title;
  final String content;
  final String? imageUrl;
  final bool isTitleSlide;

  const SlideData({
    required this.title,
    required this.content,
    this.imageUrl,
    this.isTitleSlide = false,
  });
}

const List<SlideData> presentationSlides = [
  SlideData(
    title: 'Fundamentals of Business Administration',
    content: 'Welcome to the presentation.\nA guide for BA Students.',
    isTitleSlide: true,
  ),
  SlideData(
    title: '1. What is Business Administration?',
    content: 'Business Administration involves overseeing the operations and decision-making processes within an organization to ensure efficiency and profitability.',
  ),
  SlideData(
    title: '2. Core Components',
    content: 'Key areas include Finance, Marketing, Human Resources, and Operations. A successful BA professional understands how these departments interact.',
  ),
  SlideData(
    title: '3. Strategic Management',
    content: 'Strategy involves setting long-term goals and determining the best approaches to achieve a competitive advantage in the market.',
  ),
  SlideData(
    title: '4. Organizational Behavior',
    content: 'Understanding how people behave within groups is crucial for effective leadership, corporate culture development, and team management.',
    imageUrl: 'https://images.unsplash.com/photo-1522071820081-009f0129c71c?auto=format&fit=crop&q=80&w=1000', // Team collaboration
  ),
  SlideData(
    title: '5. Financial Accounting',
    content: 'Finance is the language of business. BA students must master analyzing balance sheets, income statements, and cash flows to assess company health.',
  ),
  SlideData(
    title: '6. Marketing Principles',
    content: 'Marketing is more than advertising; it is about understanding customer needs, market research, positioning, and delivering value.',
  ),
  SlideData(
    title: '7. The Role of Analytics',
    content: 'Modern business administration relies heavily on data. Business Analytics drives informed decision-making and forecasting trends.',
  ),
  SlideData(
    title: '8. Future of Business',
    content: 'Global markets, sustainable practices, and technological integration are shaping the future landscape for business administrators.',
    imageUrl: 'https://images.unsplash.com/photo-1460925895917-afdab827c52f?auto=format&fit=crop&q=80&w=1000', // Business analytics/charts
  ),
  SlideData(
    title: 'Conclusion & Q&A',
    content: 'Thank you for attending.\nAny questions?',
    isTitleSlide: true,
  ),
];

class PresentationScreen extends StatefulWidget {
  const PresentationScreen({super.key});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _nextPage() {
    if (_currentPage < presentationSlides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Progress Bar
            LinearProgressIndicator(
              value: (_currentPage + 1) / presentationSlides.length,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              minHeight: 4,
            ),
            
            // Slides
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: presentationSlides.length,
                itemBuilder: (context, index) {
                  return SlideWidget(slide: presentationSlides[index]);
                },
              ),
            ),
            
            // Navigation Controls
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    offset: const Offset(0, -2),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Slide ${_currentPage + 1} of ${presentationSlides.length}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: _currentPage > 0 ? _previousPage : null,
                        icon: const Icon(Icons.chevron_left),
                        iconSize: 32,
                        color: Colors.blueAccent,
                        disabledColor: Colors.grey[300],
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        onPressed: _currentPage < presentationSlides.length - 1
                            ? _nextPage
                            : null,
                        icon: const Icon(Icons.chevron_right),
                        iconSize: 32,
                        color: Colors.blueAccent,
                        disabledColor: Colors.grey[300],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SlideWidget extends StatelessWidget {
  final SlideData slide;

  const SlideWidget({super.key, required this.slide});

  @override
  Widget build(BuildContext context) {
    final bool hasImage = slide.imageUrl != null;

    if (slide.isTitleSlide) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                slide.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                slide.content,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            slide.title,
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    slide.content,
                    style: const TextStyle(
                      fontSize: 26,
                      color: Colors.black87,
                      height: 1.6,
                    ),
                  ),
                ),
                if (hasImage) ...[
                  const SizedBox(width: 40),
                  Expanded(
                    flex: 2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        slide.imageUrl!,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            color: Colors.grey[200],
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[200],
                            child: const Center(
                              child: Icon(Icons.error, color: Colors.red, size: 50),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
