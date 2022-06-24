Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F40C559D7B
	for <lists+linux-omap@lfdr.de>; Fri, 24 Jun 2022 17:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232137AbiFXPiC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 24 Jun 2022 11:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232382AbiFXPiA (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 24 Jun 2022 11:38:00 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56432A46B
        for <linux-omap@vger.kernel.org>; Fri, 24 Jun 2022 08:37:57 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id i67-20020a1c3b46000000b003a03567d5e9so1893007wma.1
        for <linux-omap@vger.kernel.org>; Fri, 24 Jun 2022 08:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IGWWvGYMbJMzHNjMbMwN/PgKeHvUTnFkfiEKD4OboOU=;
        b=dctimEgMCr/Ncq3rV7xZgljVKZJ5didIgUqFkPEb1mNuKIbZdvBp1rDgMlHMd6oelI
         lzQUNV4tQ2OOJh2BAYCh518YxoCPym36nK6FZlYHqxcF/eKourkKVXdiQZH8zYAxv6ln
         hrdk2e1h1GV4+mpJLrbIE9G6YBhsxCbo5RR7bQgeqFv4RdXfRJ7qKTAlsHdcspiVM/aI
         M3K44TCX8WYnKSKx2LxQZ9XddSWV4ljzAiYxIVH4jj1b6BrXH5oI2WSnm9QbEKsNhKa3
         4s+rVNxEc4ba5BgKv5qfHF9vp8MK5aUUxNKWHNLx/WRKwBEYh/tQY+ChHg4tr9OU8MjX
         Y0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IGWWvGYMbJMzHNjMbMwN/PgKeHvUTnFkfiEKD4OboOU=;
        b=kMujs9ejdbAODUgkjgwxet5iUnCaIi9i5zBtHUSBUafg9E0ORG9Eng4aNf/y6XCnHC
         pP/VUp5hFqE/d6ePSKentX5uh4S3Ji+qh+NzEZM+JI81t//Es4pYyoWww0fpIl2R+uDW
         DTWAk5boXyCaKCShGh0qgqWa5JFurKIsmmb6I8+TtRRqM88CLcqzPy0ZCS6BNu2bLdIg
         i3dEj2t9aM7HT/dUNZkFlhas4Oxj3h+uMbS+TaZRyrWhsC1GjIUQVqYT0cH3onapvbqj
         4FKBTh3IblyeWL+6a4rfsri+BrLvwUZi35Uvshyf8ZKKCMp0mCPMvHTu/3N3z5k/e3ZK
         aofA==
X-Gm-Message-State: AJIora9rVbw7ls4ZaaIw5IJ2TUrHVGIErPSV6+rdIAhxx0kqRf38A+oy
        8jXQINH+HU2NHhgqlQYYig2ILg==
X-Google-Smtp-Source: AGRyM1uxz26dArL1HDuhnHUPyQcp+dojHE88iHnjWFPwQfSmo5RIw/FZdyx3sebIjsfZagXwHsvh7A==
X-Received: by 2002:a05:600c:29d3:b0:397:4730:ee75 with SMTP id s19-20020a05600c29d300b003974730ee75mr4619787wmd.149.1656085075899;
        Fri, 24 Jun 2022 08:37:55 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bh7-20020a05600c3d0700b0039c948dbb61sm3135904wmb.26.2022.06.24.08.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 08:37:55 -0700 (PDT)
Message-ID: <8dc2a434-15bc-c602-0272-fdb6159fc0d1@linaro.org>
Date:   Fri, 24 Jun 2022 17:37:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] ARM: dts: am33xx: Fix MMCHS0 dma properties
Content-Language: en-US
To:     YuTong Chang <mtwget@gmail.com>, bcousson@baylibre.com
Cc:     tony@atomide.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220620124146.5330-1-mtwget@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220620124146.5330-1-mtwget@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 20/06/2022 14:41, YuTong Chang wrote:
> According to technical manual(table 11-24), the DMA of MMCHS0 should be
> direct mapped.
> 
> Signed-off-by: YuTong Chang <mtwget@gmail.com>
> ---
> v1 -> v2: Cleaned up coding style and addressed review comments

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
