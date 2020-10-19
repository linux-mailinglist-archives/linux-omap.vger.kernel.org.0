Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D697D292B71
	for <lists+linux-omap@lfdr.de>; Mon, 19 Oct 2020 18:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730570AbgJSQ2V (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Oct 2020 12:28:21 -0400
Received: from netrider.rowland.org ([192.131.102.5]:58637 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730459AbgJSQ2U (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Oct 2020 12:28:20 -0400
Received: (qmail 902120 invoked by uid 1000); 19 Oct 2020 12:28:19 -0400
Date:   Mon, 19 Oct 2020 12:28:19 -0400
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
Subject: Re: [patch V2 08/13] usb: hosts: Remove in_interrupt() from comments
Message-ID: <20201019162819.GA898631@rowland.harvard.edu>
References: <20201019100629.419020859@linutronix.de>
 <20201019101110.439968251@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019101110.439968251@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Oct 19, 2020 at 12:06:37PM +0200, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <a.darwish@linutronix.de>
> 
> The usage of in_interrupt() in drivers is phased out for various reasons.
> 
> Various comments use !in_interrupt() to describe calling context for probe()
> and remove() functions. That's wrong because the calling context has to be
> preemptible task context, which is not what !in_interrupt() describes.
> 
> Cleanup the comments. While at it add the missing kernel doc argument
> descriptors.
> 
> Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>                                                                                                                                                                                                                                 
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-omap@vger.kernel.org
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> ---
> V2: Split out the static change and add a missing comment
> ---
>  drivers/usb/host/ehci-fsl.c     |    9 ++++-----
>  drivers/usb/host/ehci-pmcmsp.c  |   11 +++++++----
>  drivers/usb/host/ohci-at91.c    |   11 ++++++++---
>  drivers/usb/host/ohci-omap.c    |    9 ++++++---
>  drivers/usb/host/ohci-pxa27x.c  |   11 ++++++-----
>  drivers/usb/host/ohci-s3c2410.c |   12 ++++++------
>  6 files changed, 37 insertions(+), 26 deletions(-)

Acked-by: Alan Stern <stern@rowland.harvard.edu>
