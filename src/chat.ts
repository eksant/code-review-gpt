import { ChatGPTAPI } from "chatgpt";

export class Chat {
  private chatAPI: ChatGPTAPI;

  constructor(apikey: string) {
    this.chatAPI = new ChatGPTAPI({
      apiKey: apikey,
      completionParams: {
        model: process.env.OPENAI_API_MODEL || "gpt-3.5-turbo",
        temperature: +(process.env.OPENAI_API_TEMPERATURE || 0) || 1,
        top_p: +(process.env.OPENAI_API_TOP_P || 0) || 1,
      },
    });
  }

  private generatePrompt = (patch: string) => {
    const answerLanguage = process.env.OPENAI_API_LANGUAGE
      ? `Answer me in ${process.env.OPENAI_API_LANGUAGE},`
      : "";

    return `Bellow is the code patch, please help me do a brief code review, ${answerLanguage} if any bug risk and improvement suggestion are welcome
    ${patch}
    `;
  };

  public codeReview = async (patch: string) => {
    if (!patch) {
      return "";
    }

    console.time("code-review cost");
    const prompt = this.generatePrompt(patch);

    const res = await this.chatAPI.sendMessage(prompt);

    console.timeEnd("code-review cost");
    return res.text;
  };
}
