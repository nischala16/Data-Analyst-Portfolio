# Nischala Nagisetty

Data professional specializing in statistical analysis, machine learning systems, and scalable data pipelines. I build analytics infrastructure that translates complex datasets into measurable business outcomes.

Currently open to roles data science and analytics.

---

## Projects

### Sephora Beauty Analytics
**End-to-end ML pipeline analyzing 1M+ product reviews**

Built transformer-based sentiment classifier, hybrid recommendation engine, and predictive models to identify pricing strategies and user behavior patterns across 8,494 products.

**Key findings:**
- Brand positioning explains 85% of pricing variance while price-quality correlation is near zero (r=0.083)
- 90% of users follow category-first navigation patterns, contradicting existing brand-first merchandising approach
- Travel-size products systematically underpriced by 20-30% relative to category benchmarks
- Device/tool category shows 40%+ negative sentiment, flagging quality control gaps

**Technical approach:**
- Sentiment classification with DistilBERT (87.7% high-confidence predictions)
- Hybrid recommendation system combining SVD collaborative filtering with TF-IDF content similarity
- Three supervised models: product success classification (0.69 AUC), review helpfulness prediction (0.71 AUC), price regression (R²=0.58)
- Handled 99.7% sparse user-item matrix with 105K users and 8.5K products

**Stack:** Python, HuggingFace Transformers, XGBoost, BERTopic, scikit-learn, pandas

[View project](https://github.com/nischala16/sephora-beauty-analytics)

---

### Spotify Streaming Analytics
**Statistical analysis of audio features and popularity patterns across 114K tracks**

Rigorous exploratory analysis using correlation testing, ANOVA, clustering, and hypothesis testing to understand what drives song popularity and inform playlist optimization strategies.

**Key findings:**
- Feature combinations matter more than individual metrics: tracks with danceability >0.7 AND energy >0.7 achieve 2.35x higher popularity despite representing only 0.66% of the catalog (750 tracks, 77.7 vs 33.3 avg popularity)
- Genre explains 100%+ variance in popularity (emo 48.1 vs reggaeton 23.9), far exceeding individual audio feature correlations (all r<0.10)
- Challenges assumption that sonic quality predicts success: strongest individual predictor (instrumentalness) shows r=-0.095 correlation
- Explicit content demonstrates 10.6% popularity lift, though effect likely confounded by genre preferences

**Technical approach:**
- Pearson correlation analysis across 9 audio features
- One-way ANOVA comparing distributions across genres (F-statistics 132-373, p<0.001)
- 2D clustering to identify high-performing feature combinations
- Welch's t-tests and chi-square tests for group comparisons

**Stack:** Python, pandas, NumPy, scipy, matplotlib, seaborn

[View project](https://github.com/nischala16/spotify-streaming-analytics)

---

## Technical Skills

**Languages & Analysis**  
Python (pandas, NumPy, scikit-learn), SQL (Snowflake, PostgreSQL), R (dplyr, ggplot2)

**Machine Learning**  
Supervised learning (XGBoost, LightGBM, Random Forest), NLP (transformers, BERT, topic modeling), recommendation systems (collaborative filtering, content-based), model evaluation and validation

**Data Engineering**  
ETL pipelines (dbt, Apache Airflow), cloud platforms (AWS Lambda), workflow orchestration, data modeling

**Statistical Methods**  
Hypothesis testing, regression analysis, ANOVA, experimental design, A/B testing, correlation analysis

**Visualization & BI**  
Tableau, matplotlib, seaborn, dashboard design, executive reporting

---

## Approach

I focus on translating analytical findings into specific business recommendations backed by statistical evidence. My work emphasizes:

- Rigorous hypothesis testing and proper statistical methodology
- Feature engineering and dimensionality reduction for complex datasets
- Model interpretability and explaining results to non-technical stakeholders
- Identifying confounding variables and avoiding spurious correlations
- Balancing model performance with production constraints

---

## Contact

[LinkedIn](https://linkedin.com/in/nischala-nagisetty) • [GitHub](https://github.com/nischala16) • nischalanagisetty@gmail.com
