Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E74D34C35D
	for <lists+linux-omap@lfdr.de>; Mon, 29 Mar 2021 07:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbhC2Fzc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Mar 2021 01:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbhC2FzN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 Mar 2021 01:55:13 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45C06C061574;
        Sun, 28 Mar 2021 22:55:13 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id a1so14551824ljp.2;
        Sun, 28 Mar 2021 22:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AFwBwKQmaZvAfek2ylzBqiy9Pmq25T+2fBHpaiUkdFo=;
        b=ZbwEUR9JiKBgSN5xGYMSv85NfiSzlVg2dL14PH4e7nqVuN6qo7uIt5SmS972nqkDcu
         9IgSQaYwfdWjeiqmBwgBnSz7YO7l5UaLDXYmJrsw7AHjJ3G6CVezmRFq913T3XfU1ghR
         g+64Y9UyuuJ6Qyvm+IcNbLtCrceI3QSWjzvOT24AiBoQa9gQJy1WK70xyUVHDlQ3P9r2
         XkNI5MzdfrBaKISfHjpEK4h+PXdELvnrKTesw2QDKe/LNDKIjuWArxntQjqyDOvtJSCB
         Ddtg7GRh7ofETihb9mbi8mlceZe7Zw7ejPPS/HLtO8sdCirnrnI3no/dhGY0xWEprIPP
         MaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AFwBwKQmaZvAfek2ylzBqiy9Pmq25T+2fBHpaiUkdFo=;
        b=I8BhtGcGIQ6ktGXOvgguLboCvwUio224ejl9BGvLzhXCECdRIRKs0giCXGN9vzxMDN
         zgHbU+BUIP0bPbG0rkIlhcHfFMv2UioY30+O4twT7o0XWcJfo5iWSmAvtolCoa5++e9u
         t/8iQ75VRJIC60v/PJ5gOjghpCqMcyRoPZMu/NK7VHKGqjO4aVFA889ucj1o11cdwGx6
         3PUw8doUdXNgpaweKAMCTtgIkj7hDx9XsEjOmzsFxB8S/KIjPGaC3YEvhjG204uWhJP8
         pubm3yAg0C+1zhT9B2YRuyweaCQU3K2NyXIeYf2v9CZmeTnbA7CBktH32jl9dbNPFpP3
         sIiQ==
X-Gm-Message-State: AOAM533wYI4WCs5VDIAKGSqy5q2vVl7kYaVJaQUELscuTfcEOmY13OQX
        yCfUbLGCmuMVaVLQRAS2Hc/AqcnZPyr08w==
X-Google-Smtp-Source: ABdhPJzpmYL7y4TlZmnpGM1IV/tUVOJPf//OV0otEsKWBQkvYtfnUG5H++Svfy/AiLhizNJHdlSy0A==
X-Received: by 2002:a2e:974d:: with SMTP id f13mr16880816ljj.210.1616997311512;
        Sun, 28 Mar 2021 22:55:11 -0700 (PDT)
Received: from [10.0.0.42] (91-157-86-200.elisa-laajakaista.fi. [91.157.86.200])
        by smtp.gmail.com with ESMTPSA id i22sm2311894ljn.56.2021.03.28.22.55.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Mar 2021 22:55:10 -0700 (PDT)
Subject: Re: [PATCH 15/17] ASoC: ti: omap-mcsp: remove duplicate test
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        alsa-devel@alsa-project.org
Cc:     tiwai@suse.de, broonie@kernel.org, linux-kernel@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@bitmer.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        "open list:OMAP AUDIO SUPPORT" <linux-omap@vger.kernel.org>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
 <20210326215927.936377-16-pierre-louis.bossart@linux.intel.com>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <38488f20-a155-607d-464e-9461e50bc765@gmail.com>
Date:   Mon, 29 Mar 2021 08:56:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210326215927.936377-16-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Pierre,

On 3/26/21 11:59 PM, Pierre-Louis Bossart wrote:
> cppcheck warning:
> 
> sound/soc/ti/omap-mcbsp.c:379:11: style: The if condition is the same
> as the previous if condition [duplicateCondition]
> 
>  if (mcbsp->irq) {
>           ^
> sound/soc/ti/omap-mcbsp.c:376:11: note: First condition
>  if (mcbsp->irq)
>           ^
> sound/soc/ti/omap-mcbsp.c:379:11: note: Second condition
>  if (mcbsp->irq) {
>           ^
> 
> Keeping two separate tests was probably intentional for clarity, but
> since this generates warnings we might as well make cppcheck happy so
> that we have fewer warnings.

There might be other historical reasons why it ended up like this but
merging them does not make it less cleaner.

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/ti/omap-mcbsp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> index 6025b30bbe77..db47981768c5 100644
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -373,10 +373,9 @@ static void omap_mcbsp_free(struct omap_mcbsp *mcbsp)
>  		MCBSP_WRITE(mcbsp, WAKEUPEN, 0);
>  
>  	/* Disable interrupt requests */
> -	if (mcbsp->irq)
> +	if (mcbsp->irq) {
>  		MCBSP_WRITE(mcbsp, IRQEN, 0);
>  
> -	if (mcbsp->irq) {
>  		free_irq(mcbsp->irq, (void *)mcbsp);
>  	} else {
>  		free_irq(mcbsp->rx_irq, (void *)mcbsp);
> 

-- 
Péter
