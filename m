Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F92CE71DB
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2019 13:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389447AbfJ1Mnb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Oct 2019 08:43:31 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54524 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389439AbfJ1Mnb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Oct 2019 08:43:31 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9SChTog067297;
        Mon, 28 Oct 2019 07:43:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572266609;
        bh=s6MCR8cgc8q0iMMzkGXUM4CLc7LCEE3fJD3b0dvZ0UU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=MiPFXaetRZ9Q3eU97QRczviY6UwxtWyO+MDLfJSx1AF8YPioWBf59UuDo3MI6OU4O
         Dp+Zn/0IfwMNe150f3u8iyM9PXEw6NWWmXPqogsfod5Ac3F2ol4XPrSOm+a6nMrhHo
         +uCLkoFY8KwjhscnIAcXgvYaWdG7q+d0xhh6uLZo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9SChTdo069810
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 28 Oct 2019 07:43:29 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 28
 Oct 2019 07:43:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 28 Oct 2019 07:43:15 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9SCgoh8063574;
        Mon, 28 Oct 2019 07:43:25 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 16/17] remoteproc/omap: add watchdog functionality for remote processors
Date:   Mon, 28 Oct 2019 14:42:37 +0200
Message-ID: <20191028124238.19224-17-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191028124238.19224-1-t-kristo@ti.com>
References: <20191028124238.19224-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

Remote processors can be stuck in a loop, and may not be recoverable
if they do not have a built-in watchdog. The watchdog implementation
for OMAP remote processors uses external gptimers that can be used
to interrupt both the Linux host as well as the remote processor.

Each remote processor is responsible for refreshing the timer during
normal behavior - during OS task scheduling or entering the idle loop
properly. During a watchdog condition (executing a tight loop causing
no scheduling), the host processor gets interrupts and schedules a
recovery for the corresponding remote processor. The remote processor
may also get interrupted to be able to print a back trace.

A menuconfig option has also been added to enable/disable the Watchdog
functionality, with the default as disabled.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/remoteproc/Kconfig           |  12 +++
 drivers/remoteproc/omap_remoteproc.c | 154 ++++++++++++++++++++++++---
 2 files changed, 154 insertions(+), 12 deletions(-)

diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
index d6450d7fcf92..b2eaa18ad503 100644
--- a/drivers/remoteproc/Kconfig
+++ b/drivers/remoteproc/Kconfig
@@ -42,6 +42,18 @@ config OMAP_REMOTEPROC
 	  It's safe to say N here if you're not interested in multimedia
 	  offloading or just want a bare minimum kernel.
 
+config OMAP_REMOTEPROC_WATCHDOG
+	bool "OMAP remoteproc watchdog timer"
+	depends on OMAP_REMOTEPROC
+	default n
+	help
+	  Say Y here to enable watchdog timer for remote processors.
+
+	  This option controls the watchdog functionality for the remote
+	  processors in OMAP. Dedicated OMAP DMTimers are used by the remote
+	  processors and triggers the timer interrupt upon a watchdog
+	  detection.
+
 config WKUP_M3_RPROC
 	tristate "AMx3xx Wakeup M3 remoteproc support"
 	depends on SOC_AM33XX || SOC_AM43XX
diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 6f797025bb6b..2eb05d7a4dec 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/dma-mapping.h>
+#include <linux/interrupt.h>
 #include <linux/remoteproc.h>
 #include <linux/mailbox_client.h>
 #include <linux/omap-mailbox.h>
