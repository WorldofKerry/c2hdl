import os
import openai

openai.api_key = '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'

response = openai.Completion.create(
  model="text-davinci-003",
  prompt="cx = 100;\ncy = 150;\nr = 50;\nx = cx - r;\ny = cy - r;\n\nfor (x = cx - r; x <= cx + r; x++)\n{\n    for (y = cy - r; y <= cy + r; y++)\n    {\n        if ((x - cx) * (x - cx) + (y - cy) * (y - cy) <= r * r)\n        {\n            plot = 1;\n        }\n    }\n}\n\nRewrite this C code using a single `while(true)` and multiple `if(condition) { ... }` and `if(!condition) { ... }` statements",
  temperature=0.7,
  max_tokens=256,
  top_p=1,
  frequency_penalty=0,
  presence_penalty=0
)

print(response.choices[0].text)