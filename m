Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA234116A90
	for <lists+linux-omap@lfdr.de>; Mon,  9 Dec 2019 11:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbfLIKJG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Dec 2019 05:09:06 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:35658 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726687AbfLIKJG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 9 Dec 2019 05:09:06 -0500
Received: by mail-lj1-f196.google.com with SMTP id j6so14944432lja.2
        for <linux-omap@vger.kernel.org>; Mon, 09 Dec 2019 02:09:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=newoldbits-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qFxYVOCFv/IcSY7l7U6uJnkWyj0SJCRuOjbnSm1YePs=;
        b=0yD/xG0BGqJQOa8lh0bjl0BziV/iiF8t7ZnU7N97usjEJwxoPuFq30xWLcbDkYIRzC
         uWsaHqPC47bwqz8TWyIFKjokI0aoh9KDnf/eYwKVS3dkDPVpmXPGd5XD57GdOvuKXcyJ
         6CcnphbPrkVA3oJtO7qUdFF03fGdGxJQiuL1QbqWXCMMtgb5ri9ZfsawQDtVddIaODpp
         MePFL0rGZDGANlR02nlOI6V+EacZE7ugOVcUG98YvCGnKY3qpGixTani2mZ82WezBDFp
         Met5QQjO3RO3R4eIA1Krg6sbUko0+C7TbuDzcVDl3thv+eVtCSgJJQ2p7iBITUaQM2oW
         5qDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qFxYVOCFv/IcSY7l7U6uJnkWyj0SJCRuOjbnSm1YePs=;
        b=D1db433VtnR4x7xtyXHQ+J6qGmw5YedpypFKbOt5xwOwWytwcesJM5Orbn4jp/hKBJ
         YsC+eGJ2Z6iUNt9QVFlQlXKHAHZtO4gV47cACU6xe2MHGPPngrZUQ7U3tcbg0XIxyAd5
         ATUyFRDKTHppeODIXwuI0FHHuyhuAoRW13Z5Vk3EnFM6HWi7d3DuOY3w4bdDFA/rgX0l
         h+77wuXm2G+t51WrASWBTfIDZWQPKQJyILtR2UqRAlv7TKGFYUumDj9Jzv4tEpmtU4KR
         7tOS7m4Z7VhF4AzS6O4JH7LBG7qJxdvtgo8lKI/+v+wFpLvsoQwms/fN7c5XtM/SRQ17
         17+Q==
X-Gm-Message-State: APjAAAVOiYys7ZlxFrbi6cMiWv01/R6oz3KmoLCUVKcxgzN6fm0n02A+
        L4UQeEqfVYQ9e9ixdWpfz6RFP93BNVtTqo3H4ycswg==
X-Google-Smtp-Source: APXvYqxCGEJyLk0M69YAhpSsMh0T/N2yiFphyss5MStSLd/a+2iUGREL97xCC6L2vq0QyVJCxB9oIjVv21xlZE1G+Ig=
X-Received: by 2002:a2e:99cd:: with SMTP id l13mr2167115ljj.243.1575886144510;
 Mon, 09 Dec 2019 02:09:04 -0800 (PST)
MIME-Version: 1.0
References: <20191206160007.331801-1-jean.pihet@newoldbits.com>
 <20191206160007.331801-2-jean.pihet@newoldbits.com> <451986b2-e4f2-8bb6-fea1-65328b855223@ti.com>
In-Reply-To: <451986b2-e4f2-8bb6-fea1-65328b855223@ti.com>
From:   Jean Pihet <jean.pihet@newoldbits.com>
Date:   Mon, 9 Dec 2019 11:08:49 +0100
Message-ID: <CAORVsuXx1rmOk0Y+DY6fzQWUAjzUFSTZaV_7ookz=UzzmKd21w@mail.gmail.com>
Subject: Re: [PATCH 1/3] TI QSPI: Fix fclk frequency
To:     Vignesh Raghavendra <vigneshr@ti.com>
Cc:     Mark Brown <broonie@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        linux-omap@vger.kernel.org, linux-spi@vger.kernel.org,
        Ryan Barnett <ryan.barnett@rockwellcollins.com>,
        Conrad Ratschan <conrad.ratschan@rockwellcollins.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Vignesh,

On Mon, Dec 9, 2019 at 10:59 AM Vignesh Raghavendra <vigneshr@ti.com> wrote:
>
>
>
> On 06/12/19 9:30 pm, Jean Pihet wrote:
> > The QSPI IP is clocked by two clocks:
> > - CORE_CLKOUTM4 / 2 (L3) as interface clock,
> > - PER_CLKOUTM2 / 4 (L4) as functional clock, which is PER_CLKOUTM2
> >   divided by 4, so at 192Mhz / 4 = 48MHz.
> >
> > Fix the use of the correct fclk by the driver and fix the frequency
> > value so that the divider is correctly programmed to generate the
> > desired frequency of QSPI_CLK.
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
>
> This macro is unused and should be dropped.
That is correct. It is a left over from older versions. Will remove it.

Thanks,
Jean

>
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
> >
>
> --
> Regards
> Vignesh
