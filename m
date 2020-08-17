Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C37F1245C97
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 08:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726746AbgHQGiO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 02:38:14 -0400
Received: from muru.com ([72.249.23.125]:40416 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726483AbgHQGiN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 17 Aug 2020 02:38:13 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 36DAA80A3;
        Mon, 17 Aug 2020 06:38:12 +0000 (UTC)
Date:   Mon, 17 Aug 2020 09:38:35 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     David Shah <dave@ds0.me>
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        kernel@pyra-handheld.com, Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: [Letux-kernel] Lockup inside omap4_prminst_read_inst_reg on
 OMAP5 uEVM
Message-ID: <20200817063835.GA2994@atomide.com>
References: <115bcd43a5d01f2df26b58ffcd7e1a9f9e551c83.camel@ds0.me>
 <b407c35a2017dd348c7fd94eee1386246ffba857.camel@ds0.me>
 <30eba639cefaa30718fad38a1dbc53c7475e40dd.camel@ds0.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30eba639cefaa30718fad38a1dbc53c7475e40dd.camel@ds0.me>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

* David Shah <dave@ds0.me> [200816 20:13]:
> It seems like 'CSWR' idle may never have actually worked properly on
> the OMAP5...
> 
> As an experiment, I took the old TI 3.8.y GLSDK kernel,
> commit 2c871a879dbb4234232126f7075468d5bf0a50e3 and made the following
> changes:
> 
>  - Enabling CONFIG_CPU_IDLE as this was not in omap2plus_defconfig back
> then
>  - Disabling all the kernel debugging related config, as these seem to
> significantly reduce the frequency of lockups
>  - OSWR idle disabled, as this is known broken
>  - Some small patches to get it working with gcc9, none of which
> touched any power management or idle code.
> 
> And I saw lockups with an almost identical frequency to 5.6 and 5.7
> with a similar config; and the same pipeline stalled error reported by
> CCS when connecting over JTAG. The only difference is the reported PC
> was a read instruction inside sched_clock rather
> than omap4_prminst_read_inst_reg.
> 
> Would be interested to know if there is a backstory here? Could it be
> related to the bugs that stopped OSWR from working? Is there a glsdk
> kernel version that I missed where CSWR on the OMAP5 actually works
> reliably.
> 
> If anyone wants to try reproducing this; the most important settings
> are:
> 
>  - CONFIG_CPU_IDLE=y
>  - All kernel debugging settings disabled
>  - CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
> 
> This will usually result in a lockup while idle at a login prompt
> within a few hours with no other hardware connected. A lockup usually
> occurs sooner (within 30 minutes) repeatedly wget'ing a 100MB test file
> in a loop.

Care to check if this happens with current mainline kernel and sgx
disabled?

The reason I'm asking is I used a pi-top with a omap5-igep0050 board as
a test laptop with the mainline kernel for about two years until I managed
to break the UART connector on it a few years ago :) I sure had things
working reliably with no hangs with cpuidle enabled with LPAE. This was
with the pi-top HDMI panel without sgx.

Also please see if this happens with omap5-uevm too. There pyra related
DDR self-refresh related hangs should be out of the AFAIK, but still
worth testing.

Regards,

Tony
