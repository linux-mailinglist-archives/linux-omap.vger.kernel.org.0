Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E20518A90A
	for <lists+linux-omap@lfdr.de>; Thu, 19 Mar 2020 00:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727308AbgCRXJq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Mar 2020 19:09:46 -0400
Received: from muru.com ([72.249.23.125]:60846 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727283AbgCRXJq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Mar 2020 19:09:46 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 5EA3981AC;
        Wed, 18 Mar 2020 23:10:31 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Nick Dyer <nick@shmanahar.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Henrik Rydberg <rydberg@bitmath.org>,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH 3/3] Input: atmel_mxt_ts - use runtime PM autosuspend for idle config
Date:   Wed, 18 Mar 2020 16:09:38 -0700
Message-Id: <20200318230938.31573-3-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318230938.31573-1-tony@atomide.com>
References: <20200318230938.31573-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's enable runtime PM autosuspend with a default value of 600 ms and
switch to idle power config for runtime_suspend. The autosuspend timeout
can also be configured also via userspace with value of -1 disabling the
autosuspend.

Let's only allow autosuspend if MXT_SUSPEND_T9_CTRL is not configured for
suspend_mode as MXT_SUSPEND_T9_CTRL mode powers off the controller.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 76 ++++++++++++++++++++----
 1 file changed, 66 insertions(+), 10 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -1140,21 +1140,26 @@ static irqreturn_t mxt_process_messages(struct mxt_data *data)
 static irqreturn_t mxt_interrupt(int irq, void *dev_id)
 {
 	struct mxt_data *data = dev_id;
+	irqreturn_t ret = IRQ_HANDLED;
 
 	if (data->in_bootloader) {
 		/* bootloader state transition completion */
 		complete(&data->bl_completion);
-		return IRQ_HANDLED;
+		goto out_done;
 	}
 
 	if (!data->object_table)
-		return IRQ_HANDLED;
+		goto out_done;
 
-	if (data->T44_address) {
-		return mxt_process_messages_t44(data);
-	} else {
-		return mxt_process_messages(data);
-	}
+	if (data->T44_address)
+		ret = mxt_process_messages_t44(data);
+	else
+		ret = mxt_process_messages(data);
+
+out_done:
+	pm_runtime_mark_last_busy(&data->client->dev);
+
+	return ret;
 }
 
 static int mxt_t6_command(struct mxt_data *data, u16 cmd_offset,
@@ -2957,6 +2962,16 @@ static int mxt_input_open(struct input_dev *input_dev)
 		return error;
 	}
 
+	/*
+	 * Prevent autoidle if MXT_SUSPEND_T9_CTRL is the default as it will
+	 * power off the controller. Balanced inmxt_input_close().
+	 */
+	if (data->suspend_mode == MXT_SUSPEND_T9_CTRL)
+		pm_runtime_get(dev);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
 	return 0;
 }
 
@@ -2964,8 +2979,21 @@ static void mxt_input_close(struct input_dev *input_dev)
 {
 	struct mxt_data *data = input_get_drvdata(input_dev);
 	struct device *dev = &data->client->dev;
+	int error;
 
-	pm_runtime_put_sync(dev);
+	/* Release extra usage count for MXT_SUSPEND_T9_CTRL done in open */
+	if (data->suspend_mode == MXT_SUSPEND_T9_CTRL)
+		pm_runtime_put(dev);
+
+	/* Wake the device so autosuspend sees correct input_dev->users */
+	error = pm_runtime_get_sync(dev);
+	if (error < 0) {
+		pm_runtime_put_noidle(dev);
+		return;
+	}
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
 }
 
 static int mxt_parse_device_properties(struct mxt_data *data)
@@ -3099,6 +3127,14 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	}
 
 	pm_runtime_enable(dev);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_set_autosuspend_delay(dev, 600);
+	error = pm_runtime_get_sync(dev);
+	if (error < 0) {
+		pm_runtime_put_noidle(dev);
+		return error;
+	}
+
 
 	error = mxt_initialize(data);
 	if (error)
@@ -3111,9 +3147,14 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		goto err_disable;
 	}
 
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
 	return 0;
 
 err_disable:
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_put_sync(dev);
 	pm_runtime_disable(dev);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
@@ -3124,12 +3165,24 @@ static int mxt_remove(struct i2c_client *client)
 {
 	struct mxt_data *data = i2c_get_clientdata(client);
 	struct device *dev = &data->client->dev;
+	int active;
+
+	/* Attempt to change controller suspend mode to disable on remove */
+	active = pm_runtime_get_sync(dev);
+	if (active < 0)
+		pm_runtime_put_noidle(dev);
+	else
+		data->suspend_mode = MXT_SUSPEND_T9_CTRL;
+
+	pm_runtime_dont_use_autosuspend(dev);
+	if (active >= 0)
+		pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
 
 	disable_irq(data->irq);
 	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
-	pm_runtime_disable(dev);
 
 	return 0;
 }
@@ -3152,7 +3205,10 @@ static int __maybe_unused mxt_runtime_suspend(struct device *dev)
 
 	case MXT_SUSPEND_DEEP_SLEEP:
 	default:
-		mxt_set_t7_power_cfg(data, MXT_POWER_CFG_DEEPSLEEP);
+		if (input_dev->users)
+			mxt_set_t7_power_cfg(data, MXT_POWER_CFG_IDLE);
+		else
+			mxt_set_t7_power_cfg(data, MXT_POWER_CFG_DEEPSLEEP);
 		break;
 	}
 
-- 
2.25.1
