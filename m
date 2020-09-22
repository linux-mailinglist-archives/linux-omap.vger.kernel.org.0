Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7D34273D34
	for <lists+linux-omap@lfdr.de>; Tue, 22 Sep 2020 10:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbgIVIXH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 22 Sep 2020 04:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726743AbgIVIXH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 22 Sep 2020 04:23:07 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 584D0C061755;
        Tue, 22 Sep 2020 01:23:07 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d6so11740688pfn.9;
        Tue, 22 Sep 2020 01:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wPxHaBm+GJpOsgGu569qludylznm1Q7RqZ/7WCqRYDk=;
        b=T9ABVP4Io72ILRuNmJK1wQLXNy7HJF012rO7xpLqU6KIrg4N4ZLvEHzQE+gg2bs/es
         Ui3p355Tqb/62EcoHxIrIKRQRBGYr5/UpZxD4CIeNwo+DMC6uf0gsreSTv3iIJEO/LFz
         saGDKLwKWkMOkZil3+q8RCxnn77JYBWV8ZhxUpRPBVEGCwi21wb2xmClqENLgdyKJjjf
         aXQxva2xys8NA+zochRngqRsRckb0keXmi4op4V6cNS84la3EyutD9afib9RBjQAIfg2
         cgBOZhkQbOBZPCnd6xKE5nEghTNzanigVxlcaDm1G9jyrvXFCoznqB3egesCx4YJOv+t
         r7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wPxHaBm+GJpOsgGu569qludylznm1Q7RqZ/7WCqRYDk=;
        b=X2kIbmSjzVTKiKRDbHjbhfaiWGdD3xJ2Howe7evogWp/C+KQS6vK2QNPGOMog7myxY
         rV8kyH/R2iHXGxYzDRhmSBvFhyc+VcDdXjb3MwcJrHi8i4cgn4Cy8NWZGTvrw8t1yAAg
         h+NObVvduBRlsEMDQgXXXJ8Geg5ByG5M5/g3VON6MnCQLzI3ebEs2ejV4BLXtgJCDJMd
         CneLu9RQhSaZnVYxh1inFijCuEnd82+6ElXpPfk9gCIWKgiGqPlxrcCZiscb0FstdYm+
         4TzJLSnwdw0Ur7Rc1m+JjBaOaUKTyJ7O9DjANxU2tPLdTiKezEWLH+wyEFC6I95mGiGl
         7zJw==
X-Gm-Message-State: AOAM5310hlh0E+RAS5UJRW2a9bRbmSYIknwN2bul9Hs5Vl/BpAbCVChR
        SBEoj88zQ6ik649SNaPyBmRBMkqkwt5Hz82xHQI=
X-Google-Smtp-Source: ABdhPJzi2FDCJYACw6w9gxRyP6h63DxFy1f+mMZkZzN6oQhnq6un3C1tTVtOTbNBvNNejo0GxRaddWM2Eh2a+lBZYA4=
X-Received: by 2002:aa7:81d5:0:b029:142:2501:39fa with SMTP id
 c21-20020aa781d50000b0290142250139famr3233304pfn.73.1600762986936; Tue, 22
 Sep 2020 01:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200921205016.20461-1-krzk@kernel.org> <20200921205016.20461-11-krzk@kernel.org>
In-Reply-To: <20200921205016.20461-11-krzk@kernel.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 22 Sep 2020 11:22:50 +0300
Message-ID: <CAHp75Vd8tjNx1N=TVSS=coC8f1R7yGP07TXw7985+7yzAQXSTw@mail.gmail.com>
Subject: Re: [PATCH 11/42] mfd: intel_soc_pmic: use PLATFORM_DEVID_NONE
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

On Mon, Sep 21, 2020 at 11:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Use PLATFORM_DEVID_NONE define instead of "-1" value because:
>  - it brings some meaning,
>  - it might point attention why auto device ID was not used.

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/mfd/intel_soc_pmic_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mfd/intel_soc_pmic_core.c b/drivers/mfd/intel_soc_pmic_core.c
> index ddd64f9e3341..b7bbe58dedcc 100644
> --- a/drivers/mfd/intel_soc_pmic_core.c
> +++ b/drivers/mfd/intel_soc_pmic_core.c
> @@ -86,7 +86,7 @@ static int intel_soc_pmic_i2c_probe(struct i2c_client *i2c,
>         /* Add lookup table for crc-pwm */
>         pwm_add_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
>
> -       ret = mfd_add_devices(dev, -1, config->cell_dev,
> +       ret = mfd_add_devices(dev, PLATFORM_DEVID_NONE, config->cell_dev,
>                               config->n_cell_devs, NULL, 0,
>                               regmap_irq_get_domain(pmic->irq_chip_data));
>         if (ret)
> --
> 2.17.1
>


-- 
With Best Regards,
Andy Shevchenko
