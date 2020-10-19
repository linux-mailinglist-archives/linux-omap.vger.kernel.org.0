Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5A8292B7F
	for <lists+linux-omap@lfdr.de>; Mon, 19 Oct 2020 18:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730642AbgJSQ2l (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Oct 2020 12:28:41 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34811 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730637AbgJSQ2l (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Oct 2020 12:28:41 -0400
Received: (qmail 902215 invoked by uid 1000); 19 Oct 2020 12:28:40 -0400
Date:   Mon, 19 Oct 2020 12:28:40 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        Johan Hovold <johan@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-omap@vger.kernel.org,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: Re: [patch V2 12/13] usb: core: Replace in_interrupt() in comments
Message-ID: <20201019162840.GD898631@rowland.harvard.edu>
References: <20201019100629.419020859@linutronix.de>
 <20201019101110.851821025@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201019101110.851821025@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Oct 19, 2020 at 12:06:41PM +0200, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <a.darwish@linutronix.de>
> 
> The usage of in_interrupt() in drivers is phased out for various reasons.
> 
> Various comments use !in_interrupt() to describe calling context for
> functions which might sleep. That's wrong because the calling context has
> to be preemptible task context, which is not what !in_interrupt()
> describes.
> 
> Replace !in_interrupt() with more accurate plain text descriptions.
> 
> The comment for usb_hcd_poll_rh_status() is misleading as this function is
> called from all kinds of contexts including preemptible task
> context. Remove it as there is obviously no restriction.
> 
> Signed-off-by: Ahmed S. Darwish <a.darwish@linutronix.de>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> ---
> V2: Fixup the comments according to review (Alan)
> ---
>  drivers/usb/core/buffer.c  |    6 ++++--
>  drivers/usb/core/hcd-pci.c |    6 ++++--
>  drivers/usb/core/hcd.c     |   26 +++++++++++++++++---------
>  drivers/usb/core/hub.c     |    3 ++-
>  drivers/usb/core/message.c |   35 ++++++++++++++++++++++-------------
>  drivers/usb/core/usb.c     |    4 ++--
>  6 files changed, 51 insertions(+), 29 deletions(-)

Acked-by: Alan Stern <stern@rowland.harvard.edu>
