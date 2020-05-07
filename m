Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3A8B1C8D9B
	for <lists+linux-omap@lfdr.de>; Thu,  7 May 2020 16:08:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727856AbgEGOHi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 7 May 2020 10:07:38 -0400
Received: from muru.com ([72.249.23.125]:53080 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727835AbgEGOHh (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 7 May 2020 10:07:37 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3567680CD;
        Thu,  7 May 2020 14:08:24 +0000 (UTC)
Date:   Thu, 7 May 2020 07:07:32 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     kernel list <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org, sre@kernel.org, nekit1000@gmail.com,
        mpartap@gmx.net, merlijn@wizzup.org, martin_rysavy@centrum.cz
Subject: Re: USB networking news, ofono for d4: less hacked version
Message-ID: <20200507140732.GU37466@atomide.com>
References: <20200506101125.GA7490@amd>
 <20200506144338.GT37466@atomide.com>
 <20200506230525.GA22354@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200506230525.GA22354@amd>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Pavel Machek <pavel@ucw.cz> [200506 23:06]:
> On Wed 2020-05-06 07:43:38, Tony Lindgren wrote:
> > * Pavel Machek <pavel@ucw.cz> [200506 10:12]:
> > > Hi!
> > > 
> > > So... I found out that USB networking works way better when I don't
> > > attempt to charge the phone at the same. Yes, green light was
> > > blinking.
> > 
> > OK yes we don't have much of a charger detection currently and the
> > charger tries to reconnect with the LED blinking rapidly with an
> > empty battery.
> 
> Do you have an idea why that causes problems with usb data connection?

If the charger is configured to draw too much current, the USB port
or hub will cut it off. I have been carrying the following patch in
droid4-pending-v5.6 that lowers the charge current if it fails, maybe
see if that helps?

> I created a script to disable charging -- and that works. I also found
> out cable about 5cm long. Not nice to use, but works significantly
> better w.r.t. charging.

Yeah some USB cables are really thin.

> > I still need to figure update audio notifications for the current set of
> > gsmmux patches. Eventually maybe ofono can just set the voice call audio
> > routing using alsa. But let's get the kernel notifications working first
> > as we also need to fix up the audio parts for the earlier comments from
> > Peter and Sebastian.
> 
> Ofono does not normally touch ALSA, so I'd prefer not to do it from
> there.

OK

> But I might be confused. I recall some audio patches were needed for
> basic phone calls (setting up mixers to connect gsm<->audio), but
> those worked before gsmux support was enabled. (Maybe some hardcoded
> commands were needed to be sent to gsmmux somewhere).

We're currently reconfiguring the TDM transport that based on the
unsolicited messages on dlci1. I still need to figure out how to add
that back while keeping the serdev-ngsm driver generic.

I'm thinking maybe we'll just have the voice call audio driver also be a
read-only consumer driver for dlci1 to listen to the unsolicited
messages on dlci1, and also request n_gsm spin up /dev/gsmtty1.

Then if at some point we have some Linux generic modem framework, it
can provide some notifiers for the call state.

> I assume neither gsmmux audio parts nor mixer parts are available in
> -next at the moment?

Sorry not yet, will post as soon as I have the audio notifiers part
working, so it will be some days away still with time permitting.

Regards,

Tony

8< -------------------------------
From tony Mon Sep 17 00:00:00 2001
From: Tony Lindgren <tony@atomide.com>
Date: Sun, 16 Feb 2020 16:59:06 -0800
Subject: [PATCH] power: supply: cpcap-charger: Adjust current based on
 charger interrupts

When debugging why higher than 500 mA charge current does not work, I
noticed that we start getting lots of chrgcurr1 interrupts if we attempt
to charge at rates higher than the charger can provide.

Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/power/supply/cpcap-charger.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/power/supply/cpcap-charger.c b/drivers/power/supply/cpcap-charger.c
--- a/drivers/power/supply/cpcap-charger.c
+++ b/drivers/power/supply/cpcap-charger.c
@@ -147,6 +147,8 @@ struct cpcap_charger_ddata {
 	int status;
 	int state;
 	int voltage;
+	int last_current;
+	int last_current_retries;
 };
 
 struct cpcap_interrupt_desc {
@@ -616,6 +618,7 @@ static void cpcap_usb_detect(struct work_struct *work)
 	/* Just init the state if a charger is connected with no chrg_det set */
 	if (!s.chrg_det && s.chrgcurr1 && s.vbusvld) {
 		cpcap_charger_update_state(ddata, CPCAP_CHARGER_DETECTING);
+		ddata->last_current = 0;
 
 		return;
 	}
@@ -662,6 +665,30 @@ static void cpcap_usb_detect(struct work_struct *work)
 		else
 			max_current = CPCAP_REG_CRM_ICHRG_0A532;
 
+		switch (ddata->state) {
+		case CPCAP_CHARGER_DETECTING:
+			ddata->last_current_retries = 0;
+			break;
+		case CPCAP_CHARGER_DISCONNECTED:
+			if (ddata->last_current > CPCAP_REG_CRM_ICHRG_0A532) {
+				/* Attempt current 3 times before lowering */
+				if (ddata->last_current_retries++ >= 3) {
+					ddata->last_current--;
+					ddata->last_current_retries = 0;
+					/* Wait a bit for voltage to ramp up */
+					usleep_range(40000, 50000);
+				}
+				max_current = ddata->last_current;
+			}
+			dev_info(ddata->dev, "enabling charger with current %i\n",
+				 max_current);
+			break;
+		default:
+			ddata->last_current_retries = 0;
+			break;
+		}
+
+		ddata->last_current = max_current;
 		vchrg = cpcap_charger_voltage_to_regval(ddata->voltage);
 		error = cpcap_charger_set_state(ddata,
 						CPCAP_REG_CRM_VCHRG(vchrg),
-- 
2.26.2
