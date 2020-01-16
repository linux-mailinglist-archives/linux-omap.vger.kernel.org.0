Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85AD813DC90
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jan 2020 14:56:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729143AbgAPNyT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 16 Jan 2020 08:54:19 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:36198 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729137AbgAPNyT (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 16 Jan 2020 08:54:19 -0500
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00GDsHZM105219;
        Thu, 16 Jan 2020 07:54:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1579182857;
        bh=+2Oz5p0Ad+TDuTqFLH9s+jjIlOtB6U14VgijKK29Qmo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=DmW9Qh6t9MPinMetfMQxvsLHww0gaFZ4TCtJZdd/PF+f3gHU0j+//sVRr9snAWbFP
         pmjLjK+Y9APouT8jdL7BoSWCwp29I5e4CfwlvPwvIV5Oq1d/M4i6kqE/8ZAv0PNY3D
         6JGm59iAUeJNaU0Ecpb8W2GZtRcWAhjXALr0EGRs=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00GDsHRq102446
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 16 Jan 2020 07:54:17 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Jan 2020 07:54:17 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Jan 2020 07:54:17 -0600
Received: from sokoban.bb.dnainternet.fi (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00GDrqdc048732;
        Thu, 16 Jan 2020 07:54:15 -0600
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <mathieu.poirier@linaro.org>,
        <s-anna@ti.com>, <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>
Subject: [PATCHv5 10/14] remoteproc/omap: Request a timer(s) for remoteproc usage
Date:   Thu, 16 Jan 2020 15:53:28 +0200
Message-ID: <20200116135332.7819-11-t-kristo@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200116135332.7819-1-t-kristo@ti.com>
References: <20200116135332.7819-1-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Suman Anna <s-anna@ti.com>

The remote processors in OMAP4+ SoCs are equipped with internal
timers, like the internal SysTick timer in a Cortex M3/M4 NVIC or
the CTM timer within Unicache in IPU & DSP. However, these timers
are gated when the processor subsystem clock is gated, making
them rather difficult to use as OS tick sources. They will not
be able to wakeup the processor from any processor-sleep induced
clock-gating states.

This can be avoided by using an external timer as the tick source,
which can be controlled independently by the OMAP remoteproc
driver code, but still allowing the processor subsystem clock to
be auto-gated when the remoteproc cores are idle.

This patch adds the support for OMAP remote processors to request
timer(s) to be used by the remoteproc. The timers are enabled and
disabled in line with the enabling/disabling of the remoteproc.
The timer data is not mandatory if the advanced device management
features are not required.

The core timer functionality is provided by the OMAP DMTimer
clocksource driver, which does not export any API. The logic is
implemented through the timer device's platform data ops. The OMAP
remoteproc driver mainly requires ops to request/free a dmtimer,
and to start/stop a timer. The split ops helps in controlling the
timer state without having to request and release a timer everytime
it needs to use the timer.

NOTE: If the gptimer is already in use by the time IPU and/or
DSP are loaded, the processors will fail to boot.

Signed-off-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
v5:
  - small fix in error handling logic for enable timers
  - build failure fix under enable timers (this was only visible with
    compiling the patches sequentially, the failure was masked by patch
    #14 in the series)

 drivers/remoteproc/omap_remoteproc.c | 276 ++++++++++++++++++++++++++-
 1 file changed, 275 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 777231ce2bae..293996af4797 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -26,6 +26,9 @@
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
 #include <linux/reset.h>
+#include <clocksource/timer-ti-dm.h>
+
+#include <linux/platform_data/dmtimer-omap.h>
 
 #include "omap_remoteproc.h"
 #include "remoteproc_internal.h"
@@ -57,6 +60,16 @@ struct omap_rproc_mem {
 	size_t size;
 };
 
+/**
+ * struct omap_rproc_timer - data structure for a timer used by a omap rproc
+ * @odt: timer pointer
+ * @timer_ops: OMAP dmtimer ops for @odt timer
+ */
+struct omap_rproc_timer {
+	struct omap_dm_timer *odt;
+	const struct omap_dm_timer_ops *timer_ops;
+};
+
 /**
  * struct omap_rproc - omap remote processor state
  * @mbox: mailbox channel handle
@@ -64,6 +77,8 @@ struct omap_rproc_mem {
  * @boot_data: boot data structure for setting processor boot address
  * @mem: internal memory regions data
  * @num_mems: number of internal memory regions
+ * @num_timers: number of rproc timer(s)
+ * @timers: timer(s) info used by rproc
  * @rproc: rproc handle
  * @reset: reset handle
  */
@@ -73,6 +88,8 @@ struct omap_rproc {
 	struct omap_rproc_boot_data *boot_data;
 	struct omap_rproc_mem *mem;
 	int num_mems;
+	int num_timers;
+	struct omap_rproc_timer *timers;
 	struct rproc *rproc;
 	struct reset_control *reset;
 };
@@ -97,6 +114,227 @@ struct omap_rproc_dev_data {
 	const struct omap_rproc_mem_data *mems;
 };
 
+/**
+ * omap_rproc_request_timer() - request a timer for a remoteproc
+ * @dev: device requesting the timer
+ * @np: device node pointer to the desired timer
+ * @timer: handle to a struct omap_rproc_timer to return the timer handle
+ *
+ * This helper function is used primarily to request a timer associated with
+ * a remoteproc. The returned handle is stored in the .odt field of the
+ * @timer structure passed in, and is used to invoke other timer specific
+ * ops (like starting a timer either during device initialization or during
+ * a resume operation, or for stopping/freeing a timer).
+ *
+ * Returns 0 on success, otherwise an appropriate failure
+ */
+static int omap_rproc_request_timer(struct device *dev, struct device_node *np,
+				    struct omap_rproc_timer *timer)
+{
+	int ret;
+
+	timer->odt = timer->timer_ops->request_by_node(np);
+	if (!timer->odt) {
+		dev_err(dev, "request for timer node %p failed\n", np);
+		return -EBUSY;
+	}
+
+	ret = timer->timer_ops->set_source(timer->odt, OMAP_TIMER_SRC_SYS_CLK);
+	if (ret) {
+		dev_err(dev, "error setting OMAP_TIMER_SRC_SYS_CLK as source for timer node %p\n",
+			np);
+		timer->timer_ops->free(timer->odt);
+		return ret;
+	}
+
+	/* clean counter, remoteproc code will set the value */
+	timer->timer_ops->set_load(timer->odt, 0, 0);
+
+	return 0;
+}
+
+/**
+ * omap_rproc_start_timer - start a timer for a remoteproc
+ * @timer: handle to a OMAP rproc timer
+ *
+ * This helper function is used to start a timer associated with a remoteproc,
+ * obtained using the request_timer ops. The helper function needs to be
+ * invoked by the driver to start the timer (during device initialization)
+ * or to just resume the timer.
+ *
+ * Returns 0 on success, otherwise a failure as returned by DMTimer ops
+ */
+static inline int omap_rproc_start_timer(struct omap_rproc_timer *timer)
+{
+	return timer->timer_ops->start(timer->odt);
+}
+
+/**
+ * omap_rproc_stop_timer - stop a timer for a remoteproc
+ * @timer: handle to a OMAP rproc timer
+ *
+ * This helper function is used to disable a timer associated with a
+ * remoteproc, and needs to be called either during a device shutdown
+ * or suspend operation. The separate helper function allows the driver
+ * to just stop a timer without having to release the timer during a
+ * suspend operation.
+ *
+ * Returns 0 on success, otherwise a failure as returned by DMTimer ops
+ */
+static inline int omap_rproc_stop_timer(struct omap_rproc_timer *timer)
+{
+	return timer->timer_ops->stop(timer->odt);
+}
+
+/**
+ * omap_rproc_release_timer - release a timer for a remoteproc
+ * @timer: handle to a OMAP rproc timer
+ *
+ * This helper function is used primarily to release a timer associated
+ * with a remoteproc. The dmtimer will be available for other clients to
+ * use once released.
+ *
+ * Returns 0 on success, otherwise a failure as returned by DMTimer ops
+ */
+static inline int omap_rproc_release_timer(struct omap_rproc_timer *timer)
+{
+	return timer->timer_ops->free(timer->odt);
+}
+
+/**
+ * omap_rproc_enable_timers - enable the timers for a remoteproc
+ * @rproc: handle of a remote processor
+ * @configure: boolean flag used to acquire and configure the timer handle
+ *
+ * This function is used primarily to enable the timers associated with
+ * a remoteproc. The configure flag is provided to allow the driver to
+ * to either acquire and start a timer (during device initialization) or
+ * to just start a timer (during a resume operation).
+ */
+static int omap_rproc_enable_timers(struct rproc *rproc, bool configure)
+{
+	int i;
+	int ret = 0;
+	struct platform_device *tpdev;
+	struct dmtimer_platform_data *tpdata;
+	const struct omap_dm_timer_ops *timer_ops;
+	struct omap_rproc *oproc = rproc->priv;
+	struct omap_rproc_timer *timers = oproc->timers;
+	struct device *dev = rproc->dev.parent;
+	struct device_node *np = NULL;
+
+	if (!oproc->num_timers)
+		return 0;
+
+	if (!configure)
+		goto start_timers;
+
+	for (i = 0; i < oproc->num_timers; i++) {
+		np = of_parse_phandle(dev->of_node, "ti,timers", i);
+		if (!np) {
+			ret = -ENXIO;
+			dev_err(dev, "device node lookup for timer at index %d failed: %d\n",
+				i, ret);
+			goto free_timers;
+		}
+
+		tpdev = of_find_device_by_node(np);
+		if (!tpdev) {
+			ret = -ENODEV;
+			dev_err(dev, "could not get timer platform device\n");
+			goto put_node;
+		}
+
+		tpdata = dev_get_platdata(&tpdev->dev);
+		put_device(&tpdev->dev);
+		if (!tpdata) {
+			ret = -EINVAL;
+			dev_err(dev, "dmtimer pdata structure NULL\n");
+			goto put_node;
+		}
+
+		timer_ops = tpdata->timer_ops;
+		if (!timer_ops || !timer_ops->request_by_node ||
+		    !timer_ops->set_source || !timer_ops->set_load ||
+		    !timer_ops->free || !timer_ops->start ||
+		    !timer_ops->stop) {
+			ret = -EINVAL;
+			dev_err(dev, "device does not have required timer ops\n");
+			goto put_node;
+		}
+
+		timers[i].timer_ops = timer_ops;
+		ret = omap_rproc_request_timer(dev, np, &timers[i]);
+		if (ret) {
+			dev_err(dev, "request for timer %p failed: %d\n", np,
+				ret);
+			goto put_node;
+		}
+		of_node_put(np);
+	}
+
+start_timers:
+	for (i = 0; i < oproc->num_timers; i++) {
+		ret = omap_rproc_start_timer(&timers[i]);
+		if (ret) {
+			dev_err(dev, "start timer %p failed failed: %d\n", np,
+				ret);
+			break;
+		}
+	}
+	if (ret) {
+		while (i >= 0) {
+			omap_rproc_stop_timer(&timers[i]);
+			i--;
+		}
+		goto put_node;
+	}
+	return 0;
+
+put_node:
+	if (configure)
+		of_node_put(np);
+free_timers:
+	while (i--) {
+		omap_rproc_release_timer(&timers[i]);
+		timers[i].odt = NULL;
+		timers[i].timer_ops = NULL;
+	}
+
+	return ret;
+}
+
+/**
+ * omap_rproc_disable_timers - disable the timers for a remoteproc
+ * @rproc: handle of a remote processor
+ * @configure: boolean flag used to release the timer handle
+ *
+ * This function is used primarily to disable the timers associated with
+ * a remoteproc. The configure flag is provided to allow the driver to
+ * to either stop and release a timer (during device shutdown) or to just
+ * stop a timer (during a suspend operation).
+ */
+static int omap_rproc_disable_timers(struct rproc *rproc, bool configure)
+{
+	int i;
+	struct omap_rproc *oproc = rproc->priv;
+	struct omap_rproc_timer *timers = oproc->timers;
+
+	if (!oproc->num_timers)
+		return 0;
+
+	for (i = 0; i < oproc->num_timers; i++) {
+		omap_rproc_stop_timer(&timers[i]);
+		if (configure) {
+			omap_rproc_release_timer(&timers[i]);
+			timers[i].odt = NULL;
+			timers[i].timer_ops = NULL;
+		}
+	}
+
+	return 0;
+}
+
 /**
  * omap_rproc_mbox_callback() - inbound mailbox message handler
  * @client: mailbox client pointer used for requesting the mailbox channel
@@ -232,14 +470,22 @@ static int omap_rproc_start(struct rproc *rproc)
 		goto put_mbox;
 	}
 
+	ret = omap_rproc_enable_timers(rproc, true);
+	if (ret) {
+		dev_err(dev, "omap_rproc_enable_timers failed: %d\n", ret);
+		goto put_mbox;
+	}
+
 	ret = reset_control_deassert(oproc->reset);
 	if (ret) {
 		dev_err(dev, "reset control deassert failed: %d\n", ret);
-		goto put_mbox;
+		goto disable_timers;
 	}
 
 	return 0;
 
+disable_timers:
+	omap_rproc_disable_timers(rproc, true);
 put_mbox:
 	mbox_free_channel(oproc->mbox);
 	return ret;
@@ -255,6 +501,10 @@ static int omap_rproc_stop(struct rproc *rproc)
 	if (ret)
 		return ret;
 
+	ret = omap_rproc_disable_timers(rproc, true);
+	if (ret)
+		return ret;
+
 	mbox_free_channel(oproc->mbox);
 
 	return 0;
@@ -523,6 +773,30 @@ static int omap_rproc_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 
+	/*
+	 * Timer nodes are directly used in client nodes as phandles, so
+	 * retrieve the count using appropriate size
+	 */
+	oproc->num_timers = of_count_phandle_with_args(np, "ti,timers", NULL);
+	if (oproc->num_timers <= 0) {
+		dev_dbg(&pdev->dev, "device does not have timers, status = %d\n",
+			oproc->num_timers);
+		oproc->num_timers = 0;
+	}
+
+	if (oproc->num_timers) {
+		oproc->timers = devm_kcalloc(&pdev->dev, oproc->num_timers,
+					     sizeof(*oproc->timers),
+					     GFP_KERNEL);
+		if (!oproc->timers) {
+			ret = -ENOMEM;
+			goto free_rproc;
+		}
+
+		dev_dbg(&pdev->dev, "device has %d tick timers\n",
+			oproc->num_timers);
+	}
+
 	ret = of_reserved_mem_device_init(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "device does not have specific CMA pool\n");
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
