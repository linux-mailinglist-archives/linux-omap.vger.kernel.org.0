Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3229518A8C1
	for <lists+linux-omap@lfdr.de>; Wed, 18 Mar 2020 23:59:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727356AbgCRW5i (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 18 Mar 2020 18:57:38 -0400
Received: from muru.com ([72.249.23.125]:60786 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727308AbgCRW5i (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 18 Mar 2020 18:57:38 -0400
Received: from hillo.muru.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTP id BD8BB81AC;
        Wed, 18 Mar 2020 22:58:23 +0000 (UTC)
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: [PATCH 2/3] Input: omap4-keypad - Scan keys in two phases and simplify with bitmask
Date:   Wed, 18 Mar 2020 15:57:26 -0700
Message-Id: <20200318225727.29327-3-tony@atomide.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318225727.29327-1-tony@atomide.com>
References: <20200318225727.29327-1-tony@atomide.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Because of errata i689 the keyboard can idle with state where no key
up interrupts are seen until after the next key press.

This means we need to first check for any lost key up events before
scanning for new down events.

For example, rapidly pressing shift-shift-j can sometimes produce a J
instead of j. Let's fix the issue by scanning the keyboard in two
phases. First we scan for any key up events that we may have missed,
and then we scan for key down events.

Let's also simplify things with for_each_set_bit() as suggested by
Dmitry Torokhov <dmitry.torokhov@gmail.com>.

Cc: Arthur Demchenkov <spinal.by@gmail.com>
Cc: Merlijn Wajer <merlijn@wizzup.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: ruleh <ruleh@gmx.de>
Cc: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 drivers/input/keyboard/omap4-keypad.c | 70 ++++++++++++++++++---------
 1 file changed, 47 insertions(+), 23 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -78,7 +78,7 @@ struct omap4_keypad {
 	u32 irqreg_offset;
 	unsigned int row_shift;
 	bool no_autorepeat;
-	unsigned char key_state[8];
+	u64 keys;
 	unsigned short *keymap;
 };
 
@@ -107,6 +107,41 @@ static void kbd_write_irqreg(struct omap4_keypad *keypad_data,
 		     keypad_data->base + keypad_data->irqreg_offset + offset);
 }
 
+static int omap4_keypad_scan_state(struct omap4_keypad *keypad_data, u64 keys,
+				   bool down)
+{
+	struct input_dev *input_dev = keypad_data->input;
+	unsigned int col, row, code;
+	DECLARE_BITMAP(mask, 64);
+	unsigned long bit;
+	int events = 0;
+	bool key_down;
+	u64 changed;
+
+	changed = keys ^ keypad_data->keys;
+	bitmap_from_u64(mask, changed);
+
+	for_each_set_bit(bit, mask, keypad_data->rows * BITS_PER_BYTE) {
+		row = bit / BITS_PER_BYTE;
+		col = bit % BITS_PER_BYTE;
+		code = MATRIX_SCAN_CODE(row, col, keypad_data->row_shift);
+
+		if (BIT_ULL(bit) & keys)
+			key_down = true;
+		else
+			key_down = false;
+
+		if (key_down != down)
+			continue;
+
+		input_event(input_dev, EV_MSC, MSC_SCAN, code);
+		input_report_key(input_dev, keypad_data->keymap[code],
+				 key_down);
+		events++;
+	}
+
+	return events;
+}
 
 /* Interrupt handlers */
 static irqreturn_t omap4_keypad_irq_handler(int irq, void *dev_id)
@@ -123,34 +158,23 @@ static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
 {
 	struct omap4_keypad *keypad_data = dev_id;
 	struct input_dev *input_dev = keypad_data->input;
-	unsigned char key_state[ARRAY_SIZE(keypad_data->key_state)];
-	unsigned int col, row, code, changed;
-	u32 *new_state = (u32 *) key_state;
+	int keys_up, keys_down;
+	u32 low, high;
+	u64 keys;
 
-	*new_state = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE31_0);
-	*(new_state + 1) = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE63_32);
+	low = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE31_0);
+	high = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE63_32);
+	keys = low | (u64)high << 32;
 
-	for (row = 0; row < keypad_data->rows; row++) {
-		changed = key_state[row] ^ keypad_data->key_state[row];
-		if (!changed)
-			continue;
+	/* Scan for key up events for lost key-up interrupts */
+	keys_up = omap4_keypad_scan_state(keypad_data, keys, false);
 
-		for (col = 0; col < keypad_data->cols; col++) {
-			if (changed & (1 << col)) {
-				code = MATRIX_SCAN_CODE(row, col,
-						keypad_data->row_shift);
-				input_event(input_dev, EV_MSC, MSC_SCAN, code);
-				input_report_key(input_dev,
-						 keypad_data->keymap[code],
-						 key_state[row] & (1 << col));
-			}
-		}
-	}
+	/* Scan for key down events */
+	keys_down = omap4_keypad_scan_state(keypad_data, keys, true);
 
 	input_sync(input_dev);
 
-	memcpy(keypad_data->key_state, key_state,
-		sizeof(keypad_data->key_state));
+	keypad_data->keys = keys;
 
 	/* clear pending interrupts */
 	kbd_write_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS,
-- 
2.25.1
