Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3319043C973
	for <lists+linux-omap@lfdr.de>; Wed, 27 Oct 2021 14:19:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241885AbhJ0MVg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 27 Oct 2021 08:21:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230420AbhJ0MVb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 27 Oct 2021 08:21:31 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1984BC061570;
        Wed, 27 Oct 2021 05:19:06 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id c28so5655075lfv.13;
        Wed, 27 Oct 2021 05:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rIOeyL3hQU0K0LOdQBmDeeRWDlQgCLP7xNdWmaO63Xc=;
        b=c/FkzoZrczpNjuuYzv1t8+0uVFd5g1UJjMcsBDfAh3tSKWjWGD2QOvGf/N8+E82j83
         q2bSBtgtA9k+ojfJJL/+opT0pCOFxXfW/iuOFKe5dp6NaMSIXHh6mvqbSXhfArq+UPga
         x9cjIcZghphYUEoIP8qr5Jol4271XYS4pFNdreP4809fa2/70wonl7WxPWf1rnzf8rbE
         UCcbWAEoUmTTVQIliBlYbPV71rLyQyZNXaKkTUdX79daizA7KDggagTFM+Rt6f3eTEYe
         yiyWHnkUjSsRVM6PgOq//tJ3EvFapOhj9VN+7OZE3AomtK3jsWTRwvTwTXtEUOWuspmN
         2H8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rIOeyL3hQU0K0LOdQBmDeeRWDlQgCLP7xNdWmaO63Xc=;
        b=Mml/HZlAoM7lYbzp2pIFH7ykVGG65hAkNKkV6nVe1AdAdhcq/IBqetAI9JrbEPskwp
         Rvl4n2v1Vr08EF85JHI/PGsuCj3xorrgxR2DQjK2MJzVWlJPMrC11/Jn8GNFLYgchUTO
         diB+IXZXMIw0GOZBvxs1pFfaOaiVqhiryYtJ0zXUs69d525y7f0rzcs7WldExo5Hdpx+
         7ia6edqJAle8WUJZnaLsA8lc75GHIzEMzxKUuuNI86mHIr7Es6gsk76swDjj056V+gBy
         FT632/JefPmJahdpahSi3b1hPTUolMYV8NQWiPlg7mCll+xt4zRGFUpWI4B1Sp2tq6K4
         biYw==
X-Gm-Message-State: AOAM533P9bCAuQlTHQ/IzvaV+uOkQguYUWhzavJhiLQsBHKH03Y96HUM
        vaT8cz1PLGfd5fOG/3HHCSqneS8jEd4=
X-Google-Smtp-Source: ABdhPJz+Zj8/GwPIkvlflTdc+NLkCswoRcogP4L+NfXXPaq01L2n/T9XXVK9hg8uMEXdFn0iGEfHmg==
X-Received: by 2002:a05:6512:5c8:: with SMTP id o8mr15617760lfo.339.1635337143169;
        Wed, 27 Oct 2021 05:19:03 -0700 (PDT)
Received: from [192.168.2.145] (46-138-41-28.dynamic.spd-mgts.ru. [46.138.41.28])
        by smtp.googlemail.com with ESMTPSA id bu5sm2178998lfb.50.2021.10.27.05.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 05:19:02 -0700 (PDT)
Subject: Re: [PATCH v1] ARM: dts: elpida_ecb240abacn: Change Elpida compatible
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Tony Lindgren <tony@atomide.com>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org
References: <20211019234059.29877-1-digetx@gmail.com>
Message-ID: <a584428e-99f7-986e-90d5-7e81ca213158@gmail.com>
Date:   Wed, 27 Oct 2021 15:19:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211019234059.29877-1-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

20.10.2021 02:40, Dmitry Osipenko пишет:
> Vendor prefix shouldn't start with capital letter. The Elpida Memory
> compatible was never used in practice, hence just correct the compatible.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/elpida_ecb240abacn.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/elpida_ecb240abacn.dtsi b/arch/arm/boot/dts/elpida_ecb240abacn.dtsi
> index d87ee4794f83..9698801cbcfb 100644
> --- a/arch/arm/boot/dts/elpida_ecb240abacn.dtsi
> +++ b/arch/arm/boot/dts/elpida_ecb240abacn.dtsi
> @@ -5,7 +5,7 @@
>  
>  / {
>  	elpida_ECB240ABACN: lpddr2 {
> -		compatible	= "Elpida,ECB240ABACN","jedec,lpddr2-s4";
> +		compatible	= "elpida,ECB240ABACN","jedec,lpddr2-s4";
>  		density		= <2048>;
>  		io-width	= <32>;
>  
> 

This patch should go via OMAP tree since there is only OMAP board which
uses this dtsi. To make it more clear, "elpida" variant is now
documented in the bindings [1][2].

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=9e17f71e9c334f14ad6a8ec3edc09c7a4244e12f

[2]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=001b8b2594db4ea24fbea4c161e665f858917fce

If there is no interest in taking the patch via OMAP tree, then it may
go via the DT git tree. Rob, you should pick it up then.

Thanks!
