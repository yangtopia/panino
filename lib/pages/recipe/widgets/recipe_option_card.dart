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
    _isSelected = widget.isSelected || false;
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
        GestureDetector(
          onTap: _onTab,
          child: Card(
            color: _isSelected ? Colors.amber[100] : Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
            ),
            child: _isSelected
                ? Icon(
                    Icons.check_circle_outline,
                    size: 15.0,
                  )
                : null,
          ),
          right: 5,
          top: 5,
        ),
      ],
    );
  }
}
