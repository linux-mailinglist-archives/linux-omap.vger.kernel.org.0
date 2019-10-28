Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 717F6E71C4
	for <lists+linux-omap@lfdr.de>; Mon, 28 Oct 2019 13:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389415AbfJ1Mn1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Oct 2019 08:43:27 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:46302 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389382AbfJ1MnZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Oct 2019 08:43:25 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9SChN9Q047834;
        Mon, 28 Oct 2019 07:43:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572266603;
        bh=ObxkZR5S8p6PF891MPqgpe6CFyxBPc2I0M1HLauGAGg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=qpz6p7IuON0egvY4FHVW22JOh3mqCXOUGyJmV/yoWUoLbypHaAct/YNuDsZr4CiLm
         qq2/IE4uSfB2N1WLsEaWHJbhHHGTNv6nQmi/EcGnIoOGKXyXmIixCL1vuqNi2oo5jT
         QOjJZQMOeoNk8trNbgWeKXedX88jVLS+BO7G8nDk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9SChN2Y069706
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 28 Oct 2019 07:43:23 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 28
 Oct 2019 07:43:11 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 28 Oct 2019 07:43:11 -0500
Received: from sokoban.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9SCgoh6063574;
        Mon, 28 Oct 2019 07:43:21 -0500
From:   Tero Kristo <t-kristo@ti.com>
To:     <bjorn.andersson@linaro.org>, <ohad@wizery.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <s-anna@ti.com>, Tero Kristo <t-kristo@ti.com>
Subject: [PATCH 14/17] remoteproc/omap: add support for runtime auto-suspend/resume
Date:   Mon, 28 Oct 2019 14:42:35 +0200
Message-ID: <20191028124238.19224-15-t-kristo@ti.com>
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

This patch enhances the PM support in the OMAP remoteproc driver to
support the runtime auto-suspend. A remoteproc may not be required to
be running all the time, and typically will need to be active only
during certain usecases. As such, to save power, it should be turned
off during potential long periods of inactivity between usecases.
This suspend and resume of the device is a relatively heavy process
in terms of latencies, so a remoteproc should be suspended only after
a certain period of prolonged inactivity. The OMAP remoteproc driver
leverages the runtime pm framework's auto_suspend feature to accomplish
this functionality. This feature is automatically enabled when a remote
processor has successfully booted. The 'autosuspend_delay_ms' for each
device dictates the inactivity period/time to wait for before
suspending the device.

The runtime auto-suspend design relies on marking the last busy time
on every communication (virtqueue kick) to and from the remote processor.
When there has been no activity for 'autosuspend_delay_ms' time, the
runtime PM framework invokes the driver's runtime pm suspend callback
to suspend the device. The remote processor will be woken up on the
initiation of the next communication message through the runtime pm
resume callback. The current auto-suspend design also allows a remote
processor to deny a auto-suspend attempt, if it wishes to, by sending a
NACK response to the initial suspend request message sent to the remote
processor as part of the suspend process. The auto-suspend request is
also only attempted if the remote processor is idled and in standby at
the time of inactivity timer expiry. This choice is made to avoid
unnecessary messaging, and the auto-suspend is simply rescheduled to
be attempted again after a further lapse of autosuspend_delay_ms.

The runtime pm callbacks functionality in this patch reuses most of the
core logic from the suspend/resume support code, and make use of an
additional auto_suspend flag to differentiate the logic in common code
from system suspend. The system suspend/resume sequences are also updated
to reflect the proper pm_runtime statuses, and also to really perform a
suspend/resume only if the remoteproc has not been auto-suspended at the
time of request. The remote processor is left in suspended state on a
system resume if it has been auto-suspended before, and will be woken up
only when a usecase needs to run. The other significant change in this
patch is to reset the remoteproc device's pm_domain so as to avoid
conflicts with the ordering sequences in the device pm_domain's runtime
callbacks and the reset management and clock management implemented
within the runtime callbacks in the driver.

