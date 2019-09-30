Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD7FC229B
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2019 16:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731276AbfI3OEc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 10:04:32 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:38170 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731166AbfI3OEc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Sep 2019 10:04:32 -0400
Received: by mail-io1-f66.google.com with SMTP id u8so38569694iom.5;
        Mon, 30 Sep 2019 07:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jw2BmP5yAP0WIosdHUXg7b2dakGh/ZFsEzhCPT0aSTY=;
        b=hEbiamxPCTcn/ohyF9QMFLMPKiB5S3lXi7jcR41Yh2WGNf3hbnh0ceuN2lJMuOmTpp
         mndYJHfjEEs3ef8tSbz9USe7+z9BikHN2mkRU4nsN114Es+ntSUJpOb4dwB4yFaIu5gb
         Qep/mbad6GXN8UZnQn6AHpWL32X3nbNq8xeDIjRjhFAbqOTVH6viJLxsgkrj2mwTsep8
         w0Cj9CkmegC6rXTJRUohiVwggPN+WQn+gaD7cDVOE9u6mN0vV17XOOXxBrPP265y2aoL
         0S8oS3lU4GQ/MWDyL4t95nSroNILfMPOeV8hpjSRDF8CPoJdjqt68E4LTHT5/Jl1M2ga
         GTWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jw2BmP5yAP0WIosdHUXg7b2dakGh/ZFsEzhCPT0aSTY=;
        b=UpPo+f2buI/JOUx1tPzHbDinb0JlF+vdwkEvUdX2nwLeIkQZTX4gSM1L3Gp9yJY81y
         rtcSrD/hP9rW/o7br93cODNybR0mFN2TQ/SjWDEclan5axgUzGGbpNAoonJZJsnNmpiI
         Yoad5P07t66JcHKjSW7uUJPTxXP9JOZKfmUZWxDIezEhCJ6W23Zw5XWuwsHoQ43UQoD6
         ViJis9JA45CGBCIZm/YnWzNZs9Hl89sYGUqLJzCehWM1ZBbS0wJgD30ar2rNgrBiAvMV
         kt8MIMbYLMB5XzSUtukaxCKVodyOeJU2BVUsv2+G8I2Q/9Y0DaMAEqIvglVxXTqmmD7r
         YLgg==
X-Gm-Message-State: APjAAAVTP+W4QJCLFcaEGKaFDiDkoW+BinqCskBQg61PjxujFnOvUd1q
        mqRGI5Ktg/B4oe2oe7mXgoKdgJR475PzH8hAhJq+PGIfask=
X-Google-Smtp-Source: APXvYqy5GqHyiuPTz1Bll8seY6c2CREX2eQo4WThC1YG88GiMLmoaGhJGfMPnuan5jClXADZCCq/ma5FNq9RDBtc71Y=
X-Received: by 2002:a92:3314:: with SMTP id a20mr19714009ilf.276.1569852270674;
 Mon, 30 Sep 2019 07:04:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190510194229.20628-1-aford173@gmail.com> <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com> <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com> <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com> <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
 <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com> <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
 <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com> <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com>
 <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com> <F3335195-6EB7-4D44-B884-2F29D9238011@goldelico.com>
 <CAHCN7xL9bFxO=2i1DzmRj6A3XwUNdt=DZeJ2a0EZ0f9gcFTy6g@mail.gmail.com>
In-Reply-To: <CAHCN7xL9bFxO=2i1DzmRj6A3XwUNdt=DZeJ2a0EZ0f9gcFTy6g@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 30 Sep 2019 09:04:18 -0500
Message-ID: <CAHCN7x+vCfPTRE+zzYUwAXdbBzRotTP2hSOgsHB0FdgBhZV5zA@mail.gmail.com>
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

On Mon, Sep 30, 2019 at 8:54 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Mon, Sep 30, 2019 at 8:39 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
> >
> >
> > > Am 30.09.2019 um 10:53 schrieb Tero Kristo <t-kristo@ti.com>:
> > >
> > > The best action here is probably to drop the max-div value for this clock to 16. Can someone check this with their display setup and see what happens? Attached patch should do the trick.
> >
> > I have checked on GTA04 and OpenPandora (DM3730 resp. OMAP3430) and did not notice a negative effect.
> >
> > (Well, we never see the problem that is discussed here and have built with CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=0).
>
> I have never been able to use CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=0, but
> I assume it's either a function of pck or a combination of pck with
> the resolution.
>
> Based on Tomi's comment, I assume he's working on the following.  Can
> you also try:
>
> diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c
> b/drivers/gpu/drm/omapdrm/dss/dss.c
> index 5711b7a720e6..5e584f32ea6a 100644
> --- a/drivers/gpu/drm/omapdrm/dss/dss.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dss.c
> @@ -1090,7 +1090,7 @@ static const struct dss_features omap34xx_dss_feats = {
>
>  static const struct dss_features omap3630_dss_feats = {
>         .model                  =       DSS_MODEL_OMAP3,
> -       .fck_div_max            =       32,
> +       .fck_div_max            =       16,
>         .fck_freq_max           =       173000000,
>         .dss_fck_multiplier     =       1,
>         .parent_clk_name        =       "dpll4_ck",
>
>
> Hopefully it doesn't break the 3630 for you, but it fixed my issue
> with no back trace:
>
> [    9.915588] DSS: set fck to 54000000
> [    9.915618] DISPC: lck = 54000000 (1)
> [    9.915649] DISPC: pck = 9000000 (6)
> [    9.917633] DISPC: channel 0 xres 480 yres 272
> [    9.917663] DISPC: pck 9000000
>
> I do wonder, however if there is a divider that is higher than 16, but
> lower than 32.
> I was able to run fck at 36MHz before with divide by 4 to 9MHz, so I
> am hoping that by running at 54MHz / 6 doesn't draw more power.  I was
> reading through the datasheet, but I could not find any reference to
> the max divider.
>

For run, I tested a max divider of 27, and I was able to get it
functional with a slower fck

[    9.939056] DSS: set fck to 36000000
[    9.939086] DISPC: lck = 36000000 (1)
[    9.939086] DISPC: pck = 9000000 (4)
[    9.941314] DISPC: channel 0 xres 480 yres 272
[    9.941314] DISPC: pck 9000000
[    9.941314] DISPC: hsync_len 42 hfp 3 hbp 2 vsw 11 vfp 2 vbp 3
[    9.941314] DISPC: vsync_level 1 hsync_level 1 data_pclk_edge 1
de_level 1 sync_pclk_edge -1
[    9.941345] DISPC: hsync 17077Hz, vsync 59Hz


I don't know the implications, so if the people from TI say stick with
16, I'm fine with that, but at least there is some evidence that it
can be higher than 16, but lower than 32.

adam

> adam
> >
> > BR,
> > Nikolaus
> >
