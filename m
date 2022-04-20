Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B03350848D
	for <lists+linux-omap@lfdr.de>; Wed, 20 Apr 2022 11:10:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377075AbiDTJN3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 20 Apr 2022 05:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377066AbiDTJN1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 20 Apr 2022 05:13:27 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B116E33897
        for <linux-omap@vger.kernel.org>; Wed, 20 Apr 2022 02:10:30 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id y20so2157114eju.7
        for <linux-omap@vger.kernel.org>; Wed, 20 Apr 2022 02:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vqwgJl4DHA8sy3uwY+be9zZfUwVmhmBPi3bc5ivst+Y=;
        b=erEAmUkQMejCiiq83EQDsRS3hcBVjdVlgCrZxPxNltmwVPZoBbmZO9QaKtXVwd0t3o
         xx0j8aAcn/u7+Zd6C9gaNpmZaT/ZgCwZgdK6+EjaEHsBsH8i27BUDwk4rIHEJs+NBYO1
         5WhHO1MyiPkL7phRWoBovzGlWMfpOttU0radh/t3Nq4AfjZ+ChDrrk1wG4SiqGMj0Tr0
         z6A9P0ixKh9l9Fq6wgAj65wG7yxhFpZm6NqvLfef3/RsVebHwfxzenJoOVP5mXEKXkR0
         fTCLXiZAPuUy5yIiOsHVrkugux5OExeYhp39YKi3wGFoW7xHC2pbgxEtkZmyUhHgOhNx
         X5IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vqwgJl4DHA8sy3uwY+be9zZfUwVmhmBPi3bc5ivst+Y=;
        b=drK97UewCViiZZkMHpzsKJAMEj12mUfyatE1fGUEk2sK7I30NsVXfab9h2zZeF397q
         1WlzOLG3O4nBbw2g1eUkUd04EjUTMRBf+xmb2cLjyt1fjMZBZcTeiZlJxvvXyFbDFsed
         aKWMGzvIMTciQi0ThbxbPyAtcSozSlpnZgpPEvUlSjBAtagxbH3EHCfQj1RSFyQWEXP1
         fwURyj2rKd3p/DwZElixgC2kFwpUH1AFIy+WryAqyhe0Tr6hPWYdHXZrJ/LTrlvtO/X7
         o226lk0Tl0d9/rdZ57iRfwFgrY3zTJUdxWA0R5MxzFGzzoJ1aeAQU15N6uuV8NvqeQJu
         mZpw==
X-Gm-Message-State: AOAM530mIZax42xUV9qWntW9e2+BBBvkYpdh9Ws57xdAv2292wP4XD2y
        nTKICbpFu1Haolt0F7OcJ14tQg==
X-Google-Smtp-Source: ABdhPJwYmyBu+5SWkcY92aZxepK/sflAwJJujD1Gdtr/89i6zERXHavdnB7F9F8SToGR7mL0cADTyA==
X-Received: by 2002:a17:906:fc05:b0:6e8:89e7:52e7 with SMTP id ov5-20020a170906fc0500b006e889e752e7mr17112386ejb.360.1650445829195;
        Wed, 20 Apr 2022 02:10:29 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id r3-20020aa7d583000000b00420a8b66566sm9727057edq.97.2022.04.20.02.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 02:10:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] ARM: dts: omap: align SPI NOR node name with dtschema
Date:   Wed, 20 Apr 2022 11:10:17 +0200
Message-Id: <165044570802.75184.5076185924334450922.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220407143304.295610-1-krzysztof.kozlowski@linaro.org>
References: <20220407143304.295610-1-krzysztof.kozlowski@linaro.org>
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

On Thu, 7 Apr 2022 16:33:04 +0200, Krzysztof Kozlowski wrote:
> The node names should be generic and SPI NOR dtschema expects "flash".
> 
> 

Looks like no one wants to take this, so let me take care of it.

Applied, thanks!

[1/1] ARM: dts: omap: align SPI NOR node name with dtschema
      commit: 4a229458a98f973b50b7f36d44ed5c2d4c77e0c4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
