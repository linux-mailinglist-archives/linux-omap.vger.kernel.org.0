Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEA3B245F29
	for <lists+linux-omap@lfdr.de>; Mon, 17 Aug 2020 10:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727936AbgHQITE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 17 Aug 2020 04:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727797AbgHQITC (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 17 Aug 2020 04:19:02 -0400
Received: from ds0.me (ds0.me [IPv6:2602:ffc5::f9bc:b4ce])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78237C061388
        for <linux-omap@vger.kernel.org>; Mon, 17 Aug 2020 01:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ds0.me; s=mail;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID; bh=kv2kv6o8+CJz/gtnJzng8Ng2m7mqY7Uosu9hvJ+JVJo=;
        b=KvyGXLvxGf68frEHtAw7AQ+oxY05UvAa2mpInZC+xdoMl9Gd+oAyGr9ObKswKTg3qEnpV1A50asaFr7X3Gu0eqh4hfQD3jRKKzjrc3n1vySfI/Hmqfa/jl35e/c8wVT0ykhCrWSEsh1ci0UR0J1g0bjgP57AjpURxAOlzE280zA=;
Received: from 97e0b068.skybroadband.com ([151.224.176.104] helo=david-5530)
        by ds0.me with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.84_2)
        (envelope-from <dave@ds0.me>)
        id 1k7aM4-0003PB-7K; Mon, 17 Aug 2020 04:18:56 -0400
Message-ID: <2b2d40b6fde71167d78af33ff3af18f878a13000.camel@ds0.me>
Subject: Re: [Letux-kernel] Lockup inside omap4_prminst_read_inst_reg on
 OMAP5 uEVM
From:   David Shah <dave@ds0.me>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Discussions about the Letux Kernel <letux-kernel@openphoenux.org>,
        kernel@pyra-handheld.com, Linux-OMAP <linux-omap@vger.kernel.org>
Date:   Mon, 17 Aug 2020 09:18:49 +0100
In-Reply-To: <20200817063835.GA2994@atomide.com>
References: <115bcd43a5d01f2df26b58ffcd7e1a9f9e551c83.camel@ds0.me>
         <b407c35a2017dd348c7fd94eee1386246ffba857.camel@ds0.me>
         <30eba639cefaa30718fad38a1dbc53c7475e40dd.camel@ds0.me>
         <20200817063835.GA2994@atomide.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Mon, 2020-08-17 at 09:38 +0300, Tony Lindgren wrote:
> Hi,
> 
> * David Shah <dave@ds0.me> [200816 20:13]:
> > It seems like 'CSWR' idle may never have actually worked properly on
> > the OMAP5...
> > 
> > As an experiment, I took the old TI 3.8.y GLSDK kernel,
> > commit 2c871a879dbb4234232126f7075468d5bf0a50e3 and made the following
> > changes:
> > 
> >  - Enabling CONFIG_CPU_IDLE as this was not in omap2plus_defconfig back
> > then
> >  - Disabling all the kernel debugging related config, as these seem to
> > significantly reduce the frequency of lockups
> >  - OSWR idle disabled, as this is known broken
> >  - Some small patches to get it working with gcc9, none of which
> > touched any power management or idle code.
> > 
> > And I saw lockups with an almost identical frequency to 5.6 and 5.7
> > with a similar config; and the same pipeline stalled error reported by
> > CCS when connecting over JTAG. The only difference is the reported PC
> > was a read instruction inside sched_clock rather
> > than omap4_prminst_read_inst_reg.
> > 
> > Would be interested to know if there is a backstory here? Could it be
> > related to the bugs that stopped OSWR from working? Is there a glsdk
> > kernel version that I missed where CSWR on the OMAP5 actually works
> > reliably.
> > 
> > If anyone wants to try reproducing this; the most important settings
> > are:
> > 
> >  - CONFIG_CPU_IDLE=y
> >  - All kernel debugging settings disabled
> >  - CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
> > 
> > This will usually result in a lockup while idle at a login prompt
> > within a few hours with no other hardware connected. A lockup usually
> > occurs sooner (within 30 minutes) repeatedly wget'ing a 100MB test file
> > in a loop.
> 
> Care to check if this happens with current mainline kernel and sgx
> disabled?
> 
> The reason I'm asking is I used a pi-top with a omap5-igep0050 board as
> a test laptop with the mainline kernel for about two years until I managed
> to break the UART connector on it a few years ago :) I sure had things
> working reliably with no hangs with cpuidle enabled with LPAE. This was
> with the pi-top HDMI panel without sgx.
> 

That's a good idea, I'll try that. 

> Also please see if this happens with omap5-uevm too. There pyra related
> DDR self-refresh related hangs should be out of the AFAIK, but still
> worth testing.
> 

Most of my testing so far has been on the the uEVM, due to easier JTAG access.
For some reason that I have not yet identified, the uEVM actually locks up
slightly more frequently than the Pyra.

I wonder if there is some hardware difference going on, I know a few other
people have had good experiences with the IGEP on older mainline kernels too.

> Regards,
> 
> Tony

