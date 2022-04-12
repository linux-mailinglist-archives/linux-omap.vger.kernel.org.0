Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECB764FE7B9
	for <lists+linux-omap@lfdr.de>; Tue, 12 Apr 2022 20:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232099AbiDLSSH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 12 Apr 2022 14:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231250AbiDLSSF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 12 Apr 2022 14:18:05 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B545F4FD
        for <linux-omap@vger.kernel.org>; Tue, 12 Apr 2022 11:15:47 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 15so10298199ljw.8
        for <linux-omap@vger.kernel.org>; Tue, 12 Apr 2022 11:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=bv3Ii30g4zGcWcAjSR2RS9vcLFQi9OzgY4tPm0Xq2DI=;
        b=YV53AwGdEEVgzCL5YdoQZETViwrr4M+mhHCyloRPNiBVNtmcBfdVBhj5spAJHCr839
         kZtSOC9W7a/ByewNrfCcTZb7cPQIY4MJfbZqA5HJn3kBbDTTg/ZfPvxSEV5MRUpzWrWA
         y460MIcw0ZJMLrcZCMLG5DAnSXUEz/rE/CWFYntEAPmZv4pbd2mkdDNMAUEC7GZACJM7
         8A+SE4CUvYdisEKXHNlUiH3gLBBuHLaDkca47ws/UwwDDwpAzluzQmqP90fO7oUmzewL
         KAF4erB55K5h/Xk2lqIpgdfvfrkrVcmyJPREZMksN5fmHJK8BqlxOU45xTyb/7IXdemY
         Lspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=bv3Ii30g4zGcWcAjSR2RS9vcLFQi9OzgY4tPm0Xq2DI=;
        b=L40IylOlcbN/Myl/AiEpmfJEM2cZDTW45RdT3SJ7oaLEB9BvgezzZyCxzkBT2/b23g
         y/4Yg2A6tkLJDG71EPUNq6Rb2Cv+pdh885/r7bMUM6uI9FDxKbKXbp2HEO6AGV8tn9/h
         BXcQwQCuQ2rxclucLF6byHVoydZe0zFg/7a1pkFQZWKPrZbgdDP1wiSxY2JEMuBNaebJ
         BG4MY2dCgh7bLkasNPJ4yttQfQjfV3P/R5KTkwp1TO4nfEMOD8zqVlAFlMXvcvpSQ0fy
         C+2pj7/jJFTMI5xLjTEaA8i2nJo04OnfQIj/pNIgRoD306oeA1WKb9GSFNqCer2eKUeQ
         epuA==
X-Gm-Message-State: AOAM53037O3Vgbi+DpdHysMzV9i0xVP6iMtTRC8Kc2u9cea7bIUMnmIt
        ixECOXi82iSRCt93uhxLmDi9K0uputQy+VgX
X-Google-Smtp-Source: ABdhPJyCwli3exPbuxaDOZra0Qqr/PAYhgR3s7Rs82OLpmiFF+a50aDqmTJPoBEdwbdy6CyNR84AvQ==
X-Received: by 2002:a2e:a4c8:0:b0:249:7f70:50ad with SMTP id p8-20020a2ea4c8000000b002497f7050admr23420518ljm.171.1649787345883;
        Tue, 12 Apr 2022 11:15:45 -0700 (PDT)
Received: from [10.0.0.127] (91-159-150-230.elisa-laajakaista.fi. [91.159.150.230])
        by smtp.gmail.com with ESMTPSA id f17-20020a2e1f11000000b00247f8eb86a7sm3358565ljf.108.2022.04.12.11.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 11:15:45 -0700 (PDT)
Message-ID: <cfae1549-560d-7ac6-bafd-2e55a3ae5c5e@gmail.com>
Date:   Tue, 12 Apr 2022 21:16:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] ASoC: ti: osk5912: Make it CCF clk API compatible
Content-Language: en-US
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
        linux-omap@vger.kernel.org
References: <20220402120106.131118-1-jmkrzyszt@gmail.com>
 <20220407191202.46206-1-jmkrzyszt@gmail.com>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20220407191202.46206-1-jmkrzyszt@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 07/04/2022 22:12, Janusz Krzysztofik wrote:
> The driver, OMAP1 specific, now omits clk_prepare/unprepare() steps, not
> supported by OMAP1 custom implementation of clock API.  However, non-CCF
> stubs of those functions exist for use on such platforms until converted
> to CCF.
> 
> Update the driver to be compatible with CCF implementation of clock API.
> 
> v2: use clk_prepare_enable/clk_disable_unprepare() (Peter)

Does the changelogn needs to be in the commit message?

I almost missed the V2 as it came as a reply to a thread ;)

Other than the nitpick with the changlog placement:

Looks good but I can not test it,
Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> ---
>  sound/soc/ti/osk5912.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/ti/osk5912.c b/sound/soc/ti/osk5912.c
> index 40e29dda7e7a..2790c8915f55 100644
> --- a/sound/soc/ti/osk5912.c
> +++ b/sound/soc/ti/osk5912.c
> @@ -27,12 +27,12 @@ static struct clk *tlv320aic23_mclk;
>  
>  static int osk_startup(struct snd_pcm_substream *substream)
>  {
> -	return clk_enable(tlv320aic23_mclk);
> +	return clk_prepare_enable(tlv320aic23_mclk);
>  }
>  
>  static void osk_shutdown(struct snd_pcm_substream *substream)
>  {
> -	clk_disable(tlv320aic23_mclk);
> +	clk_disable_unprepare(tlv320aic23_mclk);
>  }
>  
>  static int osk_hw_params(struct snd_pcm_substream *substream,

-- 
Péter
