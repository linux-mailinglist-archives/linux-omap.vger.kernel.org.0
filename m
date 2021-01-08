Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471B42EF846
	for <lists+linux-omap@lfdr.de>; Fri,  8 Jan 2021 20:38:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728960AbhAHTiZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Jan 2021 14:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728925AbhAHTiZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Jan 2021 14:38:25 -0500
Received: from mail.andi.de1.cc (mail.andi.de1.cc [IPv6:2a01:238:4321:8900:456f:ecd6:43e:202c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6598C061380;
        Fri,  8 Jan 2021 11:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=kemnade.info; s=20180802; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=0Lsmq7/0xAH4kHr5+Yt1Dx5zxHvwrqpJ/B4AEEaf3Gg=; b=huy8sS9VR10Y8I1F8qwud6OU89
        Va5C4EtnrDQXL0RMHELKxf4wlS4Ws3LkfR0hyggkVGVenhF+o8FmiK/7QjP4Jm7IhGMJUeUJaSsNW
        chmhhxYlsbqlZEZz1Dccb4SL25frkbLlZQETVNpjMiVavzZcINYyYUwvOjytf8GBccpg=;
Received: from p200300ccff0bcf001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:cc:ff0b:cf00:1a3d:a2ff:febf:d33a] helo=aktux)
        by mail.andi.de1.cc with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <andreas@kemnade.info>)
        id 1kxxZn-0007dN-5o; Fri, 08 Jan 2021 20:37:36 +0100
Date:   Fri, 8 Jan 2021 20:37:34 +0100
From:   Andreas Kemnade <andreas@kemnade.info>
To:     Adam Ford <aford173@gmail.com>
Cc:     Tony Lindgren <tony@atomide.com>,
        Doug Anderson <dianders@chromium.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Subject: Re: [PATCH] ARM: OMAP2+: omap_device: fix idling of devices during
 probe
Message-ID: <20210108203734.15c5adb9@aktux>
In-Reply-To: <CAHCN7xLWbXtN6SfUW4fbwfUPvGVOjvGxJS=S-HWH2BSDkrUfYQ@mail.gmail.com>
References: <20201204095539.31705-1-andreas@kemnade.info>
        <CAD=FV=WLcEBv7gaA3MOVYmxJ3d2Q+mo+Amkex=0eu_19jMtjrA@mail.gmail.com>
        <20201204171428.0a011188@aktux>
        <CAD=FV=Vynttaz00yqbihgK0HxyrPt9b0i0-8Ft6-4NEPc_NkeQ@mail.gmail.com>
        <20201207135753.GA26857@atomide.com>
        <CAHCN7xLWbXtN6SfUW4fbwfUPvGVOjvGxJS=S-HWH2BSDkrUfYQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -1.0 (-)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Fri, 8 Jan 2021 13:17:06 -0600
Adam Ford <aford173@gmail.com> wrote:

> On Mon, Dec 7, 2020 at 8:01 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Doug Anderson <dianders@chromium.org> [201204 16:43]:  
> > > Hi,
> > >
> > > On Fri, Dec 4, 2020 at 8:14 AM Andreas Kemnade <andreas@kemnade.info> wrote:  
> > > >  
> > > > > > Fixes: 21b2cec61c04 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4")  
> > > > >
> > > > > From the description it sounds like this problem has always existed
> > > > > but the async probe just tickled it reliably.  Seems like it'd make
> > > > > sense to tag the "Fixes" as some earlier commit so you make sure your
> > > > > fix gets picked to kernels even if they don't have the async probe
> > > > > patch?
> > > > >  
> > > >
> > > > Hmm, maybe
> > > > Fixes: 04abaf07f6d5 ("ARM: OMAP2+: omap_device: Sync omap_device and
> > > > pm_runtime after probe defer")
> > > >
> > > > But on the other hand to stable branches only such patches are applied
> > > > which solve pratical problems not only theoretical problems. But maybe
> > > > it solves several random issues where nobody took care to debug them.
> > > >
> > > > That would be since v4.11.  
> > >
> > > I guess maybe best is to include both.  Then if someone is debugging
> > > why their async probe is failing they will notice this commit, but
> > > they also might decide to pick it earlier just to be safe...  
> >
> > OK I'll add the above fixes tag too and apply this into fixes.
> >  
> 
> It might be too late, but...
> 
> Tested-by: Adam Ford <aford173@gmail.com>  #logicpd-torpedo-37xx-devkit
> 
hmm, when will it arrive in mainline? 

Regards,
Andreas
