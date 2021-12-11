Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3861847135F
	for <lists+linux-omap@lfdr.de>; Sat, 11 Dec 2021 11:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhLKKnM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 11 Dec 2021 05:43:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbhLKKnL (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 11 Dec 2021 05:43:11 -0500
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 370A8C061714
        for <linux-omap@vger.kernel.org>; Sat, 11 Dec 2021 02:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=zWk4cL+qtg9AVVmekan+4ZxDOIQeZWlWJorVUj3T19M=; b=DNSUr3pa9+TjMs0GiczcGJlbph
        GrpxFhUuXKm7w9EySWl+a/s72RyC2C9dCDJIvgFL7Joq0nyfRGSw+StrVjs9b7qeZOjdgYstmbWFO
        7D3H3nv0w9Ri/fczGJNR3/UeGdlKX9gNu56VkCz2LEBILIcpeMHtZ0PPrKIrvIu//+fY=;
Received: from p200300ccff3520001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff35:2000:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1mvzqN-0002Ps-V8; Sat, 11 Dec 2021 11:43:08 +0100
Date:   Sat, 11 Dec 2021 11:43:06 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Merlijn Wajer <merlijn@wizzup.org>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Adam Ford <aford173@gmail.com>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dev Null <devnull@uvos.xyz>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: Nokia N900 OFF mode regression between v5.10 and v5.11
Message-ID: <20211211114306.16116dde@aktux>
In-Reply-To: <4fa31761-e7d2-0995-2180-c52afeb39dfa@wizzup.org>
References: <43cac03a-53c2-83dd-e1b0-4d25920d9095@wizzup.org>
        <20211211085403.3c1fcb0d@aktux>
        <4fa31761-e7d2-0995-2180-c52afeb39dfa@wizzup.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Sat, 11 Dec 2021 11:23:33 +0100
Merlijn Wajer <merlijn@wizzup.org> wrote:

> Hi Andreas,
> 
> On 11/12/2021 08:54, Andreas Kemnade wrote:
> > Hi,
> > 
> > On Sat, 11 Dec 2021 00:20:24 +0100
> > Merlijn Wajer <merlijn@wizzup.org> wrote:
> >   
> >> Hi Tony, Adam,
> >>
> >> I noticed that after I fixed the OFF mode regression between v5.9 and
> >> v5.10 that there are another one between v5.10 and v5.11. Fortunately,
> >> much like the other change it can be worked around with a config change,
> >> and in fact it looks like the commit identified by git bisect is indeed
> >> just a commit to change omap2plus_defconfig.
> >>
> >> a82820fcd079e38309403f595f005a8cc318a13c ("ARM: omap2plus_defconfig:
> >> Enable OMAP3_THERMAL") prevents the N900 from entering OFF mode pretty
> >> much all the time (I've seen scenarios with OFF:2,RET:500), but with the
> >> config change reverted, stuff like this is more common: OFF:13,RET:2
> >>
> >> We will probably to keep the thermal features enabled, but maybe we can
> >> figure out why it causes the SoC to not enter sleep modes?  
> > 
> > well, it was enabled after people agreed that is fixed... including me.
> > It was wrongly enabled some time before, then disabled again, fixed and
> > reenabled.
> > The mentioned commit was just after the fix. So what is different now?  
> 
> I'll have to find the mails you are referring to, but I suspect that if
> the device wasn't hitting OFF mode on v5.10 because of the
> CONFIG_COMPACT=y option in omap2plus_defconfig, it might have masked
> this issue?
>
The patch fixing thermal power management is: 
 
commit 5093402e5b449b64f7bbaa09057ce40a8f3c1484
Author: Adam Ford <aford173@gmail.com>
Date:   Fri Sep 11 07:31:56 2020 -0500

    thermal: ti-soc-thermal: Enable addition power management
    
    The bandgap sensor can be idled when the processor is too, but it
    isn't currently being done, so the power consumption of OMAP3
    boards can elevated if the bangap sensor is enabled.
    
    This patch attempts to use some additional power management
    to idle the clock to the bandgap when not needed.

Maybe there is something specific to the N900 which causes these
issues? Well, I'll recheck on the boards I have.

Regards,
Andreas
