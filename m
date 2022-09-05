Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E00B5AD14E
	for <lists+linux-omap@lfdr.de>; Mon,  5 Sep 2022 13:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236826AbiIELN3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Sep 2022 07:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236801AbiIELN2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Sep 2022 07:13:28 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD25D5AA0B
        for <linux-omap@vger.kernel.org>; Mon,  5 Sep 2022 04:13:26 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id c11so6654192wrp.11
        for <linux-omap@vger.kernel.org>; Mon, 05 Sep 2022 04:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=LV8awVGBrBoFFTStY/bfqmF59okNhYDKAb2JnNbcqRk=;
        b=iozAkvCrxOiFDkYqlTXwHoisAM5wnOJptzMaV5reA35Qg1xNX2ZX08uMI+WXTjcUm3
         U3StGjLs4i2S+mbXjiq1XDe4zekN3St4gMXBFXqrkrlxaLIBEubrgtlVOnWttz8P8OR0
         nizRHwqUvV+w796vx1IoeRO2wCsvJH8ocjIzh6OfsdU4r0ug0LArZoIVigFLDm1h1jZA
         P91vcKICEgPsOUsnJoDhBPu48oRHWMcCFjDDg+BLfVEAIZh9Y1vWb1ZXMuJ7d/Sy97Ac
         ZwFp6mJSB8zz13QvnhkfC++eVG+4xdZhvd0OQ4Lu16Ec+xsg90jCPHLLWnS9xasAUw04
         uIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=LV8awVGBrBoFFTStY/bfqmF59okNhYDKAb2JnNbcqRk=;
        b=Dm6JFI1gKxxXVE4SuALKFgpTbnGPSXliq0m/Lkp1m4gmm03B9eRiZmTdcqncTdLybn
         kP7bjSQ/Op7LIIVNfV8VeJ7Zj+zTCY/PS/qwHrFlE0C8RxSBvSsoGR/RJ4MNJxmIvru0
         wPCC+v3HOSTtphIqXXyHEo6d3dxF3GmylQhBsKSf24OQ1Wiy3B4eoBS/XPeGT/G/tBij
         WgyaQVlcYBpGOPruucdSiBB7TEyI2jO19v6yxNug4EiKVaFIUBHYGqaNCO990jUiVdTH
         5BzEgM01kwKMt/kRC06JvBrhwQI1aTNbhSRyYQoSqW3SE3U7DzbC/82qF9sNftWVFBrP
         9P7Q==
X-Gm-Message-State: ACgBeo1pDBKtKMh5huII9iCEWM15+CpHOcBAWJCBns7iqCrFcuxFMVcr
        4bTxE5uDGBsuRCD8/coAwacgw4uQcTmXHQ==
X-Google-Smtp-Source: AA6agR5lRPQZCfeVqRup/VzIC5xXBBPNumSHmBt/WI44+ukJhyH4aJNRU88M+dZKgRIgThOSdqHBXw==
X-Received: by 2002:a5d:65c9:0:b0:228:8044:2fe4 with SMTP id e9-20020a5d65c9000000b0022880442fe4mr2870090wrw.457.1662376404837;
        Mon, 05 Sep 2022 04:13:24 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id n34-20020a05600c3ba200b003a601707174sm10706298wms.33.2022.09.05.04.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 04:13:24 -0700 (PDT)
Date:   Mon, 5 Sep 2022 12:13:22 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-kernel@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Cory Maccarrone <darkstar6262@gmail.com>,
        linux-omap@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH] mfd/omap1: htc-i2cpld: Convert to a pure GPIO driver
Message-ID: <YxXZ0u7nKd+j7Bys@google.com>
References: <20220831085301.490906-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220831085301.490906-1-linus.walleij@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 31 Aug 2022, Linus Walleij wrote:

> Instead of passing GPIO numbers pertaining to ourselves through
> platform data, just request GPIO descriptors from our own GPIO
> chips and use them, and cut down on the unnecessary complexity.
> 
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Cory Maccarrone <darkstar6262@gmail.com>
> Cc: linux-omap@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> If one of the OMAP1 people can provide an ACK then it's best
> if Lee takes this into the MFD tree.

If you haven't already, could you please resend this to my kernel.org
account, as-per MAINTAINERS?  Thanks Linus.

> ---
>  arch/arm/mach-omap1/board-htcherald.c |  9 ----
>  drivers/mfd/htc-i2cpld.c              | 59 ++++++++++++---------------
>  include/linux/htcpld.h                |  2 -
>  3 files changed, 26 insertions(+), 44 deletions(-)

-- 
DEPRECATED: Please use lee@kernel.org
