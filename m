Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9F4239B495
	for <lists+linux-omap@lfdr.de>; Fri,  4 Jun 2021 10:05:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbhFDIHd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Jun 2021 04:07:33 -0400
Received: from muru.com ([72.249.23.125]:36196 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229921AbhFDIHd (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 4 Jun 2021 04:07:33 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0490081A8;
        Fri,  4 Jun 2021 08:05:53 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Bin Liu <b-liu@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Bhushan Shah <bshah@kde.org>,
        Drew Fustini <drew@beagleboard.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 2/2] usb: musb: Implement tracing for state change events
Date:   Fri,  4 Jun 2021 11:05:36 +0300
Message-Id: <20210604080536.12185-2-tony@atomide.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604080536.12185-1-tony@atomide.com>
References: <20210604080536.12185-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The devctl register on musb is the only way to get state information
on musb. The hardware can easily get confused because it tries to do
things on it's own automagically, and things like slow VBUS rise can
make things fail.

Let's make it easier to debug the ongoing state change issues that
keep popping up on regular basis and add tracing support.

With these changes we can easily trace musb state change events with:

echo 1 > /sys/kernel/debug/tracing/events/musb/musb_state/enable
cat /sys/kernel/debug/tracing/trace_pipe
echo 0 > /sys/kernel/debug/tracing/events/musb/musb_state/enable

Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Andreas Kemnade <andreas@kemnade.info>
Cc: Bhushan Shah <bshah@kde.org>
Cc: Drew Fustini <drew@beagleboard.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/usb/musb/musb_core.c  | 34 ++++++++++++++++++----------------
 drivers/usb/musb/musb_trace.h | 17 +++++++++++++++++
 2 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/musb/musb_core.c b/drivers/usb/musb/musb_core.c
--- a/drivers/usb/musb/musb_core.c
+++ b/drivers/usb/musb/musb_core.c
@@ -480,9 +480,7 @@ int musb_set_host(struct musb *musb)
 
 	devctl = musb_read_devctl(musb);
 	if (!(devctl & MUSB_DEVCTL_BDEVICE)) {
-		dev_info(musb->controller,
-			 "%s: already in host mode: %02x\n",
-			 __func__, devctl);
+		trace_musb_state(musb, devctl, "Already in host mode");
 		goto init_data;
 	}
 
@@ -499,6 +497,9 @@ int musb_set_host(struct musb *musb)
 		return error;
 	}
 
+	devctl = musb_read_devctl(musb);
+	trace_musb_state(musb, devctl, "Host mode set");
+
 init_data:
 	musb->is_active = 1;
 	musb->xceiv->otg->state = OTG_STATE_A_IDLE;
@@ -526,10 +527,7 @@ int musb_set_peripheral(struct musb *musb)
 
 	devctl = musb_read_devctl(musb);
 	if (devctl & MUSB_DEVCTL_BDEVICE) {
-		dev_info(musb->controller,
-			 "%s: already in peripheral mode: %02x\n",
-			 __func__, devctl);
-
+		trace_musb_state(musb, devctl, "Already in peripheral mode");
 		goto init_data;
 	}
 
@@ -546,6 +544,9 @@ int musb_set_peripheral(struct musb *musb)
 		return error;
 	}
 
+	devctl = musb_read_devctl(musb);
+	trace_musb_state(musb, devctl, "Peripheral mode set");
+
 init_data:
 	musb->is_active = 0;
 	musb->xceiv->otg->state = OTG_STATE_B_IDLE;
@@ -1984,10 +1985,11 @@ ATTRIBUTE_GROUPS(musb);
 #define MUSB_QUIRK_A_DISCONNECT_19	((3 << MUSB_DEVCTL_VBUS_SHIFT) | \
 					 MUSB_DEVCTL_SESSION)
 
