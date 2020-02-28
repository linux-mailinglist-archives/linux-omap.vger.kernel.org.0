Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0296173E09
	for <lists+linux-omap@lfdr.de>; Fri, 28 Feb 2020 18:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbgB1RMc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 Feb 2020 12:12:32 -0500
Received: from muru.com ([72.249.23.125]:58232 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726674AbgB1RMc (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 28 Feb 2020 12:12:32 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 69D4281CC;
        Fri, 28 Feb 2020 17:13:16 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Sebastian Reichel <sre@kernel.org>, ruleh <ruleh@gmx.de>
Subject: [PATCH 3/3] Input: omap4-keypad - check state again for lost key-up interrupts
Date:   Fri, 28 Feb 2020 09:12:23 -0800
Message-Id: <20200228171223.11444-4-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200228171223.11444-1-tony@atomide.com>
References: <20200228171223.11444-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

We only have partial errata i689 implemented with Commit 6c3516fed7b6
("Input: omap-keypad - fix keyboard debounce configuration"). We are
still missing the check for lost key-up interrupts as described in the
omap4 silicon errata documentation as Errata ID i689 "1.32 Keyboard Key
Up Event Can Be Missed":

"When a key is released for a time shorter than the debounce time,
 in-between 2 key press (KP1 and KP2), the keyboard state machine will go
 to idle mode and will never detect the key release (after KP1, and also
 after KP2), and thus will never generate a new IRQ indicating the key
 release."

Let's check the keyboard state with delayed_work after each event. And
if the problem state is detect, let's clear all events.

Cc: Arthur Demchenkov <spinal.by@gmail.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/input/keyboard/omap4-keypad.c | 56 ++++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 6 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -71,6 +71,8 @@ struct omap4_keypad {
 	void __iomem *base;
 	bool irq_wake_enabled;
 	unsigned int irq;
+	struct delayed_work key_work;
+	struct mutex lock;		/* for key scan */
 
 	unsigned int rows;
 	unsigned int cols;
@@ -119,16 +121,22 @@ static irqreturn_t omap4_keypad_irq_handler(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
-static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
+static bool omap4_keypad_scan_keys(struct omap4_keypad *keypad_data, bool clear)
 {
-	struct omap4_keypad *keypad_data = dev_id;
 	struct input_dev *input_dev = keypad_data->input;
 	unsigned char key_state[ARRAY_SIZE(keypad_data->key_state)];
 	unsigned int col, row, code, changed;
-	u32 *new_state = (u32 *) key_state;
-
-	*new_state = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE31_0);
-	*(new_state + 1) = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE63_32);
+	u32 *rows_lo = (u32 *)key_state;
+	u32 *rows_hi = rows_lo + 1;
+
+	mutex_lock(&keypad_data->lock);
+	if (clear) {
+		*rows_lo = 0;
+		*rows_hi = 0;
+	} else {
+		*rows_lo = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE31_0);
+		*rows_hi = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE63_32);
+	}
 
 	for (row = 0; row < keypad_data->rows; row++) {
 		changed = key_state[row] ^ keypad_data->key_state[row];
@@ -151,6 +159,20 @@ static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
 
 	memcpy(keypad_data->key_state, key_state,
 		sizeof(keypad_data->key_state));
+	mutex_unlock(&keypad_data->lock);
+
+	return *rows_lo || *rows_hi;
+}
+
+static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
+{
+	struct omap4_keypad *keypad_data = dev_id;
+	bool events;
+
+	events = omap4_keypad_scan_keys(keypad_data, false);
+	if (events)
+		schedule_delayed_work(&keypad_data->key_work,
+				      msecs_to_jiffies(50));
 
 	/* clear pending interrupts */
 	kbd_write_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS,
@@ -159,6 +181,25 @@ static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+/*
+ * Errata ID i689 "1.32 Keyboard Key Up Event Can Be Missed".
+ * Interrupt may not happen for key-up events.
+ */
+static void omap4_keypad_work(struct work_struct *work)
+{
+	struct omap4_keypad *keypad_data =
+		container_of(work, struct omap4_keypad, key_work.work);
+	bool events;
+	u32 active;
+
+	active = kbd_readl(keypad_data, OMAP4_KBD_STATEMACHINE);
+	if (active)
+		return;
+
+	dev_dbg(keypad_data->input->dev.parent, "idle with events\n");
+	events = omap4_keypad_scan_keys(keypad_data, true);
+}
+
 static int omap4_keypad_open(struct input_dev *input)
 {
 	struct omap4_keypad *keypad_data = input_get_drvdata(input);
@@ -251,6 +292,8 @@ static int omap4_keypad_probe(struct platform_device *pdev)
 	}
 
 	keypad_data->irq = irq;
+	mutex_init(&keypad_data->lock);
+	INIT_DELAYED_WORK(&keypad_data->key_work, omap4_keypad_work);
 
 	error = omap4_keypad_parse_dt(&pdev->dev, keypad_data);
 	if (error)
@@ -387,6 +430,7 @@ static int omap4_keypad_remove(struct platform_device *pdev)
 	struct resource *res;
 
 	free_irq(keypad_data->irq, keypad_data);
+	cancel_delayed_work_sync(&keypad_data->key_work);
 
 	pm_runtime_disable(&pdev->dev);
 
-- 
2.25.1