The OMAP remoteproc driver currently uses a default value of 10 seconds
for all OMAP remoteprocs, and a different value can be chosen either by
choosing a positive value for the 'autosuspend_delay' in the device's
omap_rproc_fw_data in the driver match data or by updating the
'autosuspend_delay_ms' field at runtime through the sysfs interface.
    Eg: To use 25 seconds for IPU2 on DRA7xx,
      echo 25000 > /sys/bus/platform/devices/55020000.ipu/power/autosuspend_delay_ms

The runtime suspend feature can also be similarly enabled or disabled by
writing 'auto' or 'on' to the device's 'control' power field. The default
is enabled.
    Eg: To disable auto-suspend for IPU2 on DRA7xx SoC,
      echo on > /sys/bus/platform/devices/55020000.ipu/power/control

Signed-off-by: Suman Anna <s-anna@ti.com>
[t-kristo@ti.com: converted to use ti-sysc instead of hwmod]
Signed-off-by: Tero Kristo <t-kristo@ti.com>
---
 drivers/remoteproc/omap_remoteproc.c | 228 ++++++++++++++++++++++++++-
 1 file changed, 222 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
index 410bf1b56e93..8bd415c8fc86 100644
--- a/drivers/remoteproc/omap_remoteproc.c
+++ b/drivers/remoteproc/omap_remoteproc.c
@@ -21,6 +21,7 @@
 #include <linux/of_address.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/dma-mapping.h>
 #include <linux/remoteproc.h>
 #include <linux/mailbox_client.h>
@@ -41,6 +42,9 @@
 #define OMAP_RPROC_DSP_LOCAL_MEM_OFFSET		(0x00800000)
 #define OMAP_RPROC_IPU_L2RAM_DEV_ADDR		(0x20000000)
 
