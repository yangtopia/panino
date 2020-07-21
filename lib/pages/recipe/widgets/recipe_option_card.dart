import 'package:flutter/material.dart';
import '../../../models/recipe_option.dart';

class RecipeOptionCard extends StatefulWidget {
  final bool isSelected;
  final RecipeOption recipeOption;

  RecipeOptionCard(this.recipeOption, {this.isSelected = false});

  @override
  _RecipeOptionCardState createState() => _RecipeOptionCardState();
}

class _RecipeOptionCardState extends State<RecipeOptionCard> {
  bool _isSelected;
  RecipeOption _recipeOption;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.isSelected || true;
    _recipeOption = widget.recipeOption;
  }

  void _onTab() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: _onTab,
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 5 / 3.5,
                  child: Image.asset(
                    'assets/images/${widget.isSelected ? '1' : '2'}.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      '${_recipeOption.title}',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: _isSelected
                ? Icon(Icons.check_circle_outline)
                : Icon(Icons.panorama_fish_eye),
          ),
          right: 5,
          top: 5,
        ),
      ],
    );
  }
}
