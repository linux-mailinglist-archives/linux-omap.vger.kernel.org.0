Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF1EC2281
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2019 15:54:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730378AbfI3Nyr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 09:54:47 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:39252 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729738AbfI3Nyr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Sep 2019 09:54:47 -0400
Received: by mail-io1-f67.google.com with SMTP id a1so38517098ioc.6;
        Mon, 30 Sep 2019 06:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v/6cTPKdYhCWm4oLn5nnbSZnKAi257wb/KoyfLSpOZ8=;
        b=mYXxmzMjX2uupScR95FotMBV60td1h7GEI1SE1kqw7gcg+cUuNOF/LlEyv8C8cYA1X
         TnShjEcS4laWh9uKeWQkPd+sxEBwdg0NvOmq5aditwp160k4/U0uaHpNBeZRqsn/dcYi
         AZj2GK7NBcSceCOT6GoV88CRKsTOE3cN8ZjVlbofX1UuxXVZdL5zwgLFP4HEwViw9kxS
         3BSJmRYpS2lOchJETLBBTTzTvmE5YHtS1/u4slG6REkeQdRr7GbQ7I7W+OxT4V8Ocvqg
         4Q+A7ITlEQ2bYWrN27FnMvn79gJdgsYlFKinQnqGM3Si+CbXnqg+9lS1ajToADw3FA6W
         vzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v/6cTPKdYhCWm4oLn5nnbSZnKAi257wb/KoyfLSpOZ8=;
        b=kL/lTkQOHE8R+9EnheLuFVrxMR7SMqRwbMAK2C/GpfeXXO8AtQZDVXSMkGkVVg7Ubu
         b68KcPoiHfQOSPxoZphjlz4xBNMO+Zgs0uQ4PpFPKygvDKW9ZBH4n/R65k7bIPOZWicy
         hWDUguJrK35wJB2bE7cgJNYzKeYuI9vfxQWY7u0wyY4UbWiaN7Gkweq2g0lJOmf8+PHS
         W5HfCkeZDJ/pUGQKYM938VneoWQCA1/D2TteqlmoL1Vusfdzd56+ijbWOQtKnAFagdr5
         3kpURxROPXcXuwwyWZykuTe+iyy3DeuWJBpBCV6b0/MF8I5XpXpmRRidK4aju1JtfSH3
         voHA==
X-Gm-Message-State: APjAAAVFnIXHClPiEFBUubJI+MXU63z0dKccveUMZiMn5zVu8GUT0W8K
        aaH0nzdbPMcJjAZa+2A1v+kTWbQTHT+s/75h1W4=
X-Google-Smtp-Source: APXvYqxbNYGoI0Ebnhewnu+oe0JbB4iIoaKSizxLuOYI/fUvQoO0IBP74yP9CUOWd1hGyNh8HR7NMPqsFmwcwEM4XV0=
X-Received: by 2002:a5d:9c4c:: with SMTP id 12mr1983384iof.276.1569851686291;
 Mon, 30 Sep 2019 06:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190510194229.20628-1-aford173@gmail.com> <af325707-3e42-493d-e858-77878ef06138@ti.com>
 <CAHCN7xLzoCNW6q5yDCsqMHeNvdNegkGhd0N+q9+Gd8JUGbG=_g@mail.gmail.com>
 <7ada0752-6f65-2906-cb29-a47c9490fd57@ti.com> <CAHCN7xJexJvh71vyb31ETgo=n_y_CupHH-AZwVK9mZe3GzJfEQ@mail.gmail.com>
 <845055e2-8182-de74-2077-629fdf50ac6c@ti.com> <CAHCN7xJFrTLOnbqrnH2W_T2whR8Xji0EMNR_cy8GYkDV-JDodQ@mail.gmail.com>
 <854f6130-c8a8-81cb-aa76-4830f218ae54@ti.com> <CAHCN7xKocdiWOdmoWQV3POr84qte6WNt0QbQRAwxKSvU8COB_w@mail.gmail.com>
 <0473526e-df0a-94a5-5c22-debd0084ab16@ti.com> <36369388-e9c8-22cd-8c19-e2bdf2d0389b@ti.com>
 <eb2eb1f6-3c9b-7ecb-667e-819033af9c14@ti.com> <23eba53a-9304-2ceb-d97e-01891ec0b3ed@ti.com>
 <cb028b1e-05ca-9b22-be5d-c63f5fd56cc4@ti.com> <F3335195-6EB7-4D44-B884-2F29D9238011@goldelico.com>
In-Reply-To: <F3335195-6EB7-4D44-B884-2F29D9238011@goldelico.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Mon, 30 Sep 2019 08:54:34 -0500
Message-ID: <CAHCN7xL9bFxO=2i1DzmRj6A3XwUNdt=DZeJ2a0EZ0f9gcFTy6g@mail.gmail.com>
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

On Mon, Sep 30, 2019 at 8:39 AM H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
>
> > Am 30.09.2019 um 10:53 schrieb Tero Kristo <t-kristo@ti.com>:
> >
> > The best action here is probably to drop the max-div value for this clock to 16. Can someone check this with their display setup and see what happens? Attached patch should do the trick.
>
> I have checked on GTA04 and OpenPandora (DM3730 resp. OMAP3430) and did not notice a negative effect.
>
> (Well, we never see the problem that is discussed here and have built with CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=0).

I have never been able to use CONFIG_OMAP2_DSS_MIN_FCK_PER_PCK=0, but
I assume it's either a function of pck or a combination of pck with
the resolution.

Based on Tomi's comment, I assume he's working on the following.  Can
you also try:

diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c
b/drivers/gpu/drm/omapdrm/dss/dss.c
index 5711b7a720e6..5e584f32ea6a 100644
--- a/drivers/gpu/drm/omapdrm/dss/dss.c
+++ b/drivers/gpu/drm/omapdrm/dss/dss.c
@@ -1090,7 +1090,7 @@ static const struct dss_features omap34xx_dss_feats = {

 static const struct dss_features omap3630_dss_feats = {
        .model                  =       DSS_MODEL_OMAP3,
-       .fck_div_max            =       32,
+       .fck_div_max            =       16,
        .fck_freq_max           =       173000000,
        .dss_fck_multiplier     =       1,
        .parent_clk_name        =       "dpll4_ck",


Hopefully it doesn't break the 3630 for you, but it fixed my issue
with no back trace:

[    9.915588] DSS: set fck to 54000000
[    9.915618] DISPC: lck = 54000000 (1)
[    9.915649] DISPC: pck = 9000000 (6)
[    9.917633] DISPC: channel 0 xres 480 yres 272
[    9.917663] DISPC: pck 9000000

I do wonder, however if there is a divider that is higher than 16, but
lower than 32.
I was able to run fck at 36MHz before with divide by 4 to 9MHz, so I
am hoping that by running at 54MHz / 6 doesn't draw more power.  I was
reading through the datasheet, but I could not find any reference to
the max divider.

adam
>
> BR,
> Nikolaus
>
