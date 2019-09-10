Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8FA4AEF77
	for <lists+linux-omap@lfdr.de>; Tue, 10 Sep 2019 18:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394157AbfIJQVs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 10 Sep 2019 12:21:48 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:46685 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394113AbfIJQVr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 10 Sep 2019 12:21:47 -0400
Received: by mail-io1-f66.google.com with SMTP id d17so16959864ios.13;
        Tue, 10 Sep 2019 09:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=zfak0oamvqR0wlkWdro1v2MEWig7UToX5bvVAqdDtOo=;
        b=bmHftRBVG3UesIvZiqDbiuOA72BylSogyhaiKS/wsP0AEjtZYtvMHOLsoute6sQZ5m
         xIpo4gwZiwWDF9NooW5VDBFoxQRjUbyuPu83ukqlsJCxANwMV2lX6+qwjxFIUr6BKnq3
         NfSd+thBNxcRljHIBEfSFJfnX7Q/CYPMHBuJo7QT+nvrZD7tMejiXPX4Zs/CkfDsqBOY
         LGQ4DWvRummpLuvyn5+fQh6ES61QTQ1cEyqouvQ1C/hgnOdTAA8wQ5nVUanyJCpycTeh
         pUe2RixtytadF7XaVfarQuRIZRWLNta0DZH6FwCIudQOeAh9XLLfxyWfqlD0aJ0kin47
         bl5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=zfak0oamvqR0wlkWdro1v2MEWig7UToX5bvVAqdDtOo=;
        b=GyX477TlhyWib5JtJq+IojEWdR6yb62pnhKvQI0ZlEWOR2QjP8RU2u3ccwKcT6sWUJ
         JGveHMF07yiH6VY8qf06IZRyaSsuNoUfc3xYqpJKNTq8aMs1ptOomSGPWl4R8gATdxY7
         MwLAIE+cgOyAoHHrVIxRakNEatHCQNLkseHNcqiF/zGaPQNgc2trp5kUo0Tw9cJHXwaz
         XTPtdPOPkKcrVg6oysHmpeERDzdrI6gxTfl+GAh5gcO9rg0DgjkOECC86tKjc8nDwwkp
         U8rWLWd7vhtVhr3DtKTu1j2L0Q4Atq0ZlCJIwauoitg0aXyVeBCxf8hFJDqmAtR85HBQ
         Lp7g==
X-Gm-Message-State: APjAAAUZ2eSxYTAPXjqJvjYMKweSrkKfQMKtv3hEHn42Xo14Rksr2I2z
        LZ4q2+Qx6f91VGMG5d3GiwujUAU7BlpGFEyggTI=
X-Google-Smtp-Source: APXvYqzn3tHPt7okLee/JSPLqAibKWmQEQwC+Yi3HLUftPevSq/bxBvLHOKp4243JzzRNVWIktQJsyVQUxI79CU3IR4=
X-Received: by 2002:a5e:de47:: with SMTP id e7mr1078126ioq.127.1568132506319;
 Tue, 10 Sep 2019 09:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190828150037.2640-1-aford173@gmail.com> <20190905230443.GA52127@atomide.com>
 <CAHCN7xL0fbr=Sv+b=0AuGB1PPhAAFdAFLEd_iBM+ZMTkUw5sHQ@mail.gmail.com>
 <CAHCN7xL-Gfxe0qF5w7BUsHnyhcNNpmCnchdKErnmiqggXfsLWw@mail.gmail.com>
 <20190909134033.s26eiurpat3iekse@pali> <20190909163543.GQ52127@atomide.com> <CAHCN7x+t-OVRE7pVM4V87_YMWpgO+_Vashfn1s5msoqC5eiwTg@mail.gmail.com>
