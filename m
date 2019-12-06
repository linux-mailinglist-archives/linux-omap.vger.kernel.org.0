Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2630115555
	for <lists+linux-omap@lfdr.de>; Fri,  6 Dec 2019 17:29:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbfLFQ3q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Dec 2019 11:29:46 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:37830 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbfLFQ3p (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 6 Dec 2019 11:29:45 -0500
Received: by mail-lj1-f196.google.com with SMTP id u17so8302260lja.4
        for <linux-omap@vger.kernel.org>; Fri, 06 Dec 2019 08:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newoldbits-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aLDOIrzTyHs8l3ztkg2SbHaADtEERTGh4fc2alZmQNQ=;
        b=AovdqPJxPvGB0qPkqTEsv39S5uBq373VomY2IfsaZWqdMkaWqfzC9hQFTRHPaNXyw9
         EntsooeqGDn2Mu5pV4WsJNgIZtQafOsfwAMShtXGKrdyG3BkgMXERSNTUc8p4r+/Z1sg
         qRAWQTokevjbXavssM5CSYESTvIZYDdHf2iQRkFeocGTx/5mYK6bYFG0MRFaL1VNoHn2
         U53cOPrnaMM+uZx0KNUgEsXVulaGgDKyTIDF1+YKNWEboSE5mPtKvqORZnbjbB1OPWYU
         hkuwlnpjaXhql5wJzqqIuTMfdeIwDGkVPgjKCex+eB9s1KG/V5XRMp8FvpJZ6ua/rNQi
         IBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aLDOIrzTyHs8l3ztkg2SbHaADtEERTGh4fc2alZmQNQ=;
        b=Br1yOMp/JW05/q61//R3pn4LDWWws7CUae0z4y1mvAboguHvyt84sn0AkUJYxdHngM
         6Ab26SCWVWRMGtIIJwF/LnzGPfSIe8n/E7FVS7aLU4fUwjGQPk7tI9mT2PMqR0O0dLPa
         HnUaRbhlr/Z2FM5e8BD6jja91zrz+kBV2NMLlX1TieTZk8QBmFdVBTrzlOFZjWjtVwzj
         T+P1/ihescOXiQGLKfeTeA9nvLntX2O2kfda3sT+qclNvPcORuDirK2QKgscR/7vDLV6
         c0LnaZwkQ2kvXv7iNBZa/jR2W4aWkSI5ZR/emNorDX0InVH9VmB6wUXYNj+Tgun1Zqb2
         8vJw==
X-Gm-Message-State: APjAAAUS3/sYm6fJxQYXQjiNHMcaWOgemCLC/wymW8YqXLXGx/srZDSd
        x2R9xvlG532I7W5dMdo6Rf0mxRzJK97eIEjleZGGYQ==
X-Google-Smtp-Source: APXvYqyDkm4S4d2x1Qyqb6joY1dRKa1NLvPIqk02NElzWxqPVa5K/+bYuPRByLhMnpwTCh1PdaoThDVlcraWiN6rTJs=
X-Received: by 2002:a2e:7816:: with SMTP id t22mr9206929ljc.161.1575649783780;
 Fri, 06 Dec 2019 08:29:43 -0800 (PST)
MIME-Version: 1.0
References: <20191206160007.331801-1-jean.pihet@newoldbits.com>
 <20191206160007.331801-2-jean.pihet@newoldbits.com> <20191206162431.GF35479@atomide.com>
In-Reply-To: <20191206162431.GF35479@atomide.com>
From:   Jean Pihet <jean.pihet@newoldbits.com>
Date:   Fri, 6 Dec 2019 17:29:32 +0100
Message-ID: <CAORVsuUBseM3vnZsSajMmUS1O6rEC4U_aa951HwMsGxyEm+t+g@mail.gmail.com>
Subject: Re: [PATCH 1/3] TI QSPI: Fix fclk frequency
To:     Tony Lindgren <tony@atomide.com>
Cc:     Mark Brown <broonie@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-omap@vger.kernel.org, linux-spi@vger.kernel.org,
        Ryan Barnett <ryan.barnett@rockwellcollins.com>,
        Conrad Ratschan <conrad.ratschan@rockwellcollins.com>,
        Vignesh R <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Fri, Dec 6, 2019 at 5:24 PM Tony Lindgren <tony@atomide.com> wrote:
>
> Hi Jean,
>
> * Jean Pihet <jean.pihet@newoldbits.com> [191206 16:01]:
> > The QSPI IP is clocked by two clocks:
> > - CORE_CLKOUTM4 / 2 (L3) as interface clock,
> > - PER_CLKOUTM2 / 4 (L4) as functional clock, which is PER_CLKOUTM2
> >   divided by 4, so at 192Mhz / 4 = 48MHz.
> >
> > Fix the use of the correct fclk by the driver and fix the frequency
> > value so that the divider is correctly programmed to generate the
> > desired frequency of QSPI_CLK.
>
> This source clock can be different between the SoC models, the
> related fck probably needs to be fixed in the SoC specific dtsi
> file.
>
> Currently qspi it's there only in dra7.dtsi, sounds like you
> are using it on am3/am4 based on the clock name?

I am using the AM4376 chipset. Only the interface is fixed in the
hwmod data as fck.
What is the best solution to add the extra fck?

Thank you for reviewing.
Regards,
Jean

>
> Regards,
>
> Tony
>
> > ---
> >  drivers/spi/spi-ti-qspi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/spi/spi-ti-qspi.c b/drivers/spi/spi-ti-qspi.c
> > index 3cb65371ae3b..4680dad38ab2 100644
> > --- a/drivers/spi/spi-ti-qspi.c
> > +++ b/drivers/spi/spi-ti-qspi.c
> > @@ -79,7 +79,7 @@ struct ti_qspi {
> >
> >  #define QSPI_COMPLETION_TIMEOUT              msecs_to_jiffies(2000)
> >
> > -#define QSPI_FCLK                    192000000
> > +#define QSPI_FCLK                    48000000
> >
> >  /* Clock Control */
> >  #define QSPI_CLK_EN                  (1 << 31)
> > @@ -748,7 +748,7 @@ static int ti_qspi_probe(struct platform_device *pdev)
> >               }
> >       }
> >
> > -     qspi->fclk = devm_clk_get(&pdev->dev, "fck");
> > +     qspi->fclk = devm_clk_get(&pdev->dev, "dpll_per_m2_div4_ck");
> >       if (IS_ERR(qspi->fclk)) {
> >               ret = PTR_ERR(qspi->fclk);
> >               dev_err(&pdev->dev, "could not get clk: %d\n", ret);
> > --
> > 2.23.0
> >
