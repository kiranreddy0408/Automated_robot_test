import os
import openai



openai.api_key= "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"

res = openai.File.create(file=open(r"C:\Users\91918\OneDrive\Desktop\new\search.jsonl"), purpose="answers")
print(res)