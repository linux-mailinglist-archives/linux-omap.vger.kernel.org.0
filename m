Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECE363F5E2
	for <lists+linux-omap@lfdr.de>; Thu,  1 Dec 2022 18:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbiLARGr (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 1 Dec 2022 12:06:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbiLARGq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 1 Dec 2022 12:06:46 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2AEA282E
        for <linux-omap@vger.kernel.org>; Thu,  1 Dec 2022 09:06:45 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id a19so2647387ljk.0
        for <linux-omap@vger.kernel.org>; Thu, 01 Dec 2022 09:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tNqK8ABpJ20Ut6IZq8bTpq8cjfjNpkSTKrUTQ4ZO9wQ=;
        b=m0BFEI7fG4NoNWMPezAmxX10Nj7BG+3CEcAUBUnOrIoKGpD2NWTkwBe2nfRHEIgwYn
         qBe7h7sjp5XiM6GPNTpvWhuGZ8ObcXReSZwZgMlv2hCE6yI1axc3/4k/sb5SKNwVLFcO
         qE29WsVQtlkZ771Bkj/xedg6oRWy8oocJFQHFt3ekokKkuJ1+kzQiOs1+vaurbPh8Nkn
         6dJV3AawIyj+petGRRH+2rdYuZHklTRT61lkfS7nvLM7uc89Dsa650qhvPANaooD7GqS
         QXtXyDMujIcs8SAT+PfGQr3Cvq6m7I3RMPqRwSBrSK+Z6SFHZQVnvKibrOsmiMXzHXf9
         DIwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNqK8ABpJ20Ut6IZq8bTpq8cjfjNpkSTKrUTQ4ZO9wQ=;
        b=2OkcnVNR+1hvP3i5OReuVWeVGe0EhjlN+1QDJEjs43YPmQe8AK9Slvw7boCwFTi0sL
         p1poJjCd6GywGhiLhZPLOIOZB71mB8/Ov1Vs6H0YI9o3MzNio4r+ewbvjTzCKo7xXffD
         pXdZEAqC6zObhHY1moGBzyXAG75/Qo3di2WSD4pDfmFP/ufE3pt7hBKzjTEvfqMO1uEG
         l846a0Jiaxa5RZrxAiUvyVRfTTwqB1b//kUNRzEkcdGc0dWs/BgaPDtLKOg2wojYh+DY
         LwIpJ3H0PMHKgC8LGRGe9hXDnkEbVhWk/pJUbBHYjyFIm8bvF50hqIVneKvvH/Wi3Rne
         Mm+A==
X-Gm-Message-State: ANoB5pni+OvHGK7bJylVxr/Z3pcTMjovD2B6qx7GjrkvLcCsoSInAHUY
        YU6/+HWpYWdMLuy87w6D0qQvIA==
X-Google-Smtp-Source: AA0mqf5qBK59tKVGV7MlW4lUfH/wxFPRF4fellB1UL3lq0f4Vzr/JveS9J2ScMIYZCRHPV8jkadBxg==
X-Received: by 2002:a2e:8e38:0:b0:26d:e863:2f6d with SMTP id r24-20020a2e8e38000000b0026de8632f6dmr23252733ljk.519.1669914404100;
        Thu, 01 Dec 2022 09:06:44 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q9-20020ac25fc9000000b004b40f5e7336sm703659lfg.199.2022.12.01.09.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 09:06:43 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Tony Lindgren <tony@atomide.com>, devicetree@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH] ARM: dts: am335x: align LED node names with dtschema
Date:   Thu,  1 Dec 2022 18:06:38 +0100
Message-Id: <166991439955.130674.2720283801810821539.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125144118.476905-1-krzysztof.kozlowski@linaro.org>
References: <20221125144118.476905-1-krzysztof.kozlowski@linaro.org>
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

On Fri, 25 Nov 2022 15:41:18 +0100, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern:
> 
>   am335x-baltos-ir2110.dtb: leds: 'app', 'power', 'wlan' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
> 
> 

Applied, thanks!

[1/1] ARM: dts: am335x: align LED node names with dtschema
      https://git.kernel.org/krzk/linux-dt/c/37dddd7f7621bd5e0234fb3b8288248f165833b4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
