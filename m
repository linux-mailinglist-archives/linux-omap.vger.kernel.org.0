Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2B622F05B6
	for <lists+linux-omap@lfdr.de>; Sun, 10 Jan 2021 07:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725385AbhAJGbp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 10 Jan 2021 01:31:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbhAJGbo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 10 Jan 2021 01:31:44 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85901C061786;
        Sat,  9 Jan 2021 22:31:04 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id lj6so5897753pjb.0;
        Sat, 09 Jan 2021 22:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YGGZ6fSTacFV3p0yhGT7HTdfidK9m5Fu6uaRbgw/vRo=;
        b=UGnmnce2mMfNdou+rW0FOfKEPQxJ3kpu0VcmKTvG9PvE0g+iP3CxTVK5JPvclqx28u
         o2zeFPgbRlgFjBRTi8SfFjxUDVmQZhbFxTfdolQqLnGG3cRyuUNhQhTdHzKm6omTmfNK
         q7uaJQV27boVp//B1EyeP30jwAKVEaKN3YC4gX7A20GCK8MLaZps443NV26qFMGXQBMM
         X5AxwSDOQH1N8Lf1d3Ux3xO4NMSy1QvwfeV+uisEqiiDJSFtRGDBtYnVmlq3jZOCQw0t
         Eq6DfHKxKULa0Ja7rLtwa8RGy893RFVVTd5mr0uhKfwa/RDgLATDesj+qiSs5jhLL1Vg
         ezpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YGGZ6fSTacFV3p0yhGT7HTdfidK9m5Fu6uaRbgw/vRo=;
        b=CkZBBkEYxuSNnWZTiKYWe9PdB7ZnKog5Kab3+jlebuwzLVIh+wDomSWOWm3W8C1QxN
         3Sj1yXjhk1R6yew2MWd8nO2pI0mmAzkFfh2ypz1b2QZSpVqtFUchtzk2XBQWHmNm3LzF
         hEs+ppBOTCB3b52fIgB21TavRDivRYhnIWe39NJrVdDB0RgAYEyFmrCZxhJgcH6olOQD
         LHFjYPrNFqKZ9p7a12W4dA6cSglesajc61GcJRZYaa9aAqSo8WIZN/Fim08erXYk+8tZ
         BQ7VaP6X9eR4lEWz7SfYBpDyyS0BO62ploZdo4nuaYm7jsag1K7I/JKJIY8prJHhVJrU
         nWRw==
X-Gm-Message-State: AOAM533kXzw0fSJ8BSgWQ0BPphi6Wa8nN0eUg/Kv29MCeaNXfItVyVZj
        /FndLSrQ197fqYY67BLp7ek=
X-Google-Smtp-Source: ABdhPJxwhuIteONtpnLyU7uS5xN4LiIgzC55HtaRDYNPxFlkxvqaz4P/Jtyux0AfE96RYbMXtGHHZQ==
X-Received: by 2002:a17:90b:215:: with SMTP id fy21mr11811895pjb.227.1610260263886;
        Sat, 09 Jan 2021 22:31:03 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id i10sm15675388pgt.85.2021.01.09.22.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jan 2021 22:31:02 -0800 (PST)
Date:   Sat, 9 Jan 2021 22:31:00 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 4/4] Input: omap4-keypad - simplify probe with devm
Message-ID: <X/qfJKiM21uyksYl@google.com>
References: <20210106125822.31315-1-tony@atomide.com>
 <20210106125822.31315-5-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106125822.31315-5-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Wed, Jan 06, 2021 at 02:58:22PM +0200, Tony Lindgren wrote:
>  static int omap4_keypad_remove(struct platform_device *pdev)
>  {
>  	struct omap4_keypad *keypad_data = platform_get_drvdata(pdev);
> -	struct resource *res;
>  
>  	dev_pm_clear_wake_irq(&pdev->dev);
> -
> -	free_irq(keypad_data->irq, keypad_data);
> -
>  	pm_runtime_dont_use_autosuspend(&pdev->dev);
>  	pm_runtime_disable(&pdev->dev);

I do not quite like that we need to keep this in remove(). I had the
patch below for quite some time, could you please try it?

Thanks!

-- 
Dmitry


Input: omap4-keypad - switch to use managed resources

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Now that input core supports devres-managed input devices we can clean
up this driver a bit.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/omap4-keypad.c |  139 +++++++++++++--------------------
 1 file changed, 55 insertions(+), 84 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index b17ac2a295b9..d36774a55a10 100644
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -252,8 +252,14 @@ static int omap4_keypad_check_revision(struct device *dev,
 	return 0;
 }
 
+static void omap4_disable_pm(void *d)
+{
+	pm_runtime_disable(d);
+}
+
 static int omap4_keypad_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct omap4_keypad *keypad_data;
 	struct input_dev *input_dev;
 	struct resource *res;
@@ -271,33 +277,30 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	keypad_data = kzalloc(sizeof(struct omap4_keypad), GFP_KERNEL);
+	keypad_data = devm_kzalloc(dev, sizeof(struct omap4_keypad),
+				   GFP_KERNEL);
 	if (!keypad_data) {
-		dev_err(&pdev->dev, "keypad_data memory allocation failed\n");
+		dev_err(dev, "keypad_data memory allocation failed\n");
 		return -ENOMEM;
 	}
 
 	keypad_data->irq = irq;
 
-	error = omap4_keypad_parse_dt(&pdev->dev, keypad_data);
+	error = omap4_keypad_parse_dt(dev, keypad_data);
 	if (error)
-		goto err_free_keypad;
+		return error;
 
-	res = request_mem_region(res->start, resource_size(res), pdev->name);
-	if (!res) {
-		dev_err(&pdev->dev, "can't request mem region\n");
-		error = -EBUSY;
-		goto err_free_keypad;
-	}
+	keypad_data->base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(keypad_data->base))
+		return PTR_ERR(keypad_data->base);
 
