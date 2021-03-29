Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36CE34C351
	for <lists+linux-omap@lfdr.de>; Mon, 29 Mar 2021 07:52:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbhC2FwU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Mar 2021 01:52:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbhC2Fvz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 Mar 2021 01:51:55 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58CBDC061574;
        Sun, 28 Mar 2021 22:51:55 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id b83so16585929lfd.11;
        Sun, 28 Mar 2021 22:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RTLEyGYV7yZnyiywVX1eOKOUOm0dlrQWocBPAeC79ME=;
        b=hNAHBojYISzngalmZZEPtvRBfhgwq4l7m6YkXQek8/1QFA2rul3OVIBvlStI01aBHC
         hxo9w3v7g05OYpns2vmFULGfBkX3dE1exCo6nX+P4Qc4/JSzgT2VPVSjSUQ2NonW2GYW
         YDj0OUyKAwGXNc08nvbkhEu/8Xu6D0YL9enJTsggteQnKCOrjK2Onvb8rjCRt4boYdPX
         Madcp2QIdCcHzrR+lrF9eEtm+54C6WoNmW808AtKEZWFvHGAfrcs6KB+XZdLzL/B45QS
         0ETnX78rbx3ECTEcNkAsP9sTRdBRwWD7ARh5htEPboxnb4juYxjT9TiQCv8RqcS77diM
         bULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RTLEyGYV7yZnyiywVX1eOKOUOm0dlrQWocBPAeC79ME=;
        b=hP4rHLicsaiQlU+IRZYmVi/2UEunNLVZUXJW9g5mKBF8Svf8d1EGR+fjrcV/s8ZIXi
         YJr/ozkJ0qbkZRh/2v6WSjZVjgkf0JExswjcctFP5ATND/5IgOhP1UBcHqC7JRNdTJle
         MTWMIew8Y7mKKUU77sQ+q4nx0EcFI1cZSDpbJLFZSTNI3XCU5C3H4/IEaalBrvTHuyvV
         rrWHsAvxKLyC6NJipNzO4r8hCl5ig9nHT1PuJCTbb6A8FIwQdKsfw3DpEbwI45+S7tOE
         mZVokSjpikQwPz3il02d/E0XeOtd3wSFaUqEiWb4XD8lpct3iI/HJFtGZWRgOgkUZAO6
         OX/w==
X-Gm-Message-State: AOAM5311LU49dQjF4PPE82G5ZzSm3QUED69tl1fRDbarK9gS3/g1XSB7
        dHIQtHNd6aZdtSmhg/XcyAEhZbkeWYc=
X-Google-Smtp-Source: ABdhPJzUmHX+nuyzaEP26EJ10aru8aZC9ARy5zb2nWO8j/0CzMhFhLBvwpv8cuYyGvkhN9urB6hxlg==
X-Received: by 2002:a05:6512:36c8:: with SMTP id e8mr14779024lfs.635.1616997113586;
        Sun, 28 Mar 2021 22:51:53 -0700 (PDT)
Received: from [10.0.0.42] (91-157-86-200.elisa-laajakaista.fi. [91.157.86.200])
        by smtp.gmail.com with ESMTPSA id n18sm1360128lfl.148.2021.03.28.22.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Mar 2021 22:51:53 -0700 (PDT)
Subject: Re: [PATCH 14/17] ASoC: ti: omap-abe-twl6040: remove useless
 assignment
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org
Cc:     tiwai@suse.de, broonie@kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        "open list:OMAP AUDIO SUPPORT" <linux-omap@vger.kernel.org>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
 <20210326215927.936377-15-pierre-louis.bossart@linux.intel.com>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <c21d4306-4219-009c-289a-14aa5bb7f241@gmail.com>
Date:   Mon, 29 Mar 2021 08:52:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210326215927.936377-15-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 3/26/21 11:59 PM, Pierre-Louis Bossart wrote:
> cppcheck warning:
> 
> sound/soc/ti/omap-abe-twl6040.c:173:10: style: Variable 'ret' is
> assigned a value that is never used. [unreadVariable]
>  int ret = 0;
>          ^

Thanks,
Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/ti/omap-abe-twl6040.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/ti/omap-abe-twl6040.c b/sound/soc/ti/omap-abe-twl6040.c
> index 16ea039ff865..91cc9a4f44d7 100644
> --- a/sound/soc/ti/omap-abe-twl6040.c
> +++ b/sound/soc/ti/omap-abe-twl6040.c
> @@ -170,7 +170,7 @@ static int omap_abe_twl6040_init(struct snd_soc_pcm_runtime *rtd)
>  	struct snd_soc_card *card = rtd->card;
>  	struct abe_twl6040 *priv = snd_soc_card_get_drvdata(card);
>  	int hs_trim;
> -	int ret = 0;
> +	int ret;
>  
>  	/*
>  	 * Configure McPDM offset cancellation based on the HSOTRIM value from
> 

-- 
Péter
