Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBFE9395670
	for <lists+linux-omap@lfdr.de>; Mon, 31 May 2021 09:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbhEaHoi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 31 May 2021 03:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231157AbhEaHo0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 31 May 2021 03:44:26 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8B70C06138A;
        Mon, 31 May 2021 00:41:08 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id v3so2148067ljc.6;
        Mon, 31 May 2021 00:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MARe7ohTXlyio6CLGTaQ2C9DZzSxmfhJlawgXJ1NVHk=;
        b=EhOYxsis2O4mcY62S1NLPyMyc3fapU5jmz5OKjRiUst/kn8lVxmBSPjPW1CzmB+zVZ
         m5Qc/jQPUmRh89CDk5FHKhByWJ0GaVdIKPuM/UM7Fy5VWvTNpKd5kZ/ME2uvY4ikV5Yc
         ebyYcFpDuP/8ujqm4RE9dNkMiBGjlBrR9cP8oZmsq7ZCk/Q3teGbJ47gdJI+lCS5tuZE
         TXd3dbbi6F1i1dDYsv/A+0agl6sKjtiU/yMOnX3LuxYK9tZh4I2XAeiFFc9OCFUM8uXu
         eURTqgruGU991X3YeQXU0HvrjLusRDX/DFF2Ot+bAnX4jPep7TQozniljbGoBybL6T2Y
         RmEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MARe7ohTXlyio6CLGTaQ2C9DZzSxmfhJlawgXJ1NVHk=;
        b=Cfo0g3xsXNdk4hLeXaLJfGNHt/etKXXTRjYmEr+V3/N/zw2iq/6+e0Xlsatqjd8iUW
         fPKJLIfxxMDcDjKkEZGusP9+3IaXKzYUCF9iowvxA8q4cng1/fuii3qNERrd6fvNy0ds
         gyIw7/npFuhIjdZurXLjRTnE8wxiGWa7P/w+u8ZQvdBQmAwCFFl2FzyA2eIhXITcZIIb
         kcorkhIzOhSt6qnaBvw75F/V4xWXq5/bmH55nqDXfNqOw+liQdIsYWnE4Te6NQIYwJpg
         5IYV6OB5nWe1FPcmXa07SKPnZZaAK9o8EGgEAD5O0AjFvdZW0MxGLSoBFAhfbBztaER4
         QKVA==
X-Gm-Message-State: AOAM533NCgE7NjcvQBQAF99EguUlmIToPUhF0+ePzPHR8ydT3JZuTxhA
        fGBz5dSAJiOA2MlWzyqP2Az/zCTh8qNBKw==
X-Google-Smtp-Source: ABdhPJyo6dPuLMB4LP2n+t1loZCMvzzb6S7YlfpD5yTo1kZT5K6Nj9zV079+PrJKQxoBfbfeKbGDrA==
X-Received: by 2002:a2e:b890:: with SMTP id r16mr15575399ljp.300.1622446865620;
        Mon, 31 May 2021 00:41:05 -0700 (PDT)
Received: from [10.0.0.40] (91-155-111-71.elisa-laajakaista.fi. [91.155.111.71])
        by smtp.gmail.com with ESMTPSA id s9sm542211ljp.62.2021.05.31.00.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 00:41:05 -0700 (PDT)
Subject: Re: [PATCH -next] ASoC: ti: omap-mcbsp: use DEVICE_ATTR_RW macro
To:     YueHaibing <yuehaibing@huawei.com>, jarkko.nikula@bitmer.com,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com
Cc:     alsa-devel@alsa-project.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20210528063033.19904-1-yuehaibing@huawei.com>
From:   =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Message-ID: <144f1781-1c06-8a00-25dc-6f32e1f348be@gmail.com>
Date:   Mon, 31 May 2021 10:41:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210528063033.19904-1-yuehaibing@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 28/05/2021 09:30, YueHaibing wrote:
> Use DEVICE_ATTR_RW() helper instead of plain DEVICE_ATTR(),
> which makes the code a bit shorter and easier to read.

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  sound/soc/ti/omap-mcbsp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
> index db47981768c5..4479d74f0a45 100644
> --- a/sound/soc/ti/omap-mcbsp.c
> +++ b/sound/soc/ti/omap-mcbsp.c
> @@ -539,7 +539,7 @@ static ssize_t prop##_store(struct device *dev,				\
>  	return size;							\
>  }									\
>  									\
> -static DEVICE_ATTR(prop, 0644, prop##_show, prop##_store)
> +static DEVICE_ATTR_RW(prop)
>  
>  THRESHOLD_PROP_BUILDER(max_tx_thres);
>  THRESHOLD_PROP_BUILDER(max_rx_thres);
> 

-- 
Péter
