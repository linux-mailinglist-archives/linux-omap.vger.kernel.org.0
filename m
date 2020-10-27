Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8680229A48C
	for <lists+linux-omap@lfdr.de>; Tue, 27 Oct 2020 07:17:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2506391AbgJ0GRr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Oct 2020 02:17:47 -0400
Received: from muru.com ([72.249.23.125]:46836 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2506390AbgJ0GRr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Oct 2020 02:17:47 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CAB0380AA;
        Tue, 27 Oct 2020 06:17:49 +0000 (UTC)
Date:   Tue, 27 Oct 2020 08:17:41 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Bhushan Shah <bshah@kde.org>
Cc:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>, clayton@craftyguy.net
Subject: Re: [PATCH] usb: musb: fix idling for suspend after disconnect
 interrupt
Message-ID: <20201027061741.GD5639@atomide.com>
References: <20191126034151.38154-1-tony@atomide.com>
 <20201027045519.GA947883@aquila.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027045519.GA947883@aquila.localdomain>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* Bhushan Shah <bshah@kde.org> [201027 04:55]:
> Hi Tony,
> 
> On Mon, Nov 25, 2019 at 07:41:51PM -0800, Tony Lindgren wrote:
> > When disconnected as USB B-device, we sometimes get a suspend interrupt
> > after disconnect interrupt. In that case we have devctl set to 99 with
> > VBUS still valid and musb_pm_runtime_check_session() wrongly things we
> > have an active session. We have no other interrupts after disconnect
> > coming in this case at least with the omap2430 glue.
> 
> So I had been debugging a issue with musb_hrdc driver preventing a
> suspend on the pinephone, which is Allwinner A64 platform.

Great. After that you might want to take a look and make sure that musb
also gets idled properly during runtime with no devices connected :)

> Namely, if I have USB connected, and I try to suspend, it would hang
> until USB is disconnected. After enabling tracing, I realized that is
> hanging after this commit. Reverting it makes device suspend and resume
> correctly.
> 
> Some more of debugging notes can be found at,
> 
> https://gitlab.com/postmarketOS/pmaports/-/issues/839
> 
> I wonder what would be right solution here? Disable this quirk somehow
> for device?

Hmm maybe we're just missing the check for suspend here. Maybe
give the following untested patch a try?

I'll give it a try here too but it might be few days.

Seems like we might be able to eventually simplify the suspend and
quirk check stuff, but let's fix the $subject issue first.

Regards,

Tony

8< ----------------------
diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -2005,10 +2005,14 @@ static void musb_pm_runtime_check_session(struct musb *musb)
 		MUSB_DEVCTL_HR;
 	switch (devctl & ~s) {
 	case MUSB_QUIRK_B_DISCONNECT_99:
-		musb_dbg(musb, "Poll devctl in case of suspend after disconnect\n");
-		schedule_delayed_work(&musb->irq_work,
-				      msecs_to_jiffies(1000));
-		break;
+		if (musb->quirk_retries && !musb->flush_irq_work) {
+			musb_dbg(musb, "Poll devctl in case of suspend after disconnect\n");
+			schedule_delayed_work(&musb->irq_work,
+					      msecs_to_jiffies(1000));
+			musb->quirk_retries--;
+			break;
+		}
+		/* fall through */
 	case MUSB_QUIRK_B_INVALID_VBUS_91:
 		if (musb->quirk_retries && !musb->flush_irq_work) {
 			musb_dbg(musb,