+/* default auto-suspend delay (ms) */
+#define DEFAULT_AUTOSUSPEND_DELAY		10000
+
 /**
  * struct omap_rproc_boot_data - boot data structure for the DSP omap rprocs
  * @syscon: regmap handle for the system control configuration module
@@ -87,6 +91,8 @@ struct omap_rproc_timer {
  * @num_mems: number of internal memory regions
  * @num_timers: number of rproc timer(s)
  * @timers: timer(s) info used by rproc
+ * @autosuspend_delay: auto-suspend delay value to be used for runtime pm
+ * @need_resume: if true a resume is needed in the system resume callback
  * @rproc: rproc handle
  * @reset: reset handle
  * @pm_comp: completion primitive to sync for suspend response
@@ -101,6 +107,8 @@ struct omap_rproc {
 	int num_mems;
 	int num_timers;
 	struct omap_rproc_timer *timers;
+	int autosuspend_delay;
+	bool need_resume;
 	struct rproc *rproc;
 	struct reset_control *reset;
 	struct completion pm_comp;
@@ -112,10 +120,12 @@ struct omap_rproc {
  * struct omap_rproc_dev_data - device data for the omap remote processor
  * @device_name: device name of the remote processor
  * @fw_name: firmware name to use
+ * @autosuspend_delay: custom auto-suspend delay value in milliseconds
  */
 struct omap_rproc_dev_data {
 	const char *device_name;
 	const char *fw_name;
+	int autosuspend_delay;
 };
 
 /**
@@ -381,11 +391,23 @@ static void omap_rproc_kick(struct rproc *rproc, int vqid)
 	struct device *dev = rproc->dev.parent;
 	int ret;
 
+	/* wake up the rproc before kicking it */
+	ret = pm_runtime_get_sync(dev);
+	if (WARN_ON(ret < 0)) {
+		dev_err(dev, "pm_runtime_get_sync() failed during kick, ret = %d\n",
+			ret);
+		pm_runtime_put_noidle(dev);
+		return;
+	}
+
 	/* send the index of the triggered virtqueue in the mailbox payload */
 	ret = mbox_send_message(oproc->mbox, (void *)vqid);
 	if (ret < 0)
 		dev_err(dev, "failed to send mailbox message, status = %d\n",
 			ret);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 }
 
 /**
@@ -470,6 +492,19 @@ static int omap_rproc_start(struct rproc *rproc)
 		goto put_mbox;
 	}
 
+	/*
+	 * remote processor is up, so update the runtime pm status and
+	 * enable the auto-suspend. The device usage count is incremented
+	 * manually for balancing it for auto-suspend
+	 */
+	pm_runtime_set_active(dev);
+	pm_runtime_set_autosuspend_delay(dev, oproc->autosuspend_delay);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_get(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
 	reset_control_deassert(oproc->reset);
 
 	return 0;
@@ -482,9 +517,26 @@ static int omap_rproc_start(struct rproc *rproc)
 /* power off the remote processor */
 static int omap_rproc_stop(struct rproc *rproc)
 {
+	struct device *dev = rproc->dev.parent;
 	struct omap_rproc *oproc = rproc->priv;
 	int ret;
 
+	/*
+	 * cancel any possible scheduled runtime suspend by incrementing
+	 * the device usage count, and resuming the device. The remoteproc
+	 * also needs to be woken up if suspended, to avoid the remoteproc
+	 * OS to continue to remember any context that it has saved, and
+	 * avoid potential issues in misindentifying a subsequent device
+	 * reboot as a power restore boot
+	 */
+	ret = pm_runtime_get_sync(dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(dev);
+		return ret;
+	}
+
+	pm_runtime_put_sync(dev);
+
 	reset_control_assert(oproc->reset);
 
 	ret = omap_rproc_disable_timers(rproc, true);
@@ -493,6 +545,15 @@ static int omap_rproc_stop(struct rproc *rproc)
 
 	mbox_free_channel(oproc->mbox);
 
+	/*
+	 * update the runtime pm states and status now that the remoteproc
+	 * has stopped
+	 */
+	pm_runtime_disable(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_put_noidle(dev);
+	pm_runtime_set_suspended(dev);
+
 	return 0;
 }
 
@@ -545,17 +606,19 @@ static bool _is_rproc_in_standby(struct omap_rproc *oproc)
 
 /* 1 sec is long enough time to let the remoteproc side suspend the device */
 #define DEF_SUSPEND_TIMEOUT 1000
-static int _omap_rproc_suspend(struct rproc *rproc)
+static int _omap_rproc_suspend(struct rproc *rproc, bool auto_suspend)
 {
 	struct device *dev = rproc->dev.parent;
 	struct omap_rproc *oproc = rproc->priv;
 	unsigned long to = msecs_to_jiffies(DEF_SUSPEND_TIMEOUT);
 	unsigned long ta = jiffies + to;
+	u32 suspend_msg = auto_suspend ?
+				RP_MBOX_SUSPEND_AUTO : RP_MBOX_SUSPEND_SYSTEM;
 	int ret;
 
 	reinit_completion(&oproc->pm_comp);
 	oproc->suspend_acked = false;
-	ret = mbox_send_message(oproc->mbox, (void *)RP_MBOX_SUSPEND_SYSTEM);
+	ret = mbox_send_message(oproc->mbox, (void *)suspend_msg);
 	if (ret < 0) {
 		dev_err(dev, "PM mbox_send_message failed: %d\n", ret);
 		return ret;
@@ -595,25 +658,55 @@ static int _omap_rproc_suspend(struct rproc *rproc)
 		goto enable_device;
 	}
 
+	/*
+	 * IOMMUs would have to be disabled specifically for runtime suspend.
+	 * They are handled automatically through System PM callbacks for
+	 * regular system suspend
+	 */
+	if (auto_suspend) {
+		ret = omap_iommu_domain_deactivate(rproc->domain);
+		if (ret) {
+			dev_err(dev, "iommu domain deactivate failed %d\n",
+				ret);
+			goto enable_timers;
+		}
+	}
+
 	return 0;
+enable_timers:
+	/* ignore errors on re-enabling code */
+	omap_rproc_enable_timers(rproc, false);
 
 enable_device:
 	reset_control_deassert(oproc->reset);
 	return ret;
 }
 
-static int _omap_rproc_resume(struct rproc *rproc)
+static int _omap_rproc_resume(struct rproc *rproc, bool auto_suspend)
 {
 	struct device *dev = rproc->dev.parent;
 	struct omap_rproc *oproc = rproc->priv;
 	int ret;
 
+	/*
+	 * IOMMUs would have to be enabled specifically for runtime resume.
+	 * They would have been already enabled automatically through System
+	 * PM callbacks for regular system resume
+	 */
+	if (auto_suspend) {
+		ret = omap_iommu_domain_activate(rproc->domain);
+		if (ret) {
+			dev_err(dev, "omap_iommu activate failed %d\n", ret);
+			goto out;
+		}
+	}
+
 	/* boot address could be lost after suspend, so restore it */
 	if (oproc->boot_data) {
 		ret = omap_rproc_write_dsp_boot_addr(rproc);
 		if (ret) {
 			dev_err(dev, "boot address restore failed %d\n", ret);
-			goto out;
+			goto suspend_iommu;
 		}
 	}
 
@@ -626,6 +719,12 @@ static int _omap_rproc_resume(struct rproc *rproc)
 
 	reset_control_deassert(oproc->reset);
 
+	return 0;
+
+suspend_iommu:
+	if (auto_suspend)
+		omap_iommu_domain_deactivate(rproc->domain);
+
 out:
 	return ret;
 }
@@ -634,6 +733,7 @@ static int __maybe_unused omap_rproc_suspend(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct rproc *rproc = platform_get_drvdata(pdev);
+	struct omap_rproc *oproc = rproc->priv;
 	int ret = 0;
 
 	mutex_lock(&rproc->lock);
@@ -648,13 +748,25 @@ static int __maybe_unused omap_rproc_suspend(struct device *dev)
 		goto out;
 	}
 
-	ret = _omap_rproc_suspend(rproc);
+	ret = _omap_rproc_suspend(rproc, false);
 	if (ret) {
 		dev_err(dev, "suspend failed %d\n", ret);
 		goto out;
 	}
 
+	/*
+	 * remoteproc is running at the time of system suspend, so remember
+	 * it so as to wake it up during system resume
+	 */
+	oproc->need_resume = 1;
 	rproc->state = RPROC_SUSPENDED;
+
+	/*
+	 * update the runtime pm status to be suspended, without decrementing
+	 * the device usage count
+	 */
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
 out:
 	mutex_unlock(&rproc->lock);
 	return ret;
@@ -664,6 +776,7 @@ static int __maybe_unused omap_rproc_resume(struct device *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev);
 	struct rproc *rproc = platform_get_drvdata(pdev);
+	struct omap_rproc *oproc = rproc->priv;
 	int ret = 0;
 
 	mutex_lock(&rproc->lock);
@@ -675,17 +788,86 @@ static int __maybe_unused omap_rproc_resume(struct device *dev)
 		goto out;
 	}
 
-	ret = _omap_rproc_resume(rproc);
+	/*
+	 * remoteproc was auto-suspended at the time of system suspend,
+	 * so no need to wake-up the processor (leave it in suspended
+	 * state, will be woken up during a subsequent runtime_resume)
+	 */
+	if (!oproc->need_resume)
+		goto out;
+
+	ret = _omap_rproc_resume(rproc, false);
 	if (ret) {
 		dev_err(dev, "resume failed %d\n", ret);
 		goto out;
 	}
+	oproc->need_resume = false;
 
 	rproc->state = RPROC_RUNNING;
+
+	/*
+	 * update the runtime pm status to be active, without incrementing
+	 * the device usage count
+	 */
+	pm_runtime_set_active(dev);
+	pm_runtime_enable(dev);
+	pm_runtime_mark_last_busy(dev);
 out:
 	mutex_unlock(&rproc->lock);
 	return ret;
 }
