Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 843B02F010E
	for <lists+linux-omap@lfdr.de>; Sat,  9 Jan 2021 17:01:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbhAIQBK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 9 Jan 2021 11:01:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbhAIQBJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 9 Jan 2021 11:01:09 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D28EC061786;
        Sat,  9 Jan 2021 08:00:29 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id 75so13534754ilv.13;
        Sat, 09 Jan 2021 08:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UYQyrgoDNjwpWvUBnRddFfEf/fRfH0i7pG63HCGhO9w=;
        b=DB0Vml99ZCZHvMy5PFEOpv7Zhi9sHQIOK6oGGewCCsWc37EAn2/Dfv3u6jH4FqUQrn
         xindImLalCHLy82Lv6SET9fdbbsC4G2n4uTiYsq2lHmkbdkbGy9mpvWLBWKoV0XoqXW2
         jjYAQdjZrYe8pf/D5+SpPKkNPol+pQtqR8MIlrlfW5bfm3KezGwpAOED7xaNKqzrgHNM
         wlT7Gmm+ECthAa1GJ3BY3smNVkFxE1F11zxys8+EfoD/rEdpwi6AGRG6AGtNMeCpoxu7
         eDyVY4XfmS3o6B00ZVN3koATiRrL/fCcw32LmPtQdJvralUc4V1LEaTtufJr4zYwn9Ud
         AUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UYQyrgoDNjwpWvUBnRddFfEf/fRfH0i7pG63HCGhO9w=;
        b=So02K0pWLxLTHb2d8Sq2HvUXR0qBKR67iSGj4gtAH7e8fvhYh96GPBwDdKEyxKY2pN
         PJ3BFIL+f7I5i+EZPT+VFTdFQ7WnMCLCdxdiJNcLxYU/UhyILeslM2TnXdIY/xE2wzPz
         xXDI20kIuQ9f32yjS3FAFev+STTRCK0exP6rTjJfaew5auAfCyqIWq813PLI/xAh/ngZ
         ZJJSzGiQ5XGOrg/nXxCxsU4Tu+2vzCKAioqAQ5xwaYreZ1icD1cnVk9j75ud3J/LoVAN
         inALW0LEptwuB1CBrUey7uSdqWs2lz+0hw6uBtGLgednBn9qboBEHNaOqatt6IW/IJe9
         hGIg==
X-Gm-Message-State: AOAM531q8PMkhNrGy50DVp6tI0m3/ffYEZNfULW7TvgPr1d0wAU4eoAm
        rA9WNS+DIAWo041o+zr6HzTXOBZcxKbtEMGjda4=
X-Google-Smtp-Source: ABdhPJzE/oyX1fpdBwWx0NDxcTp9WVbZRPs3zZLQNp+cBdD5UQ8vsA55bjk4lYh1PbsvsNIwH060bg6Cih7oKoWLm5w=
X-Received: by 2002:a92:c26f:: with SMTP id h15mr1155498ild.65.1610208028315;
 Sat, 09 Jan 2021 08:00:28 -0800 (PST)
MIME-Version: 1.0
References: <20201204095539.31705-1-andreas@kemnade.info> <CAD=FV=WLcEBv7gaA3MOVYmxJ3d2Q+mo+Amkex=0eu_19jMtjrA@mail.gmail.com>
 <20201204171428.0a011188@aktux> <CAD=FV=Vynttaz00yqbihgK0HxyrPt9b0i0-8Ft6-4NEPc_NkeQ@mail.gmail.com>
 <20201207135753.GA26857@atomide.com> <CAHCN7xLWbXtN6SfUW4fbwfUPvGVOjvGxJS=S-HWH2BSDkrUfYQ@mail.gmail.com>
 <20210108203734.15c5adb9@aktux>
In-Reply-To: <20210108203734.15c5adb9@aktux>
From:   Adam Ford <aford173@gmail.com>
Date:   Sat, 9 Jan 2021 10:00:16 -0600
Message-ID: <CAHCN7x+OjL17cxcz=rZ7OGaBQDc8rCeP3OzO93iT5GBMdEy_FA@mail.gmail.com>
Subject: Re: [PATCH] ARM: OMAP2+: omap_device: fix idling of devices during probe
To:     Andreas Kemnade <andreas@kemnade.info>
Cc:     Tony Lindgren <tony@atomide.com>,
        Doug Anderson <dianders@chromium.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jan 8, 2021 at 1:37 PM Andreas Kemnade <andreas@kemnade.info> wrote:
>
> Hi,
>
> On Fri, 8 Jan 2021 13:17:06 -0600
> Adam Ford <aford173@gmail.com> wrote:
>
> > On Mon, Dec 7, 2020 at 8:01 AM Tony Lindgren <tony@atomide.com> wrote:
> > >
> > > * Doug Anderson <dianders@chromium.org> [201204 16:43]:
> > > > Hi,
> > > >
> > > > On Fri, Dec 4, 2020 at 8:14 AM Andreas Kemnade <andreas@kemnade.info> wrote:
> > > > >
> > > > > > > Fixes: 21b2cec61c04 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4")
> > > > > >
> > > > > > From the description it sounds like this problem has always existed
> > > > > > but the async probe just tickled it reliably.  Seems like it'd make
> > > > > > sense to tag the "Fixes" as some earlier commit so you make sure your
> > > > > > fix gets picked to kernels even if they don't have the async probe
> > > > > > patch?
> > > > > >
> > > > >
> > > > > Hmm, maybe
> > > > > Fixes: 04abaf07f6d5 ("ARM: OMAP2+: omap_device: Sync omap_device and
> > > > > pm_runtime after probe defer")
> > > > >
> > > > > But on the other hand to stable branches only such patches are applied
> > > > > which solve pratical problems not only theoretical problems. But maybe
> > > > > it solves several random issues where nobody took care to debug them.
> > > > >
> > > > > That would be since v4.11.
> > > >
> > > > I guess maybe best is to include both.  Then if someone is debugging
> > > > why their async probe is failing they will notice this commit, but
> > > > they also might decide to pick it earlier just to be safe...
> > >
> > > OK I'll add the above fixes tag too and apply this into fixes.
> > >
> >
> > It might be too late, but...
> >
> > Tested-by: Adam Ford <aford173@gmail.com>  #logicpd-torpedo-37xx-devkit
> >
> hmm, when will it arrive in mainline?

It looks like it's been merged onto Linus Torvalds' branch:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=95f05058b2bbe3b85c8617b961879e52f692caa5



>
> Regards,
> Andreas
