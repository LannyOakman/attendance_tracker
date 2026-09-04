# Attendence Tracking System with Canvas Integration

## Preface

Several attendence tracking systems currently exist, but do not hit certain criteria I think should be present.

Of the services I've encountered, they all lack in some areas:

- Account setup/config requirements
- A tiering business model that eventually results in payment
- Limited integration and automation within Instructure's Canvas
- Universal attendence codes/QR codes.

## Purpose

I'm seeking to develop a simple mobile application that interfaces with existing [Canvas APIs](https://developerdocs.instructure.com/services/canvas) with hope to:
- decrease time needed for attendence
- increase average student:teacher/ta ratio over classtime

## Functionality

### Per student
- 1 QR code assigned. Student receives printed copy of QR.
    - QR stores student's canvas UID. Student can take picture of QR code just in case.
- NFC/BearcatCard support
    - NFC BearcatCard data is encrypted, but it has an unencrypted UID/Serial code. We could hold a mapping from serial code to canvas UID. This is the ideal solution to me.

### Per TA/Instructor
- Mobile app to interface with existing Canvas API endpoints.
- TA creates/provides personal access token from Canvas to app.
    - App encrypts and holds token with user-provided one-time passphrase.
- Generate/assign QR codes for students to hold
    - QRs hold Canvas UID.
    - interface to create BearcatCard mapping (optional, but desirable)
        - Mapping(s) can be stored on canvas to avoid need for a server
        - This breaks if student gets new ID. There should be support to update existing mapping
    - Ad-hoc student lookup if QR/BearcatCard not available (6+2?)

- Assisted/Auto grading
    1. Fetch possible sections/assignments
    1. TA selects applicable section/assignment
    1. TA scans QR/BearcatCard.
    1. QR/BearcatCard is then mapped to canvas student id.
        - If no QR/card on person, TA manually updates on canvas.
    1. Automatically/manually trigger one of the events:
        1. Hit API with proper auth and trigger Canvas grade change for the user with the associated UID.
        1. Update/create excel doc that is stored on canvas. This allows for a middle step to avoid direct access. 

## Role Out Plan with Existing Courses

This project should be feasible. It is just a simple wrapper app to interface with Canvas's APIs.

If it proves to be successful I will attempt to roll it out in phases.

### Section-wise

- Start with one section of a course. Slowly ramp up the portion of 'automated' students- 4, 8, 16, 32, 64

### Course-wise

- If Section rollout was successful, hold that section for a week or two, documenting any unfamiliar behavior.
- After 1-2 weeks of success, follow a similar procedure, increasing sections in an exponential form.

## Getting Started

Current Canvas API communication uses a `User-Generated Access Token` instead of proper [OAuth2](https://developerdocs.instructure.com/services/canvas/oauth2/file.oauth).

Information for how to generate tokens can be found [here](https://developerdocs.instructure.com/services/canvas/oauth2/file.oauth#manual-token-generation)

For proper functionality, a `.env` file must be created at the root of the project, populated with `CANVAS_DEV_API_TOKEN`

`Manual Token Generation` should be updated to `OAuth2` if application is ever deployed.