-static bool musb_state_needs_recheck(struct musb *musb, const char *desc)
+static bool musb_state_needs_recheck(struct musb *musb, u8 devctl,
+				     const char *desc)
 {
 	if (musb->quirk_retries && !musb->flush_irq_work) {
-		musb_dbg(musb, desc);
+		trace_musb_state(musb, devctl, desc);
 		schedule_delayed_work(&musb->irq_work,
 				      msecs_to_jiffies(1000));
 		musb->quirk_retries--;
@@ -2018,21 +2020,21 @@ static void musb_pm_runtime_check_session(struct musb *musb)
 		MUSB_DEVCTL_HR;
 	switch (devctl & ~s) {
 	case MUSB_QUIRK_B_DISCONNECT_99:
-		musb_state_needs_recheck(musb,
-			"Poll devctl in case of suspend after disconnect\n");
+		musb_state_needs_recheck(musb, devctl,
+			"Poll devctl in case of suspend after disconnect");
 		break;
 	case MUSB_QUIRK_B_INVALID_VBUS_91:
-		if (musb_state_needs_recheck(musb,
+		if (musb_state_needs_recheck(musb, devctl,
 				"Poll devctl on invalid vbus, assume no session"))
 			return;
 		fallthrough;
 	case MUSB_QUIRK_A_DISCONNECT_19:
-		if (musb_state_needs_recheck(musb,
+		if (musb_state_needs_recheck(musb, devctl,
 				"Poll devctl on possible host mode disconnect"))
 			return;
 		if (!musb->session)
 			break;
-		musb_dbg(musb, "Allow PM on possible host mode disconnect");
+		trace_musb_state(musb, devctl, "Allow PM on possible host mode disconnect");
 		pm_runtime_mark_last_busy(musb->controller);
 		pm_runtime_put_autosuspend(musb->controller);
 		musb->session = false;
@@ -2048,7 +2050,7 @@ static void musb_pm_runtime_check_session(struct musb *musb)
 
 	/* Block PM or allow PM? */
 	if (s) {
-		musb_dbg(musb, "Block PM on active session: %02x", devctl);
+		trace_musb_state(musb, devctl, "Block PM on active session");
 		error = pm_runtime_get_sync(musb->controller);
 		if (error < 0)
 			dev_err(musb->controller, "Could not enable: %i\n",
@@ -2064,7 +2066,7 @@ static void musb_pm_runtime_check_session(struct musb *musb)
 			schedule_delayed_work(&musb->irq_work,
 					      msecs_to_jiffies(3000));
 	} else {
-		musb_dbg(musb, "Allow PM with no session: %02x", devctl);
+		trace_musb_state(musb, devctl, "Allow PM with no session");
 		pm_runtime_mark_last_busy(musb->controller);
 		pm_runtime_put_autosuspend(musb->controller);
 	}
diff --git a/drivers/usb/musb/musb_trace.h b/drivers/usb/musb/musb_trace.h
--- a/drivers/usb/musb/musb_trace.h
+++ b/drivers/usb/musb/musb_trace.h
@@ -37,6 +37,23 @@ TRACE_EVENT(musb_log,
 	TP_printk("%s: %s", __get_str(name), __get_str(msg))
 );
 
+TRACE_EVENT(musb_state,
+	TP_PROTO(struct musb *musb, u8 devctl, const char *desc),
+	TP_ARGS(musb, devctl, desc),
+	TP_STRUCT__entry(
+		__string(name, dev_name(musb->controller))
+		__field(u8, devctl)
+		__string(desc, desc)
+	),
+	TP_fast_assign(
+		__assign_str(name, dev_name(musb->controller));
+		__entry->devctl = devctl;
+		__assign_str(desc, desc);
+	),
+	TP_printk("%s: devctl: %02x %s", __get_str(name), __entry->devctl,
+		  __get_str(desc))
+);
+
 DECLARE_EVENT_CLASS(musb_regb,
 	TP_PROTO(void *caller, const void  __iomem *addr,
 		 unsigned int offset, u8 data),
-- 
2.31.1
