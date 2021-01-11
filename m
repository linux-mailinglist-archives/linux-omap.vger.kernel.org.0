Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D319B2F0CB2
	for <lists+linux-omap@lfdr.de>; Mon, 11 Jan 2021 07:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727092AbhAKF6Z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 11 Jan 2021 00:58:25 -0500
Received: from muru.com ([72.249.23.125]:42630 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727055AbhAKF6Y (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 11 Jan 2021 00:58:24 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 528C980E4;
        Mon, 11 Jan 2021 05:57:43 +0000 (UTC)
Date:   Mon, 11 Jan 2021 07:57:39 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Arthur Demchenkov <spinal.by@gmail.com>,
        Carl Philipp Klemm <philipp@uvos.xyz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>, ruleh <ruleh@gmx.de>,
        Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH 3/5] Input: omap4-keypad - move rest of key scanning to a
 separate function
Message-ID: <X/vo03Hd0sJFou3h@atomide.com>
References: <20210110190529.46135-1-tony@atomide.com>
 <20210110190529.46135-4-tony@atomide.com>
 <X/vZJMAOJc/CzmHH@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/vZJMAOJc/CzmHH@google.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Dmitry Torokhov <dmitry.torokhov@gmail.com> [210111 04:50]:
> On Sun, Jan 10, 2021 at 09:05:27PM +0200, Tony Lindgren wrote:
> > Let's move rest of the key scanning code to omap4_keypad_scan_keys().
> > We will use omap4_keypad_scan_keys() also for implementing errata
> > handling to clear the stuck last key in the following patch.
> 
> And this one will become then...

Yes great, this works for me.

Thanks,

Tony


> 
> Input: omap4-keypad - move rest of key scanning to a separate function
> 
> From: Tony Lindgren <tony@atomide.com>
> 
> Let's move rest of the key scanning code to omap4_keypad_scan_keys().
> We will use omap4_keypad_scan_keys() also for implementing errata
> handling to clear the stuck last key in the following patch.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/keyboard/omap4-keypad.c |   39 ++++++++++++++++++++++-----------
>  1 file changed, 26 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
> index 6dcf27af856d..c48705dd049b 100644
> --- a/drivers/input/keyboard/omap4-keypad.c
> +++ b/drivers/input/keyboard/omap4-keypad.c
> @@ -71,6 +71,7 @@ struct omap4_keypad {
>  
>  	void __iomem *base;
>  	unsigned int irq;
> +	struct mutex lock;		/* for key scan */
>  
>  	unsigned int rows;
>  	unsigned int cols;
> @@ -135,6 +136,28 @@ static int omap4_keypad_report_keys(struct omap4_keypad *keypad_data,
>  	return events;
>  }
>  
> +static void omap4_keypad_scan_keys(struct omap4_keypad *keypad_data, u64 keys)
> +{
> +	u64 changed;
> +
> +	mutex_lock(&keypad_data->lock);
> +
> +	changed = keys ^ keypad_data->keys;
> +
> +	/*
> +	 * Report key up events separately and first. This matters in case we
> +	 * lost key-up interrupt and just now catching up.
> +	 */
> +	omap4_keypad_report_keys(keypad_data, changed & ~keys, false);
> +
> +	/* Report key down events */
> +	omap4_keypad_report_keys(keypad_data, changed & keys, true);
> +
> +	keypad_data->keys = keys;
> +
> +	mutex_unlock(&keypad_data->lock);
> +}
> +
>  /* Interrupt handlers */
>  static irqreturn_t omap4_keypad_irq_handler(int irq, void *dev_id)
>  {
> @@ -150,24 +173,13 @@ static irqreturn_t omap4_keypad_irq_thread_fn(int irq, void *dev_id)
>  {
>  	struct omap4_keypad *keypad_data = dev_id;
>  	u32 low, high;
> -	u64 keys, changed;
> +	u64 keys;
>  
>  	low = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE31_0);
>  	high = kbd_readl(keypad_data, OMAP4_KBD_FULLCODE63_32);
>  	keys = low | (u64)high << 32;
>  
> -	changed = keys ^ keypad_data->keys;
> -
> -	/*
> -	 * Report key up events separately and first. This matters in case we
> -	 * lost key-up interrupt and just now catching up.
> -	 */
> -	omap4_keypad_report_keys(keypad_data, changed & ~keys, false);
> -
> -	/* Report key down events */
> -	omap4_keypad_report_keys(keypad_data, changed & keys, true);
> -
> -	keypad_data->keys = keys;
> +	omap4_keypad_scan_keys(keypad_data, keys);
>  
>  	/* clear pending interrupts */
>  	kbd_write_irqreg(keypad_data, OMAP4_KBD_IRQSTATUS,
> @@ -300,6 +312,7 @@ static int omap4_keypad_probe(struct platform_device *pdev)
>  	}
>  
>  	keypad_data->irq = irq;
> +	mutex_init(&keypad_data->lock);
>  
>  	error = omap4_keypad_parse_dt(dev, keypad_data);
>  	if (error)
