Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8DB21E76A
	for <lists+linux-omap@lfdr.de>; Tue, 14 Jul 2020 07:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgGNFVp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 14 Jul 2020 01:21:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725283AbgGNFVo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 14 Jul 2020 01:21:44 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891F4C061755;
        Mon, 13 Jul 2020 22:21:44 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id l17so4500729iok.7;
        Mon, 13 Jul 2020 22:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Up3G6PsFpPGYr8nZRL3w9MPTvUeQJXFm+eKweHGs86o=;
        b=Nr5IsVmBRvtEBrNLQ9atU796t0OuBHDNFUIUpmSRdDIx5aETNaogxWClkvNgYO0o3i
         m/1zM+mtwrZC9R6+4fk+lsAbEyLEnmeQouo9siwT54qbYW0jfGHOIClh6Ob1kv5sApu8
         99yC9FPAQj523Fx7PVC2/ZMZOe/LyYcaOavuGGIaGWrjQf29vzigq7Awn4v8BRhP97el
         YSkPHETinL1bN3M8CAa7Q9uLkdpCLOIrFjDuTf0ZKGL/7WPJoYlsWtISOFkQAnSOo+71
         +Zf/O3nPQjg+AvXlP55nPgqhsr3RTTJgtrcUo0cqIUlojiKahFHjJsWkq+3sshlhdBb2
         Elbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Up3G6PsFpPGYr8nZRL3w9MPTvUeQJXFm+eKweHGs86o=;
        b=H1FGYNlHw4Dwc4PhteDqUAKtCsjwEFUhZl4xE+nVcuSyFqSFPee5jYMrRa91Y5z9C3
         4bZtza9LcTEGw+lktqkKf9kTzW0GQ8x0bvSJUcDeMrfM/OpgynsqX/oHjOFD13HDx8Fk
         v2MvIvsXxOHBJteSpPGgOkP9ES2wnl8mVLmgAFDmb2E1HL9dcNXHGPO2gL9+BGmYOpJo
         w4gFq1SVaGL+75MIeipknQDXGDau/068ijn45DZk88SgP3rF8YzX/jXfa+jebKQuIhIq
         q7ivERwYuBwJIAvdg+uu3yOaWF12xWGh0lingPw27dJCHaP1joNf6syxaUYhXT7UuEWs
         Pogw==
X-Gm-Message-State: AOAM531Ia3Wdnp8C6VhSQOTJ+wfiQ7FB0DCLxvxyDvF8iLZlSibpGlxW
        i7xwZq7bmg1JMAFQs+dy6jYEssnz5i01v9avtrw=
X-Google-Smtp-Source: ABdhPJzFKfHtR2lq73ZLFph/Q2QwhS4b1uCu5CknGEp/7od+WTT6dFeOnjjJNB2Cosa4z4TbW+8SA/BJLb+Nb3G1+3E=
X-Received: by 2002:a05:6602:1610:: with SMTP id x16mr3317570iow.68.1594704103845;
 Mon, 13 Jul 2020 22:21:43 -0700 (PDT)
MIME-Version: 1.0
References: <1594696998-3995-1-git-send-email-dillon.minfei@gmail.com>
 <1594696998-3995-2-git-send-email-dillon.minfei@gmail.com>
 <20200714133835.3b03b8af@canb.auug.org.au> <CAL9mu0JurdBoXbSxvHUmNFSBOa=RneNyYtzT=C1MvJs10Y-Geg@mail.gmail.com>
 <20200714135407.35992389@canb.auug.org.au>
In-Reply-To: <20200714135407.35992389@canb.auug.org.au>
From:   dillon min <dillon.minfei@gmail.com>
Date:   Tue, 14 Jul 2020 13:21:07 +0800
Message-ID: <CAL9mu0L5=khi2oXaei=EhTmRJC5mC1hj5gZVBHJgowi_3vxk=Q@mail.gmail.com>
Subject: Re: [PATCH v2] Since am437x have the same clock structure with am335x
 [1][2], reuse the code from Tony Lindgren's patch [3] to fix dcan probe
 failed on am437x platform.
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Benoit Cousson <bcousson@baylibre.com>, tony@atomide.com,
        Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jul 14, 2020 at 11:54 AM Stephen Rothwell <sfr@canb.auug.org.au> wr=
