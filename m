Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CDFC5BC992
	for <lists+linux-omap@lfdr.de>; Mon, 19 Sep 2022 12:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbiISK01 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Sep 2022 06:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231949AbiISKYY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Sep 2022 06:24:24 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8672D27FFB
        for <linux-omap@vger.kernel.org>; Mon, 19 Sep 2022 03:19:17 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id j16so19105324lfg.1
        for <linux-omap@vger.kernel.org>; Mon, 19 Sep 2022 03:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=I3nq9SH0Z4BapU3+D3M4JLuO2Hr9R3TgojeyAFc62IA=;
        b=Zw/AFzXZHwhQz6Um1qmS6KWUUbRquXfeB2T3RZwuGZNOOwVigUCyHfyVrhE4cC88Gx
         19Flmp1b9gMuSkITrvY21DDqScm66vAAgv9OJTbM+iPvSJVSIRYVAX/hm7rFt8vbCigw
         ZdyhsxRHoKfG46krJWCJ+TKKOWPp6rZAsHkfRIEgj4Xyja3BL0vw/t4yR92j/EJzJaoG
         bA9hPQGGbgGUqfVE0axDeufip+yKQCRuVZVqrpNZ3EVtLF3Tz2aUrrhFYAJFWDNb/QvJ
         PHbAFy/4XWn65ZKIpnAbJkVeXCcmWReEnCU7HHA0+kblIr7jtIZhiRZgeCgryBveeDxC
         BYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=I3nq9SH0Z4BapU3+D3M4JLuO2Hr9R3TgojeyAFc62IA=;
        b=PkegVlo1RjlPeJ+UVpsvF8+YovYl6S/rRaWlGubk9wAYnz8E6bxWnop2ly+VW+Vk20
         Vb6xGwo/twucFccI4ZUZVE0ZnadCNn1jRuER12oTLefgppDEyLT1/vDezB6TpHMlYXiR
         RsEkHiLhxUSWH85FAyrGjJlCyUpQBy9zNkoUJv5MED9X5K+cVdDgz2ZF/Y5oJCC+xWQ0
         C5Vi15lINDxhd+dQ1Qc+U1CnERAY++kMpwyS7gCJVLqPq37/393AagTJyQktS/th8Qif
         R3fqm8az58eiFzGt+sr9OjDLcvfHTEYV0ebzX/iL8xQC5UuaREPM614nssfY+nPkPiul
         BU1A==
X-Gm-Message-State: ACrzQf3rAGhRkKip8el1BkQQutcIOhRbS1pXSMbs5nCPGPnk4pubBHxk
        56KMV91GkGRZE+JOO63fsrv4tg==
X-Google-Smtp-Source: AMsMyM6S98Z9ei/Hod1Vl3jXv9h8+wy5sGwfGmnMpWB3RM4n34+G0Wf8fQtLVeFSt54ZzyBus6Q7Nw==
X-Received: by 2002:a05:6512:3f8b:b0:492:d1ed:5587 with SMTP id x11-20020a0565123f8b00b00492d1ed5587mr6409490lfa.355.1663582755278;
        Mon, 19 Sep 2022 03:19:15 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u13-20020a05651220cd00b0048b365176d9sm5115936lfr.286.2022.09.19.03.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 03:19:14 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linus.walleij@linaro.org, cuigaosheng1@huawei.com,
        rostedt@goodmis.org, paul@pwsan.com, stefan@agner.ch,
        alim.akhtar@samsung.com, tony@atomide.com, mingo@redhat.com,
        Sebastian Reichel <sre@kernel.org>, rmk+kernel@armlinux.org.uk,
        linux@armlinux.org.uk, broonie@kernel.org, bcousson@baylibre.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: (subset) [PATCH 2/3] ARM: s3c: remove orphan declarations from arch/arm/mach-s3c/devs.h
Date:   Mon, 19 Sep 2022 12:19:12 +0200
Message-Id: <166358274950.27930.12152110869781483914.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914034615.1240860-3-cuigaosheng1@huawei.com>
References: <20220914034615.1240860-1-cuigaosheng1@huawei.com> <20220914034615.1240860-3-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 14 Sep 2022 11:46:14 +0800, Gaosheng Cui wrote:
> s3c64xx_device_spi1 and s3c64xx_device_spi2 were removed by
> commit f1ba938e4f98 ("spi: s3c64xx: Delete unused boardfile
> helpers"), so remove the declaration, too.
> 
> 

Applied, thanks!

[2/3] ARM: s3c: remove orphan declarations from arch/arm/mach-s3c/devs.h
      https://git.kernel.org/krzk/linux/c/45c2bd1f61875fcda24937da9b0ff0d0ff8139ff

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
