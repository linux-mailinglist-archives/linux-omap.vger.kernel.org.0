Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07A6B23545C
	for <lists+linux-omap@lfdr.de>; Sat,  1 Aug 2020 22:57:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbgHAU5y (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 1 Aug 2020 16:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725883AbgHAU5x (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 1 Aug 2020 16:57:53 -0400
Received: from ds0.me (ds0.me [IPv6:2602:ffc5::f9bc:b4ce])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB1E8C06174A
        for <linux-omap@vger.kernel.org>; Sat,  1 Aug 2020 13:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ds0.me; s=mail;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID; bh=qv/TvrMjTL4urSBNPDVaQcmtjWrFJ3nZUlZXWNMtI/8=;
        b=lXBukULMWc8irG+6gjjIBV1hzlzh1aMcjZyD8nB7hNZ6lKvy+ogHqkoUtP4NGxJAE1bC1Keuaw+zVzemYS+oHGUDn62WA3ZWcTPVcqU+C3vhMtA5Ua6EEmmaA4vyAJVTHk2ulIyOPsr4WhtEjinr9U7ajce0qM6BpScLIsCih/w=;
Received: from 97e2e5e0.skybroadband.com ([151.226.229.224] helo=david-5530)
        by ds0.me with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.84_2)
        (envelope-from <dave@ds0.me>)
        id 1k1yZb-0001e2-6t; Sat, 01 Aug 2020 16:57:43 -0400
Message-ID: <b407c35a2017dd348c7fd94eee1386246ffba857.camel@ds0.me>
Subject: Re: Lockup inside omap4_prminst_read_inst_reg on OMAP5 uEVM
From:   David Shah <dave@ds0.me>
To:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        kernel@pyra-handheld.com, Linux-OMAP <linux-omap@vger.kernel.org>
Date:   Sat, 01 Aug 2020 21:57:36 +0100
In-Reply-To: <115bcd43a5d01f2df26b58ffcd7e1a9f9e551c83.camel@ds0.me>
References: <115bcd43a5d01f2df26b58ffcd7e1a9f9e551c83.camel@ds0.me>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

A tiny bit more information, if anyone has any more ideas.

I can confirm that this happened once with the device idle, and no
networking connection.

Based on the information I have been able to extract, the call stack does
seem to involve omap4_enter_lowpower but I can't be certain.

The main JTAG access I have is to be able to read out what seems to be
kernel virtual memory via the other, non-locked-up but WFI, core. I
attempted to add some tracing via writing a value to a global variable
inside the problem function and then flushing the D$, but the delay this
adds (or the cache flush itself) seems to stop the lockup from occuring
most of the time. It did lock up once with this added, but then reading
out that area of memory failed, possibly because the locked up core was
confusing the cache coherency magic inside the cores.

Since that lock-up I added 20 NOPs after the cache flush, to try and make
sure the cache flush really does work, and with those added it does not
lock up at all.

Is there a better way to take advantage of this ability to read out
memory for debugging?

Best

David


On Sun, 2020-07-26 at 18:59 +0100, David Shah wrote:
> Hi all,
> 
> I am looking into random lockups - significantly rarer than once a day
> in typical usage, various patterns like lots of bursty network traffic
> increase frequency - that affect both the uEVM and the Pyra (also
> OMAP5432 based) on newer kernels (currently testing with 5.6 but I have
> seen lockups with 5.7 too).
> 
> Currently I'm working with the uEVM as it is a bit easier to connect
> the JTAG adapter. I managed to get a lockup with the JTAG attached, and
> unfortunately the processor is badly locked up enough (presumably a
> stuck memory bus?) that JTAG isn't able to get a register dump or
> stacktrace. But I do get the following error which at least gives a
> PC: 
> 
> CortexA15_0: Trouble Halting Target CPU: (Error -1323 @ 0xC0223E0C)
> Device failed to enter debug/halt mode because pipeline is stalled.
> Power-cycle the board. If error persists, confirm configuration and/or
> try more reliable JTAG settings (e.g. lower TCLK). (Emulation package
> 9.2.0.00002) 
> 
> The second core is just sitting at WFI, don't think there is anything
> suspicious about that.
> 
> Looking at the kernel disassembly this is the actual register read (ldr
> r0, [r1]) part of omap4_prminst_read_inst_reg.
> 
> My best guess is that it is trying to read from a register that doesn't
> exist or isn't responding due to the current power configuration, but I
> wonder if anyone has seen this before or has any more clues on how to
> debug this? It's a shame that I can't seem to see what r1 is or get a
> backtrace. It looks like it might be possible to set some kind of
> timeout on the interconnect, has anyone tried something like that to
> debug this kind of issue?
> 
> Best
> 
> David Shah
> 
> 

