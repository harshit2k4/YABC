/// Content for the Analysis Page, keyed by BMI Status string.
/// Each status contains a "summary" (Line 2) and a "quote" (Line 3).
///
/// Note: This content is for informational purposes only, not for medical diagnosis.
const Map<String, Map<String, String>> bmiAnalysisContent = {
  "Underweight": {
    "summary":
        "Your BMI suggests you are under the typical healthy range for your height. "
        "This could be a good opportunity to focus on strengthening your body through nutrient-rich, calorie-dense foods, and gentle resistance training. "
        "Over time, building muscle and maintaining a regular eating schedule may support a healthier, more balanced weight. "
        "Remember, BMI is only one measure — factors like muscle mass, lifestyle, and other health indicators also matter.",
    "quote": "“Be gentle with yourself. You are doing the best you can.”",
  },

  "Normal": {
    "summary":
        "You are within the BMI range considered healthy for most adults. "
        "This is a strong foundation — you may choose to continue your balanced diet and regular physical activity to sustain this. "
        "It’s worth noting that BMI is a screening tool, not a complete health evaluation: body composition, waist circumference, and habits like sleep and stress also influence well-being.",
    "quote":
        "“To keep the body in good health is a duty... otherwise we shall not be able to keep our mind strong and clear.”",
  },

  "Overweight": {
    "summary":
        "Your BMI falls into the ‘Overweight’ category, which can indicate an increased risk of certain health concerns over time. "
        "Small, consistent changes — such as moderating processed foods, increasing whole foods, and adding moderate physical activity — are often effective. "
        "Adopting a sustainable routine with realistic goals may help you gradually move toward a healthier balance. "
        "Keep in mind: BMI does not tell the full story; factors like fat distribution and fitness level also play a role.",
    "quote": "“A journey of a thousand miles begins with a single step.”",
  },

  "Obese": {
    "summary":
        "A higher BMI can point toward a greater likelihood of long-term health challenges if not addressed. "
        "Considering a structured, balanced plan — combining nutrient-rich foods, regular exercise, and lifestyle adjustments — may be beneficial. "
        "Because BMI alone does not capture everything (e.g., where fat is stored, or how active you are), you might think about tracking other indicators too. "
        "If you decide to make significant changes, consulting with a trusted health or wellness professional can offer personalized support.",
    "quote": "“The time to repair the roof is when the sun is shining.”",
  },

  "Extreme Obese": {
    "summary":
        "Your BMI suggests a level of excess weight that could significantly increase the risk of health complications over time. "
        "A thoughtful, long-term approach may be most helpful — combining gradual changes in nutrition, consistent physical activity, and sustainable habits. "
        "Because BMI has limitations, you might also explore additional measures (such as waist circumference or body composition) to get a fuller picture of health. "
        "Consider seeking guidance from a qualified professional to develop a safe and realistic plan tailored to your individual goals and needs.",
    "quote": "“The journey of a thousand miles begins with a single step.”",
  },
};