-	keypad_data->base = ioremap(res->start, resource_size(res));
-	if (!keypad_data->base) {
-		dev_err(&pdev->dev, "can't ioremap mem resource\n");
-		error = -ENOMEM;
-		goto err_release_mem;
-	}
+	pm_runtime_enable(dev);
 
-	pm_runtime_enable(&pdev->dev);
+	error = devm_add_action_or_reset(dev, omap4_disable_pm, dev);
+	if (error) {
+		dev_err(dev, "unable to register cleanup action\n");
+		return error;
+	}
 
 	/*
 	 * Enable clocks for the keypad module so that we can read
@@ -307,27 +310,26 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	if (error) {
 		dev_err(&pdev->dev, "pm_runtime_get_sync() failed\n");
 		pm_runtime_put_noidle(&pdev->dev);
-	} else {
-		error = omap4_keypad_check_revision(&pdev->dev,
-						    keypad_data);
-		if (!error) {
-			/* Ensure device does not raise interrupts */
-			omap4_keypad_stop(keypad_data);
-		}
-		pm_runtime_put_sync(&pdev->dev);
+		return error;
+	}
+
+	error = omap4_keypad_check_revision(&pdev->dev,
+					    keypad_data);
+	if (!error) {
+		/* Ensure device does not raise interrupts */
+		omap4_keypad_stop(keypad_data);
 	}
+
+	pm_runtime_put_sync(&pdev->dev);
 	if (error)
-		goto err_pm_disable;
+		return error;
 
 	/* input device allocation */
-	keypad_data->input = input_dev = input_allocate_device();
-	if (!input_dev) {
-		error = -ENOMEM;
-		goto err_pm_disable;
-	}
+	keypad_data->input = input_dev = devm_input_allocate_device(dev);
+	if (!input_dev)
+		return -ENOMEM;
 
 	input_dev->name = pdev->name;
-	input_dev->dev.parent = &pdev->dev;
 	input_dev->id.bustype = BUS_HOST;
 	input_dev->id.vendor = 0x0001;
 	input_dev->id.product = 0x0001;
@@ -344,84 +346,53 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 
 	keypad_data->row_shift = get_count_order(keypad_data->cols);
 	max_keys = keypad_data->rows << keypad_data->row_shift;
-	keypad_data->keymap = kcalloc(max_keys,
-				      sizeof(keypad_data->keymap[0]),
-				      GFP_KERNEL);
+	keypad_data->keymap = devm_kcalloc(dev,
+					   max_keys,
+					   sizeof(keypad_data->keymap[0]),
+					   GFP_KERNEL);
 	if (!keypad_data->keymap) {
-		dev_err(&pdev->dev, "Not enough memory for keymap\n");
-		error = -ENOMEM;
-		goto err_free_input;
+		dev_err(dev, "Not enough memory for keymap\n");
+		return -ENOMEM;
 	}
 
 	error = matrix_keypad_build_keymap(NULL, NULL,
 					   keypad_data->rows, keypad_data->cols,
 					   keypad_data->keymap, input_dev);
 	if (error) {
-		dev_err(&pdev->dev, "failed to build keymap\n");
-		goto err_free_keymap;
+		dev_err(dev, "failed to build keymap\n");
+		return error;
 	}
 
-	error = request_threaded_irq(keypad_data->irq, omap4_keypad_irq_handler,
-				     omap4_keypad_irq_thread_fn, IRQF_ONESHOT,
-				     "omap4-keypad", keypad_data);
+	error = devm_request_threaded_irq(dev, keypad_data->irq,
+					  omap4_keypad_irq_handler,
+					  omap4_keypad_irq_thread_fn,
+					  IRQF_ONESHOT,
+					  "omap4-keypad", keypad_data);
 	if (error) {
-		dev_err(&pdev->dev, "failed to register interrupt\n");
-		goto err_free_keymap;
+		dev_err(dev, "failed to register interrupt\n");
+		return error;
 	}
 
 	error = input_register_device(keypad_data->input);
-	if (error < 0) {
-		dev_err(&pdev->dev, "failed to register input device\n");
-		goto err_free_irq;
+	if (error) {
+		dev_err(dev, "failed to register input device\n");
+		return error;
 	}
 
-	device_init_wakeup(&pdev->dev, true);
-	error = dev_pm_set_wake_irq(&pdev->dev, keypad_data->irq);
+	device_init_wakeup(dev, true);
+	error = dev_pm_set_wake_irq(dev, keypad_data->irq);
 	if (error)
-		dev_warn(&pdev->dev,
-			 "failed to set up wakeup irq: %d\n", error);
+		dev_warn(dev, "failed to set up wakeup irq: %d\n", error);
 
 	platform_set_drvdata(pdev, keypad_data);
 
 	return 0;
-
-err_free_irq:
-	free_irq(keypad_data->irq, keypad_data);
-err_free_keymap:
-	kfree(keypad_data->keymap);
-err_free_input:
-	input_free_device(input_dev);
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
-	iounmap(keypad_data->base);
-err_release_mem:
-	release_mem_region(res->start, resource_size(res));
-err_free_keypad:
-	kfree(keypad_data);
-	return error;
 }
 
 static int omap4_keypad_remove(struct platform_device *pdev)
 {
-	struct omap4_keypad *keypad_data = platform_get_drvdata(pdev);
-	struct resource *res;
-
 	dev_pm_clear_wake_irq(&pdev->dev);
 
-	free_irq(keypad_data->irq, keypad_data);
-
-	pm_runtime_disable(&pdev->dev);
-
-	input_unregister_device(keypad_data->input);
-
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
 
