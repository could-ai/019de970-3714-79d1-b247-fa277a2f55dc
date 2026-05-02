import 'package:flutter/material.dart';

void main() {
  runApp(const PresentationApp());
}

class PresentationApp extends StatelessWidget {
  const PresentationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Presentation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
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
    title: 'The Future of AI App Development',
    content: 'Welcome to the presentation.\nPresented by AI.',
    isTitleSlide: true,
  ),
  SlideData(
    title: '1. What is AI App Development?',
    content: 'AI app development leverages large language models and autonomous agents to architect, build, and deploy software faster than ever before.',
  ),
  SlideData(
    title: '2. The Evolution',
    content: 'We are moving from writing repetitive boilerplate code to writing descriptive prompts. The AI handles the syntax while developers focus on the product vision.',
  ),
  SlideData(
    title: '3. Key Technologies',
    content: 'Combining frameworks like Flutter for cross-platform UI with powerful LLMs allows for seamless generation of native iOS, Android, and Web applications.',
  ),
  SlideData(
    title: '4. Speed and Efficiency',
    content: 'Development cycles are shortened from months to minutes. Instant live previews enable rapid iteration.',
    imageUrl: 'https://images.unsplash.com/photo-1517976487492-5750f3195933?auto=format&fit=crop&q=80&w=1000', // Rocket / Speed
  ),
  SlideData(
    title: '5. Revolutionizing the Workflow',
    content: 'Platforms like CouldAI integrate the entire workflow into one intelligent environment, removing the friction of setting up environments, managing dependencies, and staging deployments.',
  ),
  SlideData(
    title: '6. Autonomous Agents',
    content: 'Agents do not just write snippets; they read your entire codebase, understand architecture, and implement multi-file features safely.',
  ),
  SlideData(
    title: '7. Ensuring Quality',
    content: 'AI agents can also write tests, perform refactoring, and identify security vulnerabilities early in the development lifecycle.',
  ),
  SlideData(
    title: '8. Real-world Applications',
    content: 'From enterprise dashboards to consumer mobile apps, AI-generated code is reaching production-grade reliability.',
    imageUrl: 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?auto=format&fit=crop&q=80&w=1000', // Tech / Cyber
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
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: presentationSlides.length,
            itemBuilder: (context, index) {
              return SlideWidget(slide: presentationSlides[index]);
            },
          ),
          
          // Navigation Controls
          Positioned(
            bottom: 30,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 30),
                    onPressed: _currentPage > 0 ? _previousPage : null,
                    color: _currentPage > 0 ? Colors.blueAccent : Colors.grey.withOpacity(0.5),
                  ),
                  Text(
                    '${_currentPage + 1} / ${presentationSlides.length}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward_ios, size: 30),
                    onPressed: _currentPage < presentationSlides.length - 1 ? _nextPage : null,
                    color: _currentPage < presentationSlides.length - 1 ? Colors.blueAccent : Colors.grey.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
          
          // Progress Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: LinearProgressIndicator(
              value: (_currentPage + 1) / presentationSlides.length,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blueAccent),
              minHeight: 4,
            ),
          ),
        ],
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
              const SizedBox(height: 40),
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
      padding: const EdgeInsets.fromLTRB(60.0, 80.0, 60.0, 100.0),
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
          const Divider(thickness: 2, color: Colors.blueAccent),
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
