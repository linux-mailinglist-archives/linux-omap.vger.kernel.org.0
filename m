Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 749192458B0
	for <lists+linux-omap@lfdr.de>; Sun, 16 Aug 2020 19:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728306AbgHPRNl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 16 Aug 2020 13:13:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbgHPRNk (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 16 Aug 2020 13:13:40 -0400
Received: from ds0.me (ds0.me [IPv6:2602:ffc5::f9bc:b4ce])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4355EC061786
        for <linux-omap@vger.kernel.org>; Sun, 16 Aug 2020 10:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ds0.me; s=mail;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID; bh=ULZWULeDqVkBMK8uPtVrFR4fQlAwJHmiLEMeNqeCm+0=;
        b=VUBXZeDpTKlizHIZO+v3Ts+t1Dnp3XtHzQpdDwkUPvH0VncdV/rq6g1PuM370/ElyWhHL4lTZ+caiumy8MouRAcjKVtIHgIPMBnJdiq8U92zrVj1mVvGN7lBtQy4V8iB+PvN7zvw+rDZy3z5tL+NJsz8UZgM1e8mL1xP5PTzhm4=;
Received: from 97e0b068.skybroadband.com ([151.224.176.104] helo=archlinux)
        by ds0.me with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.84_2)
        (envelope-from <dave@ds0.me>)
        id 1k7MDm-0005Vd-5D; Sun, 16 Aug 2020 13:13:26 -0400
Message-ID: <30eba639cefaa30718fad38a1dbc53c7475e40dd.camel@ds0.me>
Subject: Re: [Letux-kernel] Lockup inside omap4_prminst_read_inst_reg on
 OMAP5 uEVM
From:   David Shah <dave@ds0.me>
To:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        kernel@pyra-handheld.com, Linux-OMAP <linux-omap@vger.kernel.org>
Date:   Sun, 16 Aug 2020 18:13:19 +0100
In-Reply-To: <b407c35a2017dd348c7fd94eee1386246ffba857.camel@ds0.me>
References: <115bcd43a5d01f2df26b58ffcd7e1a9f9e551c83.camel@ds0.me>
         <b407c35a2017dd348c7fd94eee1386246ffba857.camel@ds0.me>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

It seems like 'CSWR' idle may never have actually worked properly on
the OMAP5...

As an experiment, I took the old TI 3.8.y GLSDK kernel,
commit 2c871a879dbb4234232126f7075468d5bf0a50e3 and made the following
changes:

 - Enabling CONFIG_CPU_IDLE as this was not in omap2plus_defconfig back
then
 - Disabling all the kernel debugging related config, as these seem to
significantly reduce the frequency of lockups
 - OSWR idle disabled, as this is known broken
 - Some small patches to get it working with gcc9, none of which
touched any power management or idle code.

And I saw lockups with an almost identical frequency to 5.6 and 5.7
with a similar config; and the same pipeline stalled error reported by
CCS when connecting over JTAG. The only difference is the reported PC
was a read instruction inside sched_clock rather
than omap4_prminst_read_inst_reg.

Would be interested to know if there is a backstory here? Could it be
related to the bugs that stopped OSWR from working? Is there a glsdk
kernel version that I missed where CSWR on the OMAP5 actually works
reliably.

If anyone wants to try reproducing this; the most important settings
are:

 - CONFIG_CPU_IDLE=y
 - All kernel debugging settings disabled
 - CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y

This will usually result in a lockup while idle at a login prompt
within a few hours with no other hardware connected. A lockup usually
occurs sooner (within 30 minutes) repeatedly wget'ing a 100MB test file
in a loop.

Best

David

On Sat, 2020-08-01 at 21:57 +0100, David Shah wrote:
> A tiny bit more information, if anyone has any more ideas.
> 
> I can confirm that this happened once with the device idle, and no
> networking connection.
> 
> Based on the information I have been able to extract, the call stack
> does
> seem to involve omap4_enter_lowpower but I can't be certain.
> 
> The main JTAG access I have is to be able to read out what seems to
> be
> kernel virtual memory via the other, non-locked-up but WFI, core. I
> attempted to add some tracing via writing a value to a global
> variable
> inside the problem function and then flushing the D$, but the delay
> this
> adds (or the cache flush itself) seems to stop the lockup from
> occuring
> most of the time. It did lock up once with this added, but then
> reading
> out that area of memory failed, possibly because the locked up core
> was
> confusing the cache coherency magic inside the cores.
> 
> Since that lock-up I added 20 NOPs after the cache flush, to try and
> make
> sure the cache flush really does work, and with those added it does
> not
> lock up at all.
> 
> Is there a better way to take advantage of this ability to read out
> memory for debugging?
> 
> Best
> 
> David
> 
> 
> On Sun, 2020-07-26 at 18:59 +0100, David Shah wrote:
> > Hi all,
> > 
> > I am looking into random lockups - significantly rarer than once a
> > day
> > in typical usage, various patterns like lots of bursty network
> > traffic
> > increase frequency - that affect both the uEVM and the Pyra (also
> > OMAP5432 based) on newer kernels (currently testing with 5.6 but I
> > have
> > seen lockups with 5.7 too).
> > 
> > Currently I'm working with the uEVM as it is a bit easier to
> > connect
> > the JTAG adapter. I managed to get a lockup with the JTAG attached,
> > and
> > unfortunately the processor is badly locked up enough (presumably a
> > stuck memory bus?) that JTAG isn't able to get a register dump or
> > stacktrace. But I do get the following error which at least gives a
> > PC: 
> > 
> > CortexA15_0: Trouble Halting Target CPU: (Error -1323 @ 0xC0223E0C)
> > Device failed to enter debug/halt mode because pipeline is stalled.
> > Power-cycle the board. If error persists, confirm configuration
> > and/or
> > try more reliable JTAG settings (e.g. lower TCLK). (Emulation
> > package
> > 9.2.0.00002) 
> > 
> > The second core is just sitting at WFI, don't think there is
> > anything
> > suspicious about that.
> > 
> > Looking at the kernel disassembly this is the actual register read
> > (ldr
> > r0, [r1]) part of omap4_prminst_read_inst_reg.
> > 
> > My best guess is that it is trying to read from a register that
> > doesn't
> > exist or isn't responding due to the current power configuration,
> > but I
> > wonder if anyone has seen this before or has any more clues on how
> > to
> > debug this? It's a shame that I can't seem to see what r1 is or get
> > a
> > backtrace. It looks like it might be possible to set some kind of
> > timeout on the interconnect, has anyone tried something like that
> > to
> > debug this kind of issue?
> > 
> > Best
> > 
> > David Shah
> > 
> > 
> 
> _______________________________________________
> https://projects.goldelico.com/p/gta04-kernel/
> Letux-kernel mailing list
> Letux-kernel@openphoenux.org
> http://lists.goldelico.com/mailman/listinfo.cgi/letux-kernel

