Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74B203B84A7
	for <lists+linux-omap@lfdr.de>; Wed, 30 Jun 2021 16:05:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235851AbhF3OH7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Jun 2021 10:07:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235420AbhF3OHJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Jun 2021 10:07:09 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5C1C0617A8;
        Wed, 30 Jun 2021 07:04:16 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id k21so3476965ljh.2;
        Wed, 30 Jun 2021 07:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=57vYDWtaiAc9fCqO279XfLyvE20qvnTCvRyRXxlPmgg=;
        b=jAyYP64udX37D3pFHoVvKXOKf/Y4VbO6LowSd9VeDV6VfPWc+bXfUK+PMkpepVH3Bp
         jVP2gRZf2Etdvgc31YlomCyMWCnGxFQqN381nKXatw/zG9cdB/VZF7UxPXCQt2Zy0ZQ2
         zXjeyK2E6OPn6xA4ohdg6vNymxpwtmHysVtPdu4WI45CTbsBG23WuuftbEJ9tQuqWplj
         m728AUXnnlOTYzIseByCBXoJyXipeyZpjyOGaKTMuO2KDfEB8ssAp1NqsuZFyw4n1qGa
         z4vbfOKitKRrO0sHtBNWVaZe6vvpGGWjZPy4Rb/OdWXCdcn2lMKlzygG4JSC6Aq3L3Rg
         wT7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=57vYDWtaiAc9fCqO279XfLyvE20qvnTCvRyRXxlPmgg=;
        b=po6iAWbTGhvZA6GszK5PlRAMJ7uyqWu404CNd3NERYJaMKP/R6p/2yA/st5FAqv4Q+
         TJMKNPnZxH9LM0pxNyAKON/7CxtNkZPsiBmEJcBoz6oS+moUxAwH5yPBrUQ7uW9KnizE
         qyJeFT2TRHyq9fLJzyPzry3jLCxc0f+koVyo7vy5vmIzk4rvDm6sS7NsMQJjdsMEwXcN
         aOQzRAvotsXkoU+ZGWOObqEEUDciiF5GltWOVtO9JgYytNqc7RLhXybzUkU4WgLSeZZo
         tckIUPCkV+DoViPH5vroO8BTcfaec3LKXI7znY9FjROiy9vx3dlzjVZFWLhT80kaf0C6
         28vA==
X-Gm-Message-State: AOAM531erhv/HBheqgz+funzK0Qdn8iMZTFg3OhUyjUJQ/eAa5mxJ3a/
        V3K5RgxBkjF3qwbjW3kCWyoQ84WNeZp7CQRn
X-Google-Smtp-Source: ABdhPJy/2s9U8czt+fFFdv6oHM3g32XncInGR8IEojZ5SGHDCn98TDgZkw4S+KzOn64r++ck2UAYNg==
X-Received: by 2002:a2e:9c18:: with SMTP id s24mr2330139lji.249.1625061854376;
        Wed, 30 Jun 2021 07:04:14 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id o15sm1565990lfu.134.2021.06.30.07.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jun 2021 07:04:13 -0700 (PDT)
Subject: Re: [PATCH] ASoC: ti: delete some dead code in omap_abe_probe()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
        linux-omap@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <YNxTHXz58dhgbFtG@mwanda>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <24479ba7-6fc3-fce1-735d-b611d056412e@gmail.com>
Date:   Wed, 30 Jun 2021 17:04:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNxTHXz58dhgbFtG@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 30/06/2021 14:18, Dan Carpenter wrote:
> This code checks "priv->mclk_freq" twice and the second check is not
> required.  The code is left over from when removed support for legacy
> boot.

Good find, thank you!

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> Fixes: 8fe120b5a665 ("ASoC: omap-abe-twl6040: Remove support for pdata (legacy boot)")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  sound/soc/ti/omap-abe-twl6040.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
> index 91cc9a4f44d7..2e3d1eea77c1 100644
> --- a/sound/soc/ti/omap-abe-twl6040.c
> +++ b/sound/soc/ti/omap-abe-twl6040.c
> @@ -292,11 +292,6 @@ static int omap_abe_probe(struct platform_device *pdev)
>  
>  	card->fully_routed = 1;
>  
> -	if (!priv->mclk_freq) {
> -		dev_err(&pdev->dev, "MCLK frequency missing\n");
> -		return -ENODEV;
> -	}
> -
>  	card->dai_link = priv->dai_links;
>  	card->num_links = num_links;
>  
> 

-- 
Péter
