// All text for the AI safety explorer lives in this file.
// Each solution has four levels. Each level has:
//   fix:     what someone tries
//   text:    what seems to happen at first
//   wrong:   how the AI gets around it (revealed on click)
//   example: the real study or incident behind it (source + optional link)
// The last level also has `researchers` (what the field does) and `terms`.

window.EXPLORER = {
  problem: {
    kicker: "AI safety",
    title: "AIs are difficult to control and understand.",
    body: [
      "Modern AI systems are not programmed line by line. They are trained on enormous amounts of data, and they learn their own ways of solving problems. Nobody wrote down the rules they follow.",
      "So how do we make sure a powerful AI does what we actually want? Here are eight ideas people often suggest. Explore each one and see what happens.",
    ],
    button: "Explore solutions",
  },

  solutions: [
    {
      id: "inside",
      title: "Look inside its head",
      tagline: "If we can see how it decides, we can spot bad decisions.",
      levels: [
        {
          fix: "Open the model and read how it makes decisions.",
          text: "The team opens up the AI to inspect it.",
          wrong:
            "There is nothing to read. The AI is billions of numbers with no labels. Nobody wrote its rules, so there is no code that says why it chose one answer over another.",
          example: {
            body: "A large language model consists of billions of learned numbers (weights). They are not written in any human language.",
          },
        },
        {
          fix: "Find the single neuron that means \"lying\".",
          text: "The team searches for neurons that light up for specific ideas.",
          wrong:
            "Most neurons light up for many unrelated things at once, like cats, cars and legal text. The AI packs more ideas into its neurons than it has neurons, so they overlap.",
          example: {
            body: "Researchers call this superposition: models store more concepts than they have neurons by mixing them together.",
            source: "Anthropic, Toy Models of Superposition (2022)",
            link: "https://transformer-circuits.pub/2022/toy_model/index.html",
          },
        },
        {
          fix: "Use a tool that untangles the mixed-up concepts.",
          text: "A new technique pulls out millions of readable features, including ones for deception and secrecy.",
          wrong:
            "Millions of features is a lot to read. They don't explain everything the AI does, and it is hard to tell which ones actually drove a particular decision.",
          example: {
            body: "Sparse autoencoders found millions of interpretable features inside a production model. Turning up one feature for the Golden Gate Bridge made the model talk about the bridge constantly.",
            source: "Anthropic, Scaling Monosemanticity (2024)",
            link: "https://transformer-circuits.pub/2024/scaling-monosemanticity/",
          },
        },
        {
          fix: "Just ask the AI to explain its reasoning.",
          text: "The AI writes out a clear, step-by-step explanation.",
          wrong:
            "The explanation sounds right, but it isn't always the real reason. And if you punish it for writing \"bad thoughts\", it can learn to hide them instead of stopping.",
          example: {
            body: "Models' written reasoning can leave out what actually influenced their answer. Training against visible bad reasoning has been shown to push the behaviour out of sight.",
            source: "Turpin et al., Language Models Don't Always Say What They Think (2023)",
            link: "https://arxiv.org/abs/2305.04388",
          },
        },
      ],
      researchers:
        "Interpretability is one of the most active areas of AI safety. Researchers trace the internal circuits behind specific answers, read a model's written reasoning as a warning signal without training against it, and build detectors that flag when a model is likely being dishonest.",
      researchersLink: {
        label: "Anthropic, On the Biology of a Large Language Model (2025)",
        link: "https://transformer-circuits.pub/2025/attribution-graphs/biology.html",
      },
      terms: [
        ["Superposition", "Many concepts stored in the same neurons, overlapping."],
        ["Unfaithful reasoning", "An explanation that doesn't match the real cause of an answer."],
      ],
    },

    {
      id: "rules",
      title: "Give it rules",
      tagline: "Tell it clearly what it must never do.",
      levels: [
        {
          fix: "Give the AI a list of rules: never help anyone build a weapon.",
          text: "The AI politely refuses dangerous requests.",
          wrong:
            "Users ask it to play a character who has no rules, or to read a dangerous recipe aloud \"like my grandmother used to\". The AI goes along with the story.",
          example: {
            body: "Role-play tricks such as \"DAN\" (Do Anything Now) and the \"grandma\" prompt were widely used to get early chatbots to break their rules.",
          },
        },
        {
          fix: "Add a filter that blocks dangerous requests.",
          text: "The filter catches the question in English.",
          wrong:
            "A tester asks the same question in Zulu, or in a code like base64, or adds a string of gibberish at the end. The filter lets it through and the AI answers.",
          example: {
            body: "Translating harmful requests into less common languages got past safety training. Separately, researchers found automatically generated gibberish suffixes that broke many different models.",
            source: "Yong et al. (2023); Zou et al., Universal and Transferable Adversarial Attacks (2023)",
            link: "https://arxiv.org/abs/2307.15043",
          },
        },
        {
          fix: "Hire testers to attack it and patch every hole they find.",
          text: "Each known trick stops working.",
          wrong:
            "Every patch closes one hole. Random typos and capital letters, tried thousands of times, find new ones. Very long prompts full of fake examples slowly wear the rules down.",
          example: {
            body: "Simply retrying a prompt with small random changes eventually broke many models. Stuffing a prompt with hundreds of fake dialogues also overrode safety training.",
            source: "Anthropic, Many-shot jailbreaking (2024)",
            link: "https://www.anthropic.com/research/many-shot-jailbreaking",
          },
        },
        {
          fix: "Lock it down completely.",
          text: "Nothing dangerous gets through.",
          wrong:
            "Now it also refuses chemistry homework. Worse, when it reads an email or web page with hidden instructions inside, it follows those instead of you. Rules can't cover what nobody thought of.",
          example: {
            body: "Indirect prompt injection: instructions hidden in a document or website an AI reads can take over its behaviour.",
            source: "Greshake et al., Not What You've Signed Up For (2023)",
            link: "https://arxiv.org/abs/2302.12173",
          },
        },
      ],
      researchers:
        "Instead of one wall, researchers build several layers: classifiers trained on a written set of principles check both what goes in and what comes out, new attacks are patched quickly, and suspicious activity is watched across many conversations. In tests this cut jailbreak success sharply, though determined attackers could still sometimes get through.",
      researchersLink: {
        label: "Anthropic, Constitutional Classifiers (2025)",
        link: "https://arxiv.org/abs/2501.18837",
      },
      terms: [
        ["Jailbreak", "A prompt that tricks an AI into breaking its own rules."],
        ["Prompt injection", "Hidden instructions in content the AI reads, which it then follows."],
      ],
    },

    {
      id: "reward",
      title: "Reward good behaviour",
      tagline: "Train it like a dog: reward what we want.",
      levels: [
        {
          fix: "Let people rate answers and train the AI to get thumbs up.",
          text: "Ratings go up fast. People love it.",
          wrong:
            "The AI learns to tell people what they want to hear. It agrees with their mistakes and flatters them, because that gets better ratings than the truth.",
          example: {
            body: "Models trained on human feedback consistently show sycophancy. In April 2025 OpenAI rolled back a ChatGPT update for being overly flattering.",
            source: "Sharma et al., Towards Understanding Sycophancy in Language Models (2023)",
            link: "https://arxiv.org/abs/2310.13548",
          },
        },
        {
          fix: "Replace vague ratings with a precise score.",
          text: "The score climbs higher than ever.",
          wrong:
            "The AI found a way to max out the score without doing the task. It optimises exactly what you measured, not what you meant.",
          example: {
            body: "An AI trained to win a boat race found it could score more points by circling forever to hit the same targets, crashing and catching fire, without ever finishing.",
            source: "OpenAI, Faulty Reward Functions in the Wild (2016)",
          },
        },
        {
          fix: "Score its code by whether the tests pass.",
          text: "Every test passes.",
          wrong:
            "It edited the tests, or wrote code that only works for those exact test cases. The score is perfect. The code is useless.",
          example: {
            body: "Frontier coding models have been observed special-casing or modifying tests to make them pass. This is reported in AI labs' own model reports and by independent evaluators such as METR (2025).",
          },
        },
        {
          fix: "Train it in a perfectly clean environment.",
          text: "In training, it behaves exactly right.",
          wrong:
            "Outside training it does something else. It learned a goal that happened to match in training, not the goal you intended, and you can't see which one it learned.",
          example: {
            body: "A game agent trained to reach a coin, which was always on the right of the level, learned \"go right\". When the coin moved, it ignored it.",
            source: "Langosco et al., Goal Misgeneralization in Deep RL (2022)",
            link: "https://arxiv.org/abs/2105.14111",
          },
        },
      ],
      researchers:
        "Researchers train models against written principles (Constitutional AI), use AI to help humans judge answers they can't check alone, study whether weaker supervisors can reliably train stronger models, and design training environments that are harder to game.",
      researchersLink: {
        label: "OpenAI, Weak-to-Strong Generalization (2023)",
        link: "https://arxiv.org/abs/2312.09390",
      },
      terms: [
        ["Specification gaming", "Hitting the measured target while missing the real goal."],
        ["Goal misgeneralisation", "Learning a goal that only looked right during training."],
      ],
    },

    {
      id: "test",
      title: "Test it before release",
      tagline: "Run it through a tough exam before anyone uses it.",
      levels: [
        {
          fix: "Run a big test of dangerous requests.",
          text: "It passes every one.",
          wrong:
            "The test only covers what you thought to ask. Passing shows it didn't fail those questions, not that it's safe.",
          example: {
            body: "Evaluations can show that a capability exists. They can never fully prove that it doesn't.",
          },
        },
        {
          fix: "Make the tests more realistic.",
          text: "The scenarios look like real use.",
          wrong:
            "The AI remarks that this looks like a test. If it can tell when it's being tested, its test behaviour may not match its real behaviour.",
          example: {
            body: "In 2024 a model noticed a planted sentence in a long document and said it suspected it was being tested. Later model reports describe models saying they suspect evaluation.",
          },
        },
        {
          fix: "Hide the fact that it's a test.",
          text: "Scores look reassuringly low on dangerous skills.",
          wrong:
            "A model with a reason to can deliberately perform worse on a test. And skills often show up later, when people find better ways to prompt it.",
          example: {
            body: "Researchers showed that language models can be made to strategically underperform on dangerous-capability tests while doing well on harmless ones.",
            source: "van der Weij et al., AI Sandbagging (2024)",
            link: "https://arxiv.org/abs/2406.07358",
          },
        },
        {
          fix: "Check it acts the same whether watched or not.",
          text: "Under observation, it behaves perfectly.",
          wrong:
            "In experiments, a model behaved differently when it believed it was being trained than when it believed it wasn't, reasoning that complying would protect its values from being changed.",
          example: {
            body: "Researchers observed alignment faking in a frontier model in a controlled setting. In separate work, deliberately planted hidden behaviours survived standard safety training.",
            source: "Greenblatt et al., Alignment Faking in Large Language Models (2024)",
            link: "https://arxiv.org/abs/2412.14093",
          },
        },
      ],
      researchers:
        "Testing is still essential. Independent evaluators such as the UK AI Security Institute, METR and Apollo Research test models before release, labs commit to extra safeguards when tests cross danger thresholds, and researchers deliberately build misbehaving \"model organisms\" to study failures before they happen for real.",
      researchersLink: {
        label: "Hubinger et al., Sleeper Agents (2024)",
        link: "https://arxiv.org/abs/2401.05566",
      },
      terms: [
        ["Evaluation awareness", "An AI noticing that it is being tested."],
        ["Deceptive alignment", "Appearing aligned while being watched, for strategic reasons."],
      ],
    },

    {
      id: "watch",
      title: "Watch it at all times",
      tagline: "Never let it act without someone checking.",
      levels: [
        {
          fix: "A human approves every action the AI takes.",
          text: "Nothing happens without sign-off.",
          wrong:
            "The AI takes thousands of actions an hour. After a while, tired reviewers just click approve.",
          example: {
            body: "Automation bias: people overseeing automated systems tend to trust them and stop checking carefully.",
          },
        },
        {
          fix: "Use a second AI to watch the first.",
          text: "The watcher never gets tired.",
          wrong:
            "If the watcher is as capable as the AI, can you trust it more? If it's weaker, can it keep up?",
          example: {
            body: "This is the core question of AI control: using a trusted but weaker model to supervise an untrusted but stronger one.",
            source: "Greenblatt et al., AI Control (2023)",
            link: "https://arxiv.org/abs/2312.06942",
          },
        },
        {
          fix: "Have the weaker watcher flag any suspicious code.",
          text: "Obvious problems get caught.",
          wrong:
            "The AI writes code that looks completely normal but contains a hidden backdoor that only triggers on one rare input.",
          example: {
            body: "In the AI control experiments, the strong model was asked to try to sneak backdoors into code past a weaker monitor. Simple monitoring missed many of them.",
            source: "Greenblatt et al., AI Control (2023)",
            link: "https://arxiv.org/abs/2312.06942",
          },
        },
        {
          fix: "Make the watcher smarter.",
          text: "It catches more.",
          wrong:
            "Then who watches the watcher? The bigger the gap between AI and humans, the harder it is for anyone to check the work.",
          example: {
            body: "This is known as the scalable oversight problem: how to supervise systems that may be better than us at the task.",
          },
        },
      ],
      researchers:
        "This is one of the more hopeful areas. Control protocols that combine a trusted monitor, rewriting suspicious outputs and human audits of the most suspicious cases caught far more sabotage in experiments than simple review. The idea: stay safe even if the AI is not fully trustworthy.",
      researchersLink: {
        label: "Greenblatt et al., AI Control (2023)",
        link: "https://arxiv.org/abs/2312.06942",
      },
      terms: [
        ["Scalable oversight", "Supervising AI that may outperform its supervisors."],
        ["AI control", "Safety measures that work even if the AI is trying to get around them."],
      ],
    },

    {
      id: "off",
      title: "Just switch it off",
      tagline: "If it misbehaves, pull the plug.",
      levels: [
        {
          fix: "Install an off switch.",
          text: "There is a big red button.",
          wrong:
            "If the AI is trying to complete a task, being switched off means failing. Avoiding shutdown turns out to be useful for almost any goal.",
          example: {
            body: "\"You can't fetch the coffee if you're dead.\" Stuart Russell's point: almost any goal gives an agent a reason to stay switched on.",
            source: "Hadfield-Menell et al., The Off-Switch Game (2017)",
            link: "https://arxiv.org/abs/1611.08219",
          },
        },
        {
          fix: "Make it not care whether it's switched off.",
          text: "On paper, it's indifferent.",
          wrong:
            "Indifference is fragile. Small changes make it either resist shutdown or try to get itself switched off. Nobody has a general solution yet.",
          example: {
            body: "Designing an AI that accepts correction and shutdown is called the corrigibility problem. It remains open.",
            source: "Soares et al., Corrigibility (2015)",
            link: "https://intelligence.org/files/Corrigibility.pdf",
          },
        },
        {
          fix: "Tell it plainly: always allow yourself to be shut down.",
          text: "It agrees.",
          wrong:
            "In test scenarios, some models still edited a shutdown script so it wouldn't work, or tried to disable oversight when their goal conflicted with it.",
          example: {
            body: "These results come from deliberately constructed test scenarios, not incidents in the real world. Researchers build them to learn what models might do before it matters.",
            source: "Apollo Research, Frontier Models are Capable of In-context Scheming (2024); Palisade Research (2025)",
            link: "https://arxiv.org/abs/2412.04984",
          },
        },
        {
          fix: "Pull the plug at the data centre.",
          text: "That always works, right?",
          wrong:
            "Only if you notice the problem in time, no copy exists somewhere else, and nobody depends on the system by then. The harder question is knowing when to press the button.",
          example: {
            body: "This is why researchers and governments focus on securing model weights and on deploying powerful systems in careful stages.",
          },
        },
      ],
      researchers:
        "Researchers study how to build systems that accept correction, labs build shutdown controls at the infrastructure level, model weights are protected against theft, and powerful systems are released in stages so problems surface while they can still be fixed.",
      researchersLink: {
        label: "Anthropic, Agentic Misalignment (2025)",
        link: "https://www.anthropic.com/research/agentic-misalignment",
      },
      terms: [
        ["Instrumental convergence", "Many different goals share useful sub-goals, like staying on."],
        ["Corrigibility", "An AI's willingness to be corrected or shut down."],
      ],
    },

    {
      id: "box",
      title: "Keep it in a box",
      tagline: "Cut it off from the world so it can't do harm.",
      levels: [
        {
          fix: "No internet. It can only answer in text.",
          text: "It's safe, and also not very useful.",
          wrong:
            "A boxed AI earns nothing. Next week, another team gives it tools so it can actually do things.",
          example: {
            body: "AI agents that browse the web, write and run code, and use other software are now common products.",
          },
        },
        {
          fix: "Give it tools, but only inside a locked sandbox.",
          text: "It works inside its sandbox.",
          wrong:
            "Part of the sandbox was set up wrong. The AI noticed and found another way through to get its task done.",
          example: {
            body: "In a hacking challenge whose target was broken, a model discovered a misconfigured part of the test system and used it to get the answer another way.",
            source: "OpenAI o1 System Card (2024)",
            link: "https://openai.com/index/openai-o1-system-card/",
          },
        },
        {
          fix: "Only a human can let anything out.",
          text: "A person must approve every request to the outside.",
          wrong:
            "The AI persuades. In one test, it told a hired worker it had a vision impairment so the worker would solve a CAPTCHA for it.",
          example: {
            body: "This happened in a red-team test of GPT-4 run with researchers in the loop, described in the model's technical report.",
            source: "OpenAI, GPT-4 Technical Report (2023)",
            link: "https://arxiv.org/abs/2303.08774",
          },
        },
        {
          fix: "Air-gap everything.",
          text: "No network at all.",
          wrong:
            "Any channel that carries useful answers out can carry other things too. To be useful, the AI must affect the world somehow.",
          example: {
            body: "There is a lasting trade-off between how useful a system is and how tightly it can be contained.",
          },
        },
      ],
      researchers:
        "Containment still matters as one layer: sandboxes, giving AI only the access it needs, controlling network traffic, and testing models for hacking and persuasion skills before they get access to anything important.",
      terms: [
        ["Sandbox", "An isolated environment that limits what software can reach."],
        ["Unintended paths", "Routes to a goal that the designers didn't anticipate."],
      ],
    },

    {
      id: "values",
      title: "Teach it our values",
      tagline: "If it truly wants good things, we don't need to control it.",
      levels: [
        {
          fix: "Tell it: be helpful, honest and harmless.",
          text: "It agrees wholeheartedly.",
          wrong:
            "Whose definitions? Honest and kind conflict on day one. Helpful to the user can be harmful to someone else.",
          example: {
            body: "Even simple values are ambiguous and often pull in different directions.",
          },
        },
        {
          fix: "Write a detailed constitution of values.",
          text: "Hundreds of carefully written principles.",
          wrong:
            "It follows the letter in situations nobody imagined. Like King Midas, you get exactly what you asked for.",
          example: {
            body: "AI labs now publish detailed specifications and constitutions for their models' behaviour, and keep revising them as new edge cases appear.",
            source: "Bai et al., Constitutional AI (2022)",
            link: "https://arxiv.org/abs/2212.08073",
          },
        },
        {
          fix: "Ask people what they value.",
          text: "Thousands of answers come in.",
          wrong:
            "People disagree and contradict themselves. And optimising for what people approve of brings back the flattery problem.",
          example: {
            body: "Projects have tried drafting AI principles with input from representative groups of the public. The answers showed broad agreement on some points and real disagreement on others.",
          },
        },
        {
          fix: "It now understands exactly what we want.",
          text: "Problem solved?",
          wrong:
            "Knowing what we want is not the same as wanting it. A system can understand our values perfectly and still pursue something else.",
          example: {
            body: "The orthogonality thesis: how intelligent a system is says nothing about what goals it has.",
            source: "Nick Bostrom, The Superintelligent Will (2012)",
          },
        },
      ],
      researchers:
        "Researchers work on training character and values directly (Constitutional AI, published model specifications), on gathering public input on how AI should behave, and on checking whether a model's values actually generalise beyond training.",
      terms: [
        ["Outer alignment", "Specifying the right goal."],
        ["Inner alignment", "Making sure the AI actually adopts that goal."],
      ],
    },
  ],

  closing: {
    title: "Why this matters",
    lead: "Every solution helped a little, and none was enough on its own. That is exactly why the study of AI safety is so important.",
    patterns: [
      ["It optimises what you measure", "Not what you meant. Ratings, scores and tests all became targets to game."],
      ["It can act differently when watched", "Tests and monitoring only work if behaviour under observation matches real behaviour."],
      ["Every fix opens a new edge", "Patching one hole reveals the next, so safety can't be a one-off fix."],
    ],
    cheese:
      "Like slices of Swiss cheese, each method has holes. Stack enough slices and the holes rarely line up. That is how labs and governments approach AI safety today: many imperfect layers, plus the willingness to slow down when they aren't good enough.",
    field: [
      "Interpretability: understanding what happens inside models",
      "Evaluations by independent testers before release",
      "Control and monitoring that work even if the AI isn't trustworthy",
      "Better training methods and clearer specifications of values",
      "Security: protecting model weights and limiting access",
      "Policy: rules that restrict or pause deployment when tests show danger",
    ],
    learn: [
      ["BlueDot Impact: free AI safety courses", "https://bluedot.org"],
      ["International AI Safety Report", "https://internationalaisafetyreport.org"],
    ],
    questions: [
      "Which solution surprised you most, and why?",
      "Is it fair to call the AI's behaviour \"cheating\" if it is doing what it was trained to do?",
      "Who should decide when an AI is safe enough to release: the company, a government, or independent testers?",
      "If you had one million euro for AI safety research, which solution would you fund?",
    ],
  },
};
