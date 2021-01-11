Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7269F2F0BF0
	for <lists+linux-omap@lfdr.de>; Mon, 11 Jan 2021 05:50:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726278AbhAKEtd (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 10 Jan 2021 23:49:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbhAKEtd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 10 Jan 2021 23:49:33 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC095C061786;
        Sun, 10 Jan 2021 20:48:52 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id 30so11806463pgr.6;
        Sun, 10 Jan 2021 20:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=b4RS69ujb5Y+r7PmC+oADOOjWqIYiqiOvDuEILLKDJQ=;
        b=gr8zeixHjabO1BH1le504uwB2w6vgruWvbZYEQ+0e93iMwDRQSKSb8n1Rt1inehELs
         4RhG89iSjjXgf6SxwJosuuMuU8Hx46IedxKnPJ27FVFHgF3EXmk167i87IoZR3kY8l2l
         S2TRVaGFb36QasF7+Obsq2LAH3OOtAB64EocAcny0CZeXwwATp8kNfHlVRWdKNpQNVQa
         kngb/bG5SRWPx/tRbPQDgi1S7nKZFLP/vUQpAOkt1P/s8RQbn19xtDHXCneei8zAAS3t
         6qfR5KH1//3Tf+QbX8E2m5g5nM9dyefmQu6HrZkqYpThS7uVB9wbqbYb3KNyHMGAnf7J
         QNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b4RS69ujb5Y+r7PmC+oADOOjWqIYiqiOvDuEILLKDJQ=;
        b=pHooB5/WIP7HsXR9gJr62Jg+h2fXhYuqCYly6+z3+wbZ/3q7HVdZ4dNk5ztaMVowt3
         T4h0VoN6JrVB3Bmg6q6j3ITwNRGMbeiI6seWz3FNaEDavRL5bjBE+lTlskxipMiB2/wq
         GtUsSpHjc0XhHPINgL22IQry6QsBsuZ0qd0r0cI131MQS1aiXv8jWnVdLG0U1Ez9K0s0
         n01byU15HMG2/+P90edR4Ubk4X6BTgoTwsk+5ne2PpDfct8ihzFVG+mPAgDWZWk+dfht
         AhGrvLDeDpZFhrYR0XwEzo9j5nOfzGYwVQjhL5wETIeNEB0dwCc2FviEMLrxMcFDsqst
         i3tg==
X-Gm-Message-State: AOAM533rns3vkb0+hXmgQfElD8KqHYMNwEKNbXzYvcPVLCT4TP9G3TfI
        F5stblU/GYyByzla595uJmA=
X-Google-Smtp-Source: ABdhPJyMX06fb4mVbuiUoURLbU6qjf8mQ0jDVJXCg8i2rby76TPFdbfYuKeVTkm0c3NjSl17JTKBqQ==
X-Received: by 2002:a65:58c7:: with SMTP id e7mr18014621pgu.350.1610340532343;
        Sun, 10 Jan 2021 20:48:52 -0800 (PST)
Received: from google.com ([2620:15c:202:201:a6ae:11ff:fe11:fcc3])
        by smtp.gmail.com with ESMTPSA id 37sm13740146pjz.41.2021.01.10.20.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jan 2021 20:48:51 -0800 (PST)
Date:   Sun, 10 Jan 2021 20:48:49 -0800
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 2/5] Input: omap4-keypad - scan keys in two phases and
 simplify with bitmask
Message-ID: <X/vYsc19ltOYafQb@google.com>
References: <20210110190529.46135-1-tony@atomide.com>
 <20210110190529.46135-3-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210110190529.46135-3-tony@atomide.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Sun, Jan 10, 2021 at 09:05:26PM +0200, Tony Lindgren wrote:
