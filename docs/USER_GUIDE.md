# S.A.N.T.O. — User Guide

> **S.A.N.T.O.** is pronounced **"SANTO"**.
> Version 2.0.0 (Android 8.0+)

S.A.N.T.O. is a private, local-first AI assistant and autonomous Android agent. It can
talk with you, read your screen through the accessibility service, and operate apps on
your behalf. You choose which model provider it uses — including a fully offline
Ollama server — and nothing is sent anywhere except the model calls you configure.

---

## 1. Install and first run

1. Install the APK (`app-release.apk`) with your file manager or `adb install -r app-release.apk`.
2. Open S.A.N.T.O. The onboarding walkthrough appears on first launch.
3. Pick your AI provider (see [Choosing a provider](#3-choosing-an-ai-provider)) and paste an
   API key if the provider needs one.
4. Grant permissions when prompted. The **Permissions Hub** (Settings → App permissions)
   shows every permission with its current status and a shortcut to the Android setting.
5. Tap **Finish**. The app opens on the **Agent** tab.

> **Upgrading from the old JARVIS build?**
> Your settings, workflows, todos, notes and personality choice are migrated automatically
> on first launch. The old `jarvis_*` preference keys are copied to `santo_*` and removed.

---

## 2. The three modes

Use the liquid-glass mode switcher at the top of the home screen, or the switcher on the HUD.

| Mode | What it does | Device actions? |
|---|---|---|
| **Agent** | Observe → Think → Act automation of any app using the accessibility service. | Yes |
| **Chat** | Streaming, markdown-aware conversation. No screen access, no tapping. | No |
| **S.A.N.T.O.** | Hands-free voice + the animated Arc Reactor / hologram HUD. | Yes |

### Agent mode

Type or dictate a goal, for example *"Open YouTube and play Interstellar soundtrack"* or
*"Install WhatsApp"*. The executor:

1. Reads the visible UI tree (labels, widget classes, centres, flags).
2. Asks the model for exactly one JSON action per step.
3. Performs the action through Android accessibility gestures.
4. Repeats until the goal is complete, the step limit is reached, or you press stop.

The transcript shows every step with its reasoning. You can pause, resume and cancel a
running task from the active-task bar. **Agent mode requires the accessibility service.**

### Chat mode

A safe sandbox for questions, writing, brainstorming and analysis. Responses stream token
by token and support Markdown, tables and code blocks. Chat keeps the last 20 turns of
conversation in memory. If you ask it to tap or type in another app, it will tell you to
switch to Agent or S.A.N.T.O. mode.

### S.A.N.T.O. mode

The hands-free experience, built around the animated HUD:

- **Wake word**: start speaking with *"Hey Santo"*, *"Hello Santo"*, *"Hi Santo"*,
  *"OK Santo"*, or just *"Santo"*. STT variants such as *"Sainto"*, *"Santu"*, *"Santoo"*,
  *"San To"* and the spelled-out *"S.A.N.T.O."* are accepted.
- **Command after the wake word**: *"Hey Santo, what are today's headlines?"*.
- **Command before the wake word**: *"What's the weather, Santo?"*.
- **Follow-ups**: after a reply, the microphone stays open briefly so you can continue
  without repeating the wake word.
- **Standalone wake**: saying only the wake word opens the listening window.
- Background noise, conversations that merely *contain* similar words, and media playback
  are filtered out so the assistant does not interrupt itself.

Switch the HUD between the **Arc Reactor core** and the **hologram suit bust** in
Settings → S.A.N.T.O. screen mode, or from the switcher pill on the HUD itself.

---

## 3. Choosing an AI provider

Open **Settings → Model provider preset**, pick a provider, then set the model name.
Presets are filled in automatically. All providers speak the OpenAI chat-completions
protocol (including tool calling), so any compatible endpoint works too.

| Preset | Base URL | Default model | Notes |
|---|---|---|---|
| **DeepSeek** | `https://api.deepseek.com/v1` | `deepseek-flash` | Fast and inexpensive general model. |
| **OpenAI** | `https://api.openai.com/v1` | `gpt-6.1-sol` | Strong reasoning, vision and tool use. |
| **Google Gemini** | `https://generativelanguage.googleapis.com/v1beta/openai` | `gemini-3.8-flash` | Multimodal and fast. |
| **OpenRouter** | `https://openrouter.ai/api/v1` | `openai/gpt-6.1-sol` | One key for many vendors. |
| **NVIDIA NIM** | `https://integrate.api.nvidia.com/v1` | `nvidia/nemotron-3-super-120b-a12b` | Enterprise-grade open models. |
| **Ollama (local)** | `http://127.0.0.1:11434/v1` | `qwen3.5:4b` | Fully offline, no API key. |
| **Custom endpoint** | your URL | your model | Any OpenAI-compatible server. |

### Tips

- **Local-first privacy mode** (Settings) forces the Ollama provider and offline TTS. Use it
  when you want zero cloud traffic.
- The model name is free text. If a vendor renames or retires a model, type the new ID
  without rebuilding the app.
- For Agent mode pick a model with reliable **tool/function calling** and a large context
  window; small local models can be slow or inconsistent at JSON action output.
- Keys are stored in Android `SharedPreferences` on the device. They are never bundled,
  synced or sent to the developer.

---

## 4. Voice and speech

- **Neural voice** (default): Microsoft Edge neural TTS, streamed and cached on device.
  No Azure subscription is required.
- **Available voices**: Ryan (British, default), Thomas (British conversational),
  Guy (US studio), Christopher (US confident), Emily (Irish, F.R.I.D.A.Y. style).
- **On-device fallback**: if the network or Edge endpoint is unavailable, S.A.N.T.O. falls
  back to the Android TTS engine (`flutter_tts`).
- **Auto-speak** can be disabled in Settings if you prefer silent operation.
- S.A.N.T.O. spells its own name *"Santo"* when speaking (the display keeps `S.A.N.T.O.`).

---

## 5. Voice command cheat sheet

Wake the assistant first in S.A.N.T.O. mode, or type these into Agent mode.

| What you want | Say |
|---|---|
| News | *"What are today's top headlines?"* |
| Web search | *"Search who built the pyramids"* |
| Weather | *"What's the weather?"* |
| Battery / time | *"Battery status"*, *"What time is it?"* |
| Flashlight / volume / brightness | *"Turn on the flashlight"*, *"Volume up"*, *"Set brightness to 50%"* |
| Reminders | *"Remind me to call Jack at 4 PM"* |
| Todos | *"Add buy milk to my todo list"* |
| Notes | *"Save a note: meeting notes…"* |
| Messages | *"Draft a WhatsApp to Sarah saying I'm running late"* |
| Email | *"Read my inbox"* |
| Translate | *"Translate 'where is the station' to French"* |
| Smart home | *"Turn on the living room light"*, *"Dim office lights to 40%"* |
| Commute | *"How is traffic to work?"* |
| Diagnostics | *"System diagnostics"*, *"How much RAM is free?"* |
| Files | *"Save this to notes.txt in Downloads"* |
| Multi-task | *"Remind me at 5, text Sarah I'm late, calculate 25% of 600, and turn on the flashlight"* |
| App automation | *"Open Uber and check the price to the airport"* |
| Self-evolve | *"Self evolve"*, *"Update your memory"* |

Special modes and features have their own entries in the app: Sentry, Code Black,
air gestures, airspace radar, network audit, optical solver, polyglot diplomat and the
floating co-pilot.

---

## 6. Permissions explained

| Permission | Type | Why |
|---|---|---|
| Microphone | Runtime | Wake word and voice commands. |
| Accessibility service | Special | Read the screen and perform taps/typing/scrolls. |
| Display over other apps | Special | Floating co-pilot and system overlays. |
| Notification listener | Special | Email/SMS triage. |
| SMS, contacts | Runtime | Reading messages and dialling contacts. |
| Camera | Runtime | Sentry intruder capture, Optical solver, Santo Eye. |
| Files / all-files access | Special | Read and write files in public folders. |
| Usage access | Special | App usage insights. |
| Battery optimisation exemption | Special | Keeps wake word and background work alive. |
| Shizuku (optional) | Privileged | Elevated shell actions without root. |

The **Permissions Hub** links directly to each Android settings page. Granting the
accessibility service and battery exemption is strongly recommended for hands-free use.

---

## 7. Privacy and data

- **No analytics, no trackers, no telemetry** are built in.
- Conversations, settings and learned skills stay in local app storage.
- The **only** outbound traffic is: (a) requests to the AI provider you configured,
  (b) Edge TTS audio, if neural voice is enabled, (c) optional integrations you turn on
  (Telegram, OpenSky, weather/news feeds, Home Assistant).
- **Local-first mode** eliminates (a) and (b) by forcing Ollama and on-device TTS.
- API keys are stored locally and can be cleared by removing the app data.

---

## 8. Troubleshooting

**"Accessibility service is OFF"**
Enable *S.A.N.T.O. Screen Control* under Android Settings → Accessibility. Some OEMs
(Xiaomi, Oppo, vivo) also require "restricted settings" to be allowed for sideloaded apps.

**Sending a chat message does nothing**
A task may already be running, or a previous reply is still streaming. S.A.N.T.O. now
shows a message explaining this; wait for the current task/reply to finish.

**Wake word does not trigger**
Check microphone permission, battery optimisation exemption, and that the Google speech
service is installed and allowed. Try the spelled variants or type instead.

**Agent clicks miss the target**
Keep the screen in portrait. Apps using `FLAG_SECURE` (banking, some password managers)
hide their node tree from accessibility and cannot be automated.

**No sound**
Neural TTS needs a network connection the first time; after that, cached phrases work
offline. Check media volume and that auto-speak is enabled.

**Provider returns 401/403**
Re-paste the API key. For local models, make sure Ollama is running and reachable at the
configured base URL. Cloud keys are not interchangeable between providers.

**Model returns no action / invalid JSON**
Switch to a stronger tool-calling model, increase max steps, or lower temperature.
The executor already tolerates markdown fences, prose around JSON and common action aliases.

---

## 9. Everyday settings worth knowing

- **Agent max steps** (default 15, range 3–40) — upper bound on actions per task.
- **Step delay** (default 1200 ms, range 200–10000 ms) — pause between actions so the UI
  can settle.
- **Memorised skills** — replay previously successful automations without spending tokens.
- **Confirm risky actions** — asks before destructive steps.
- **Telegram remote** — control the phone from a private Telegram chat (`/status`,
  `/screenshot`, `/cancel`, or plain task text).
- **Proactive prompts** — morning briefing, night mode, commute, meeting and study nudges.
- **Sentry mode** — accelerometer anti-theft watchdog with camera capture and Telegram alert.
- **Code Black** — a simulated kernel-panic lock screen for privacy; disarm with the voice
  passphrase, four taps in the top-right corner, or the emergency slider.

---

## 10. Getting help

- Re-run `flutter analyze` and `flutter test` if you build from source.
- See [TECHNICAL_GUIDE.md](TECHNICAL_GUIDE.md) for architecture, storage schema and
  extension points.
- Open an issue with device model, Android version, provider/model and the exact command.
