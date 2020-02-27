Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C5E4170E2D
	for <lists+linux-omap@lfdr.de>; Thu, 27 Feb 2020 03:04:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728317AbgB0CEO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 Feb 2020 21:04:14 -0500
Received: from muru.com ([72.249.23.125]:57994 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728243AbgB0CEO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 26 Feb 2020 21:04:14 -0500
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id 18AF7819C;
        Thu, 27 Feb 2020 02:04:58 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 2/2] Input: omap4-keypad - check state again for lost key-up interrupts
Date:   Wed, 26 Feb 2020 18:04:07 -0800
Message-Id: <20200227020407.17276-2-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200227020407.17276-1-tony@atomide.com>
References: <20200227020407.17276-1-tony@atomide.com>
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

Let's just check the keyboard state one more time after no more key
press events.

Cc: Arthur Demchenkov <spinal.by@gmail.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---

Can you guys test if you're still seeing stuck keys here and there
with this patch applied? Seems to behave for me based on very brief
testing so not sure if I got it right..

---
 drivers/input/keyboard/omap4-keypad.c | 37 ++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
+#include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/of.h>
@@ -57,8 +58,10 @@
 #define OMAP4_KEYPAD_PTV_DIV_128        0x6
 #define OMAP4_KEYPAD_DEBOUNCINGTIME_MS(dbms, ptv)     \
 	((((dbms) * 1000) / ((1 << ((ptv) + 1)) * (1000000 / 32768))) - 1)
+#define OMAP4_DEBOUNCE_MS		16	/* In milliseconds */
 #define OMAP4_VAL_DEBOUNCINGTIME_16MS					\
-	OMAP4_KEYPAD_DEBOUNCINGTIME_MS(16, OMAP4_KEYPAD_PTV_DIV_128)
+	OMAP4_KEYPAD_DEBOUNCINGTIME_MS(OMAP4_DEBOUNCE_MS, \
+				       OMAP4_KEYPAD_PTV_DIV_128)
 
 enum {
 	KBD_REVISION_OMAP4 = 0,
@@ -119,13 +122,13 @@ static irqreturn_t omap4_keypad_irq_handler(int irq, void *dev_id)
 	return IRQ_NONE;
 }
 
-static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
+static int omap4_keypad_scan_keys(struct omap4_keypad *keypad_data)
 {
-	struct omap4_keypad *keypad_data = dev_id;
 	struct input_dev *input_dev = keypad_data->input;
 	unsigned char key_state[ARRAY_SIZE(keypad_data->key_state)];
 	unsigned int col, row, code, changed;
 	u32 *new_state = (u32 *) key_state;
+	int key_down, keys_pressed = 0;
 
 	*new_state = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE31_0);
 	*(new_state + 1) = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE63_32);
@@ -140,9 +143,12 @@ static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
 				code = MATRIX_SCAN_CODE(row, col,
 						keypad_data->row_shift);
 				input_event(input_dev, EV_MSC, MSC_SCAN, code);
+				key_down = key_state[row] & (1 << col);
 				input_report_key(input_dev,
 						 keypad_data->keymap[code],
-						 key_state[row] & (1 << col));
+						 key_down);
+				if (key_down)
+					keys_pressed++;
 			}
 		}
 	}
@@ -152,6 +158,29 @@ static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
 	memcpy(keypad_data->key_state, key_state,
 		sizeof(keypad_data->key_state));
 
+	return keys_pressed;
+}
+
+static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
+{
+	struct omap4_keypad *keypad_data = dev_id;
+	int new_keys_pressed;
+
+	/*
+	 * Errata ID i689 "1.32 Keyboard Key Up Event Can Be Missed"
+	 * check keyboard state again for lost key-up interrupts.
+	 */
+	do {
+		new_keys_pressed = omap4_keypad_scan_keys(keypad_data);
+
+		/* Check once after debounce time when no more keys down */
+		if (!new_keys_pressed) {
+			usleep_range(OMAP4_DEBOUNCE_MS * 1000 * 2,
+				     OMAP4_DEBOUNCE_MS * 1000 * 3);
+			new_keys_pressed = omap4_keypad_scan_keys(keypad_data);
+		}
+	} while (new_keys_pressed);
+
 	/* clear pending interrupts */
 	kbd_write_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS,
 			 kbd_read_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS));
-- 
2.25.1
