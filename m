Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F22D2EF7FC
	for <lists+linux-omap@lfdr.de>; Fri,  8 Jan 2021 20:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727686AbhAHTR7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 8 Jan 2021 14:17:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727376AbhAHTR7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 8 Jan 2021 14:17:59 -0500
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com [IPv6:2607:f8b0:4864:20::d33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94280C061380;
        Fri,  8 Jan 2021 11:17:18 -0800 (PST)
Received: by mail-io1-xd33.google.com with SMTP id e22so10271815iom.5;
        Fri, 08 Jan 2021 11:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/iMSKDwUK0Dhamj+iFw+n77dmHZP0my5gPs6n21NXXw=;
        b=QAOTNm+QNcWgL47iLbsNQcCbXMw04+sIkmxb8PBK9KdIuVTjoR1Nf3KalWTFrZ7K/u
         enhQu/B9N3y+bweGcneh1i7QelevIReuKhypW6+AS18xdIwmRuRFZ3+IN0FDPyq31xIy
         iglMCWdfbUn25Bhk+ueUQlJOoCBd9W6hRut+HD2TAMtyN17eKnQXzTyDAYtdL9NUyk8P
         cnXnU+afo5r1S3LcPCmNDj97cUZa76vwrF8PfihhTahrtFIVeUPN/lK5c+GuFEjbT8Nc
         jHgB/djlcS9r63tSBGtjjLzLDJfCsi3/LcbCjqQxZyCmnT0/qDx2zrmtTZ6nvuHf8dX0
         dwBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/iMSKDwUK0Dhamj+iFw+n77dmHZP0my5gPs6n21NXXw=;
        b=jcdhGsNXhveeyzBVkZR4lyDbcH3OJgcIcmw/cCa92uNOouIFBY/3AFEYiG8KPJSFjV
         MBs5rT7kHUISQ14AhMARBdJYk2UGSyLumqG9EzNDEy2S9hlvjnwZgkAToDCJ079te/6y
         f9B3TDah/RW+b5hcYeZoJqd9X6QM2s4HD1xor41PBmaosdieO7/9TaDUjMTqcWo184Be
         FdbJQz7tJWbzIlCzvtt3jhuhWE9hJIiOWJvuRZTSnzIu8nGMHymCvO1F8RZJw/+gZasi
         Qnxq6XtewHXkiU48vDysAZg6+OvuXeadTdY4FbwAjcmrJOxcsPl7/UOcYy+GWT8Vobwd
         yD1w==
X-Gm-Message-State: AOAM533SivfFK+l8n0EoIFrVmQFH8FIcnSQ7wOJ87/R86pkWPFoKWPGl
        4D7k2BDcLUuPT5VQRUOpkvLUZ1UEAxuTrz3gPzaiQhXCm8VuGj75
X-Google-Smtp-Source: ABdhPJyL//rapegAYYhoC2sePJlVysU1h+1n4CrjEzqqdsUMg12wG6nrsmJP77X0+iWg10DwukjzgI9jkLvriZFGV98=
X-Received: by 2002:a05:6638:153:: with SMTP id y19mr4668821jao.47.1610133437955;
 Fri, 08 Jan 2021 11:17:17 -0800 (PST)
MIME-Version: 1.0
References: <20201204095539.31705-1-andreas@kemnade.info> <CAD=FV=WLcEBv7gaA3MOVYmxJ3d2Q+mo+Amkex=0eu_19jMtjrA@mail.gmail.com>
 <20201204171428.0a011188@aktux> <CAD=FV=Vynttaz00yqbihgK0HxyrPt9b0i0-8Ft6-4NEPc_NkeQ@mail.gmail.com>
 <20201207135753.GA26857@atomide.com>
In-Reply-To: <20201207135753.GA26857@atomide.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 8 Jan 2021 13:17:06 -0600
Message-ID: <CAHCN7xLWbXtN6SfUW4fbwfUPvGVOjvGxJS=S-HWH2BSDkrUfYQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: OMAP2+: omap_device: fix idling of devices during probe
To:     Tony Lindgren <tony@atomide.com>
Cc:     Doug Anderson <dianders@chromium.org>,
        Andreas Kemnade <andreas@kemnade.info>,
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

On Mon, Dec 7, 2020 at 8:01 AM Tony Lindgren <tony@atomide.com> wrote:
>
> * Doug Anderson <dianders@chromium.org> [201204 16:43]:
> > Hi,
> >
> > On Fri, Dec 4, 2020 at 8:14 AM Andreas Kemnade <andreas@kemnade.info> wrote:
> > >
> > > > > Fixes: 21b2cec61c04 ("mmc: Set PROBE_PREFER_ASYNCHRONOUS for drivers that existed in v4.4")
> > > >
> > > > From the description it sounds like this problem has always existed
> > > > but the async probe just tickled it reliably.  Seems like it'd make
> > > > sense to tag the "Fixes" as some earlier commit so you make sure your
> > > > fix gets picked to kernels even if they don't have the async probe
> > > > patch?
> > > >
> > >
> > > Hmm, maybe
> > > Fixes: 04abaf07f6d5 ("ARM: OMAP2+: omap_device: Sync omap_device and
> > > pm_runtime after probe defer")
> > >
> > > But on the other hand to stable branches only such patches are applied
> > > which solve pratical problems not only theoretical problems. But maybe
> > > it solves several random issues where nobody took care to debug them.
> > >
> > > That would be since v4.11.
> >
> > I guess maybe best is to include both.  Then if someone is debugging
> > why their async probe is failing they will notice this commit, but
> > they also might decide to pick it earlier just to be safe...
>
> OK I'll add the above fixes tag too and apply this into fixes.
>

It might be too late, but...

Tested-by: Adam Ford <aford173@gmail.com>  #logicpd-torpedo-37xx-devkit

> Thanks,
>
> Tony
