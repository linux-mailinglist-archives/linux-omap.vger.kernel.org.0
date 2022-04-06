Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79E7B4F6C42
	for <lists+linux-omap@lfdr.de>; Wed,  6 Apr 2022 23:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233410AbiDFVNu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 6 Apr 2022 17:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236066AbiDFVMu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 6 Apr 2022 17:12:50 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E502A17B8A2
        for <linux-omap@vger.kernel.org>; Wed,  6 Apr 2022 12:57:14 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id f16so1128799lfe.11
        for <linux-omap@vger.kernel.org>; Wed, 06 Apr 2022 12:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :references:content-language:in-reply-to:content-transfer-encoding;
        bh=g7ztqiXiRJRWyb0oF8JanOthw/sBGyBWWS1T9cwNFWA=;
        b=qQ26SHSZT6N2m5UMWrPZvxHJGfnffKEvFJmf+AiWAlUNgpOQY8WXUy7LcnzBrLgzGt
         9zLN060XMX5PI3NFkk1JChqWAbw9Gmxorw3Og8nUOCNB5TfxjfezD0GB9rG6Yj4e4+k1
         CNdv4rxdO1J54ddTKgYF4hnBPFRx/x3+tyO/UeqAEBKsguQdjEpsMiYjbpYXIOso7LKH
         C7uNebs9yYBFIFiX+ufGavfOCnJymLQBB6GiarnSAS9CgiTyN+VEV7mxoOW+KiioCr2n
         WRddAhl/ro7i0jb9t7hPzlW1fHB9QinIocsXiWT8gEspKZ4IgbQckqJ7YhsvkqCi4uhD
         R2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:references:content-language:in-reply-to
         :content-transfer-encoding;
        bh=g7ztqiXiRJRWyb0oF8JanOthw/sBGyBWWS1T9cwNFWA=;
        b=LvQFXdkSb2Kj7hSRuZ0ZrtV1CaLCjvXJ5E7jZ9Mx8IQf+jmP/vU/hXydKrE+FfHOUe
         YdCp2pLyvatfd0zCl8dDlRjmZfHq5TUIc7QcFp7pnfo6v89FXJPRiSWzQ1C3SjpFwYi1
         Raw/N+lI6x9jJx3jREu/NU/Jn/i8k9D6zzbAhnOOD1k/f289YtwpasS+Ecm3J8JNzpW2
         /wWUQz38rPfO9eWFT+d6zs3EltkdgL0MXiKmNIXD6UZJ+n7JeuW+BGvBBwIGO6cDxvlH
         w6QiQe2DVUf83BAsJoC6rK0SLlVXWOZ9qVEtRGv1cICTT72HSILcvy8L1IgGaJ42a9vK
         jY9Q==
X-Gm-Message-State: AOAM530koWnlOZMC7FkGCaMytDKsyBcG/0JHdlJ/R3fwCO9GFfFRQVGk
        YxDnp5pHsFzPEZIqRhaLyPg=
X-Google-Smtp-Source: ABdhPJynpegKu4/oSyXIHRHMGizneGJGYguDdzuoasTpZArw9AqSno9DKrZaGCfs/NLf0zj1CkLOJA==
X-Received: by 2002:a05:6512:20ce:b0:44a:384a:9195 with SMTP id u14-20020a05651220ce00b0044a384a9195mr7076190lfr.492.1649275032572;
        Wed, 06 Apr 2022 12:57:12 -0700 (PDT)
Received: from [10.0.0.127] (91-159-150-230.elisa-laajakaista.fi. [91.159.150.230])
        by smtp.gmail.com with ESMTPSA id h1-20020a2e9ec1000000b0024afb868455sm1744622ljk.5.2022.04.06.12.57.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Apr 2022 12:57:11 -0700 (PDT)
Message-ID: <1fa386d7-2222-f12d-8a8f-c7be29b1c6d2@gmail.com>
Date:   Wed, 6 Apr 2022 22:57:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH] ASoC: ti: osk5912: Make it CCF clk API compatible
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
        linux-omap@vger.kernel.org
References: <20220402120106.131118-1-jmkrzyszt@gmail.com>
Content-Language: en-US
In-Reply-To: <20220402120106.131118-1-jmkrzyszt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Janusz,

On 02/04/2022 15:01, Janusz Krzysztofik wrote:
> The driver, OMAP1 specific, now omits clk_prepare/unprepare() steps, not
> supported by OMAP1 custom implementation of clock API.  However, non-CCF
> stubs of those functions exist for use on such platforms until converted
> to CCF.
> 
> Update the driver to be compatible with CCF implementation of clock API.
> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> ---
>  sound/soc/ti/osk5912.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/ti/osk5912.c b/sound/soc/ti/osk5912.c
> index 40e29dda7e7a..22da3b335e81 100644
> --- a/sound/soc/ti/osk5912.c
> +++ b/sound/soc/ti/osk5912.c
> @@ -134,6 +134,10 @@ static int __init osk_soc_init(void)
>  		goto err2;
>  	}
>  
> +	err = clk_prepare(tlv320aic23_mclk);

would not make sense to change the clk_enable() to clk_prepare_enable()
in osk_startup() and the clk_disable() to clk_disable_unprepare() in
osk_shutdown() instead leaving the clock in prepared state as long as
the driver is loaded?

> +	if (err)
> +		goto err3;
> +
>  	/*
>  	 * Configure 12 MHz output on MCLK.
>  	 */
> @@ -142,7 +146,7 @@ static int __init osk_soc_init(void)
>  		if (clk_set_rate(tlv320aic23_mclk, CODEC_CLOCK)) {
>  			printk(KERN_ERR "Cannot set MCLK for AIC23 CODEC\n");
>  			err = -ECANCELED;
> -			goto err3;
> +			goto err4;
>  		}
>  	}
>  
> @@ -151,6 +155,8 @@ static int __init osk_soc_init(void)
>  
>  	return 0;
>  
> +err4:
> +	clk_unprepare(tlv320aic23_mclk);
>  err3:
>  	clk_put(tlv320aic23_mclk);
>  err2:
> @@ -164,6 +170,7 @@ static int __init osk_soc_init(void)
>  
>  static void __exit osk_soc_exit(void)
>  {
> +	clk_unprepare(tlv320aic23_mclk);
>  	clk_put(tlv320aic23_mclk);
>  	platform_device_unregister(osk_snd_device);
>  }

-- 
Péter
