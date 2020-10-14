Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24B5128E446
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 18:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729651AbgJNQUh (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 12:20:37 -0400
Received: from netrider.rowland.org ([192.131.102.5]:50011 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729262AbgJNQUg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 12:20:36 -0400
Received: (qmail 719097 invoked by uid 1000); 14 Oct 2020 12:20:36 -0400
Date:   Wed, 14 Oct 2020 12:20:36 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-omap@vger.kernel.org,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Johan Hovold <johan@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: Re: [patch 08/12] usb: hosts: Remove in_interrupt() from comments
Message-ID: <20201014162036.GC712494@rowland.harvard.edu>
References: <20201014145215.518912759@linutronix.de>
 <20201014145727.957664398@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201014145727.957664398@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 14, 2020 at 04:52:23PM +0200, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <a.darwish@linutronix.de>
> 
> The usage of in_interrupt() in drivers is phased out for various reasons.
> 
> Various comments use !in_interrupt() to describe calling context for probe()
> and remove() functions. That's wrong because the calling context has to be
> preemptible task context, which is not what !in_interrupt() describes.
> 
> Cleanup the comments. While at it add the missing kernel doc argument
> descriptors and make usb_hcd_msp_remove() static.
> 
> Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-omap@vger.kernel.org
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> 
> ---

> --- a/drivers/usb/host/ehci-pmcmsp.c
> +++ b/drivers/usb/host/ehci-pmcmsp.c

> @@ -233,7 +236,7 @@ int usb_hcd_msp_probe(const struct hc_dr
>   * may be called without controller electrically present
>   * may be called with controller, bus, and devices active
>   */
> -void usb_hcd_msp_remove(struct usb_hcd *hcd, struct platform_device *dev)
> +static void usb_hcd_msp_remove(struct usb_hcd *hcd)

Please don't intermix changes to comments with other more substantive 
changes.

> --- a/drivers/usb/host/ohci-omap.c
> +++ b/drivers/usb/host/ohci-omap.c

> @@ -399,8 +401,7 @@ static int ohci_hcd_omap_probe(struct pl
>  
>  /**
>   * ohci_hcd_omap_remove - shutdown processing for OMAP-based HCDs
> - * @dev: USB Host Controller being removed
> - * Context: !in_interrupt()
> + * @pdev: USB Host Controller being removed
>   *
>   * Reverses the effect of ohci_hcd_omap_probe(), first invoking
>   * the HCD's stop() method.  It is always called from a thread

You forgot to add the Context comment.

Alan Stern
