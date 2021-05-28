Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABED6393F1B
	for <lists+linux-omap@lfdr.de>; Fri, 28 May 2021 11:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234608AbhE1JCI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 May 2021 05:02:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:57206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229911AbhE1JCH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 28 May 2021 05:02:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 972266124B;
        Fri, 28 May 2021 09:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1622192433;
        bh=5utpBUWZl30sjRPFYC2tWtUU3o2Hk1kNkbbqmvyXDQ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wV1V6JJkzHScqdoKBqatYtK/jnXG1G2X9vDHC9UwSazaAvae9ZPt2bqKdM6oZjcRD
         R/iI74zyIxz503oY/Ba8BFO/cR5N5M5zSbF+Lb8rqH2PisIiiGaod80jfThD30XHe+
         pRSeoXrBKAOnM4M3zwrw3YkxLXztBwjeVl4iXIAQ=
Date:   Fri, 28 May 2021 11:00:30 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] serial: 8250: 8250_omap: Fix possible interrupt storm
Message-ID: <YLCxLvcm/yG9+GE3@kroah.com>
References: <20210511151955.28071-1-vigneshr@ti.com>
 <YJ008MjjewRUTn9Z@kroah.com>
 <YLCCJzkkB4N7LTQS@atomide.com>
 <e5b35370-bf2d-7295-e2fd-9aee5bbc3296@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5b35370-bf2d-7295-e2fd-9aee5bbc3296@ti.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, May 28, 2021 at 11:41:36AM +0530, Vignesh Raghavendra wrote:
> Hi,
> 
> On 5/28/21 11:09 AM, Tony Lindgren wrote:
> > Hi Greg, Vignesh & Jan,
> > 
> > * Greg Kroah-Hartman <gregkh@linuxfoundation.org> [210513 14:17]:
> >> On Tue, May 11, 2021 at 08:49:55PM +0530, Vignesh Raghavendra wrote:
> >>> It is possible that RX TIMEOUT is signalled after RX FIFO has been
> >>> drained, in which case a dummy read of RX FIFO is required to clear RX
> >>> TIMEOUT condition. Otherwise, RX TIMEOUT condition is not cleared
> >>> leading to an interrupt storm
> >>>
> >>> Cc: stable@vger.kernel.org
> >>
> >> How far back does this need to go?  What commit id does this fix?  What
> >> caused this to just show up now vs. previously?
> 
> Sorry, I missed this reply. Issue was reported on AM65x SoC with custom
> test case from Jan Kiszka that stressed UART with rapid baudrate changes
> from 9600 to 4M along with data transfer.
> 
> Based on the condition that led to interrupt storm, I inferred it to
> affect all SoCs with 8250 OMAP UARTs. But that seems thats not the best
> idea as seen from OMAP3 regression.
> 
> Greg,
> 
> Could you please drop the patch? Very sorry for the inconvenience..

Now reverted, thanks.

greg k-h
