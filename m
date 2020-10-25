Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5342982B8
	for <lists+linux-omap@lfdr.de>; Sun, 25 Oct 2020 18:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1417583AbgJYRQO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 25 Oct 2020 13:16:14 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46275 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729178AbgJYRQO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 25 Oct 2020 13:16:14 -0400
Received: by mail-lj1-f193.google.com with SMTP id c21so7225496ljn.13;
        Sun, 25 Oct 2020 10:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=PMXldS4frrwc3ZqG31YTvYd9N3hWa1nWp8tHb7QPcuo=;
        b=A5o35qXcJnIGGKDb2vQ8pWHU+FKjlNnKTLLPC5Vt2qWiYh+N6qz07YK/YejopSG1L8
         C8M3pmOOyIV430OJDKRwkl+JEoAEAQrAr1qxorvdqLCSvhW3QU1AM+bm9gOmZYExW0dH
         jgPYG37sjcMZAefYy9X1jKzIWBVdp5mFn9B9dOHmFZcOGy+qaV1yrF7hkzpKjLytI2Ep
         eOvCubBtr6MbusPHD66WVq57Ln9kuGjgiDRfikQfFtf9wXk8wXquHXjAPCYv0sc/+0iI
         hg/TqP2AiRnyxG+ueiZhLL1pVTv4ZDcwhFk5Sg21rW15ift1LnJBP4/5d1Y1qexCLSBa
         3FsQ==
X-Gm-Message-State: AOAM533r4RdersgUCyPeqjiaxhOOzfokAwIgFDyl+qU7iweWwAOBpvfg
        tIECSoZeyf+fDg6UGQEbfd8tHcQRANe/fA==
X-Google-Smtp-Source: ABdhPJxXubjA+MMwIxWygGmgjStosuhUXTqdl0C1uXV6556piPV6UdgHcGYW5JHodk1O0FLDjxTXBg==
X-Received: by 2002:a2e:9955:: with SMTP id r21mr4069846ljj.124.1603646171409;
        Sun, 25 Oct 2020 10:16:11 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id y21sm789025lfk.49.2020.10.25.10.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 10:16:10 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kWjcr-0004lp-Dw; Sun, 25 Oct 2020 18:16:14 +0100
Date:   Sun, 25 Oct 2020 18:16:13 +0100
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
Subject: Re: [patch V2 04/13] USB: serial: digi_acceleport: Remove
 in_interrupt() usage
Message-ID: <20201025171613.GT26280@localhost>
References: <20201019100629.419020859@linutronix.de>
 <20201019101110.019266389@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019101110.019266389@linutronix.de>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Oct 19, 2020 at 12:06:33PM +0200, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <a.darwish@linutronix.de>
> 
> The usage of in_interrupt() in drivers is phased out and Linus clearly
> requested that code which changes behaviour depending on context should
> either be separated or the context be conveyed in an argument passed by the
> caller, which usually knows the context.
> 
> The debug printk() in digi_write() prints in_interrupt() as context
> information. TTY writes happen always in preemptible task context and
> console writes can happen from almost any context, so in_interrupt() is not
> really helpful.

The above statement is not correct, TTY writes can and do happen from
other contexts, including soft IRQ (e.g. PPP).

> Aside of that issuing a printk() from a console->write() callback is not a
> really brilliant idea for obvious reasons.

True, but we don't need to sprinkle conditionals for the benefit of
people trying to debug USB serial drivers using a USB serial console.
They get what they deserve. ;)

> Remove the in_interrupt() printout and make the printk() depend on tty.
> 
> Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> 
> ---
>  drivers/usb/serial/digi_acceleport.c |    7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> --- a/drivers/usb/serial/digi_acceleport.c
> +++ b/drivers/usb/serial/digi_acceleport.c
> @@ -911,9 +911,10 @@ static int digi_write(struct tty_struct
>  	unsigned char *data = port->write_urb->transfer_buffer;
>  	unsigned long flags = 0;
>  
> -	dev_dbg(&port->dev,
> -		"digi_write: TOP: port=%d, count=%d, in_interrupt=%ld\n",
> -		priv->dp_port_num, count, in_interrupt());
> +	if (tty) {
> +		dev_dbg(&port->dev, "digi_write: TOP: port=%d, count=%d\n",
> +			priv->dp_port_num, count);
> +	}

So just drop the in_interrupt() here.

Also note that we already have another unconditional dev_dbg() at the
end of this function.

>  
>  	/* copy user data (which can sleep) before getting spin lock */
>  	count = min(count, port->bulk_out_size-2);
> 

Johan
