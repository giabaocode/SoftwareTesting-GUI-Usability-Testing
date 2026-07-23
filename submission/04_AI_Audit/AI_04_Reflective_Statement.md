# [AI-04] Reflective Statement

**Group 03 - T01 GUI & Usability Testing**  
**Responsible: All four members**  
**Target length: approximately 300 words**

Our most useful lesson was that AI becomes valuable in testing only when its role is sharply defined. It worked well for organizing research, proposing checklists, turning a vague study idea into a repeatable sequence, and reminding us to record limitations. The prompt that treated Claude Vision as a “hypothesis generator” was especially effective because it required a location, heuristic, missing evidence, and verification step for every suggestion. That structure makes an AI response easier to audit than a general request to “find all UI problems.”

What did not work was allowing generic e-commerce assumptions to enter SUT-specific documentation. Early drafts described address and payment controls as though they were already verified in EShop. The available repository evidence later showed only the cart, coupon, amount, and confirmation path. This mismatch demonstrated how confidently written AI text can hide an unsupported assumption. We corrected it by narrowing the final guide to observed states and asking participants to notice whether an address-confirmation step exists.

The project also exposed a process weakness: evidence was spread across branches, weekly reports, screenshots, and AI logs. A polished guide existed before a completed Maze result set existed, so examples and placeholders could easily be mistaken for findings. We learned to label setup evidence, participant evidence, and verified defects separately. We also avoided reporting success rates, misclick rates, AI accuracy, or audience feedback that the repository could not support.

In future work, we would define an evidence schema before testing, assign one owner for each artifact, merge completed work earlier, and pilot the Maze study before writing result sections. We would also preserve exact prompts and model versions at the time of use. Our final position is that AI can widen the search space and improve documentation speed, but humans must remain accountable for context, reproduction, severity, and every public claim.

