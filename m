Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 960D42982A2
	for <lists+linux-omap@lfdr.de>; Sun, 25 Oct 2020 17:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1417403AbgJYQ4v (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 25 Oct 2020 12:56:51 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43620 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1417402AbgJYQ4u (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 25 Oct 2020 12:56:50 -0400
Received: by mail-lf1-f68.google.com with SMTP id l28so8807614lfp.10;
        Sun, 25 Oct 2020 09:56:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ePQFbJ/3Ad8/iX5Bs449C4InLn8t8GvqBrcAtxnaBrw=;
        b=BN7peJ0WhFsbpRxrqDoNZMuuIT8pVQ6tHBWiC2EwoJVFBKTOcKbMJVs4GvKrzSax0l
         u8ZXnFM5ZE6rzH1Gs0sLJhfw7qs/kYm0RS7Kx4xblEAsOOSCBVpNXIevkyohZTPgFmrz
         A4DhR9T3u5C6264AflnPeRghIyKmVO21KEIJkwBOC/yF2Dkn+PWQ/4OQIItXvcRPr8R1
         oeynbBebwD2KtwffAKlqrhmwljydPGYrLkiP4HW3a29uAGDlgzp3UaQCoLuJ31b7j918
         a2bWOI4PQLfG5BLoRwYCoy2cR3zKYkPXHfC/78PyP5mwi261wqu9z7/qU+S0GIEB8EAs
         winw==
X-Gm-Message-State: AOAM530FzgQCdyyWLz92DK5eOYG6MxNbiF9Ew96NmpdiKv6rUBmG5AMQ
        uxQkf78u2Fdaj/ifYPH8e3o=
X-Google-Smtp-Source: ABdhPJw0J0QYFNhrbQ5xJk2wEIsCh8he6dIVwqhUM/8GfMALjY8iyY5XhCPb37I1yXtuPPPcMA5RlQ==
X-Received: by 2002:a05:6512:331a:: with SMTP id k26mr3457916lfe.349.1603645006196;
        Sun, 25 Oct 2020 09:56:46 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id c202sm778432lfg.133.2020.10.25.09.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 09:56:44 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kWjK3-0004fv-U4; Sun, 25 Oct 2020 17:56:48 +0100
Date:   Sun, 25 Oct 2020 17:56:47 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-omap@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: Re: [patch V2 02/13] USB: serial: keyspan_pda: Replace
 in_interrupt() usage
Message-ID: <20201025165647.GR26280@localhost>
References: <20201019100629.419020859@linutronix.de>
 <20201019101109.753597069@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019101109.753597069@linutronix.de>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Oct 19, 2020 at 12:06:31PM +0200, Thomas Gleixner wrote:
> keyspan_pda_write() uses in_interrupt() to check whether it is safe to
> invoke functions which might sleep.
> 
> The usage of in_interrupt() in drivers is phased out and Linus clearly
> requested that code which changes behaviour depending on context should
> either be seperated or the context be conveyed in an argument passed by the
> caller, which usually knows the context.
> 
> Aside of that it does not cover all contexts which cannot sleep,
> e.g. preempt disabled regions which cannot be reliably detected on all
> kernel configurations.
> 
> With the current printk() implementation console->write() can be invoked
> from almost any context. The upcoming rework of the console core will
> provide thread context for console drivers which require to sleep.
> 
> For now, restrict the room query which can sleep to tty writes which happen
> from preemptible task context.
> 
> The usability for dmesg output is limited anyway because it's almost
> guaranteed to drop the 'LF' which is submitted after the dmesg line because
> the device supports only one transfer on flight. Same for any printk()
> which is coming in before the previous transfer has been done.
> 
> This new restriction does not make it worse than before, but it makes the
> condition correct under all circumstances.
> 
> Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> 
> ---
>  drivers/usb/serial/keyspan_pda.c |   10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> --- a/drivers/usb/serial/keyspan_pda.c
> +++ b/drivers/usb/serial/keyspan_pda.c
> @@ -477,10 +477,12 @@ static int keyspan_pda_write(struct tty_
>  
>  	count = (count > port->bulk_out_size) ? port->bulk_out_size : count;
>  
> -	/* Check if we might overrun the Tx buffer.   If so, ask the
> -	   device how much room it really has.  This is done only on
> -	   scheduler time, since usb_control_msg() sleeps. */
> -	if (count > priv->tx_room && !in_interrupt()) {
> +	/*
> +	 * Check if we might overrun the Tx buffer. If so, ask the device
> +	 * how much room it really has. This can only be invoked for tty
> +	 * usage because the console write can't sleep.
> +	 */
> +	if (count > priv->tx_room && tty) {
>  		u8 *room;
>  
>  		room = kmalloc(1, GFP_KERNEL);

There's a ton of issues with this driver, but this is arguably making
things worse. A line discipline may call write() from just about any
context so we cannot rely on tty being non-NULL here (e.g. PPP).

I've prepared a series fixing up the driver's write implementation
that does away with this room check in the write path instead.

Johan