ote:
>
> Hi Dillon,
>
> On Tue, 14 Jul 2020 11:43:31 +0800 dillon min <dillon.minfei@gmail.com> w=
rote:
> >
> > On Tue, Jul 14, 2020 at 11:38 AM Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> > >
> > > On Tue, 14 Jul 2020 11:23:18 +0800 dillon.minfei@gmail.com wrote:
> > > >
> > > > From: dillon min <dillon.minfei@gmail.com>
> > > >
> > > > Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly duri=
ng init to read revision")
> > > >
> > > > [1]: https://www.ti.com/lit/pdf/spruh73 Chapter-23, Figure 23-1. DC=
AN
> > > > Integration
> > > > [2]: https://www.ti.com/lit/pdf/spruhl7 Chapter-25, Figure 25-1. DC=
AN
> > > > Integration
> > > > [3]: commit 516f1117d0fb ("ARM: dts: Configure osc clock for d_can =
on am335x")
> > > >
> > > > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > > > ---
> > > >
> > > > Hi Stephen,
> > > >
> > > > This changes correct commit messages based on your reviewing.
> > > > make Fixes tags to oneline.
> > > > make all commit message tags at the end of commit message
> > >
> > > But the Fixes: line should be down with the Signed-off-by: line ...
> > >
> > Ok, should it be like this=EF=BC=8Ci will resubmit it.
> >
> > Subject: [PATCH v2] Since am437x have the same clock structure with am3=
35x
> >  [1][2], reuse the code from Tony Lindgren's patch [3] to fix dcan
> >  probe failed on the am437x platform.
>
> You should have a shorter subject and maybe the above could be the
> first paragraph of the commit message.
>
> >
> > [1]: https://www.ti.com/lit/pdf/spruh73 Chapter-23, Figure 23-1. DCAN
> > Integration
> > [2]: https://www.ti.com/lit/pdf/spruhl7 Chapter-25, Figure 25-1. DCAN
> > Integration
> > [3]: commit 516f1117d0fb ("ARM: dts: Configure osc clock for d_can on a=
m335x")
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly during
> > init to read revision")
>
> No wrapping the the Fixes line, please and it would usually go before
> your Signed=3Doff-by line

Hi Stephen,

Thanks, how about the below commit message.

Subject: [PATCH v4] Fix dcan driver probe failed on am437x platform

Got following d_can probe errors with kernel 5.8-rc1 on am437x

[   10.730822] CAN device driver interface
Starting Wait for Network to be Configured...
[  OK  ] Reached target Network.
[   10.787363] c_can_platform 481cc000.can: probe failed
[   10.792484] c_can_platform: probe of 481cc000.can failed with
error -2
[   10.799457] c_can_platform 481d0000.can: probe failed
[   10.804617] c_can_platform: probe of 481d0000.can failed with
error -2

actually, Tony has fixed this issue on am335x with the patch [3]

Since am437x has the same clock structure with am335x
[1][2], so reuse the code from Tony Lindgren's patch [3] to fix it.


[1]: https://www.ti.com/lit/pdf/spruh73 Chapter-23, Figure 23-1. DCAN
Integration
[2]: https://www.ti.com/lit/pdf/spruhl7 Chapter-25, Figure 25-1. DCAN
Integration
[3]: commit 516f1117d0fb ("ARM: dts: Configure osc clock for d_can on am335=
x")

Fixes: 1a5cd7c23cc5 ("bus: ti-sysc: Enable all clocks directly during
init to read revision")
Signed-off-by: dillon min <dillon.minfei@gmail.com>
---

Hi Stephen,

This changes correct commit messages based on your reviewing.
make Fixes tags to oneline.
make all commit message tags at the end of commit message
make Fixes tags before Signed-off-by line.
add probe failed log to commit message.


> --
> Cheers,
> Stephen Rothwell
