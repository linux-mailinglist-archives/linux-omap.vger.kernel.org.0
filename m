Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B240A55D05F
	for <lists+linux-omap@lfdr.de>; Tue, 28 Jun 2022 15:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233837AbiF0JQk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jun 2022 05:16:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232911AbiF0JQ3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 27 Jun 2022 05:16:29 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89B8462D7
        for <linux-omap@vger.kernel.org>; Mon, 27 Jun 2022 02:16:24 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id mf9so17890361ejb.0
        for <linux-omap@vger.kernel.org>; Mon, 27 Jun 2022 02:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Rnil2oBzzmAFKWBgW3OsY0Ty5YXVLJtmCPclQHX6IXQ=;
        b=TE7r9joV5RkyWpMmMS6xGUUY+/AIhhVDmlSDRCS0E7mjodoWoHqic05qpqyEeyLM+X
         jh1m+XLvm3A72UIuK/NEwjibtjlqE7BBYkowIgJVXFpazvQpP54F/mEwVR2etxDHGlTx
         PjSTKR12Ts6ix5CcDIJQ0juOK0r8O/lWN1QZKVP/woBipS+A4ki2W4Gjeh1D0VdiSfon
         hGOZUaJfFuIRiCqHeEOVdoeCMmygemV3E2QOdkCe81VP3Sd+NrdMPcU1ooNfNda6pYGQ
         nlWVXHHOkvbNipBgfpF2Ayxm2/PlYpKf1heVLRaDLEKoCSMkDos9yDNelj1WhgEo1QC9
         f1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rnil2oBzzmAFKWBgW3OsY0Ty5YXVLJtmCPclQHX6IXQ=;
        b=TSoZT8hhyy6+VBpqhze1VC8GEf/n5DgP4B3a44ppZ55ajMKQUtEYOHenaUIsDDOSND
         p9liJpiPaJA0E3KJZ2gESbhg2XpcTM6mV9mPrmI20fWip37623PSMwswM28GVBQN5Wj+
         jCi5Y6/1Hm1AYy8KKpObaxNQ4/+gof6dbMvYcmhUnGmkfORWwifXiGJAJOo8y+0NyhiQ
         CKznAaGmGbrr3+GmJw0k5YMiWaOBwUdh+R7gq0Ad+jBDWVuIhqg45UccABqC2pju7VdU
         WY7PSt8d3mjFjEV2Zx+tMFLMioMWeUaKU9F+yG1oo48FhsCxhGiu/rxQFNlqtAgl/YXO
         UIwQ==
X-Gm-Message-State: AJIora8nzbHx3ctHaJ7V9J3r1Pkph5115c7Dpnqj2b/eQLjxh05Kczgd
        xf1NOQI0dMiWd/0vTJcwhnBBNA==
X-Google-Smtp-Source: AGRyM1tfOeBrWnaw9bfY3+V0kTOjbpcSVPI4ND5W7FXSp+uKpA6xkrM3pRHzTpoLX2bem0NYQx+XXg==
X-Received: by 2002:a17:907:7678:b0:726:9fca:8106 with SMTP id kk24-20020a170907767800b007269fca8106mr5074882ejc.640.1656321384139;
        Mon, 27 Jun 2022 02:16:24 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gy10-20020a170906f24a00b006f3ef214e2csm4805395ejb.146.2022.06.27.02.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 02:16:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     soc@kernel.org, tony@atomide.com, linux-omap@vger.kernel.org,
        bcousson@baylibre.com, linux-kernel@vger.kernel.org,
        krzysztof.kozlowski@linaro.org, Arnd Bergmann <arnd@arndb.de>,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        arm@kernel.org, robh+dt@kernel.org, olof@lixom.net
Subject: Re: (subset) [PATCH v3 33/40] ARM: dts: omap: correct gpio-keys properties
Date:   Mon, 27 Jun 2022 11:15:57 +0200
Message-Id: <165632135505.81841.17668467275601346778.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-33-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-33-krzysztof.kozlowski@linaro.org>
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

On Wed, 15 Jun 2022 17:53:26 -0700, Krzysztof Kozlowski wrote:
> gpio-keys children do not use unit addresses.
> 
> 

Applied, thanks!

[33/40] ARM: dts: omap: correct gpio-keys properties
        https://git.kernel.org/krzk/linux/c/54ab5f367142577b8280f5b03eeb36616980cd68

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
