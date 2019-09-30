Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F93FC22DF
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2019 16:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731459AbfI3OMl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 10:12:41 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:35726 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729738AbfI3OMl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Sep 2019 10:12:41 -0400
Received: by mail-io1-f66.google.com with SMTP id q10so38760441iop.2;
        Mon, 30 Sep 2019 07:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TwbrL/89iwEv92jYm3+TvZslhh9l3A55aKvB6WQE0Aw=;
        b=SRxCdHIK0riL2quHsjY50cpVIhRrFISodAZa537ifi6d7h07jLLeY4wUb1BpAcwAkj
         /PrzUswmM/rzM4rc/0QziHmYRfJRbM0sAR5PGPmCrDseIo6laabFzzPkxywUDwdr06eC
         VYxuyeDUt+2Uj425owP+L2qYUH5v6rxPWSsNoUkFm2t2t3OPEjYfiss73xCadi1J8Bj+
         b0oiZiG5WYANrMjalqsJfzT5IFOirXaTPfXNnIrM/u+FSbe8+Q3KUH89GrWeU235hIpn
         kf0sWTELgjeIqEfsUZ2fGb1+Bjyk/wY03XAse6vpmGCwkWdi9xspJrKomVk/qCaNAYar
         /ODg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TwbrL/89iwEv92jYm3+TvZslhh9l3A55aKvB6WQE0Aw=;
        b=nxBmTNeyGNvzulYmxidDvK/Q6i522IhaX3RH3NdBourervIW34W47fN/h6lMN4BTHW
         U/feCP/o8rjy4bxK7PkQxM1mpaZKRNRFjC09UjmrrNlyKWFwmflP6O19dg0rs7Ev4Vjl
         sbhdGZIBwmgq9XYS+FTlOTN/Uy5CGxShkA0THSS3s8b4pTJfXX/I/o7+otdRJOwzDF9q
         pWQnliNpPFRK9fpTXd3x2SpRev07gi1XN9/4izXhh5v9xTxqG97wYtuGrj+fPnWFtaQD
         Mu4exud/qN9W+UOQ0rd+HXOHy9IErf71z5mUtkDP6/hJqApNt/g7vey2SP3DJs9nkxC9
         vbAw==
X-Gm-Message-State: APjAAAUrgqqXjQFfjvkKUtrAFwjV53Lhl4bd6X/3VYgljYfrBRYWE0tz
        eBzdXud6WRC3d+fauWb9ZQIm+gzVgVJNhc4Glwd1aRPhAeo=
X-Google-Smtp-Source: APXvYqzT4cmcRSDdeDHW9AaSxk6Y6BgQ1h4b2jWej/Uuk9wxv1qZFa5nMO4xL5BbZ4DoqS0rAqEMZmS6f+9SegZrRyk=
X-Received: by 2002:a5d:9c4c:: with SMTP id 12mr2054950iof.276.1569852758297;
 Mon, 30 Sep 2019 07:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190510194229.20628-1-aford173@gmail.com> <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com> <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com> <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com> <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
 <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com> <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
 <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com> <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com>
 <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com> <F3335195-6EB7-4D44-B884-2F29D9238011@goldelico.com>
 <CAHCN7xL9bFxO=2i1DzmRj6A3XwUNdt=DZeJ2a0EZ0f9gcFTy6g@mail.gmail.com> <CAHCN7x+vCfPTRE+zzYUwAXdbBzRotTP2hSOgsHB0FdgBhZV5zA@mail.gmail.com>
