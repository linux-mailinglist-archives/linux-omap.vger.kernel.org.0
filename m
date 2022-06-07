Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAFED53E875
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jun 2022 19:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbiFFJUx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Jun 2022 05:20:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232742AbiFFJUw (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Jun 2022 05:20:52 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E44637A8F
        for <linux-omap@vger.kernel.org>; Mon,  6 Jun 2022 02:20:52 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id x62so17929746ede.10
        for <linux-omap@vger.kernel.org>; Mon, 06 Jun 2022 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2ygy0ohsgpqOtqIQJI1qY1Pg6A9QE5cMMHyTdZXGpec=;
        b=F9LSurUUBP0BXIXx5iXc4mMab/0uLizA+yQC2Lh+NCnxTfvF7Od/L/d96UvPdf2jfu
         efjIXzPM5B49lYgoAeEavNzFIShif/PdVcpbiD0aw+kws9rFvzu5C51RILfmQ5iZ2rEE
         AtDp05OuZwdSDx/V31SCyJrPSvoMvdIcHchuFNaV6QPN4ZxSjwvVaWZMKtWrNTRvGB0z
         wkDMCK4SB0rNsqLPfNmGf4rgAkX2zjOby4TOvkGjlpQW+J1zEs1bH3c7Coy7EcFeEpQj
         A2ldPt5bqEsKl6rc/29InoLOVKhoWt4GQjB6qQuvyqDMcoLH7EqOYPZxJ0CiuXEhCiSs
         pzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2ygy0ohsgpqOtqIQJI1qY1Pg6A9QE5cMMHyTdZXGpec=;
        b=ZX3xPNl88JKyFam0xVdda6rgcAxnta40E0QfQJ277bW9XEvrrsXHAZnzLZ8kFT0LgJ
         +h4VSlZwah78Z+Ylbo8pZQxqvpRbJkVyt5C5/xNzM1kkyRZAXeGa3h7DzwTDASjnVJBw
         j+2KLdnQNo3MY57nT7rFl1eDiyyCgNOzXXd43Kr/ggofM8rIKOqwrz5PGq2XKxV/Uru6
         ZLRaWSDf9DpDII4TMqaL5ZHeH50ku+eYowBlDHa2hc/I4zHb77CFSmwVmKxLD4hUQB+U
         MvB5XFSQ48B6Ha78N5bLgQV29qAmztWZpCHA3C05nZe1LlEBgo76pDChdFf/9JJyc2tk
         QFfw==
X-Gm-Message-State: AOAM532j/B4/pj+qJy1+Gr4dxxw9liAeR47YL428gsdUO2HMRJ3BmDGc
        OEas1i2veGAFWOZXqTwtrBnThg==
X-Google-Smtp-Source: ABdhPJwMyFu2o6QGq+uB8uaPAk00BegSXAaRNNPnRmLepg7YuMAs38EsoGEgkjK2u1MjnQwv1Nseig==
X-Received: by 2002:a05:6402:280b:b0:42d:d562:9b0e with SMTP id h11-20020a056402280b00b0042dd5629b0emr25574459ede.176.1654507250653;
        Mon, 06 Jun 2022 02:20:50 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b6-20020a17090636c600b006feb6dee4absm6067412ejc.137.2022.06.06.02.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 02:20:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Tony Lindgren <tony@atomide.com>,
        Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] memory: OMAP_GPMC should depend on ARCH_OMAP2PLUS || ARCH_KEYSTONE || ARCH_K3
Date:   Mon,  6 Jun 2022 11:20:45 +0200
Message-Id: <165450724182.62574.5739244833635102042.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f6780f572f882ed6ab5934321942cf2b412bf8d1.1652174849.git.geert+renesas@glider.be>
References: <f6780f572f882ed6ab5934321942cf2b412bf8d1.1652174849.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, 10 May 2022 11:29:13 +0200, Geert Uytterhoeven wrote:
> The Texas Instruments OMAP General Purpose Memory Controller (GPMC) is
> only present on TI OMAP2/3/4/5, Keystone, AM33xx, AM43x, DRA7xx, TI81xx,
> and K3 SoCs.  Hence add a dependency on ARCH_OMAP2PLUS || ARCH_KEYSTONE
> || ARCH_K3, to prevent asking the user about this driver when
> configuring a kernel without OMAP2+, Keystone, or K3 SoC family support.
> 
> 
> [...]

Applied, thanks!

[1/1] memory: OMAP_GPMC should depend on ARCH_OMAP2PLUS || ARCH_KEYSTONE || ARCH_K3
      https://git.kernel.org/krzk/linux-mem-ctrl/c/67c7fc6cd915d809be4de2eed323aa5f2205c52f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