In-Reply-To: <CAHCN7x+t-OVRE7pVM4V87_YMWpgO+_Vashfn1s5msoqC5eiwTg@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Tue, 10 Sep 2019 11:21:34 -0500
Message-ID: <CAHCN7xLaGQMM67VC-2_G8XC7UuG4c+TbbYb4z=ibJwZsQF4YVw@mail.gmail.com>
Subject: Re: [RFC] ARM: omap3: Enable HWMODS for HW Random Number Generator
To:     Tony Lindgren <tony@atomide.com>
Cc:     =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Tero Kristo <t-kristo@ti.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Adam Ford <adam.ford@logicpd.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Paul Walmsley <paul@pwsan.com>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Sep 10, 2019 at 10:48 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Mon, Sep 9, 2019 at 11:35 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Pali Roh=C3=A1r <pali.rohar@gmail.com> [190909 13:41]:
> > > On Monday 09 September 2019 08:37:09 Adam Ford wrote:
> > > > I applied this on 5.3 and it is working.  I assume the same is true=
 in for-next.
> >
> > Hmm I noticed I stopped getting RNG data after several rmmod modprobe
> > cycles, or several hd /dev/random reads. Anybody else seeing that?
> >
> > > > Do you want to submit a formal patch?  I  can mark it as 'tested-by=
'
> > > > This really helps speed up the startup sequence on boards with sshd
> > > > because it delays for nearly 80 seconds waiting for entropy without
> > > > the hwrng.
> > >
> > > Hi! When applying a patch, could you please disable this rng for n900=
?
> > >
> > > In omap3-n900.dts for rng should be status =3D "disabled" (as Tony al=
ready
> > > wrote), similarly like for aes.
> >
> > Yeah I'll post a proper patch after -rc1.
>
> FYI,
>
> By putting your node into omap34xx.dtsi and omap36xx.dtsi along with
> the following, I can get the RNG to work on an OMAP3530 and a DM3730.
>
>
> diff --git a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
> b/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
> index 5e9d1afcd422..73f351e6d132 100644
> --- a/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
> +++ b/arch/arm/boot/dts/omap34xx-omap36xx-clocks.dtsi
> @@ -259,7 +259,7 @@
>                          <&i2c1_ick>, <&uart2_ick>, <&uart1_ick>, <&gpt11=
_ick>,
>                          <&gpt10_ick>, <&mcbsp5_ick>, <&mcbsp1_ick>,
>                          <&omapctrl_ick>, <&aes2_ick>, <&sha12_ick>, <&ic=
r_ick>,
> -                        <&des2_ick>, <&mspro_ick>, <&mailboxes_ick>,
> +                        <&des2_ick>, <&mspro_ick>, <&mailboxes_ick>,
> <&rng_ick>,
>                          <&mspro_fck>;
>         };
>  };
>
> I tried doing the same for am3517, but it doesn't appear to work.  In
> fact, the board hangs at boot with no splat, so I assume that some
> clock isn't running and causing a hang.  Figure 4-50 in the AM3517 TRM
> shows the security_l4_iclk2, so I wonder if the HW mods for AES, SHA,
> etc are doing something to enable this clock.  Those HWmods are
> disabled on AM3517.  I tried turning on the hwmods for them before
> without success, but I'll try it again.

According to a note in omap_hwmod_3xxx_data.c,

/*
 * Apparently the SHA/MD5 and AES accelerator IP blocks are
 * only present on some AM35xx chips, and no one knows which
 * ones.  See
 * http://www.spinics.net/lists/arm-kernel/msg215466.html So
 * if you need these IP blocks on an AM35xx, try uncommenting
 * the following lines.
 */

I decided to uncomment the hwmod entries, and I got the following:

[    0.263222] omap_hwmod: sham: _wait_target_ready failed: -16
[    0.263248] omap_hwmod: sham: cannot be enabled for reset (3)
[    0.265837] omap_hwmod: aes: _wait_target_ready failed: -16
[    0.265851] omap_hwmod: aes: cannot be enabled for reset (3)
[    6.208866] omap_hwmod: sham: _wait_target_ready failed: -16
[    6.287732] omap_hwmod: aes: _wait_target_ready failed: -16

Based on this, I wonder if the sham and aes modules are not present.
If this is the case, it might explain why I cannot use the rng either.

adam
>
> adam
> >
> > Regards,
> >
> > Tony