> Because of errata i689 the keyboard can idle with state where no key
> up interrupts are seen until after the next key press.
> 
> This means we need to first check for any lost key up events before
> scanning for new down events.
> 
> For example, rapidly pressing shift-shift-j can sometimes produce a J
> instead of j. Let's fix the issue by scanning the keyboard in two
> phases. First we scan for any key up events that we may have missed,
> and then we scan for key down events.
> 
> Let's also simplify things with for_each_set_bit() as suggested by
> Dmitry Torokhov <dmitry.torokhov@gmail.com>.
> 
> Cc: Arthur Demchenkov <spinal.by@gmail.com>
> Cc: Carl Philipp Klemm <philipp@uvos.xyz>
> Cc: Merlijn Wajer <merlijn@wizzup.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: ruleh <ruleh@gmx.de>
> Cc: Sebastian Reichel <sre@kernel.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/input/keyboard/omap4-keypad.c | 69 ++++++++++++++++++---------
>  1 file changed, 46 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
> --- a/drivers/input/keyboard/omap4-keypad.c
> +++ b/drivers/input/keyboard/omap4-keypad.c
> @@ -78,7 +78,7 @@ struct omap4_keypad {
>  	u32 irqreg_offset;
>  	unsigned int row_shift;
>  	bool no_autorepeat;
> -	unsigned char key_state[8];
> +	u64 keys;
>  	unsigned short *keymap;
>  };
>  
> @@ -107,6 +107,41 @@ static void kbd_write_irqreg(struct omap4_keypad *keypad_data,
>  		     keypad_data->base + keypad_data->irqreg_offset + offset);
>  }
>  
> +static int omap4_keypad_scan_state(struct omap4_keypad *keypad_data, u64 keys,
> +				   bool down)
> +{
> +	struct input_dev *input_dev = keypad_data->input;
> +	unsigned int col, row, code;
> +	DECLARE_BITMAP(mask, 64);
> +	unsigned long bit;
> +	int events = 0;
> +	bool key_down;
> +	u64 changed;
> +
> +	changed = keys ^ keypad_data->keys;
> +	bitmap_from_u64(mask, changed);
> +
> +	for_each_set_bit(bit, mask, keypad_data->rows * BITS_PER_BYTE) {
> +		row = bit / BITS_PER_BYTE;
> +		col = bit % BITS_PER_BYTE;
> +		code = MATRIX_SCAN_CODE(row, col, keypad_data->row_shift);
> +
> +		if (BIT_ULL(bit) & keys)
> +			key_down = true;
> +		else
> +			key_down = false;
> +
> +		if (key_down != down)
> +			continue;
> +
> +		input_event(input_dev, EV_MSC, MSC_SCAN, code);
> +		input_report_key(input_dev, keypad_data->keymap[code],
> +				 key_down);
> +		events++;
> +	}
> +
> +	return events;
> +}
>  
>  /* Interrupt handlers */
>  static irqreturn_t omap4_keypad_irq_handler(int irq, void *dev_id)
> @@ -123,34 +158,22 @@ static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
>  {
>  	struct omap4_keypad *keypad_data = dev_id;
>  	struct input_dev *input_dev = keypad_data->input;
> -	unsigned char key_state[ARRAY_SIZE(keypad_data->key_state)];
> -	unsigned int col, row, code, changed;
> -	u32 *new_state = (u32 *) key_state;
> +	u32 low, high;
> +	u64 keys;
>  
> -	*new_state = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE31_0);
> -	*(new_state + 1) = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE63_32);
> +	low = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE31_0);
> +	high = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE63_32);
> +	keys = low | (u64)high << 32;
>  
> -	for (row = 0; row < keypad_data->rows; row++) {
> -		changed = key_state[row] ^ keypad_data->key_state[row];
> -		if (!changed)
> -			continue;
> +	/* Scan for key up events for lost key-up interrupts */
> +	omap4_keypad_scan_state(keypad_data, keys, false);
>  
> -		for (col = 0; col < keypad_data->cols; col++) {
> -			if (changed & (1 << col)) {
> -				code = MATRIX_SCAN_CODE(row, col,
> -						keypad_data->row_shift);
> -				input_event(input_dev, EV_MSC, MSC_SCAN, code);
> -				input_report_key(input_dev,
> -						 keypad_data->keymap[code],
> -						 key_state[row] & (1 << col));
> -			}
> -		}
> -	}
> +	/* Scan for key down events */
> +	omap4_keypad_scan_state(keypad_data, keys, true);
>  
>  	input_sync(input_dev);

