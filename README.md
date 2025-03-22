# Gain Solution Task

This project is a Flutter application developed as a recruitment task for Gain Solutions Ltd.

## Tools & Technologies:

1. Framework: flutter-3.29.2
2. Programming language: dart-3.7.2
3. State management: riverpod-2.6.1

## Features:

1. support ticket list
2. filter ticket
3. contact list with search option
4. profile


## Installation:

To run this project locally, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/Neloy-SWE/gsl-task.git
2. **Navigate to the project directory**:
   ```bash
   cd gsl-task
3. **Install dependencies**:
   ```bash
   flutter pub get

4. **Run the application**:
   ```bash
    flutter run
    
    
## Project Structure

<details>
<summary>Click to expand</summary>

```bash
Neccessary files/
├── assets/
│   ├── fonts/ # text fonts
│   │   ├── font500.ttf
│   │   ├── font600.ttf
│   ├── images/ # images
│   │   ├── profile.png
│   ├── jsons/ # static data
│   │   ├── brand.json
│   │   ├── contact.json
│   │   ├── priority.json
│   │   ├── profile.json
│   │   ├── ticket.json
├── lib/
│   ├── managers/ # state manager
│   │   ├── contact/
│   │   │   ├── manager_contact.dart
│   │   │   ├── state_contact.dart
│   │   ├── filter/
│   │   │   ├── brand/
│   │   │   │   ├── manager_brand.dart
│   │   │   │   ├── state_brand.dart
│   │   │   ├── priority/
│   │   │   │   ├── manager_priority.dart
│   │   │   │   ├── state_priority.dart
│   │   │   ├── profile/
│   │   │   │   ├── manager_profile.dart
│   │   │   │   ├── state_profile.dart
│   │   │   ├── ticket/
│   │   │   │   ├── manager_ticket.dart
│   │   │   │   ├── state_ticket.dart
│   ├── networks/ # data handle
│   │   ├── model/ # response models
│   │   │   ├── model_brand.dart
│   │   │   ├── model_contact.dart
│   │   │   ├── model_priority.dart
│   │   │   ├── model_profile.dart
│   │   │   ├── model_ticket.dart
│   │   ├── repository/ # api call
│   │   │   ├── data_brand.dart
│   │   │   ├── data_contact.dart
│   │   │   ├── data_priority.dart
│   │   │   ├── data_profile.dart
│   │   │   ├── data_ticket.dart
│   ├── utilities/ # all necessary properties
│   │   ├── app_color.dart
│   │   ├── app_constant.dart
│   │   ├── app_font.dart
│   │   ├── app_image.dart
│   │   ├── app_json_path.dart
│   │   ├── app_size.dart
│   │   ├── app_text.dart
│   │   ├── app_themes.dart
│   ├── views/ # UI
│   │   ├── custom_widgets/ # customized widgets
│   │   │   ├── custom_appbar.dart
│   │   │   ├── custom_text_field.dart
│   │   │   ├── custom_tag_container.dart
│   │   ├── screens/ # main screens
│   │   │   ├── screen_contact.dart
│   │   │   ├── screen_filter.dart
│   │   │   ├── screen_home.dart
│   │   │   ├── screen_profile.dart
│   │   │   ├── screen_splash.dart
│   │   │   ├── screen_ticket.dart
│   ├── main.dart
```
</details>



## Future scope:

in this release, you may not see any active filtration. But if you want to apply you may follow

1. you will already get functionalities of getting all selected values from the filter.
2. you may compare filter values like brands, priority, tags with ticket list and modify list.
3. you have to stop calling api for ticket list after filter, because it will restart the ticket
   list.
4. you have to store all filter values in state management. so that without clean the filter you
   will find all saved filter data if you move any other screen and back to the filter page.


## Screenshots:

<p float="left">
  <img src="screenshots/1. splash.ppg" width="200" />
  <img src="screenshots/2. ticket.png" width="200" />
  <img src="screenshots/3.1. filter.png" width="200" />
  <img src="screenshots/3.2. filter add.png" width="200" />
  <img src="screenshots/4.1. contact.png" width="200" />
  <img src="screenshots/4.2. contact search.png" width="200" />
  <img src="screenshots/4.3. contact menu.png" width="200" />
  <img src="screenshots/5. profile.png" width="200" />


### For further implementation feel free to reach out at: taufiqneloy.swe@gmail.com
