Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7EC2E69D6
	for <lists+linux-omap@lfdr.de>; Mon, 28 Dec 2020 18:47:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727924AbgL1RqZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Dec 2020 12:46:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727739AbgL1RqZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Dec 2020 12:46:25 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36E8C061793
        for <linux-omap@vger.kernel.org>; Mon, 28 Dec 2020 09:45:44 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id a109so9787712otc.1
        for <linux-omap@vger.kernel.org>; Mon, 28 Dec 2020 09:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Om6/ussyHcBEJZqJjYlQvXi/CwxT8/WrKL7Ny39pM38=;
        b=sZAJkmUlGr6sQgRLHyrO1Bq7H8K74L/6g8idarABANKfZ+XaYYL1r//7C3XolSQ+ap
         JAiBO606lpINpNPuXdFRIerXA4pPFhvQEP2Lx+T3A8XfGFbCg3btEwRrwbU87bE3SpYD
         yRJ6SQUEt8Q7IOYyGApLZ2u5GNYm3S5C+Px71fKD1YQI7b2oG9qJH+9UqMp+/W/wMrA6
         cOD6vZBYU8CPrJjjZ6ygf4ZQJsC7lOZpd7ZjFWJL5isVkmL5HhvS11Hw5liJ+qByoXj+
         ysUcPiAiGy8VMHkgDzuPdM6Gb34H4MNNCBWZbfkpUC2Ctwki6sCg6mX6QgL+2h9rc3RF
         ByFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Om6/ussyHcBEJZqJjYlQvXi/CwxT8/WrKL7Ny39pM38=;
        b=aMM9ZzIoDcFP3zWhRt7L3Tqvxfx13ZOiou1bGyDwY5zdb5xl/yTaduyuBmi6FJPE2i
         SQv2eIseVAmiTrII6nWo9hGHiKyGEIRCYaz8v3BqWRCVeFqC/qkZXKOMdamf8E5tJMUX
         bvKyHYUNvTOjCXfMslbUWjIxVVPIsfmfjQdnkhv4jECXg0NiLOh4drZUVEmb+H+pTGjR
         ad/DXHNUAvZsm2JgFBf2FqWEgWmfi/tiHmxSJwfRpRDo1OJxNBJWsAd2I16t5gchz5wX
         /5FH7EI8qTyhkG+fc8Xyg5RgpbF+Oitr9nQV+eKDhlkKNNpku3/OL8yNUs88ugsajiYR
         FzlQ==
X-Gm-Message-State: AOAM532b71A+M1hSPWpbjeOnhLI8cEaPcJ2Wc+825qrGrA5UOGrBOKUR
        qs6og5kXbpch+jxeGLvB9/+oCw==
X-Google-Smtp-Source: ABdhPJyoZSKeFeAkv0tZbKhS3/z5T3WZvwJv+hFwNI1MM01GlnpsEcFel2lF9Dl+RyQubSVL39RuIQ==
X-Received: by 2002:a9d:2270:: with SMTP id o103mr32897108ota.320.1609177544012;
        Mon, 28 Dec 2020 09:45:44 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t25sm7356044oic.15.2020.12.28.09.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 09:45:43 -0800 (PST)
Date:   Mon, 28 Dec 2020 11:45:41 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dimitar Dimitrov <dimitar@dinux.eu>
Cc:     ohad@wizery.com, Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-omap@vger.kernel.org,
        Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH] remoteproc: pru: Fix loading of GNU Binutils ELF
Message-ID: <X+oZxcgHLlInB3c2@builder.lan>
References: <20201228074933.22675-1-dimitar@dinux.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201228074933.22675-1-dimitar@dinux.eu>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon 28 Dec 01:49 CST 2020, Dimitar Dimitrov wrote:

> PRU port of GNU Binutils lacks support for separate address spaces.
> PRU IRAM addresses are marked with artificial offset to differentiate
> them from DRAM addresses. Hence remoteproc must mask IRAM addresses
> coming from GNU ELF in order to get the true hardware address.
> 
> Patch was tested on top of latest linux-remoteproc/for-next branch:
>   commit 4c0943255805 ("Merge branches 'hwspinlock-next', 'rpmsg-next' and 'rproc-next' into for-next")'
> 
> PRU firmware used for testing was the example in:
>   https://github.com/dinuxbg/pru-gcc-examples/tree/master/blinking-led/pru
> 
> Signed-off-by: Dimitar Dimitrov <dimitar@dinux.eu>
> ---
>  drivers/remoteproc/pru_rproc.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 2667919d76b3..b03114bbb9ab 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -61,6 +61,18 @@
>  #define PRU_SDRAM_DA	0x2000	/* Secondary Data RAM */
>  #define PRU_SHRDRAM_DA	0x10000 /* Shared Data RAM */
>  
> +/*
> + * GNU binutils do not support multiple address spaces. The GNU linker's
> + * default linker script places IRAM at an arbitrary high offset, in order
> + * to differentiate it from DRAM. Hence we need to strip the artificial offset
> + * in the IRAM addresses coming from the ELF file.
> + *
> + * The TI proprietary linker would never set those higher IRAM address bits
> + * anyway. PRU architecture limits the program counter to 16 bit word
> + * addresses.
> + */
> +#define PRU_IRAM_DA_MASK	0xfffff

If the limit is 16 bits, why is your mask 20 bits?

> +
>  #define MAX_PRU_SYS_EVENTS 160
>  
>  /**
> @@ -450,6 +462,8 @@ static void *pru_i_da_to_va(struct pru_rproc *pru, u32 da, size_t len)
>  	if (len == 0)
>  		return NULL;
>  

Given that the comment explains this operation I think it would be
better to place it here. And if the masking directly follows what's
described in the comment you don't need a define for the mask.

Regards,
Bjorn

> +	da &= PRU_IRAM_DA_MASK;
> +
>  	if (da >= PRU_IRAM_DA &&
>  	    da + len <= PRU_IRAM_DA + pru->mem_regions[PRU_IOMEM_IRAM].size) {
>  		offset = da - PRU_IRAM_DA;
> -- 
> 2.20.1
> 