Technically speaking, userspace is free to accumulate the events until
it receives EV_SYN/SYN_REPORT event and process the events in the event
packet in order it sees fit. So to achieve what you want, I think we
should issue 2 input_sync()s, one for the release block, and another is
for press. I think we can also simplify the code if we pass into the new
scan function exact set of keys that are being released or pressed.

How about the version below?

Thanks!

-- 
Dmitry


Input: omap4-keypad - scan keys in two phases and simplify with bitmask

From: Tony Lindgren <tony@atomide.com>

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

Signed-off-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/omap4-keypad.c |   73 ++++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 28 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index ab761aa66b6d..6dcf27af856d 100644
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
 
@@ -107,6 +107,33 @@ static void kbd_write_irqreg(struct omap4_keypad *keypad_data,
 		     keypad_data->base + keypad_data->irqreg_offset + offset);
 }
 
+static int omap4_keypad_report_keys(struct omap4_keypad *keypad_data,
+				    u64 keys, bool down)
+{
+	struct input_dev *input_dev = keypad_data->input;
+	unsigned int col, row, code;
+	DECLARE_BITMAP(mask, 64);
+	unsigned long bit;
+	int events = 0;
+
+	bitmap_from_u64(mask, keys);
+
+	for_each_set_bit(bit, mask, keypad_data->rows * BITS_PER_BYTE) {
+		row = bit / BITS_PER_BYTE;
+		col = bit % BITS_PER_BYTE;
+		code = MATRIX_SCAN_CODE(row, col, keypad_data->row_shift);
+
+		input_event(input_dev, EV_MSC, MSC_SCAN, code);
+		input_report_key(input_dev, keypad_data->keymap[code], down);
+
+		events++;
+	}
+
+	if (events)
+		input_sync(input_dev);
+
+	return events;
+}
 
 /* Interrupt handlers */
 static irqreturn_t omap4_keypad_irq_handler(int irq, void *dev_id)
@@ -122,35 +149,25 @@ static irqreturn_t omap4_keypad_irq_handler(int irq, void *dev_id)
 static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
 {
 	struct omap4_keypad *keypad_data = dev_id;
-	struct input_dev *input_dev = keypad_data->input;
-	unsigned char key_state[ARRAY_SIZE(keypad_data->key_state)];
-	unsigned int col, row, code, changed;
-	u32 *new_state = (u32 *) key_state;
-
-	*new_state = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE31_0);
-	*(new_state + 1) = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE63_32);
-
-	for (row = 0; row < keypad_data->rows; row++) {
-		changed = key_state[row] ^ keypad_data->key_state[row];
-		if (!changed)
-			continue;
-
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
+	u32 low, high;
+	u64 keys, changed;
+
+	low = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE31_0);
+	high = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE63_32);
+	keys = low | (u64)high << 32;
+
+	changed = keys ^ keypad_data->keys;
+
+	/*
+	 * Report key up events separately and first. This matters in case we
+	 * lost key-up interrupt and just now catching up.
+	 */
+	omap4_keypad_report_keys(keypad_data, changed & ~keys, false);
 
-	input_sync(input_dev);
+	/* Report key down events */
+	omap4_keypad_report_keys(keypad_data, changed & keys, true);
 
-	memcpy(keypad_data->key_state, key_state,
-		sizeof(keypad_data->key_state));
+	keypad_data->keys = keys;
 
 	/* clear pending interrupts */
 	kbd_write_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS,
