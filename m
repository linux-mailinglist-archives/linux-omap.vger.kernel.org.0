Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 621932F0CAD
	for <lists+linux-omap@lfdr.de>; Mon, 11 Jan 2021 06:57:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbhAKF5k (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Jan 2021 00:57:40 -0500
Received: from muru.com ([72.249.23.125]:42610 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbhAKF5k (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Jan 2021 00:57:40 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4CD0D80E4;
        Mon, 11 Jan 2021 05:56:58 +0000 (UTC)
Date:   Mon, 11 Jan 2021 07:56:54 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 2/5] Input: omap4-keypad - scan keys in two phases and
 simplify with bitmask
Message-ID: <X/vopuwCgxGxoVXs@atomide.com>
References: <20210110190529.46135-1-tony@atomide.com>
 <20210110190529.46135-3-tony@atomide.com>
 <X/vYsc19ltOYafQb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/vYsc19ltOYafQb@google.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Dmitry Torokhov <dmitry.torokhov@gmail.com> [210111 04:48]:
> Technically speaking, userspace is free to accumulate the events until
> it receives EV_SYN/SYN_REPORT event and process the events in the event
> packet in order it sees fit. So to achieve what you want, I think we
> should issue 2 input_sync()s, one for the release block, and another is
> for press. I think we can also simplify the code if we pass into the new
> scan function exact set of keys that are being released or pressed.
> 
> How about the version below?

Yes that works nicely.

Thanks,

Tony


> 
> Input: omap4-keypad - scan keys in two phases and simplify with bitmask
> 
> From: Tony Lindgren <tony@atomide.com>
> 
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
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/keyboard/omap4-keypad.c |   73 ++++++++++++++++++++-------------
>  1 file changed, 45 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
> index ab761aa66b6d..6dcf27af856d 100644
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
> @@ -107,6 +107,33 @@ static void kbd_write_irqreg(struct omap4_keypad *keypad_data,
>  		     keypad_data->base + keypad_data->irqreg_offset + offset);
>  }
>  
> +static int omap4_keypad_report_keys(struct omap4_keypad *keypad_data,
> +				    u64 keys, bool down)
> +{
> +	struct input_dev *input_dev = keypad_data->input;
> +	unsigned int col, row, code;
> +	DECLARE_BITMAP(mask, 64);
> +	unsigned long bit;
> +	int events = 0;
> +
> +	bitmap_from_u64(mask, keys);
> +
> +	for_each_set_bit(bit, mask, keypad_data->rows * BITS_PER_BYTE) {
> +		row = bit / BITS_PER_BYTE;
> +		col = bit % BITS_PER_BYTE;
> +		code = MATRIX_SCAN_CODE(row, col, keypad_data->row_shift);
> +
> +		input_event(input_dev, EV_MSC, MSC_SCAN, code);
> +		input_report_key(input_dev, keypad_data->keymap[code], down);
> +
> +		events++;
> +	}
> +
> +	if (events)
> +		input_sync(input_dev);
> +
> +	return events;
> +}
>  
>  /* Interrupt handlers */
>  static irqreturn_t omap4_keypad_irq_handler(int irq, void *dev_id)
> @@ -122,35 +149,25 @@ static irqreturn_t omap4_keypad_irq_handler(int irq, void *dev_id)
>  static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
>  {
>  	struct omap4_keypad *keypad_data = dev_id;
> -	struct input_dev *input_dev = keypad_data->input;
> -	unsigned char key_state[ARRAY_SIZE(keypad_data->key_state)];
> -	unsigned int col, row, code, changed;
> -	u32 *new_state = (u32 *) key_state;
> -
> -	*new_state = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE31_0);
> -	*(new_state + 1) = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE63_32);
> -
> -	for (row = 0; row < keypad_data->rows; row++) {
> -		changed = key_state[row] ^ keypad_data->key_state[row];
> -		if (!changed)
> -			continue;
> -
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
> +	u32 low, high;
> +	u64 keys, changed;
> +
> +	low = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE31_0);
> +	high = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE63_32);
> +	keys = low | (u64)high << 32;
> +
> +	changed = keys ^ keypad_data->keys;
> +
> +	/*
> +	 * Report key up events separately and first. This matters in case we
> +	 * lost key-up interrupt and just now catching up.
> +	 */
> +	omap4_keypad_report_keys(keypad_data, changed & ~keys, false);
>  
> -	input_sync(input_dev);
> +	/* Report key down events */
> +	omap4_keypad_report_keys(keypad_data, changed & keys, true);
>  
> -	memcpy(keypad_data->key_state, key_state,
> -		sizeof(keypad_data->key_state));
> +	keypad_data->keys = keys;
>  
>  	/* clear pending interrupts */
>  	kbd_write_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS,
