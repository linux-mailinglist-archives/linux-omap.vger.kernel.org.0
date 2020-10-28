Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14EB529D6B8
	for <lists+linux-omap@lfdr.de>; Wed, 28 Oct 2020 23:18:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731755AbgJ1WRn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Oct 2020 18:17:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:60514 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731715AbgJ1WRm (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:42 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 84796246BF;
        Wed, 28 Oct 2020 11:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603884420;
        bh=4Vz9K5VWILkqVQVWRhlSP7/sa3Zk4U9Q0Nqg2nrhOcc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZWcppmpESqFXU3Hg0RYaM8+OgGedONeP+ja3A+NsQ4iuMHP/cSCdIglAcGPUaQeQS
         PAd5HVdFzbzPZeTAwuecuMpWvGHv0yrgnuXT6XkHETGQcH4ldJV8qCSGaZ5K6q1Drv
         jw4UNBjUDtoi+nZuOL+PaVmMvj3p5s0VmetzCJsM=
Date:   Wed, 28 Oct 2020 12:27:52 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        linux-usb@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Johan Hovold <johan@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-omap@vger.kernel.org, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: Re: [patch V2 06/13] usb: host: isp1362: Replace in_interrupt() usage
Message-ID: <20201028112752.GA1991431@kroah.com>
References: <20201019100629.419020859@linutronix.de>
 <20201019101110.240285929@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019101110.240285929@linutronix.de>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Oct 19, 2020 at 12:06:35PM +0200, Thomas Gleixner wrote:
> isp1362_show_regs() is a debugging-only function, with no call sites. It
> prints the cached value of the HCuPINTENB register if in_interupt() is
> true, otherwise it reads the actual register content.
> 
> The usage of in_interrupt() in drivers is phased out and Linus clearly
> requested that code which changes behaviour depending on context should
> either be separated or the context be conveyed in an argument passed by the
> caller, which usually knows the context.
> 
> Make the conditional based on a function argument.
> 
> Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> ---
> V2: Fix silly typo
> ---
>  drivers/usb/host/isp1362.h |    5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> --- a/drivers/usb/host/isp1362.h
> +++ b/drivers/usb/host/isp1362.h
> @@ -793,7 +793,8 @@ static void isp1362_write_fifo(struct is
>  			ISP1362_REG_NO(ISP1362_REG_##r), isp1362_read_reg16(d, r));	\
>  }
>  
> -static void __attribute__((__unused__)) isp1362_show_regs(struct isp1362_hcd *isp1362_hcd)
> +static void __attribute__((__unused__))
> +isp1362_show_regs(struct isp1362_hcd *isp1362_hcd, bool cached_inten)
>  {
>  	isp1362_show_reg(isp1362_hcd, HCREVISION);
>  	isp1362_show_reg(isp1362_hcd, HCCONTROL);
> @@ -815,7 +816,7 @@ static void __attribute__((__unused__))
>  	isp1362_show_reg(isp1362_hcd, HCXFERCTR);
>  	isp1362_show_reg(isp1362_hcd, HCuPINT);
>  
> -	if (in_interrupt())
> +	if (cached_inten)
>  		DBG(0, "%-12s[%02x]:     %04x\n", "HCuPINTENB",
>  			 ISP1362_REG_NO(ISP1362_REG_HCuPINTENB), isp1362_hcd->irqenb);
>  	else
> 

Let's just delete this whole function, if no one is calling it, it
should not be present.  I'll go make up a patch for that...

thanks,

greg k-h