+
+static int omap_rproc_runtime_suspend(struct device *dev)
+{
+	struct rproc *rproc = dev_get_drvdata(dev);
+	struct omap_rproc *oproc = rproc->priv;
+	int ret;
+
+	if (WARN_ON(rproc->state != RPROC_RUNNING)) {
+		dev_err(dev, "rproc cannot be runtime suspended when not running!\n");
+		return -EBUSY;
+	}
+
+	/*
+	 * do not even attempt suspend if the remote processor is not
+	 * idled for runtime auto-suspend
+	 */
+	if (!_is_rproc_in_standby(oproc)) {
+		ret = -EBUSY;
+		goto abort;
+	}
+
+	ret = _omap_rproc_suspend(rproc, true);
+	if (ret)
+		goto abort;
+
+	rproc->state = RPROC_SUSPENDED;
+	return 0;
+
+abort:
+	pm_runtime_mark_last_busy(dev);
+	return ret;
+}
+
+static int omap_rproc_runtime_resume(struct device *dev)
+{
+	struct rproc *rproc = dev_get_drvdata(dev);
+	int ret;
+
+	if (WARN_ON(rproc->state != RPROC_SUSPENDED)) {
+		dev_err(dev, "rproc cannot be runtime resumed if not suspended!\n");
+		return -EBUSY;
+	}
+
+	ret = _omap_rproc_resume(rproc, true);
+	if (ret) {
+		dev_err(dev, "runtime resume failed %d\n", ret);
+		return ret;
+	}
+
+	rproc->state = RPROC_RUNNING;
+	return 0;
+}
 #endif /* CONFIG_PM */
 
 static const struct omap_rproc_dev_data omap4_dsp_dev_data = {
@@ -761,6 +943,33 @@ static const struct of_device_id omap_rproc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, omap_rproc_of_match);
 