@@ -76,10 +77,12 @@ struct omap_rproc_mem {
  * struct omap_rproc_timer - data structure for a timer used by a omap rproc
  * @odt: timer pointer
  * @timer_ops: OMAP dmtimer ops for @odt timer
+ * @irq: timer irq
  */
 struct omap_rproc_timer {
 	struct omap_dm_timer *odt;
 	const struct omap_dm_timer_ops *timer_ops;
+	int irq;
 };
 
 /**
@@ -90,6 +93,7 @@ struct omap_rproc_timer {
  * @mem: internal memory regions data
  * @num_mems: number of internal memory regions
  * @num_timers: number of rproc timer(s)
+ * @num_wd_timers: number of rproc watchdog timers
  * @timers: timer(s) info used by rproc
  * @autosuspend_delay: auto-suspend delay value to be used for runtime pm
  * @need_resume: if true a resume is needed in the system resume callback
@@ -106,6 +110,7 @@ struct omap_rproc {
 	struct omap_rproc_mem *mem;
 	int num_mems;
 	int num_timers;
+	int num_wd_timers;
 	struct omap_rproc_timer *timers;
 	int autosuspend_delay;
 	bool need_resume;
@@ -214,6 +219,81 @@ static inline int omap_rproc_release_timer(struct omap_rproc_timer *timer)
 	return timer->timer_ops->free(timer->odt);
 }
 
+/**
+ * omap_rproc_get_timer_irq - get the irq for a timer
+ * @timer - handle to a OMAP rproc timer
+ *
+ * This function is used to get the irq associated with a watchdog timer. The
+ * function is called by the OMAP remoteproc driver to register a interrupt
+ * handler to handle watchdog events on the remote processor.
+ *
+ * Returns the irq id on success, otherwise a failure as returned by DMTimer ops
+ */
+static inline int omap_rproc_get_timer_irq(struct omap_rproc_timer *timer)
+{
+	return timer->timer_ops->get_irq(timer->odt);
+}
+
+/**
+ * omap_rproc_ack_timer_irq - acknowledge a timer irq
+ * @timer: handle to a OMAP rproc timer
+ *
+ * This function is used to clear the irq associated with a watchdog timer. The
+ * The function is called by the OMAP remoteproc upon a watchdog event on the
+ * remote processor to clear the interrupt status of the watchdog timer.
+ *
+ * Returns the irq id on success, otherwise a failure as returned by DMTimer ops
+ */
+static inline void omap_rproc_ack_timer_irq(struct omap_rproc_timer *timer)
+{
+	timer->timer_ops->write_status(timer->odt, OMAP_TIMER_INT_OVERFLOW);
+}
+
+/**
+ * omap_rproc_watchdog_isr - Watchdog ISR handler for remoteproc device
+ * @irq: IRQ number associated with a watchdog timer
+ * @data: IRQ handler data
+ *
+ * This ISR routine executes the required necessary low-level code to
+ * acknowledge a watchdog timer interrupt. There can be multiple watchdog
+ * timers associated with a rproc (like IPUs which have 2 watchdog timers,
+ * one per Cortex M3/M4 core), so a lookup has to be performed to identify
+ * the timer to acknowledge its interrupt.
+ *
+ * The function also invokes rproc_report_crash to report the watchdog event
+ * to the remoteproc driver core, to trigger a recovery.
+ *
+ * Return: IRQ_HANDLED or IRQ_NONE
+ */
+static irqreturn_t omap_rproc_watchdog_isr(int irq, void *data)
+{
+	struct rproc *rproc = data;
+	struct omap_rproc *oproc = rproc->priv;
+	struct device *dev = rproc->dev.parent;
+	struct omap_rproc_timer *timers = oproc->timers;
+	struct omap_rproc_timer *wd_timer = NULL;
+	int num_timers = oproc->num_timers + oproc->num_wd_timers;
+	int i;
+
+	for (i = oproc->num_timers; i < num_timers; i++) {
+		if (timers[i].irq > 0 && irq == timers[i].irq) {
+			wd_timer = &timers[i];
+			break;
+		}
+	}
+
+	if (!wd_timer) {
+		dev_err(dev, "invalid timer\n");
+		return IRQ_NONE;
+	}
+
+	omap_rproc_ack_timer_irq(wd_timer);
+
+	rproc_report_crash(rproc, RPROC_WATCHDOG);
+
+	return IRQ_HANDLED;
+}
+
 /**
  * omap_rproc_enable_timers - enable the timers for a remoteproc
  * @rproc: handle of a remote processor
@@ -235,19 +315,25 @@ static int omap_rproc_enable_timers(struct rproc *rproc, bool configure)
 	struct omap_rproc_timer *timers = oproc->timers;
 	struct device *dev = rproc->dev.parent;
 	struct device_node *np = NULL;
+	int num_timers = oproc->num_timers + oproc->num_wd_timers;
 
-	if (oproc->num_timers <= 0)
+	if (num_timers <= 0)
 		return 0;
 
 	if (!configure)
 		goto start_timers;
 
-	for (i = 0; i < oproc->num_timers; i++) {
-		np = of_parse_phandle(dev->of_node, "timers", i);
+	for (i = 0; i < num_timers; i++) {
+		if (i < oproc->num_timers)
+			np = of_parse_phandle(dev->of_node, "timers", i);
+		else
+			np = of_parse_phandle(dev->of_node, "watchdog-timers",
+					      (i - oproc->num_timers));
 		if (!np) {
 			ret = -ENXIO;
 			dev_err(dev, "device node lookup for timer at index %d failed: %d\n",
-				i, ret);
+				i < oproc->num_timers ? i :
+				i - oproc->num_timers, ret);
 			goto free_timers;
 		}
 
@@ -270,12 +356,14 @@ static int omap_rproc_enable_timers(struct rproc *rproc, bool configure)
 		if (!timer_ops || !timer_ops->request_by_node ||
 		    !timer_ops->set_source || !timer_ops->set_load ||
 		    !timer_ops->free || !timer_ops->start ||
-		    !timer_ops->stop) {
+		    !timer_ops->stop || !timer_ops->get_irq ||
+		    !timer_ops->write_status) {
 			ret = -EINVAL;
 			dev_err(dev, "device does not have required timer ops\n");
 			goto put_node;
 		}
 
+		timers[i].irq = -1;
 		timers[i].timer_ops = timer_ops;
 		ret = omap_rproc_request_timer(np, &timers[i]);
 		if (ret) {
@@ -284,10 +372,33 @@ static int omap_rproc_enable_timers(struct rproc *rproc, bool configure)
 			goto put_node;
 		}
 		of_node_put(np);
+
+		if (i >= oproc->num_timers) {
+			timers[i].irq = omap_rproc_get_timer_irq(&timers[i]);
+			if (timers[i].irq < 0) {
+				dev_err(dev, "get_irq for timer %p failed: %d\n",
+					np, timers[i].irq);
+				ret = -EBUSY;
+				goto free_timers;
+			}
+
+			ret = request_irq(timers[i].irq,
+					  omap_rproc_watchdog_isr, IRQF_SHARED,
+					  "rproc-wdt", rproc);
+			if (ret) {
+				dev_err(dev, "error requesting irq for timer %p\n",
+					np);
+				omap_rproc_release_timer(&timers[i]);
+				timers[i].odt = NULL;
+				timers[i].timer_ops = NULL;
+				timers[i].irq = -1;
+				goto free_timers;
+			}
+		}
 	}
 
 start_timers:
-	for (i = 0; i < oproc->num_timers; i++)
+	for (i = 0; i < num_timers; i++)
 		omap_rproc_start_timer(&timers[i]);
 	return 0;
 
@@ -295,9 +406,12 @@ static int omap_rproc_enable_timers(struct rproc *rproc, bool configure)
 	of_node_put(np);
 free_timers:
 	while (i--) {
+		if (i >= oproc->num_timers)
+			free_irq(timers[i].irq, rproc);
 		omap_rproc_release_timer(&timers[i]);
 		timers[i].odt = NULL;
 		timers[i].timer_ops = NULL;
+		timers[i].irq = -1;
 	}
 
 	return ret;
@@ -318,16 +432,20 @@ static int omap_rproc_disable_timers(struct rproc *rproc, bool configure)
 	int i;
 	struct omap_rproc *oproc = rproc->priv;
 	struct omap_rproc_timer *timers = oproc->timers;
+	int num_timers = oproc->num_timers + oproc->num_wd_timers;
 
-	if (oproc->num_timers <= 0)
+	if (num_timers <= 0)
 		return 0;
 
-	for (i = 0; i < oproc->num_timers; i++) {
+	for (i = 0; i < num_timers; i++) {
 		omap_rproc_stop_timer(&timers[i]);
 		if (configure) {
+			if (i >= oproc->num_timers)
+				free_irq(timers[i].irq, rproc);
 			omap_rproc_release_timer(&timers[i]);
 			timers[i].odt = NULL;
 			timers[i].timer_ops = NULL;
+			timers[i].irq = -1;
 		}
 	}
 
@@ -1120,6 +1238,7 @@ static int omap_rproc_probe(struct platform_device *pdev)
 	struct omap_rproc *oproc;
 	struct rproc *rproc;
 	const char *firmware;
+	int num_timers;
 	int ret;
 	struct reset_control *reset;
 
@@ -1173,16 +1292,27 @@ static int omap_rproc_probe(struct platform_device *pdev)
 		oproc->num_timers = 0;
 	}
 
-	if (oproc->num_timers) {
+#ifdef CONFIG_OMAP_REMOTEPROC_WATCHDOG
+	oproc->num_wd_timers = of_count_phandle_with_args(np, "watchdog-timers",
+							  NULL);
+	if (oproc->num_wd_timers <= 0) {
+		dev_dbg(&pdev->dev, "device does not have watchdog timers, status = %d\n",
+			oproc->num_wd_timers);
+		oproc->num_wd_timers = 0;
+	}
+#endif
+
+	if (oproc->num_timers || oproc->num_wd_timers) {
+		num_timers = oproc->num_timers + oproc->num_wd_timers;
 		oproc->timers = devm_kzalloc(&pdev->dev, sizeof(*oproc->timers)
-					     * oproc->num_timers, GFP_KERNEL);
+					     * num_timers, GFP_KERNEL);
 		if (!oproc->timers) {
 			ret = -ENOMEM;
 			goto free_rproc;
 		}
 
-		dev_dbg(&pdev->dev, "device has %d tick timers\n",
-			oproc->num_timers);
+		dev_dbg(&pdev->dev, "device has %d tick timers and %d watchdog timers\n",
+			oproc->num_timers, oproc->num_wd_timers);
 	}
 
 	init_completion(&oproc->pm_comp);
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
