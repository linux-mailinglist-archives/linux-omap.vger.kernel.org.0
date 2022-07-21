Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 962BC57D013
	for <lists+linux-omap@lfdr.de>; Thu, 21 Jul 2022 17:44:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231894AbiGUPnz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Jul 2022 11:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231906AbiGUPnc (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Jul 2022 11:43:32 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A81488F1A
        for <linux-omap@vger.kernel.org>; Thu, 21 Jul 2022 08:39:36 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id w2so2284020ljj.7
        for <linux-omap@vger.kernel.org>; Thu, 21 Jul 2022 08:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=oqVQwNQbcwLQWg6kfm6rj9WKvgY4OIEgQOzUXlpBlmg=;
        b=bUbA0eHhlHZLz/7ERfxE+ujHsrXIi/1BLF0UUgCTGD2Op4a9uPqxE8PfjDUnh0vkrM
         NoiNYlMDhoMOEIMth1a4LodxokvPtNEiBNqvhrTtMsiqk5AvOOTWVvtkX0vcdar+TZ9P
         cuHmDRDRj/iCTgpFnlWFwejofmUcNLUdW+0FeB/h2HYA1p1jGTJseRZ/c1Dk0fKehi12
         XzY95w37ZgrMXEVRmU96gkg5e/DspC1gFPZ/ekbdgflGdDWjEXquopvsQwGp1I4qEgn7
         d7QKdgpNbpN8vahcEQWCFuFNkozJDOmGqU5v/udTFpQ1oOJ+f117PzP28vOHlt71WwUc
         35AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=oqVQwNQbcwLQWg6kfm6rj9WKvgY4OIEgQOzUXlpBlmg=;
        b=qC6rfss4xtFf2l9rilNWsocTkRlUfmJuvCCBE78bvL0pv7NRdPVhqy2p2YmNKjF82E
         wwAwf+COogZw83+B5op120J+8oGtlKSqf5fkQQra28gEvkLbxWA4hM/fX38rfq0m0TKR
         ZiYijumUpAzszLVukukkGGcp8JlL7ziLDz7N36jn9gQHmwHmvBO4itF0HiIOssSCPY+3
         fTXd2+7H+80F2epA9rgDHINEtERVwwnHTMI/Ad0LBaDOnctfvWOpwUsEz0o0IBytAbGW
         DIDwRXPcCkbA/ihJoBbqTGKC7lTCz2TEMRN9tKv3gTZvPuQkC8MRpFugyxNrMIBPIk4h
         XxyA==
X-Gm-Message-State: AJIora/cjQAniejQ/V9UiafJOhVjRyRytbhLl+4zIv0iECDJz3SBGvSO
        uwuwgHknBgZXg1dFKYEXfrk9+Q==
X-Google-Smtp-Source: AGRyM1u1EiuENGOYTFtFOFvt+gosoK/tppAX7Zpo5TZqB7ckZKOx3LwixuugOACtM48KFq3goni/DQ==
X-Received: by 2002:a2e:953:0:b0:25d:5c20:2265 with SMTP id 80-20020a2e0953000000b0025d5c202265mr18734344ljj.348.1658417974213;
        Thu, 21 Jul 2022 08:39:34 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id o23-20020a05651205d700b0048a35b93b24sm504903lfo.181.2022.07.21.08.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 08:39:33 -0700 (PDT)
Message-ID: <e3b0a57b-e987-9be0-75e5-40c0d7e41310@linaro.org>
Date:   Thu, 21 Jul 2022 17:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/6] ARM: defconfig: remove stale CONFIG_ZBOOT_ROM entries
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Alexander Shiyan <shc_work@mail.ru>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        Takao Orito <orito.takao@socionext.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-rpi-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-oxnas@groups.io, linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-sh@vger.kernel.org
References: <20220721141325.2413920-1-arnd@kernel.org>
 <20220721141325.2413920-4-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721141325.2413920-4-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21/07/2022 16:13, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The default is always 0x0 after commit 39c3e304567a ("ARM: 8984/1:
> Kconfig: set default ZBOOT_ROM_TEXT/BSS value to 0x0"), so any
> defconfig file that has these two lines can now drop them to reduce
> the diff against the 'make savedefconfig' version.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
