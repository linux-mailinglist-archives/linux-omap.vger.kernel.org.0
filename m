Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CAAF2F0BF7
	for <lists+linux-omap@lfdr.de>; Mon, 11 Jan 2021 05:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727191AbhAKEv2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 10 Jan 2021 23:51:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727130AbhAKEv2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 10 Jan 2021 23:51:28 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A236C061786;
        Sun, 10 Jan 2021 20:50:48 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id h186so10255752pfe.0;
        Sun, 10 Jan 2021 20:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1+dPeGiR0PpkoaRRfQ3c6JBrEn7I2K6TUylrjgBSAiQ=;
        b=d7Knouttq5yLd3V2EB7JjfHqLZQgstubRQuZyPJaUO2/RyR4kUHF5SjqmRrec7NQjt
         qqb0NYfK9lQLKd6m5hw4o2dbCDxTzSAO7WglWqsgzvC0/2mH6/HjuMT8BGaih4lW2Zzd
         pt4UyIo/KAzXN0PQwNb0bdqcZkytARinSXlzhYZ5pSmbDVO8r/R4564U7xfiYNz8Hf6p
         uo9v7QcqtahtupuNtwFrExE+Vk/WA0ylN4M8qk16WGoZvpg3A5vAOQFn5aA6IlXw/JKL
         MNvTmoc/KjF1aCWxStBR2AxqFhKky7lWvhI3wJFGJawjnpKtCVKI2vpLO1Q+orSL9KZL
         83oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1+dPeGiR0PpkoaRRfQ3c6JBrEn7I2K6TUylrjgBSAiQ=;
        b=dLLVfzHcgO7uJ5ybzMLC/rl6v6hNzTTgLumAb4Y2UrtGB6tRXL9rN2hivKCGe43fod
         zJ2Q3q29PY0cimQsICAD9IriiPZmdQl86n8KEofsJTqkeHstNCNQWP2OU3l1whsk7l4f
         gNDtvfXaJh3u3L7Roh5ZcGX3PFJzhFniBi788OS3Ej6WE7vc7/Mk6j6vub3GUdI2BFgk
         ZKSnWVLr3tYfEriyl2Z/KBjKQvu7KOtwF59cUVuUTGUfEQqJ1HizpdLmN9z3pQhtHdXG
         12LAkLh+Rk6g42IbaElQ5Zm09e4rqoYjiXWl4gR5CAOvhGDibJbHcpA58YooFaK1YSdy
         gRIg==
X-Gm-Message-State: AOAM5316xl98IEJMBiLznub7gpvJuUnMkl7Ps+VG46zJJgVktcBXxnGU
        qJRfwjecnPqCEGmmEOKynWI=
X-Google-Smtp-Source: ABdhPJw4l8azVJkxCau8iaxoQHLlgK015DyNDrSV3kXpDakm3aVR/jJqHqdQ1Yw1ZZwNRxglnGTKDg==
X-Received: by 2002:a65:6409:: with SMTP id a9mr18038192pgv.171.1610340647580;
        Sun, 10 Jan 2021 20:50:47 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id g7sm13481792pjm.46.2021.01.10.20.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 20:50:46 -0800 (PST)
Date:   Sun, 10 Jan 2021 20:50:44 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 3/5] Input: omap4-keypad - move rest of key scanning to a
 separate function
Message-ID: <X/vZJMAOJc/CzmHH@google.com>
References: <20210110190529.46135-1-tony@atomide.com>
 <20210110190529.46135-4-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210110190529.46135-4-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sun, Jan 10, 2021 at 09:05:27PM +0200, Tony Lindgren wrote:
> Let's move rest of the key scanning code to omap4_keypad_scan_keys().
> We will use omap4_keypad_scan_keys() also for implementing errata
> handling to clear the stuck last key in the following patch.

And this one will become then...

-- 
Dmitry


Input: omap4-keypad - move rest of key scanning to a separate function

From: Tony Lindgren <tony@atomide.com>

Let's move rest of the key scanning code to omap4_keypad_scan_keys().
We will use omap4_keypad_scan_keys() also for implementing errata
handling to clear the stuck last key in the following patch.

Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/omap4-keypad.c |   39 ++++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index 6dcf27af856d..c48705dd049b 100644
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -71,6 +71,7 @@ struct omap4_keypad {
 
 	void __iomem *base;
 	unsigned int irq;
+	struct mutex lock;		/* for key scan */
 
 	unsigned int rows;
 	unsigned int cols;
@@ -135,6 +136,28 @@ static int omap4_keypad_report_keys(struct omap4_keypad *keypad_data,
 	return events;
 }
 
+static void omap4_keypad_scan_keys(struct omap4_keypad *keypad_data, u64 keys)
+{
+	u64 changed;
+
+	mutex_lock(&keypad_data->lock);
+
+	changed = keys ^ keypad_data->keys;
+
+	/*
+	 * Report key up events separately and first. This matters in case we
+	 * lost key-up interrupt and just now catching up.
+	 */
+	omap4_keypad_report_keys(keypad_data, changed & ~keys, false);
+
+	/* Report key down events */
+	omap4_keypad_report_keys(keypad_data, changed & keys, true);
+
+	keypad_data->keys = keys;
+
+	mutex_unlock(&keypad_data->lock);
+}
+
 /* Interrupt handlers */
 static irqreturn_t omap4_keypad_irq_handler(int irq, void *dev_id)
 {
@@ -150,24 +173,13 @@ static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
 {
 	struct omap4_keypad *keypad_data = dev_id;
 	u32 low, high;
-	u64 keys, changed;
+	u64 keys;
 
 	low = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE31_0);
 	high = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE63_32);
 	keys = low | (u64)high << 32;
 
-	changed = keys ^ keypad_data->keys;
-
-	/*
-	 * Report key up events separately and first. This matters in case we
-	 * lost key-up interrupt and just now catching up.
-	 */
-	omap4_keypad_report_keys(keypad_data, changed & ~keys, false);
-
-	/* Report key down events */
-	omap4_keypad_report_keys(keypad_data, changed & keys, true);
-
-	keypad_data->keys = keys;
+	omap4_keypad_scan_keys(keypad_data, keys);
 
 	/* clear pending interrupts */
 	kbd_write_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS,
@@ -300,6 +312,7 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	}
 
 	keypad_data->irq = irq;
+	mutex_init(&keypad_data->lock);
 
 	error = omap4_keypad_parse_dt(dev, keypad_data);
 	if (error)