In-Reply-To: <CAHCN7x+vCfPTRE+zzYUwAXdbBzRotTP2hSOgsHB0FdgBhZV5zA@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 30 Sep 2019 09:12:26 -0500
Message-ID: <CAHCN7xJDV=R9Ysjhff7=mEXdciwPP_5LQbHwaUT8KvhSkLKw8A@mail.gmail.com>
Subject: Re: [PATCH] drm/omap: Migrate minimum FCK/PCK ratio from Kconfig to dts
To:     "H. Nikolaus Schaller" <hns@goldelico.com>
Cc:     Tero Kristo <t-kristo@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Tony Lindgren <tony@atomide.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 30, 2019 at 9:04 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Mon, Sep 30, 2019 at 8:54 AM Adam Ford <aford173@gmail.com> wrote:
> >
> > On Mon, Sep 30, 2019 at 8:39 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> > >
> > >
> > > > Am 30.09.2019 um 10:53 schrieb Tero Kristo <t-kristo@ti.com>:
> > > >
> > > > The best action here is probably to drop the max-div value for this clock to 16. Can someone check this with their display setup and see what happens? Attached patch should do the trick.
> > >
> > > I have checked on GTA04 and OpenPandora (DM3730 resp. OMAP3430) and did not notice a negative effect.
> > >
> > > (Well, we never see the problem that is discussed here and have built with CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=0).
> >
> > I have never been able to use CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=0, but
> > I assume it's either a function of pck or a combination of pck with
> > the resolution.
> >
> > Based on Tomi's comment, I assume he's working on the following.  Can
> > you also try:
> >
> > diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c
> > b/drivers/gpu/drm/omapdrm/dss/dss.c
> > index 5711b7a720e6..5e584f32ea6a 100644
> > --- a/drivers/gpu/drm/omapdrm/dss/dss.c
> > +++ b/drivers/gpu/drm/omapdrm/dss/dss.c
> > @@ -1090,7 +1090,7 @@ static const struct dss_features omap34xx_dss_feats = {
> >
> >  static const struct dss_features omap3630_dss_feats = {
> >         .model                  =       DSS_MODEL_OMAP3,
> > -       .fck_div_max            =       32,
> > +       .fck_div_max            =       16,
> >         .fck_freq_max           =       173000000,
> >         .dss_fck_multiplier     =       1,
> >         .parent_clk_name        =       "dpll4_ck",
> >
> >
> > Hopefully it doesn't break the 3630 for you, but it fixed my issue
> > with no back trace:
> >
> > [    9.915588] DSS: set fck to 54000000
> > [    9.915618] DISPC: lck = 54000000 (1)
> > [    9.915649] DISPC: pck = 9000000 (6)
> > [    9.917633] DISPC: channel 0 xres 480 yres 272
> > [    9.917663] DISPC: pck 9000000
> >
> > I do wonder, however if there is a divider that is higher than 16, but
> > lower than 32.
> > I was able to run fck at 36MHz before with divide by 4 to 9MHz, so I
> > am hoping that by running at 54MHz / 6 doesn't draw more power.  I was
> > reading through the datasheet, but I could not find any reference to
> > the max divider.
> >
>
> For run, I tested a max divider of 27, and I was able to get it
> functional with a slower fck
>
> [    9.939056] DSS: set fck to 36000000
> [    9.939086] DISPC: lck = 36000000 (1)
> [    9.939086] DISPC: pck = 9000000 (4)
> [    9.941314] DISPC: channel 0 xres 480 yres 272
> [    9.941314] DISPC: pck 9000000
> [    9.941314] DISPC: hsync_len 42 hfp 3 hbp 2 vsw 11 vfp 2 vbp 3
> [    9.941314] DISPC: vsync_level 1 hsync_level 1 data_pclk_edge 1
> de_level 1 sync_pclk_edge -1
> [    9.941345] DISPC: hsync 17077Hz, vsync 59Hz
>
>
> I don't know the implications, so if the people from TI say stick with
> 16, I'm fine with that, but at least there is some evidence that it
> can be higher than 16, but lower than 32.
>

Sorry for all the spam, but I moved both of them to 31 from 32, and it
also seems to work successfully at 31.

[   26.923004] DSS: set fck to 36000000
[   26.923034] DISPC: lck = 36000000 (1)
[   26.923034] DISPC: pck = 9000000 (4)
[   26.925048] DISPC: channel 0 xres 480 yres 272
[   26.925048] DISPC: pck 9000000
[   26.925048] DISPC: hsync_len 42 hfp 3 hbp 2 vsw 11 vfp 2 vbp 3
[   26.925079] DISPC: vsync_level 1 hsync_level 1 data_pclk_edge 1
de_level 1 sync_pclk_edge -1
[   26.925079] DISPC: hsync 17077Hz, vsync 59Hz
[   27.384613] DISPC: dispc_runtime_put

Is it possible to use 31?

adam

> adam
>
> > adam
> > >
> > > BR,
> > > Nikolaus
> > >
