Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF124D156B
	for <lists+linux-omap@lfdr.de>; Tue,  8 Mar 2022 12:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346115AbiCHLDm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Mar 2022 06:03:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346139AbiCHLDj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Mar 2022 06:03:39 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3EBAA1BC
        for <linux-omap@vger.kernel.org>; Tue,  8 Mar 2022 03:02:36 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CC7B73F7E7
        for <linux-omap@vger.kernel.org>; Tue,  8 Mar 2022 11:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646737354;
        bh=cmIEv3+2duqaZszEh7bUQ4/zmJnqkg7ujOQpTYxWoCc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=HDP3tZtGoJKE1Lg01zOlfkJLjhXyZmyDVXeEa+4KUuUPrPMZzJfK25ukoQiSIVgXp
         ngnECj1ugJHh7Q2JIn/RJcUOUs6VlOzpKchYXJoHqRFvCiPvyDDZamJ8MJ1PkZjo12
         nFX416U0LRGN9aYxllutJyfT3d6VqAPpbAj2v7kdf59d+5SiGz9TrA96IoLqAFu8t3
         xiFhJGvU/DpKJamn+EUUjebjUVOZmAAj7GBAeOylmbP7QeL913siP2MazSml9Kho7Q
         jJn3E8Ws3qqf/VLMb9yni2JKsw21i4AhdbbR0+Zo4tKCLZCOMYGrqhVcFbG+c01DIE
         QCvixLzx7iiRQ==
Received: by mail-ej1-f71.google.com with SMTP id m4-20020a170906160400b006be3f85906eso8505483ejd.23
        for <linux-omap@vger.kernel.org>; Tue, 08 Mar 2022 03:02:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cmIEv3+2duqaZszEh7bUQ4/zmJnqkg7ujOQpTYxWoCc=;
        b=7x08vNAwzoTvu4qC7gpWTeBFaMk3eDgH4pwtlxHNZCjs/3wd5Brgs1R1e61imCW5wp
         EMLtQOf6CS+8eBb5AlffWkjzJr9+YXobJGijz9hhJJpDxhX6rFGrtNA/H8E6tA0rCQvy
         u9OKhhWcCWAO+2WLNqmZC+mPykfhMMohR+y8CUKJwmZr57fvOus6/UDed/Wq22V++NPT
         en+mlEAqu0svrSpij8khtnqOG7v9GsGpiohyizHbbXn8CIFJYt5QiAkKwjuitE8zCJiN
         Vf3nVLhoJ+w37pCckMtTDATzbTkSq1tATk6jB7W9S1bhzYVgUDuV1ctrr1JLRRFPrekH
         NWHQ==
X-Gm-Message-State: AOAM531hRe5IHqQSvyTV/Yq1ReOHbkrD4CsSpNKF3Fan3wmtjKo19qSK
        RcLZzwURmRFpcmkR4kQxm6kpFfmnBOI5KxXeAfVrFKfsnOLpCRmK0eIdoQv8KsjZVbe678VwkoN
        cq29Q/Tzxmsu7hnRkQ/JFY7m7umPx0mnCjPAX+Yo=
X-Received: by 2002:a50:ee83:0:b0:416:63c:3dd2 with SMTP id f3-20020a50ee83000000b00416063c3dd2mr15418715edr.361.1646737351868;
        Tue, 08 Mar 2022 03:02:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3p9DGak2cIN3Oy9Pu0jBYckHw9+LyOxxPiom+Z6kSsNDhhsbDrANi6ehjTkjpzIfTQQ7yrA==
X-Received: by 2002:a50:ee83:0:b0:416:63c:3dd2 with SMTP id f3-20020a50ee83000000b00416063c3dd2mr15418664edr.361.1646737351463;
        Tue, 08 Mar 2022 03:02:31 -0800 (PST)
Received: from [192.168.0.143] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id fx3-20020a170906b74300b006daecedee44sm4069130ejb.220.2022.03.08.03.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 03:02:30 -0800 (PST)
Message-ID: <bbb7e8fa-757a-64c6-640e-c24bf3e56b82@canonical.com>
Date:   Tue, 8 Mar 2022 12:02:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 5/9] ARM: dts: exynos: fix ethernet node name for
 different odroid boards
Content-Language: en-US
To:     Oleksij Rempel <o.rempel@pengutronix.de>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        "David S. Miller" <davem@davemloft.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Ray Jui <rjui@broadcom.com>, Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Scott Branden <sbranden@broadcom.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     kernel@pengutronix.de, bcm-kernel-feedback-list@broadcom.com,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-tegra@vger.kernel.org
References: <20220216074927.3619425-1-o.rempel@pengutronix.de>
 <20220216074927.3619425-6-o.rempel@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220216074927.3619425-6-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 16/02/2022 08:49, Oleksij Rempel wrote:
> The node name of Ethernet controller should be "ethernet" instead of
> "usbether" as required by Ethernet controller devicetree schema:
>  Documentation/devicetree/bindings/net/ethernet-controller.yaml
> 
> This patch can potentially affect boot loaders patching against full
> node path instead of using device aliases.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  arch/arm/boot/dts/exynos4412-odroidu3.dts       | 2 +-
>  arch/arm/boot/dts/exynos4412-odroidx.dts        | 2 +-
>  arch/arm/boot/dts/exynos5410-odroidxu.dts       | 2 +-
>  arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts | 2 +-
>  arch/arm/boot/dts/exynos5422-odroidxu3.dts      | 2 +-
>  5 files changed, 5 insertions(+), 5 deletions(-)
> 

Hi Oleksij,

Both Exynos patches look good, unfortunately I forgot about them a week
ago when I was preparing late pull request and now it is too late for
this cycle. I will pick them up after the merge window. Sorry, for this.

Best regards,
Krzysztof
