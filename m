Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835A52F093D
	for <lists+linux-omap@lfdr.de>; Sun, 10 Jan 2021 20:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727040AbhAJTG2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 10 Jan 2021 14:06:28 -0500
Received: from muru.com ([72.249.23.125]:42288 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726267AbhAJTG1 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 10 Jan 2021 14:06:27 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 35F4C813C;
        Sun, 10 Jan 2021 19:05:46 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 3/5] Input: omap4-keypad - move rest of key scanning to a separate function
Date:   Sun, 10 Jan 2021 21:05:27 +0200
Message-Id: <20210110190529.46135-4-tony@atomide.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210110190529.46135-1-tony@atomide.com>
References: <20210110190529.46135-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Let's move rest of the key scanning code to omap4_keypad_scan_keys().
We will use omap4_keypad_scan_keys() also for implementing errata
handling to clear the stuck last key in the following patch.

Cc: Arthur Demchenkov <spinal.by@gmail.com>
Cc: Carl Philipp Klemm <philipp@uvos.xyz>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: ruleh <ruleh@gmx.de>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/input/keyboard/omap4-keypad.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -71,6 +71,7 @@ struct omap4_keypad {
 
 	void __iomem *base;
 	unsigned int irq;
+	struct mutex lock;		/* for key scan */
 
 	unsigned int rows;
 	unsigned int cols;
@@ -154,16 +155,18 @@ static irqreturn_t omap4_keypad_irq_handler(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
-static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
+static void omap4_keypad_scan_keys(struct omap4_keypad *keypad_data, bool clear)
 {
-	struct omap4_keypad *keypad_data = dev_id;
 	struct input_dev *input_dev = keypad_data->input;
 	u32 low, high;
-	u64 keys;
+	u64 keys = 0;
 
-	low = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE31_0);
-	high = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE63_32);
-	keys = low | (u64)high << 32;
+	mutex_lock(&keypad_data->lock);
+	if (!clear) {
+		low = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE31_0);
+		high = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE63_32);
+		keys = low | (u64)high << 32;
+	}
 
 	/* Scan for key up events for lost key-up interrupts */
 	omap4_keypad_scan_state(keypad_data, keys, false);
@@ -175,6 +178,15 @@ static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
 
 	keypad_data->keys = keys;
 
+	mutex_unlock(&keypad_data->lock);
+}
+
+static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
+{
+	struct omap4_keypad *keypad_data = dev_id;
+
+	omap4_keypad_scan_keys(keypad_data, false);
+
 	/* clear pending interrupts */
 	kbd_write_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS,
 			 kbd_read_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS));
@@ -307,6 +319,7 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	}
 
 	keypad_data->irq = irq;
+	mutex_init(&keypad_data->lock);
 
 	error = omap4_keypad_parse_dt(dev, keypad_data);
 	if (error)
-- 
2.30.0
