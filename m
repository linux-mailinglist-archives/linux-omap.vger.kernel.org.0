Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6816D2EBE24
	for <lists+linux-omap@lfdr.de>; Wed,  6 Jan 2021 14:01:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbhAFM7X (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Jan 2021 07:59:23 -0500
Received: from muru.com ([72.249.23.125]:41042 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727246AbhAFM7X (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 6 Jan 2021 07:59:23 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 9EC9E8164;
        Wed,  6 Jan 2021 12:59:01 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 4/4] Input: omap4-keypad - simplify probe with devm
Date:   Wed,  6 Jan 2021 14:58:22 +0200
Message-Id: <20210106125822.31315-5-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210106125822.31315-1-tony@atomide.com>
References: <20210106125822.31315-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Simplify probe with devm.

Cc: Arthur Demchenkov <spinal.by@gmail.com>
Cc: Carl Philipp Klemm <philipp@uvos.xyz>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: ruleh <ruleh@gmx.de>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/input/keyboard/omap4-keypad.c | 81 ++++++++++-----------------
 1 file changed, 30 insertions(+), 51 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -341,7 +341,8 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	keypad_data = kzalloc(sizeof(struct omap4_keypad), GFP_KERNEL);
+	keypad_data = devm_kzalloc(&pdev->dev, sizeof(struct omap4_keypad),
+				   GFP_KERNEL);
 	if (!keypad_data) {
 		dev_err(&pdev->dev, "keypad_data memory allocation failed\n");
 		return -ENOMEM;
@@ -352,20 +353,20 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 
 	error = omap4_keypad_parse_dt(&pdev->dev, keypad_data);
 	if (error)
-		goto err_free_keypad;
+		return error;
 
-	res = request_mem_region(res->start, resource_size(res), pdev->name);
+	res = devm_request_mem_region(&pdev->dev, res->start,
+				      resource_size(res), pdev->name);
 	if (!res) {
 		dev_err(&pdev->dev, "can't request mem region\n");
-		error = -EBUSY;
-		goto err_free_keypad;
+		return -EBUSY;
 	}
 
-	keypad_data->base = ioremap(res->start, resource_size(res));
+	keypad_data->base = devm_ioremap(&pdev->dev, res->start,
+					 resource_size(res));
 	if (!keypad_data->base) {
 		dev_err(&pdev->dev, "can't ioremap mem resource\n");
-		error = -ENOMEM;
-		goto err_release_mem;
+		return -ENOMEM;
 	}
 
 	pm_runtime_use_autosuspend(&pdev->dev);
@@ -379,20 +380,19 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	error = pm_runtime_get_sync(&pdev->dev);
 	if (error) {
 		dev_err(&pdev->dev, "pm_runtime_get_sync() failed\n");
-		pm_runtime_put_noidle(&pdev->dev);
-	} else {
-		error = omap4_keypad_check_revision(&pdev->dev,
-						    keypad_data);
-		if (!error) {
-			/* Ensure device does not raise interrupts */
-			omap4_keypad_stop(keypad_data);
-		}
+		return error;
 	}
+
+	error = omap4_keypad_check_revision(&pdev->dev,
+					    keypad_data);
 	if (error)
 		goto err_pm_disable;
 
+	/* Ensure device does not raise interrupts */
+	omap4_keypad_stop(keypad_data);
+
 	/* input device allocation */
-	keypad_data->input = input_dev = input_allocate_device();
+	keypad_data->input = input_dev = devm_input_allocate_device(&pdev->dev);
 	if (!input_dev) {
 		error = -ENOMEM;
 		goto err_pm_disable;
@@ -416,13 +416,13 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 
 	keypad_data->row_shift = get_count_order(keypad_data->cols);
 	max_keys = keypad_data->rows << keypad_data->row_shift;
-	keypad_data->keymap = kcalloc(max_keys,
-				      sizeof(keypad_data->keymap[0]),
-				      GFP_KERNEL);
+	keypad_data->keymap = devm_kcalloc(&pdev->dev, max_keys,
+					   sizeof(keypad_data->keymap[0]),
+					   GFP_KERNEL);
 	if (!keypad_data->keymap) {
 		dev_err(&pdev->dev, "Not enough memory for keymap\n");
 		error = -ENOMEM;
-		goto err_free_input;
+		goto err_pm_disable;
 	}
 
 	error = matrix_keypad_build_keymap(NULL, NULL,
@@ -430,21 +430,23 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 					   keypad_data->keymap, input_dev);
 	if (error) {
 		dev_err(&pdev->dev, "failed to build keymap\n");
-		goto err_free_keymap;
+		goto err_pm_disable;
 	}
 
-	error = request_threaded_irq(keypad_data->irq, omap4_keypad_irq_handler,
-				     omap4_keypad_irq_thread_fn, IRQF_ONESHOT,
-				     "omap4-keypad", keypad_data);
+	error = devm_request_threaded_irq(&pdev->dev, keypad_data->irq,
+					  omap4_keypad_irq_handler,
+					  omap4_keypad_irq_thread_fn,
+					  IRQF_ONESHOT, "omap4-keypad",
+					  keypad_data);
 	if (error) {
 		dev_err(&pdev->dev, "failed to register interrupt\n");
-		goto err_free_keymap;
+		goto err_pm_disable;
 	}
 
 	error = input_register_device(keypad_data->input);
 	if (error < 0) {
 		dev_err(&pdev->dev, "failed to register input device\n");
-		goto err_free_irq;
+		goto err_pm_disable;
 	}
 
 	device_init_wakeup(&pdev->dev, true);
@@ -460,46 +462,23 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 
 	return 0;
 
-err_free_irq:
-	free_irq(keypad_data->irq, keypad_data);
-err_free_keymap:
-	kfree(keypad_data->keymap);
-err_free_input:
-	input_free_device(input_dev);
 err_pm_disable:
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	iounmap(keypad_data->base);
-err_release_mem:
-	release_mem_region(res->start, resource_size(res));
-err_free_keypad:
-	kfree(keypad_data);
+
 	return error;
 }
 
 static int omap4_keypad_remove(struct platform_device *pdev)
 {
 	struct omap4_keypad *keypad_data = platform_get_drvdata(pdev);
-	struct resource *res;
 
 	dev_pm_clear_wake_irq(&pdev->dev);
-
-	free_irq(keypad_data->irq, keypad_data);
-
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-
 	input_unregister_device(keypad_data->input);
 
-	iounmap(keypad_data->base);
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	release_mem_region(res->start, resource_size(res));
-
-	kfree(keypad_data->keymap);
-	kfree(keypad_data);
-
 	return 0;
 }
 
-- 
2.30.0
