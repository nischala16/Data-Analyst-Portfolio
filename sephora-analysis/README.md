# Sephora Beauty Analytics

**End-to-end machine learning pipeline analyzing 1M+ beauty product reviews to uncover pricing strategies, sentiment patterns, and product success drivers.**

![Python](https://img.shields.io/badge/Python-3.10+-3776AB?style=flat&logo=python&logoColor=white)
![Machine Learning](https://img.shields.io/badge/Machine%20Learning-scikit--learn-F7931E?style=flat&logo=scikit-learn&logoColor=white)
![NLP](https://img.shields.io/badge/NLP-Transformers-FFD43B?style=flat)
![XGBoost](https://img.shields.io/badge/XGBoost-Gradient%20Boosting-006600?style=flat)
![DistilBERT](https://img.shields.io/badge/DistilBERT-HuggingFace-FF6F00?style=flat&logo=huggingface&logoColor=white)

| 1,092,953 Reviews | 8,494 Products | 4 ML Models | 25+ Visualizations |
|:---:|:---:|:---:|:---:|

---

## Executive Summary

This project applies statistical analysis, transformer-based NLP, recommendation systems, and supervised learning to Sephora's product catalog and customer review data. The pipeline processes over 1M reviews through DistilBERT sentiment analysis, builds a hybrid recommendation engine combining collaborative filtering with content-based methods, and trains three predictive models (product success classification, review helpfulness prediction, and price regression). The analysis reveals that brand positioning accounts for 85% of pricing power while price has almost no correlation with product quality (r=0.083), identifying concrete pricing and merchandising opportunities.

---

## Key Findings

| # | Finding | Evidence |
|---|---------|----------|
| 1 | **Premium pricing does not mean better quality** | Price-rating correlation of just r=0.083 across 8,494 products |
| 2 | **Digital engagement surged post-2020** | 5.3x increase in review volume with sentiment quality maintained |
| 3 | **Customers explore by category, not brand** | 90% of browsing follows category-first navigation patterns |
| 4 | **Brand positioning drives pricing power** | Brand average price alone explains 85.5% of feature importance in price prediction |
| 5 | **Device/tool products have quality issues** | 40%+ negative sentiment rate, highest complaint category |

---

## Technical Highlights

| Dimension | Details |
|-----------|---------|
| **Algorithms** | DistilBERT (sentiment), BERTopic (topic modeling), SVD matrix factorization, XGBoost, Random Forest, Logistic Regression, Gradient Boosting |
| **Scale** | 1,092,953 reviews, 8,494 products, 105,566 active users |
| **NLP** | Transformer-based sentiment classification with 87.7% average confidence score |
| **Recommendation** | Hybrid system: 60% collaborative filtering (SVD, 50 latent factors) + 40% content-based (TF-IDF ingredients + category features) |
| **Production Patterns** | 5-fold stratified cross-validation, GridSearchCV hyperparameter tuning, class imbalance handling, StandardScaler preprocessing |
| **Challenges Solved** | 99.7% matrix sparsity in collaborative filtering, skewed price distributions (log-transform), imbalanced classification targets |

---

## Project Structure

```
sephora-beauty-analytics/
|
|-- data/
|   |-- product_info.csv                  # 8,494 products with ingredients, pricing, categories
|   |-- reviews_0-250.csv                 # Review data split across 5 files
|   |-- reviews_250-500.csv               #   (1,092,953 total reviews)
|   |-- reviews_500-750.csv
|   |-- reviews_750-1250.csv
|   |-- reviews_1250-end.csv
|   +-- processed/
|       |-- reviews_with_sentiment.parquet # Sentiment-labeled reviews
|       +-- sentiment_analysis_summary.txt
|
|-- notebooks/
|   |-- 01_eda.ipynb                      # Exploratory data analysis
|   |-- 02_sentiment_analysis.ipynb       # DistilBERT sentiment pipeline
|   |-- 03_recommendations.ipynb          # Hybrid recommendation engine
|   +-- 04_predictive_modeling.ipynb      # Classification & regression models
|
|-- outputs/
|   |-- figures/                          # 20 publication-ready visualizations
|   +-- reports/                          # Model summaries, CSVs, key findings
|
|-- requirements.txt
+-- README.md
```

---

## Quick Start

**1. Clone and install**

```bash
git clone https://github.com/YOUR_USERNAME/sephora-beauty-analytics.git
cd sephora-beauty-analytics
pip install -r requirements.txt
```

**2. Get the data**

Download from Kaggle: [Sephora Products and Skincare Reviews](https://www.kaggle.com/datasets/nadyinky/sephora-products-and-skincare-reviews)

Place CSV files in the `data/` directory.

**3. Run notebooks in order**

```
01_eda.ipynb                 -> Statistical analysis & visualization
02_sentiment_analysis.ipynb  -> DistilBERT sentiment pipeline (generates parquet)
03_recommendations.ipynb     -> Hybrid recommendation engine
04_predictive_modeling.ipynb  -> Predictive models & evaluation
```

---

## Methodology

### Notebook 1: Exploratory Data Analysis

Statistical profiling of 8,494 products and 1M+ reviews. Includes price distributions by brand, rating-price correlation analysis, network visualization of loved products, and temporal review patterns. Uncovered the r=0.083 price-quality disconnect and 5.3x post-2020 engagement surge.

### Notebook 2: Sentiment Analysis

Transformer-based NLP pipeline using DistilBERT (`distilbert-base-uncased-finetuned-sst-2-english`) to classify review sentiment. Processes reviews in GPU-accelerated batches, applies optimal confidence thresholds, and generates topic models via BERTopic. Identifies complaint categories: texture/consistency (21.9%), skin reactions (20.0%), ineffective results (14.8%).

### Notebook 3: Recommendation System

Hybrid recommendation engine combining:
- **Content-based filtering**: TF-IDF vectorization of 5,000 ingredient terms + cosine similarity on category/brand/price features
- **Collaborative filtering**: SVD decomposition (50 latent factors) of a 105K-user x 2.1K-product interaction matrix
- **Cold-start handling**: Falls back to content-based for new users

Key learning: 99.7% matrix sparsity made pure collaborative filtering ineffective (SVD explained only 30% of variance). Content-based methods proved more reliable for this dataset's density profile.

### Notebook 4: Predictive Modeling

Three supervised models with GridSearchCV tuning:

| Model | Task | Algorithm | Key Metric |
|-------|------|-----------|------------|
| Product Success | Binary classification (rating >= 4.3 & reviews >= 100) | XGBoost | 0.69 ROC-AUC |
| Review Helpfulness | Binary classification (positive feedback >= 5) | Gradient Boosting | 0.71 ROC-AUC |
| Price Prediction | Regression on price_usd | XGBoost Regressor | 0.58 R-squared |

All models use 80/20 stratified splits, 5-fold CV, and StandardScaler preprocessing.

---

## Results

### Model Performance

| Model | Accuracy | Precision | Recall | F1 | ROC-AUC | RMSE | MAE | R-squared |
|-------|----------|-----------|--------|----|---------|------|-----|-----------|
| Product Success (XGBoost) | 64.5% | 41.7% | 63.3% | 0.50 | **0.69** | - | - | - |
| Review Helpfulness (GB) | 72.6% | 31.4% | 52.9% | 0.39 | **0.71** | - | - | - |
| Price Prediction (XGBoost) | - | - | - | - | - | $30.86 | $17.71 | **0.58** |

### Top Predictive Features

**Product Success** - Price ($) and brand popularity dominate, followed by ingredient transparency and skincare category.

**Review Helpfulness** - Star rating (33.6%) and review length (30.5%) are the strongest signals, followed by sentiment polarity.

**Price Prediction** - Brand average price alone carries 85.5% importance, confirming that brand positioning is the primary pricing driver.

### Visualizations

<details>
<summary>Click to see sample outputs</summary>

Visualizations are saved in `outputs/figures/` and include:

- `01_price_distribution_by_brand.png` - Price ranges across top brands
- `02_rating_price_correlation.png` - The r=0.083 disconnect
- `06_sentiment_by_brand.png` - Brand-level sentiment comparison
- `11_topic_modeling.png` - BERTopic cluster visualization
- `15_controversial_products.png` - Most polarizing products
- `17_product_success_models.png` - ROC curves for all classifiers
- `18_feature_importance.png` - Side-by-side feature importance (LR, RF, XGB)
- `20_price_optimization.png` - Actual vs predicted pricing with residuals

See all 20 visualizations in [`outputs/figures/`](outputs/figures/).

</details>

---

## Business Recommendations

1. **Reprice mini/travel sizes upward** - Analysis shows these SKUs are systematically underpriced relative to their category peers. A 20-30% adjustment aligns with the model's predicted optimal pricing.

2. **Focus marketing spend on the $40-80 tier** - This mid-range bracket shows the best quality-to-price ratio. Products here are most likely to clear the "successful" threshold (rating >= 4.3, reviews >= 100).

3. **Restructure product discovery around categories** - 90% of user behavior is category-first. Surfacing brand within category pages (rather than brand-first navigation) matches how customers actually shop.

4. **Audit device/tool product quality** - 40%+ negative sentiment rate is an outlier. Top complaints are texture/consistency and skin reactions. These products need QA intervention or clearer usage guidance.

5. **Surface detailed, extreme-rated reviews** - The helpfulness model shows that star rating (34%) and review length (31%) most predict helpfulness votes. Promoting longer reviews with 1-star or 5-star ratings gives customers the most decision-useful content.

---

## Technical Deep Dives

| Notebook | Focus | Key Technique |
|----------|-------|---------------|
| [`01_eda.ipynb`](notebooks/01_eda.ipynb) | Statistical profiling, correlation analysis, temporal trends | Network graphs, distribution analysis, Pearson correlation |
| [`02_sentiment_analysis.ipynb`](notebooks/02_sentiment_analysis.ipynb) | NLP pipeline, topic modeling, complaint taxonomy | DistilBERT, BERTopic, TF-IDF comparison |
| [`03_recommendations.ipynb`](notebooks/03_recommendations.ipynb) | Hybrid recommendation engine, cold-start handling | SVD factorization, cosine similarity, TF-IDF |
| [`04_predictive_modeling.ipynb`](notebooks/04_predictive_modeling.ipynb) | Classification, regression, feature importance | XGBoost, Random Forest, GridSearchCV |

Code patterns used throughout: modular functions, reproducible seeds (`random_state=42`), proper train/test separation, cross-validation, and saved model artifacts.

---

## Future Enhancements

- **Interactive dashboard**: Deploy a Streamlit app for real-time product exploration and recommendation demos
- **A/B test recommendations**: Evaluate hybrid vs content-only recommendations with simulated user sessions
- **Neural collaborative filtering**: Address 99.7% sparsity with deep learning embeddings (PyTorch)
- **Real-time sentiment monitoring**: Stream new reviews through the DistilBERT pipeline for trend alerts
- **Image analysis**: Incorporate product image features using CNNs for visual similarity recommendations

---

## About

Built by **Nischala Nagisetty** as a portfolio project.

Open to **Data Scientist / ML Engineer / Analytics** opportunities.

[LinkedIn](https://www.linkedin.com/in/nischala-nagisetty) | [Email](mailto:nischalanagisetty@gmail.com)

---

If you found this project useful, consider giving it a star.
