Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1691B2E79F9
	for <lists+linux-omap@lfdr.de>; Wed, 30 Dec 2020 15:32:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgL3ObX (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 30 Dec 2020 09:31:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726161AbgL3ObX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 30 Dec 2020 09:31:23 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AFC8C06179B;
        Wed, 30 Dec 2020 06:30:43 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id w5so17570493wrm.11;
        Wed, 30 Dec 2020 06:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AfKen0Opghye/eUbjPu8FvhlOJf1r0MkP+kC/srEZsg=;
        b=ry3BL+8MfCUYXjXbwHxMQ35RgxtVcALtJ2EzBqWdzl1Rn7Np6spbv3hPufbZKuA01f
         cwTtXstUVjmG4YE7No2VAwpIkIqI291MK4CF3GZ4V02fVoRh6/RIqP01j9zLVYGozQj/
         9DhzahQ3UTPWAe1LHYOn9eCt31poeriP+4NzaBuqbVuELmR6qU6T+ZrqAh/Erjo4b+fU
         xUjS1sF99D1Z4ZRxgswDIQZMtjNLCI3F8S/vRJl0MLWrCmsLLPVZMXoF+yamLxPjTrDD
         TaX+ZhUo6cWln0iURikF13qjde/sHUszDsXtZ1jGmAk2xypf9g910v/QAI+cYcP1D2Mc
         7i/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AfKen0Opghye/eUbjPu8FvhlOJf1r0MkP+kC/srEZsg=;
        b=k8Wq+Oocm2grOmVjYj0pmVQ6Q82psSQowLTNWthz4jqaZ6oiYSQ4Wo2Bbzyy3k0y6B
         YXNL6ymbKPT2qb3jzttM0G5XSmnhgz0LYKHfG93yPpRiOhBGOmHbYOZKUNnUyDcG4cXk
         NXbiiobqe6iPPMu1inM4lQ9vI9fq8R5F01wqFBZ4vzL7Y1oiL2Zq0Nr1mdlaXJ6kuw01
         sNC90shdAJCJjFon4+QfmvDTfWhbTO3BVTouDUPEVaFrj4qeQz6GDUZCQatNhoPA6iLy
         HPZcHAQZDr/GtYs87lhKs76G4ArTYE40TziZJwwD2GnJ/OxvXVvkxbQxG3Drzs62KLKL
         aU4w==
X-Gm-Message-State: AOAM530ovBffiWbc6qGgzSO3ctswed5wAxdqfM/vw+FccoGjsjNDnjGj
        tKdSlCKis9YCfRbuxhRSOJixjW1hT4Y=
X-Google-Smtp-Source: ABdhPJwbSE96H74Nk76qbml8O6A+fNaPt01qUnPvlex94fifI00oSAmmoyltLVi5ZYk2M96hwatYdA==
X-Received: by 2002:a5d:674c:: with SMTP id l12mr59836412wrw.399.1609338641737;
        Wed, 30 Dec 2020 06:30:41 -0800 (PST)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id a14sm63377979wrn.3.2020.12.30.06.30.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 30 Dec 2020 06:30:41 -0800 (PST)
Subject: Re: [PATCH 1/1] ARM: dts: omap443x: Correct sgx clock to 307.2MHz as
 used on motorola vendor kernel
To:     Carl Philipp Klemm <philipp@uvos.xyz>
Cc:     tony@atomide.com, bcousson@baylibre.com, robh+dt@kernel.org,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org
References: <20201230145115.239b4e1d50db37fce3560007@uvos.xyz>
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <8f782d10-4c55-ffe6-aa1c-1960ca0e20c9@gmail.com>
Date:   Wed, 30 Dec 2020 16:30:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20201230145115.239b4e1d50db37fce3560007@uvos.xyz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 30.12.20 г. 15:51 ч., Carl Philipp Klemm wrote:
> The Android vendor kernel uses 307.2MHz or a devider ratio of /5 while active
> 153600000 or /10 is only used when the sgx core is inactive.
> 
> Signed-off-by: Carl Philipp Klemm <philipp@uvos.xyz>
> ---
>   arch/arm/boot/dts/omap443x.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/omap443x.dtsi b/arch/arm/boot/dts/omap443x.dtsi
> index dd8ef58cbaed..8466161197ae 100644
> --- a/arch/arm/boot/dts/omap443x.dtsi
> +++ b/arch/arm/boot/dts/omap443x.dtsi
> @@ -78,11 +78,11 @@ &cpu_thermal {
>   /include/ "omap443x-clocks.dtsi"
>   
>   /*
> - * Use dpll_per for sgx at 153.6MHz like droid4 stock v3.0.8 Android kernel
> + * Use dpll_per for sgx at   like droid4 stock v3.0.8 Android kernel

Is is missing the value here (I guess this should be 307.2MHz)

Regards,
Ivo

>    */
>   &sgx_module {
>   	assigned-clocks = <&l3_gfx_clkctrl OMAP4_GPU_CLKCTRL 24>,
>   			  <&dpll_per_m7x2_ck>;
> -	assigned-clock-rates = <0>, <153600000>;
> +	assigned-clock-rates = <0>, <307200000>;
>   	assigned-clock-parents = <&dpll_per_m7x2_ck>;
>   };
> 
