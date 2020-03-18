Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD9A518A903
	for <lists+linux-omap@lfdr.de>; Thu, 19 Mar 2020 00:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbgCRXJn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Mar 2020 19:09:43 -0400
Received: from muru.com ([72.249.23.125]:60816 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726647AbgCRXJn (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Mar 2020 19:09:43 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 0914280B6;
        Wed, 18 Mar 2020 23:10:27 +0000 (UTC)
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
Subject: [PATCH 1/3] Input: atmel_mxt_ts - use runtime PM instead of custom functions
Date:   Wed, 18 Mar 2020 16:09:36 -0700
Message-Id: <20200318230938.31573-1-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's use standard runtime PM functions instead of custom start and stop
functions. This way we can implement runtime idle mode using runtime PM
autosuspend in the following patches.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/input/touchscreen/atmel_mxt_ts.c | 134 ++++++++++++++---------
 1 file changed, 85 insertions(+), 49 deletions(-)

diff --git a/drivers/input/touchscreen/atmel_mxt_ts.c b/drivers/input/touchscreen/atmel_mxt_ts.c
--- a/drivers/input/touchscreen/atmel_mxt_ts.c
+++ b/drivers/input/touchscreen/atmel_mxt_ts.c
@@ -21,6 +21,7 @@
 #include <linux/input/mt.h>
 #include <linux/interrupt.h>
 #include <linux/of.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/slab.h>
 #include <linux/gpio/consumer.h>
@@ -2927,58 +2928,27 @@ static const struct attribute_group mxt_attr_group = {
 	.attrs = mxt_attrs,
 };
 
-static void mxt_start(struct mxt_data *data)
+static int mxt_input_open(struct input_dev *input_dev)
 {
-	switch (data->suspend_mode) {
-	case MXT_SUSPEND_T9_CTRL:
-		mxt_soft_reset(data);
-
-		/* Touch enable */
-		/* 0x83 = SCANEN | RPTEN | ENABLE */
-		mxt_write_object(data,
-				MXT_TOUCH_MULTI_T9, MXT_T9_CTRL, 0x83);
-		break;
-
-	case MXT_SUSPEND_DEEP_SLEEP:
-	default:
-		mxt_set_t7_power_cfg(data, MXT_POWER_CFG_RUN);
-
-		/* Recalibrate since chip has been in deep sleep */
-		mxt_t6_command(data, MXT_COMMAND_CALIBRATE, 1, false);
-		break;
-	}
-}
-
-static void mxt_stop(struct mxt_data *data)
-{
-	switch (data->suspend_mode) {
-	case MXT_SUSPEND_T9_CTRL:
-		/* Touch disable */
-		mxt_write_object(data,
-				MXT_TOUCH_MULTI_T9, MXT_T9_CTRL, 0);
-		break;
+	struct mxt_data *data = input_get_drvdata(input_dev);
+	struct device *dev = &data->client->dev;
+	int error;
 
-	case MXT_SUSPEND_DEEP_SLEEP:
-	default:
-		mxt_set_t7_power_cfg(data, MXT_POWER_CFG_DEEPSLEEP);
-		break;
+	error = pm_runtime_get_sync(dev);
+	if (error < 0) {
+		pm_runtime_put_noidle(dev);
+		return error;
 	}
-}
-
-static int mxt_input_open(struct input_dev *dev)
-{
-	struct mxt_data *data = input_get_drvdata(dev);
-
-	mxt_start(data);
 
 	return 0;
 }
 
-static void mxt_input_close(struct input_dev *dev)
+static void mxt_input_close(struct input_dev *input_dev)
 {
-	struct mxt_data *data = input_get_drvdata(dev);
+	struct mxt_data *data = input_get_drvdata(input_dev);
+	struct device *dev = &data->client->dev;
 
-	mxt_stop(data);
+	pm_runtime_put_sync(dev);
 }
 
 static int mxt_parse_device_properties(struct mxt_data *data)
@@ -3036,6 +3006,7 @@ static const struct dmi_system_id chromebook_T9_suspend_dmi[] = {
 static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 {
 	struct mxt_data *data;
+	struct device *dev;
 	int error;
 
 	/*
@@ -3070,6 +3041,7 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	snprintf(data->phys, sizeof(data->phys), "i2c-%u-%04x/input0",
 		 client->adapter->nr, client->addr);
 
+	dev = &client->dev;
 	data->client = client;
 	data->irq = client->irq;
 	i2c_set_clientdata(client, data);
@@ -3109,20 +3081,23 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 		msleep(MXT_RESET_INVALID_CHG);
 	}
 
+	pm_runtime_enable(dev);
+
 	error = mxt_initialize(data);
 	if (error)
-		return error;
+		goto err_disable;
 
 	error = sysfs_create_group(&client->dev.kobj, &mxt_attr_group);
 	if (error) {
 		dev_err(&client->dev, "Failure %d creating sysfs group\n",
 			error);
-		goto err_free_object;
+		goto err_disable;
 	}
 
 	return 0;
 
-err_free_object:
+err_disable:
+	pm_runtime_disable(dev);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
 	return error;
@@ -3131,11 +3106,69 @@ static int mxt_probe(struct i2c_client *client, const struct i2c_device_id *id)
 static int mxt_remove(struct i2c_client *client)
 {
 	struct mxt_data *data = i2c_get_clientdata(client);
+	struct device *dev = &data->client->dev;
 
 	disable_irq(data->irq);
 	sysfs_remove_group(&client->dev.kobj, &mxt_attr_group);
 	mxt_free_input_device(data);
 	mxt_free_object_table(data);
+	pm_runtime_disable(dev);
+
+	return 0;
+}
+
+static int __maybe_unused mxt_runtime_suspend(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct mxt_data *data = i2c_get_clientdata(client);
+	struct input_dev *input_dev = data->input_dev;
+
+	if (!input_dev)
+		return 0;
+
+	switch (data->suspend_mode) {
+	case MXT_SUSPEND_T9_CTRL:
+		/* Touch disable */
+		mxt_write_object(data,
+				 MXT_TOUCH_MULTI_T9, MXT_T9_CTRL, 0);
+		break;
+
+	case MXT_SUSPEND_DEEP_SLEEP:
+	default:
+		mxt_set_t7_power_cfg(data, MXT_POWER_CFG_DEEPSLEEP);
+		break;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused mxt_runtime_resume(struct device *dev)
+{
+	struct i2c_client *client = to_i2c_client(dev);
+	struct mxt_data *data = i2c_get_clientdata(client);
+	struct input_dev *input_dev = data->input_dev;
+
+	if (!input_dev)
+		return 0;
+
+	switch (data->suspend_mode) {
+	case MXT_SUSPEND_T9_CTRL:
+		mxt_soft_reset(data);
+
+		/* Touch enable */
+		/* 0x83 = SCANEN | RPTEN | ENABLE */
+		mxt_write_object(data,
+				 MXT_TOUCH_MULTI_T9, MXT_T9_CTRL, 0x83);
+		break;
+
+	case MXT_SUSPEND_DEEP_SLEEP:
+	default:
+		mxt_set_t7_power_cfg(data, MXT_POWER_CFG_RUN);
+
+		/* Recalibrate since chip has been in deep sleep */
+		mxt_t6_command(data, MXT_COMMAND_CALIBRATE, 1, false);
+		break;
+	}
 
 	return 0;
 }
@@ -3152,7 +3185,7 @@ static int __maybe_unused mxt_suspend(struct device *dev)
 	mutex_lock(&input_dev->mutex);
 
 	if (input_dev->users)
-		mxt_stop(data);
+		mxt_runtime_suspend(dev);
 
 	mutex_unlock(&input_dev->mutex);
 
@@ -3175,14 +3208,17 @@ static int __maybe_unused mxt_resume(struct device *dev)
 	mutex_lock(&input_dev->mutex);
 
 	if (input_dev->users)
-		mxt_start(data);
+		mxt_runtime_resume(dev);
 
 	mutex_unlock(&input_dev->mutex);
 
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(mxt_pm_ops, mxt_suspend, mxt_resume);
+const struct dev_pm_ops mxt_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mxt_suspend, mxt_resume)
+	SET_RUNTIME_PM_OPS(mxt_runtime_suspend, mxt_runtime_resume, NULL)
+};
 
 static const struct of_device_id mxt_of_match[] = {
 	{ .compatible = "atmel,maxtouch", },
-- 
2.25.1
