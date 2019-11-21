Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 144021059D9
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2019 19:44:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbfKUSoZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Nov 2019 13:44:25 -0500
Received: from muru.com ([72.249.23.125]:43224 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726279AbfKUSoZ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 21 Nov 2019 13:44:25 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id EB8DB80DB;
        Thu, 21 Nov 2019 18:45:01 +0000 (UTC)
Date:   Thu, 21 Nov 2019 10:44:21 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Laurentiu-Cristian Duca <laurentiu.duca@gmail.com>
Cc:     linux-omap@vger.kernel.org
Subject: Re: omap4 mcspi interrupts do not appear
Message-ID: <20191121184421.GW35479@atomide.com>
References: <CAPm8-H5MWhpnTF88ZFWwfWqnVKFZ+LoKFVF+nVAdynz62cW18w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPm8-H5MWhpnTF88ZFWwfWqnVKFZ+LoKFVF+nVAdynz62cW18w@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Laurentiu-Cristian Duca <laurentiu.duca@gmail.com> [191121 14:03]:
> Hello linux-omap community,
> 
>  I am an open source enthusiast and I am trying to modify
> omap4 mcspi drivers in order to use interrupts instead of polling.
> I use beaglebone black.
>   After I set CS active and enable channel 0 and interrupts,
> I receive only two interrupts (in fact a pair):
> - tx0_empty and after this I fill the tx buffer by writing in the
> mcspi tx reg n-times
> and then reset the flag in IRQSTATUS
> - as a follow up to the actions taken for tx0_empty,
> rx0_full interrupt is risen and I read the mcspi rx reg n-times
> and reset the flag in IRQSTATUS.
> After that no interrupt comes (neither of tx_empty, rx_full or EOT)
> even if interrupts and channel0 are enabled and CS is active,
> so I can not transfer remaining data.
>   FIFO is enabled and OMAP2_MCSPI_XFERLEVEL is setup accordingly to
> transfer size.
>   Note that if I want to transfer a message that needs only one pair
> of interrupts,
> then EOT interrupt comes, which is the expected behavior.
>   If I use the polling method to see if something is pending on channel0
> everything works well, but need to use interrupts
> because I want to port this driver to Xenomai real-time linux.
>   The dts for spi0 and spi1 is not changed.
> 
>   Any ideas? Did anybody successfully used interrupts (not dma) on omap4 mcspi?

Looks like I'm also seeing zero counts in /proc/interrupts for
spi for my devices. My guess without looking at the code is that
it currently does the transfers with dma and uses the dma interrupt
and dma completion callback.

Maybe check am335x and omap4460 related errata pdf and see if
it provides more clues?

It could also be that the driver bails out wrongly somewhere
if no dma is configured.

Regards,

Tony
