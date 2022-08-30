Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B6585A6BA3
	for <lists+linux-omap@lfdr.de>; Tue, 30 Aug 2022 20:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232039AbiH3SCs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 30 Aug 2022 14:02:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231495AbiH3SC0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 30 Aug 2022 14:02:26 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B629D3452
        for <linux-omap@vger.kernel.org>; Tue, 30 Aug 2022 11:01:59 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id q16so12197885ljp.8
        for <linux-omap@vger.kernel.org>; Tue, 30 Aug 2022 11:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=al+Xtg+cfhLeP0/zAYTi1riRGZYXian07ih5lmqeHsI=;
        b=Pm5Qif4vSyD2VTwBU1s73gBXVtU0WTNoG4UCg6TSCXxTcsJNnpK75qIlpbi8TFKx4M
         1lbjnpAkwuK0/a2vRI214LWtY66+U+LUsfLCNSb3wZcdZfbpY0YCxrWQTnzcw2DpBl/R
         yFRgMzV6ItMEl8iG+J2hu3T3nqm5yuOKaUg80VlfrB85b8y9eqqWjSnhILSKLi8Wq/6T
         Q8U9PZg22vQ9OPgzmDZk2QGta51kInCdXEcBWJ19c67Y3nIWdVgdLcHzkQENxSIq+5XX
         +2IgoSvkL6/gljpJJCrOFK1pHv7AJLVSDqRQS+tY5FXGU/Y/MHaLAADvj2tv+72HDTDT
         +b5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=al+Xtg+cfhLeP0/zAYTi1riRGZYXian07ih5lmqeHsI=;
        b=HMHYDv2C332tOfwRMyMEXbjPhZpreGLo7YqJA6naqvaqmLbNO5JLCa9T2hyv6BPTXT
         18u/G2fWlLpLHW1URyvW+EGb0cwY2dSxIyYVmgOT093s9b2KTK4oH9etP1qDkcyWnjb3
         nUjkuxwCBNS5qGUE+gT2BF3B1spwJtr2zxNtlW5IhYQdzArKiaJpG7/RXbJdC9ZOo1fI
         aLkxBf7PtQaafBfaMgkx2j4D11788WS2d9sQFM00XQkzYQZgQylLIy4bpiL4UWgoPh7Q
         lihiRmNrT1lPDuwWge4TS2kKoDGTmpnZ18UmCyNBp71BQH7hiXYN/jVxX4mXE2aFrfUr
         NbFA==
X-Gm-Message-State: ACgBeo0E8v331RBIIvXBjAyNNyPi7qC3CVaBDLFxxBtU+jYgCXOsmWu1
        WmJP9IIsyAh1PiGicQZcRXloKA==
X-Google-Smtp-Source: AA6agR522yCw3HpoWy/h+YuQykZosQn1end89kl6tikcdKJnEc62U93C9wFOvKLx/YuNPGBUHOdRAA==
X-Received: by 2002:a2e:1613:0:b0:267:8c60:148f with SMTP id w19-20020a2e1613000000b002678c60148fmr1136172ljd.262.1661882517049;
        Tue, 30 Aug 2022 11:01:57 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id n25-20020a05651203f900b0048abf3a550asm1676499lfq.224.2022.08.30.11.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 11:01:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-kernel@vger.kernel.org, tony@atomide.com,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        linux-omap@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, bcousson@baylibre.com
Subject: Re: [PATCH] ARM: dts: am335x: drop panel endpoint unit address
Date:   Tue, 30 Aug 2022 21:01:53 +0300
Message-Id: <166188251000.15253.8711282037817342680.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810130212.400371-1-krzysztof.kozlowski@linaro.org>
References: <20220810130212.400371-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 10 Aug 2022 16:02:12 +0300, Krzysztof Kozlowski wrote:
> The endpoint in panel port node should not have unit address:
> 
>   am335x-evmsk.dtb: panel: port:endpoint@0: 'reg' is a required property
> 
> 

Applied, thanks!

[1/1] ARM: dts: am335x: drop panel endpoint unit address
      https://git.kernel.org/krzk/linux-dt/c/007cf8d4cbbbf467c9d4ef318fc32a592af32a83

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
