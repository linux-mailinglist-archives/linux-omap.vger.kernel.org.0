Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1C9E351FDD
	for <lists+linux-omap@lfdr.de>; Thu,  1 Apr 2021 21:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234613AbhDATau (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Apr 2021 15:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235382AbhDAT3L (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Apr 2021 15:29:11 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E7CFC04848B
        for <linux-omap@vger.kernel.org>; Thu,  1 Apr 2021 12:20:20 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id b14so4408845lfv.8
        for <linux-omap@vger.kernel.org>; Thu, 01 Apr 2021 12:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2MKyzSSqO2qBztJ2FSmZOVAwJM0w+9zEU56Q2e/9BLo=;
        b=QmqdxyzPlgQR+Zqr5E+57ZgfcnnooW6TIuqChuQIG3XCdRXgOIrRBLnlda758VgeZN
         TFCZ/8j+QF+8hGVZ8bnucq8oJV3mwqwzdrWdu9mCDRa+UpXKhqlqlC5OE3r+vXrd1ZU8
         in8n2ASP2u2akttMBOHpqmNF+Gnomi3f/YCVJ6MY6Q/njfd/NO9fHwBBIgQF1ckIk3BS
         Z9lHxLk1JSOPgKbk7X5PI3T/JoHdNGMa+wX8dQTYGXLv0SAfGzOhTwr8KJG3uyhd2QiC
         mmT7VPAoe0Of40eE5ky9qPH1g0B6HqtijZZva/KN0wpShh5gv8spLG2gxRWdcBvZ1wfp
         FQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2MKyzSSqO2qBztJ2FSmZOVAwJM0w+9zEU56Q2e/9BLo=;
        b=jE9xS7FkaPM7BkC473g28Uu5n7GM21hciKCEP7FnqRQKJp3wDM9SOmQVejyijtzVt6
         kelejROyjbKs7NeZgv16bLBRHOeK06hKKwE4f43C9X1MdZrfyvvEbgPo7j73KBnNh2oN
         Rt7giNOj+KzoMAzeTuU03ZR812WmvjL5w5XPt5ZGp/l7LEhpmxvCgWqOZxYM/rek+ds5
         AFV1Hxpw8sVepp9D+ebdkWUjVrFMfmnFliL0HsEXIzadhmkf026W/AU8+g143wrTUbCB
         CHoYsJUHoSWwNIwQGljefouwKLcRR1Mqp8wObbCEWeCxMeTEopXkdqKj5L3sVVLiLAPH
         leow==
X-Gm-Message-State: AOAM533ls2bqLDWb9r2tC3pc8sPYwJhGPqXyCFgVNp3XZp3d3pi+xXq9
        k5dVy6xNSobWox5xPA1KSnUDfk/1EvOtEOtpnsAdVQ==
X-Google-Smtp-Source: ABdhPJzDV5WB7YGUc9TbkLadDo7jSVCJrogWmp05PU4e3LhZKYQqorPhrVGv91oemEIqhtj8HL7J8+tf9kXGvezwHvY=
X-Received: by 2002:a19:5055:: with SMTP id z21mr6348381lfj.297.1617304818735;
 Thu, 01 Apr 2021 12:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210401162032.10150-1-maciej.falkowski9@gmail.com>
In-Reply-To: <20210401162032.10150-1-maciej.falkowski9@gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 1 Apr 2021 12:20:07 -0700
Message-ID: <CAKwvOdkqExnM=HpPDoj+40MDA3Wyv+oMGDD5MQq3Si2ehfT=6w@mail.gmail.com>
Subject: Re: [PATCH] usb: isp1301-omap: Add missing gpiod_add_lookup_table function
To:     Maciej Falkowski <maciej.falkowski9@gmail.com>
Cc:     aaro.koskinen@iki.fi, tony@atomide.com,
        Russell King <linux@armlinux.org.uk>,
        linux-omap@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Apr 1, 2021 at 9:21 AM Maciej Falkowski
<maciej.falkowski9@gmail.com> wrote:
>
> The gpiod table was added without any usage making it unused
> as reported by Clang compilation from omap1_defconfig on linux-next:
>
> arch/arm/mach-omap1/board-h2.c:347:34: warning: unused variable 'isp1301_gpiod_table' [-Wunused-variable]
> static struct gpiod_lookup_table isp1301_gpiod_table = {
>                                  ^
> 1 warning generated.
>
> The patch adds the missing gpiod_add_lookup_table() function.
>
> Signed-off-by: Maciej Falkowski <maciej.falkowski9@gmail.com>
> Fixes: f3ef38160e3d ("usb: isp1301-omap: Convert to use GPIO descriptors")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1325

Looks consistent to me with other callers of gpiod_add_lookup_table
from .init_machine callbacks.

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/arm/mach-omap1/board-h2.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/mach-omap1/board-h2.c b/arch/arm/mach-omap1/board-h2.c
> index c40cf5ef8607..977b0b744c22 100644
> --- a/arch/arm/mach-omap1/board-h2.c
> +++ b/arch/arm/mach-omap1/board-h2.c
> @@ -320,7 +320,7 @@ static int tps_setup(struct i2c_client *client, void *context)
>  {
>         if (!IS_BUILTIN(CONFIG_TPS65010))
>                 return -ENOSYS;
> -
> +
>         tps65010_config_vregs1(TPS_LDO2_ENABLE | TPS_VLDO2_3_0V |
>                                 TPS_LDO1_ENABLE | TPS_VLDO1_3_0V);
>
> @@ -394,6 +394,8 @@ static void __init h2_init(void)
>         BUG_ON(gpio_request(H2_NAND_RB_GPIO_PIN, "NAND ready") < 0);
>         gpio_direction_input(H2_NAND_RB_GPIO_PIN);
>
> +       gpiod_add_lookup_table(&isp1301_gpiod_table);
> +
>         omap_cfg_reg(L3_1610_FLASH_CS2B_OE);
>         omap_cfg_reg(M8_1610_FLASH_CS2B_WE);
>
> --

-- 
Thanks,
~Nick Desaulniers
