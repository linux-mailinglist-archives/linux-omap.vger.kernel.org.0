Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D4B02925D1
	for <lists+linux-omap@lfdr.de>; Mon, 19 Oct 2020 12:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgJSK3z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Oct 2020 06:29:55 -0400
Received: from smtp1-g21.free.fr ([212.27.42.1]:26149 "EHLO smtp1-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726791AbgJSK3z (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 19 Oct 2020 06:29:55 -0400
Received: from [IPv6:2a01:e0a:255:1000:418c:f3f1:2ca7:834] (unknown [IPv6:2a01:e0a:255:1000:418c:f3f1:2ca7:834])
        (Authenticated sender: duncan.sands@free.fr)
        by smtp1-g21.free.fr (Postfix) with ESMTPSA id C5434B0052C;
        Mon, 19 Oct 2020 12:28:33 +0200 (CEST)
Subject: Re: [patch V2 13/13] usb: atm: Replace in_interrupt() usage in
 comment
To:     Thomas Gleixner <tglx@linutronix.de>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
References: <20201019100629.419020859@linutronix.de>
 <20201019101110.944939915@linutronix.de>
From:   Duncan Sands <duncan.sands@free.fr>
Message-ID: <0fe3d019-3c5d-fd11-dcc7-6c4ff8b04403@free.fr>
Date:   Mon, 19 Oct 2020 12:28:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201019101110.944939915@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 10/19/20 12:06 PM, Thomas Gleixner wrote:
> in_interrupt() is a pretty vague context description as it means: hard
> interrupt, soft interrupt or bottom half disabled regions.
> 
> Replace the vague comment with a proper reasoning why spin_lock_irqsave()
> needs to be used.
> 
> Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Duncan Sands <duncan.sands@free.fr>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> 
> ---
>   drivers/usb/atm/usbatm.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- a/drivers/usb/atm/usbatm.c
> +++ b/drivers/usb/atm/usbatm.c
> @@ -249,7 +249,7 @@ static void usbatm_complete(struct urb *
>   	/* vdbg("%s: urb 0x%p, status %d, actual_length %d",
>   	     __func__, urb, status, urb->actual_length); */
>   
> -	/* usually in_interrupt(), but not always */
> +	/* Can be invoked from task context, protect against interrupts */
>   	spin_lock_irqsave(&channel->lock, flags);
>   
>   	/* must add to the back when receiving; doesn't matter when sending */
> 


Signed-off-by: Duncan Sands <duncan.sands@free.fr>
