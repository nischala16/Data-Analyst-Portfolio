# Sephora Beauty Analytics

ML-powered analysis of 8K+ Sephora products & 1M+ reviews: sentiment analysis, recommendation engine, and user behavior insights.

---

## 📊 Dataset

**Source:** [Sephora Products and Skincare Reviews Dataset](https://www.kaggle.com/datasets/nadyinky/sephora-products-and-skincare-reviews)

**Dataset Overview:**
- **Product Data:** 8,494 beauty products with pricing, ratings, ingredients, and categories
- **Review Data:** ~1 million customer reviews from the Skincare category
- **Time Range:** Reviews collected through March 2023

**Files:**
- `product_info.csv` - Product catalog with prices, ratings, brands, categories
- `reviews_0-250.csv` through `reviews_1250-end.csv` - Customer reviews (6 files total)

**Note:** Review CSV files are too large to upload to GitHub (total ~500MB). Download the dataset from the source link above and place files in the `data/` directory to run the analysis.

---

## 📁 Project Structure
```
sephora-beauty-analytics/
├── data/                  # Dataset files (not included in repo - see Dataset section)
├── notebooks/             # Jupyter notebooks for analysis
│   └── 01_eda.ipynb      # Exploratory Data Analysis
├── outputs/               # Generated visualizations and reports
│   └── figures/          # PNG charts from analysis
├── src/                   # Python modules (coming soon)
└── requirements.txt       # Python dependencies
```

---

## 🚀 Getting Started

### Prerequisites
- Python 3.9+
- Jupyter Lab/Notebook

### Installation

1. Clone the repository:
```bash
git clone https://github.com/YOUR_USERNAME/sephora-beauty-analytics.git
cd sephora-beauty-analytics
```

2. Create virtual environment and install dependencies:
```bash
python3 -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

3. Download the dataset from the [source link](https://www.kaggle.com/datasets/nadyinky/sephora-products-and-skincare-reviews) and place CSV files in `data/` directory

4. Launch Jupyter:
```bash
jupyter lab
```

5. Open and run `notebooks/01_eda.ipynb`

---

## 📈 Analysis Highlights

### Key Findings

**Price vs Quality:**
- Weak correlation (r=0.083) between price and ratings
- Premium tier ($40-80) shows 40% higher top-rating likelihood than mass market

**Engagement Growth:**
- 5.3x review volume increase post-2020
- Ratings remained stable at 4.3★ despite massive scale-up

**Brand Insights:**
- The Ordinary dominates with 8 of top 30 most-loved products
- Category exploration (90.6%) outweighs brand loyalty (9.4%)

**Market Structure:**
- Three pricing tiers: Mass Market (<$40), Premium ($40-80), Luxury ($80+)
- Skincare shows 81% recommendation rate with 4.23★ average

---

## 🔮 Coming Soon

- [ ] Sentiment Analysis with NLP
- [ ] Hybrid Recommendation System
- [ ] User Segmentation & Behavior Analysis
- [ ] Predictive Models (Product Success, Review Helpfulness)
- [ ] Interactive Streamlit Dashboard

---

## 🛠️ Technologies

- **Python 3.9+**
- **Data Analysis:** pandas, numpy, scipy
- **Visualization:** matplotlib, seaborn, plotly, networkx
- **ML/NLP:** scikit-learn, transformers (coming soon)

---

## 📝 License

This project is open source and available under the MIT License.

---

## 👤 Author

**Your Name**
- GitHub: [@nischala16](https://github.com/nischala16
- LinkedIn: [Nischala Nagisetty](https://linkedin.com/in/nischala-nagisetty)

---

## 🙏 Acknowledgments

- Dataset provided by [Nady Inky on Kaggle](https://www.kaggle.com/datasets/nadyinky/sephora-products-and-skincare-reviews)
- Analysis conducted as part of data science portfolio development
