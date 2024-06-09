import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class ProductDescriptionSection extends StatelessWidget {
  const ProductDescriptionSection({
    super.key,
  });

final String dummyHtml = '''
  <h4>Sporty Style Meets Everyday Comfort:</h4>

<p>The baseball cap is your go-to accessory for casual style and sun protection. This classic design features a curved brim for shade, a breathable cotton twill construction, and an adjustable strap for a perfect fit. The [color] cap with a contrasting [color] embroidered logo adds a touch of sporty flair to your everyday look.</p>

<h4>Key Features:</h4>

<ul>
<li>Curved brim for sun protection</li>
<li>Breathable cotton twill construction</li>
<li>Adjustable strap for a comfortable fit</li>
<li>Embroidered logo for a stylish touch</li>
</ul>

<h4>Perfect for:</h4>

<p>Casual outings, outdoor activities, everyday wear</p>

<h4>Material:</h4>

<p>Cotton.</p>
  ''';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Product Description'.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 20),
          HtmlWidget(
            dummyHtml,
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}