+static int omap_rproc_get_autosuspend_delay(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	const struct omap_rproc_dev_data *data;
+	int delay = -EINVAL;
+
+	data = of_device_get_match_data(&pdev->dev);
+	if (!data)
+		return -ENODEV;
+
+	if (!of_device_is_compatible(np, "ti,dra7-dsp") &&
+	    !of_device_is_compatible(np, "ti,dra7-ipu")) {
+		delay = data->autosuspend_delay;
+		goto out;
+	}
+
+	for (; data && data->device_name; data++) {
+		if (!strcmp(dev_name(&pdev->dev), data->device_name)) {
+			delay = data->autosuspend_delay;
+			break;
+		}
+	}
+
+out:
+	return (delay > 0) ? delay : DEFAULT_AUTOSUSPEND_DELAY;
+}
+
 static const char *omap_rproc_get_firmware(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -973,6 +1182,11 @@ static int omap_rproc_probe(struct platform_device *pdev)
 	}
 
 	init_completion(&oproc->pm_comp);
+	oproc->autosuspend_delay = omap_rproc_get_autosuspend_delay(pdev);
+	if (oproc->autosuspend_delay < 0) {
+		ret = oproc->autosuspend_delay;
+		goto free_rproc;
+	}
 
 	oproc->fck = of_clk_get(np, 0);
 	if (IS_ERR(oproc->fck)) {
@@ -1015,6 +1229,8 @@ static int omap_rproc_remove(struct platform_device *pdev)
 
 static const struct dev_pm_ops omap_rproc_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(omap_rproc_suspend, omap_rproc_resume)
+	SET_RUNTIME_PM_OPS(omap_rproc_runtime_suspend,
+			   omap_rproc_runtime_resume, NULL)
 };
 
 static struct platform_driver omap_rproc_driver = {
-- 
2.17.1

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
