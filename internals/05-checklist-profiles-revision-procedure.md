# CheckList: Profiles Revision Procedure

## 1. Enable Browser to Download Multiple Files

Any [RPA integration](/user//03-bring-your-own-profiles.md#6-rpa-access) that runs over our [MassProspecting SDK](https://github.com/MassProspecting/mass-sdk) can execute a javascript function `downloadImage`.

Such a `downloadImage` function is for downloading images from a website without perofrming an HTTP request to that website, and without raising any red-flag in that website in consequence.

Our javascript function `downloadImage` requires browser allows to download multiple files. Refer [issue #12](https://github.com/MassProspecting/docs/issues/12) for more infromation.

Follow the next steps in order to enable **multiple files downloading"":

1. Open your AdsPower terminal.

2. Start the browser you want to share.

3. Go to this URL to manage privacy configurations for LinkedIn: [chrome://settings/content/siteDetails?site=https%3A%2F%2Fwww.linkedin.com%3A443](chrome://settings/content/siteDetails?site=https%3A%2F%2Fwww.linkedin.com%3A443).

4. Allow "Automatic downloads"

![MassProspecting SDK requires browsers allow automatic downloads](/assets/internals/3-1.png)

5. Repeat the step 3 with the privacy configurations for Facebook: [chrome://settings/content/siteDetails?site=https%3A%2F%2Fwww.facebook.com%3A443](chrome://settings/content/siteDetails?site=https%3A%2F%2Fwww.facebook.com%3A443),

## 2. Sharing AdsPower Profiles

In your AdsPower 

1. Open your AdsPower terminal.

2. Select the browsers you want to share, and click on the "Share" button.

![MassProspecting - Sharing AdsPower profiles](/assets/internals/3-2.png)

3. Click on all checkboxes of **Sharing Details**: name, proxy, remark.

4. Select **E-Mail** as the **Way to Share:**, and write `adspoweer@massprospecting` in the text field.

5. Disable **Move**.

6. Click on **Ok**

![MassProspecting - Sharing AdsPower profiles](/assets/internals/3-3.png)


