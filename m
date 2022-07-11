Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 808EB55C8E0
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 14:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233141AbiF0I4O (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jun 2022 04:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233565AbiF0I4N (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Jun 2022 04:56:13 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B158B6377
        for <linux-omap@vger.kernel.org>; Mon, 27 Jun 2022 01:56:09 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id k22so12001796wrd.6
        for <linux-omap@vger.kernel.org>; Mon, 27 Jun 2022 01:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=nlPDvru9g+6e09uBPCVtQLHHZpQNhZJ7Dr6XYb9+r0U=;
        b=DBtLOJvQnc6WoXyM+892d57nD6JpLRKISJbAU3lCCMAEvZ/cG0A+cxD9WA6v5XP4eP
         GwSlVMmtUW9J6VztGPuziCFTdWDVvdsVj0pBk0Plju3v5zygc/OqsMUCNolaaa8A0DaP
         P68hmfUYyA76swlwFZP3kNzGXEVfeiGnB/3ZGoR8BSVhkxD0jOpuFsMhSQojecGsVljo
         jNpCJlv85C4XgQnRyRBWk6qo26qdcXL6YMrJMkMJPk/7ATg/SJeXWMkgK55XsUTIv85x
         cqTB5EuVMXLK4u+4APDL/xsl2iYpr0ywqK/Y5SUHUHS6oRV2g1HrjU6jSA8/9zW5dkLS
         zaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=nlPDvru9g+6e09uBPCVtQLHHZpQNhZJ7Dr6XYb9+r0U=;
        b=6kBDHCgVnAhYDa3aFyugov45vp28BeHRwebxVfO9QLr4R1ga+ZLVVPW6B5GzNI6Vi2
         a/WmE5ELD+DiYjCHNtB5LOuxI6hFehBV2piUvj3P82U5s55zPkGWAvcWCWRyM2z907ez
         oV6AgtMOeKgpSVkpV2ZUXU2YBHlv8QMIRgCrBhvZWJiaOCL5CyJTvvhd5dKLkGqojkdi
         D05ekMMzHbmxT9J/KLNX3yJHy/tI0V0Zetonvxw+f3iu9C85MNMra91DxO38roIsTUWE
         3htSPIjFRxaIP8clez4rrciVJi5dB3Xmau4xGtTjaVay0HUoVrrqhZyb1qL+/ajOcGj3
         iWpQ==
X-Gm-Message-State: AJIora9F5I6SfBQTwBbDboND5H9AMj1ZWir8Q4Jxp4reHFhkBaSfbA66
        fScrExc2jQg0zzCAlNxDnkjONg==
X-Google-Smtp-Source: AGRyM1vDiKWUi2mSnjhXXcAbN5YNOFCUtttXUmXjbqS1DAlRL0g3Z8yyDYYbEbWD4s7fAuWvicFs5g==
X-Received: by 2002:a5d:6d06:0:b0:21b:c433:d1f6 with SMTP id e6-20020a5d6d06000000b0021bc433d1f6mr8076024wrq.717.1656320168244;
        Mon, 27 Jun 2022 01:56:08 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id b3-20020a5d6343000000b0021a36955493sm9623729wrw.74.2022.06.27.01.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 01:56:07 -0700 (PDT)
Date:   Mon, 27 Jun 2022 09:56:06 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Peter Ujfalusi <peter.ujfalusi@gmail.com>
Cc:     tony@atomide.com, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: twl4030-audio: Drop legacy, non DT boot support
Message-ID: <YrlwpkEOPpmYXstO@google.com>
References: <20220616153158.29302-1-peter.ujfalusi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220616153158.29302-1-peter.ujfalusi@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 16 Jun 2022, Peter Ujfalusi wrote:

> Legacy or non DT boot is no longer possible on systems where the
> tw4030/5030 is used.
> 
> Drop the support for handling legacy pdata.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> ---
>  drivers/mfd/twl4030-audio.c | 29 ++++++-----------------------
>  1 file changed, 6 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/mfd/twl4030-audio.c b/drivers/mfd/twl4030-audio.c
> index 4536d829b43e..c61da99e9681 100644
> --- a/drivers/mfd/twl4030-audio.c
> +++ b/drivers/mfd/twl4030-audio.c
> @@ -144,14 +144,10 @@ unsigned int twl4030_audio_get_mclk(void)
>  }
>  EXPORT_SYMBOL_GPL(twl4030_audio_get_mclk);
>  
> -static bool twl4030_audio_has_codec(struct twl4030_audio_data *pdata,
> -			      struct device_node *parent)
> +static bool twl4030_audio_has_codec(struct device_node *parent)
>  {
>  	struct device_node *node;
>  
> -	if (pdata && pdata->codec)
> -		return true;
> -
>  	node = of_get_child_by_name(parent, "codec");
>  	if (node) {
>  		of_node_put(node);
> @@ -161,14 +157,10 @@ static bool twl4030_audio_has_codec(struct twl4030_audio_data *pdata,
>  	return false;
>  }
>  
> -static bool twl4030_audio_has_vibra(struct twl4030_audio_data *pdata,
> -			      struct device_node *node)
> +static bool twl4030_audio_has_vibra(struct device_node *node)
>  {
>  	int vibra;
>  
> -	if (pdata && pdata->vibra)
> -		return true;
> -
>  	if (!of_property_read_u32(node, "ti,enable-vibra", &vibra) && vibra)
>  		return true;
>  
> @@ -178,14 +170,13 @@ static bool twl4030_audio_has_vibra(struct twl4030_audio_data *pdata,
>  static int twl4030_audio_probe(struct platform_device *pdev)
>  {
>  	struct twl4030_audio *audio;
> -	struct twl4030_audio_data *pdata = dev_get_platdata(&pdev->dev);
>  	struct device_node *node = pdev->dev.of_node;
>  	struct mfd_cell *cell = NULL;
>  	int ret, childs = 0;
>  	u8 val;
>  
> -	if (!pdata && !node) {
> -		dev_err(&pdev->dev, "Platform data is missing\n");
> +	if (!node) {

Is this check required at all?

How else would be get here?

> +		dev_err(&pdev->dev, "Only DT boot si supported\n");

Spell check.

>  		return -EINVAL;
>  	}
>  
> @@ -222,22 +213,14 @@ static int twl4030_audio_probe(struct platform_device *pdev)
>  	audio->resource[TWL4030_AUDIO_RES_APLL].reg = TWL4030_REG_APLL_CTL;
>  	audio->resource[TWL4030_AUDIO_RES_APLL].mask = TWL4030_APLL_EN;
>  
> -	if (twl4030_audio_has_codec(pdata, node)) {
> +	if (twl4030_audio_has_codec(node)) {
>  		cell = &audio->cells[childs];
>  		cell->name = "twl4030-codec";
> -		if (pdata) {
> -			cell->platform_data = pdata->codec;
> -			cell->pdata_size = sizeof(*pdata->codec);
> -		}
>  		childs++;
>  	}
> -	if (twl4030_audio_has_vibra(pdata, node)) {
> +	if (twl4030_audio_has_vibra(node)) {
>  		cell = &audio->cells[childs];
>  		cell->name = "twl4030-vibra";
> -		if (pdata) {
> -			cell->platform_data = pdata->vibra;
> -			cell->pdata_size = sizeof(*pdata->vibra);
> -		}
>  		childs++;
>  	}
>  

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
