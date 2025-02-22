# playing with chatGPT in R

library(openai)

create_chat_completion(
  model = "o1-preview",
  messages = list(
    list(role = "system", content = "You are an expert product copywriter specializing in SEO-optimized e-commerce descriptions."),
    list(role = "user", content = paste0(
      "Write an SEO-optimized product description for Slingshot LTF V2. ",
      "Use the following example for inspiration: <p class=\"MsoNormal\">The LTF or “Learn to Fly” is the first inflatable foil board that was designed to progress with you. Learn to fly the wing without the distraction of the foil by attaching the FCS II fins and sUP WINDer Keel. Once this is mastered, replace the fins and sUP WINDer with a foil to get your first feeling of flight. Want to take a break from the wind? This board triples as a SUP board. No matter the conditions, the LTF is guaranteed on the water fun for the whole family.</p>\n<!---->. ",
      "Make it compelling, detailed, and optimized for search engines."
    ))
  ),
  temperature = 0.7
)