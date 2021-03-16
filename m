Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF67633D4DA
	for <lists+linux-omap@lfdr.de>; Tue, 16 Mar 2021 14:29:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232938AbhCPN2g (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Mar 2021 09:28:36 -0400
Received: from mail-ej1-f41.google.com ([209.85.218.41]:40978 "EHLO
        mail-ej1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232908AbhCPN2W (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 16 Mar 2021 09:28:22 -0400
Received: by mail-ej1-f41.google.com with SMTP id lr13so72194307ejb.8;
        Tue, 16 Mar 2021 06:28:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bwzBKawa8QrzF0WVxsZqARsh6y5l0ULdbTOzlAVvjf8=;
        b=c6FcqB/BMTGnio5EhqINUa6dr81ZOtBHnGTha8ev9PzAm1BCjpA4gE/s9dkhkPMUjE
         VByO1AV+LKyJhAcmRyxthP5XJTt3J+ObZn7nsIBoq4IrRbCfmdHHaQJ16sMKXf/sfBKp
         DF2evqBibK0DPylLazoO9Zi8/hECakJ3Ll+Ij86uZ3G0E13tXyqgtRZPsMjdn5JX0GA8
         KJuwaOpfmHQOZua/wNk59rAFs3ApyoO+RKq2AgZE4GPCrJpi3g8dwE+1UtaGwUFpTMBG
         TosodGLku0CFvUyFhjiUIqLMlG2WCLGXukcxUjlQBURIEznXvppmpdI1BwuS0r7IWki3
         02xg==
X-Gm-Message-State: AOAM533uATYPWa0Nf12jJk/vicK6TKLvAF+0c7TZ2jSTECK3+yuiorVR
        w0Lm28AmhLVWwUFKE7AHADK6CtWCUu8=
X-Google-Smtp-Source: ABdhPJzNg7/QZMDxSK8P598pTy7ITIHHfnxE3zgDqUEJxHNVIRtOoSDXPTVAWjgwwKFx39he+ZbJ8A==
X-Received: by 2002:a17:906:a44f:: with SMTP id cb15mr29191920ejb.420.1615901300059;
        Tue, 16 Mar 2021 06:28:20 -0700 (PDT)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id r4sm9463218ejd.125.2021.03.16.06.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Mar 2021 06:28:19 -0700 (PDT)
Subject: Re: [RESEND PATCH 01/42] mfd: arizona: use PLATFORM_DEVID_NONE
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Charles Keepax <ckeepax@opensource.cirrus.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Andy Shevchenko <andy@kernel.org>, Milo Kim <milo.kim@ti.com>,
        Tony Lindgren <tony@atomide.com>, Ray Jui <rjui@broadcom.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Chen-Yu Tsai <wens@csie.org>, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org
References: <20201028223009.369824-1-krzk@kernel.org>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <fcee4721-1d91-d909-8a03-1c1b0b0ad83b@kernel.org>
Date:   Tue, 16 Mar 2021 14:28:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20201028223009.369824-1-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 28/10/2020 23:29, Krzysztof Kozlowski wrote:
> Use PLATFORM_DEVID_NONE define instead of "-1" value because:
>  - it brings some meaning,
>  - it might point attention why auto device ID was not used.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Hi Lee,

I sent this patchset some time ago, then made a resend. I did not get
any feedback from you so I just wonder - are you still considering this
patchset and shall I resend?

Best regards,
Krzysztof

> ---
>  drivers/mfd/arizona-core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
> index 000cb82023e3..bf48372db605 100644
> --- a/drivers/mfd/arizona-core.c
> +++ b/drivers/mfd/arizona-core.c
> @@ -1043,8 +1043,9 @@ int arizona_dev_init(struct arizona *arizona)
>  	case CS47L24:
>  		break; /* No LDO1 regulator */
>  	default:
> -		ret = mfd_add_devices(arizona->dev, -1, early_devs,
> -				      ARRAY_SIZE(early_devs), NULL, 0, NULL);
> +		ret = mfd_add_devices(arizona->dev, PLATFORM_DEVID_NONE,
> +				      early_devs, ARRAY_SIZE(early_devs),
> +				      NULL, 0, NULL);
>  		if (ret != 0) {
>  			dev_err(dev, "Failed to add early children: %d\n", ret);
>  			return ret;
> 
