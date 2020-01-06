Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A36FA1319A1
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jan 2020 21:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727077AbgAFUrt convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Mon, 6 Jan 2020 15:47:49 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:39670 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727035AbgAFUrt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Jan 2020 15:47:49 -0500
Received: by mail-io1-f68.google.com with SMTP id c16so20199230ioh.6;
        Mon, 06 Jan 2020 12:47:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dr6kqP9sFPas/i5LLhbsBNpYIgNstL4ct56nJvUTBqY=;
        b=LlHjE/t4pNa3eB0hB4+Vvn70h6BPVtzqnMfQ9gMejRxCggIjC9qfCwC2+mwrTbeUUj
         NYyfLZdKSYv1ygmoaSaJZkzK+9rySV0PhGdya+j8OHtwb2MMPSHJliz2rP/gDhONjwVa
         4vR3UCBAghX5rbEdTzsFZy0KXqpcChdmV761PCUohyypBJSoG2eSoTWdpgJmmSODv//P
         jG1x+7FjFxz/vJqrGevFZ0vEyyyUEmHGZiJgTPXSrcE/gC7IZsziLi9zyQk1tHST8ZSX
         285XkjpKB7qKIDmS7wG89yjL2FlMDJSIj97R49QeshEEpNY7i1uDyGXU7m4RDYt/nlWb
         VlpQ==
X-Gm-Message-State: APjAAAWPR4/ZWnMY5PbhlW5qcsGLo0/qQCVVW4jDtUr96wqKt47pyF+Z
        l2v9daYtZbnKIV8KkeeUYZwzOCaKbb0TeGyJDi6W9eB1gVM=
X-Google-Smtp-Source: APXvYqwxQxN3/+hLZQ2HNRsDO/bFehGpBCG7UCI9gPnzHAuSJsadM2vu209w+V2pesB+ikDM791KnLee4uZVH9ZSLX4=
X-Received: by 2002:a6b:730c:: with SMTP id e12mr69128756ioh.4.1578343667897;
 Mon, 06 Jan 2020 12:47:47 -0800 (PST)
MIME-Version: 1.0
References: <20200106130909.7697-1-matwey@sai.msu.ru> <CAOCHtYgyN+qXXX1YeEcO+nvRFrAL1HAVVMvjfeJ5nvxVjtFKtg@mail.gmail.com>
In-Reply-To: <CAOCHtYgyN+qXXX1YeEcO+nvRFrAL1HAVVMvjfeJ5nvxVjtFKtg@mail.gmail.com>
From:   "Matwey V. Kornilov" <matwey@sai.msu.ru>
Date:   Mon, 6 Jan 2020 23:47:36 +0300
Message-ID: <CAJs94EbUL6o9sM+pwxwpqHVDkFqy7wFRirET-Vq3SNVd3grUsA@mail.gmail.com>
Subject: Re: [PATCH] arm: dts: am335x-boneblack-common: fix memory size
To:     Robert Nelson <robertcnelson@gmail.com>
Cc:     =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:OMAP DEVICE TREE SUPPORT" <linux-omap@vger.kernel.org>,
        "open list:OMAP DEVICE TREE SUPPORT" <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

пн, 6 янв. 2020 г. в 23:44, Robert Nelson <robertcnelson@gmail.com>:
>
> On Mon, Jan 6, 2020 at 7:10 AM Matwey V. Kornilov <matwey@sai.msu.ru> wrote:
> >
> > BeagleBone Black series is equipped with 512MB RAM
> > whereas only 256MB is included from am335x-bone-common.dtsi
>
> FYI: While all versions from the factory are 512MB, some 3rd parties
> offered 1GB reballing upgrades..
>
> and the SanCloud variant which uses this file, was built with 1GB:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/am335x-sancloud-bbe.dts
>
> >
> > This leads to an issue with unusual setups when devicetree
> > is loaded by GRUB2 directly.
>
> It's a miracle, since when did GRUB2 gain this ability?
>

I am not sure about when. But Grub 2.02 has devicetree command, which
can be used as the following:

        echo "Loading device tree blob ..."
        devicetree (tftp)/dtb/am335x-boneblack.dtb

And you know, you can run Grub itself as EFI application on to of u-boot.

> >
> > Signed-off-by: Matwey V. Kornilov <matwey@sai.msu.ru>
> > ---
> >  arch/arm/boot/dts/am335x-boneblack-common.dtsi | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/am335x-boneblack-common.dtsi b/arch/arm/boot/dts/am335x-boneblack-common.dtsi
> > index 7ad079861efd..91f93bc89716 100644
> > --- a/arch/arm/boot/dts/am335x-boneblack-common.dtsi
> > +++ b/arch/arm/boot/dts/am335x-boneblack-common.dtsi
> > @@ -131,6 +131,11 @@
> >  };
> >
> >  / {
> > +       memory@80000000 {
> > +               device_type = "memory";
> > +               reg = <0x80000000 0x20000000>; /* 512 MB */
> > +       };
> > +
> >         clk_mcasp0_fixed: clk_mcasp0_fixed {
> >                 #clock-cells = <0>;
> >                 compatible = "fixed-clock";
> > --
> > 2.16.4
> >
>
>
> --
> Robert Nelson
> https://rcn-ee.com/



-- 
With best regards,
Matwey V. Kornilov.
Sternberg Astronomical Institute, Lomonosov Moscow State University, Russia
119234, Moscow, Universitetsky pr-k 13, +7 (495) 9392382
