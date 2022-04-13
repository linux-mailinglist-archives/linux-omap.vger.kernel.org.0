Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CACB04FF3FD
	for <lists+linux-omap@lfdr.de>; Wed, 13 Apr 2022 11:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233974AbiDMJpw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 13 Apr 2022 05:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233922AbiDMJpt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 13 Apr 2022 05:45:49 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D99B55BE8
        for <linux-omap@vger.kernel.org>; Wed, 13 Apr 2022 02:43:25 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id l7so2798038ejn.2
        for <linux-omap@vger.kernel.org>; Wed, 13 Apr 2022 02:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oylS87girUUrQx7MuINAwy2xTwGf80twzjJs9A96Tb8=;
        b=Ucug3Vg8Frp9jao+WYFxol+ccmzQexE/zZeVexOK9d/0vYW6O32X63hFa9pz4HsBw/
         JrInFB4kDRiW5bHl8XhI9LRqEw0We1WvkkELB4mUBgsv17dcvs3YGIph0cc8eGHb6EtP
         PM3QnljClVN6pMo3S8JFpBNBl7JDRyLQqv2/ozmlclxQUoivNF9+NFiogqr1dryJzs4b
         utW59fj+Q5UDCpLFNa6txl/LLUI5rbQeL3H1ai9jyMkN4spAzGGwFw0WIpqckuBN93GM
         0/xCOsjaXZ5xuoDAOnatoralZX9WeYEXXP+y1Ey6xHmDIrvV4UfzTVul8qZD3LmZNuC6
         7RRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oylS87girUUrQx7MuINAwy2xTwGf80twzjJs9A96Tb8=;
        b=i51Y6EwFWxJMCv/jlN/ZZNjgT+KUzafpCIQsWyDFrMlH/dhaqrYM9SvFCa41Xc9V/4
         erWpoX+YIg0zWXWWpxqoJbYth/G1QuTF3mHMn87cr5jTbc6Pry87py/4yL/tCqkLHR7e
         S+tYV2C4QjESOVcw18gsvE12B+peRhgFqC7SegZARKlYbgfvQFLnuKu/TpSU+IblR6X0
         nmgPSiCqYZaX+QOTtBRXEWGLS7KTMSyq2DQnnAyfa3BAKqwyA+QKegnZdwzsb6xK0mOp
         C+/3/5cKiuu6eKSG3ZLmBZoGJH5K79yan5E13LChyHqzn7r6PpGFtvW3wnLcDHQN1jBP
         ohGQ==
X-Gm-Message-State: AOAM531BmPokKC0y/zA6vbMtRkuApKiDni+RoD0DwmeqEIBgC9We2htb
        Gi2vdHifr1gwqHr2u55EtFIiOQ==
X-Google-Smtp-Source: ABdhPJwEZyDkRFJmcImmUC0dtcyBcJZKNC3ov+ZdOEUPgWlXoNONtGaBY0kO4A/ljR3ga9neZVmfnA==
X-Received: by 2002:a17:906:7304:b0:6da:9243:865 with SMTP id di4-20020a170906730400b006da92430865mr38080684ejc.665.1649843003746;
        Wed, 13 Apr 2022 02:43:23 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id i22-20020a1709063c5600b006e8a8a48baesm2155749ejg.99.2022.04.13.02.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 02:43:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Roger Quadros <rogerq@kernel.org>, krzk@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-omap@vger.kernel.org, nm@ti.com,
        linux-kernel@vger.kernel.org, kishon@ti.com, tony@atomide.com,
        miquel.raynal@bootlin.com, vigneshr@ti.com
Subject: Re: [PATCH v3 0/2] memory: omap-gpmc: Allow module build
Date:   Wed, 13 Apr 2022 11:43:20 +0200
Message-Id: <164984299612.34759.11981181842672620752.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220411095516.24754-1-rogerq@kernel.org>
References: <20220411095516.24754-1-rogerq@kernel.org>
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

On Mon, 11 Apr 2022 12:55:14 +0300, Roger Quadros wrote:
> These patches allow OMAP_GPMC config to be visible in menuconfig
> and buildable as a module.
> 
> Changelog:
> v3:
> - Remove not required MODULE_ALIAS
> - Mention in commit message why we need to remove of_match_node() call
> 
> [...]

Applied, thanks!

[1/2] memory: omap-gpmc: Make OMAP_GPMC config visible and selectable
      commit: 656d1be692be78b825954e0a2a47fcae81834633
[2/2] memory: omap-gpmc: Allow building as a module
      commit: eb55c7180be67774aa728a3c450de441e0dedb5d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
