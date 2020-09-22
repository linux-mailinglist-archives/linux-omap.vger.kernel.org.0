Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF08273D2D
	for <lists+linux-omap@lfdr.de>; Tue, 22 Sep 2020 10:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgIVIVz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Sep 2020 04:21:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726649AbgIVIVy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Sep 2020 04:21:54 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8BCDC061755;
        Tue, 22 Sep 2020 01:21:54 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id b124so11719552pfg.13;
        Tue, 22 Sep 2020 01:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=smNZB9H3lFiNBvXyfUZ+LjIuLRfI0LDRw3wzLyN58eg=;
        b=barvP639NjCROnD9uWmUXv82JHvOckVM9XhCXhdfBIwZdbYliOHKVy2sDmYeM33F7Q
         c4zGQDrtn+InHv7Ie5Joei43l4Dkbdt8h8RO75YHlw0QmILfQNdyBf1HNU78jsJO7plQ
         s3XyOH1J9Ogo/Kz3vNkBTIPfYIdC0uhPAwSqIQ34O/bOIMKkyXvjkKTZHXaY3EY6/6W6
         umSpbU0ygJCXz/fzaHNCkCR/yx3CSP3aSpFCfWFepehv+C3NLn2OhTXXrZH1i9aoDuaD
         Y6To85eiofbT9pWH45KISBE4bC8spFahV9Oci037diwEoNHzluqGQDia2tTMdi2fo16V
         5X6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=smNZB9H3lFiNBvXyfUZ+LjIuLRfI0LDRw3wzLyN58eg=;
        b=hhWwabP0aIqoFkgBTt5BP7bm9kPd7K+/zQB09zkmaEtgAQg6BtUxpnSyMzVN7X6Qta
         No7t8F1rKGyPEB73OmKxlgfk/G0mJgAbb3SeRsj6P47HV3WR6HC8IabZbc7YWrk3SPUZ
         TA1ct7IaooA75RvAD6IwAhCMeV1fLsL+4xw5eWVYj7ScQ1g5RiuHoUbeKLPoqGXX97tL
         6LuaYxzAChdAz3HXrNt4O3ruJ27slJaWHs3WaTG7w4LsWerREOl+we7rNYdtYVoO7bvY
         xCJTQV/lgVDeoyOtVaFxp/kT+8ZmCAdVFoFlmhjmpSsg1VOYM7G6lpUo87eeiuHSxhUV
         0VPA==
X-Gm-Message-State: AOAM531MKraJZ6KvuxqIkd9ZgsRqJomfcCzC6uHDvg8xF8v3Pa65hcaB
        q464Vaem/OkXZP5h6Vh9dkCLmQJToL1vfoUg5uA=
X-Google-Smtp-Source: ABdhPJyQ7mLs/QLk46U3q9QKDnYjTmr3usX+SysoO8dpdgk3qIRwK9RMBGldX8R7JF3VIPYb6UeYOJ78yZWEOCTfD+0=
X-Received: by 2002:a62:7b55:0:b029:13e:7367:2b2e with SMTP id
 w82-20020a627b550000b029013e73672b2emr3061981pfc.7.1600762914307; Tue, 22 Sep
 2020 01:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200921205016.20461-1-krzk@kernel.org> <20200921205016.20461-5-krzk@kernel.org>
In-Reply-To: <20200921205016.20461-5-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 22 Sep 2020 11:21:37 +0300
Message-ID: <CAHp75VecLojCKW1ckVJvW_cjUek14QxpS=JZH0D2P6jVHBMGqQ@mail.gmail.com>
Subject: Re: [PATCH 05/42] mfd: axp20x: use PLATFORM_DEVID_NONE
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Support Opensource <support.opensource@diasemi.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milo Kim <milo.kim@ti.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        patches@opensource.cirrus.com,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        linux-samsung-soc@vger.kernel.org,
        Linux OMAP Mailing List <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Sep 21, 2020 at 11:52 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Use PLATFORM_DEVID_NONE define instead of "-1" value because:
>  - it brings some meaning,
>  - it might point attention why auto device ID was not used.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/mfd/axp20x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index aa59496e4376..70aa538a4b64 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
> @@ -967,7 +967,7 @@ int axp20x_device_probe(struct axp20x_dev *axp20x)
>                 return ret;
>         }
>
> -       ret = mfd_add_devices(axp20x->dev, -1, axp20x->cells,
> +       ret = mfd_add_devices(axp20x->dev, PLATFORM_DEVID_NONE, axp20x->cells,
>                               axp20x->nr_cells, NULL, 0, NULL);
>
>         if (ret) {
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
