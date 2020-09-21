Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A08F271F2C
	for <lists+linux-omap@lfdr.de>; Mon, 21 Sep 2020 11:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgIUJqF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Sep 2020 05:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726355AbgIUJqE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 21 Sep 2020 05:46:04 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81584C061755;
        Mon, 21 Sep 2020 02:46:04 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id o5so11988048wrn.13;
        Mon, 21 Sep 2020 02:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=10MZ+wZvlSGpLMLJeIkgsqILP3ii9lT0DDHtw+L14VY=;
        b=eiCBPrtDbQz9fZpSRMUVbN6HVT+LTVz2w9MZX2zQfNgGbnCdcsn5WeyL8Qcx5+1g8T
         9f872qU2PLofzXy9DUTawLWrew/J7qTtkZTiRDYSaXvhieK4GNA58JQuLyrVGsoZfrN3
         yARyCoQqcCMVcFeWbC7kCcoWTdc7VsnaJYVp57FQSbfWTL5qUgWpqetSd7kJsmpq3Tl1
         O/dQqLtq1BJZu6cjPVEFpNbG0wN7JiEh/rq+O3muezrENYoo4tjwNy84IQgCoWkCY3mA
         3nIGirFmE95me64ZAnC4fcEnl9s6YyR2ypK6aQPvSH8C1tLyRsTKX6KU2vjoW94K3Hwb
         N/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=10MZ+wZvlSGpLMLJeIkgsqILP3ii9lT0DDHtw+L14VY=;
        b=ft4moxNc3nqhZaXFZU27B7f3cMPuMJARZofoTuAu648/T3genp9reTBBvAKEKjyB7P
         IvSQluX8IKysGs/7r5IsYGN83LKNWivopJ+Ce1oBucuBbupbpFxJa7Xvui2S5UnADqpd
         pmak/OBbtkZWvVTgsInV59I6ssAq8oWcxJMwOGyuFwzMEm2Hr42Z7BXdYz90DlBE4YKw
         uR1agkpDv+nW6mrTf5vBF/1Bzu1IXwUKQ9YtedJNk4c9bHNiyXBs787KIYS6Y67BII8g
         0FxSvFE8LMVwut8U53oJjeU7PujczGCwHxKgwgsFFfl2nv80vAuj0l9/p9iaCQXABFuS
         p7qw==
X-Gm-Message-State: AOAM533bltQgJY823R29XIwJ50BHPinw+DjtLXhwivPh9q7B8j0a/yur
        ftdy5pzGvQa2tfkgZWCp77bhMdS5sxLpzQ==
X-Google-Smtp-Source: ABdhPJznDhgMre1h2yMv5CA2MkQwbd2x1oCcy4YKpIiOFgYsBiNKv6yfhzZXlH8PLSlsOD0bvbtTBA==
X-Received: by 2002:a5d:4c88:: with SMTP id z8mr51052257wrs.218.1600681562851;
        Mon, 21 Sep 2020 02:46:02 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
        by smtp.gmail.com with ESMTPSA id t202sm19475945wmt.14.2020.09.21.02.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2020 02:46:02 -0700 (PDT)
Subject: Re: [PATCH v2 03/15] arm64: dts: mediatek: fix tca6416 reset GPIOs in
 pumpkin
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-4-krzk@kernel.org>
From:   Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <911e34dc-3516-d15d-89d6-1e234e9309f6@gmail.com>
Date:   Mon, 21 Sep 2020 11:46:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200910175733.11046-4-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 10/09/2020 19:57, Krzysztof Kozlowski wrote:
> Correct the property for reset GPIOs of tca6416 GPIO expander.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to v5.9-next/dts64

Thanks!

> ---
>   arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> index dfceffe6950a..29d8cf6df46b 100644
> --- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> @@ -56,7 +56,7 @@
>   	tca6416: gpio@20 {
>   		compatible = "ti,tca6416";
>   		reg = <0x20>;
> -		rst-gpio = <&pio 65 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&pio 65 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&tca6416_pins>;
>   
> 
