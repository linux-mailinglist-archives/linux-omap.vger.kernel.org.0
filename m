Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79356363D46
	for <lists+linux-omap@lfdr.de>; Mon, 19 Apr 2021 10:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238080AbhDSISM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Apr 2021 04:18:12 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50464 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236767AbhDSISI (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Apr 2021 04:18:08 -0400
Received: from mail-ej1-f71.google.com ([209.85.218.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYP69-0007wJ-To
        for linux-omap@vger.kernel.org; Mon, 19 Apr 2021 08:17:38 +0000
Received: by mail-ej1-f71.google.com with SMTP id ne22-20020a1709077b96b02903803a047edeso2039029ejc.3
        for <linux-omap@vger.kernel.org>; Mon, 19 Apr 2021 01:17:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xk3WBnA32t2m4Myce9cZ0YQ9ZIjnwr2MU+dccRhDaEQ=;
        b=fKg3wAU4TruFDN0H+f4PIohSlrddPUCsG8q+A6OrjQhNq1khml3gxjvfYwa4By60nz
         S3rvhUvhn52f9Vp0m7kHR9peRrUfY01dbYo9KYPuNz6TRiv+O1qDbh9vWmg5OxDyggyB
         7VO78Tcf6ePFuLTbDeZA5kNI1Ac92GZyl3WgSqH1hIUQou/64B28yjE5EKfqDxnP2xuw
         Z86eSLrLiMIxMu7o7MMenbBdM+oAizg07CLXe5qRnIvQ88ZfJv16eqKZia9UErD0hkok
         OgAbbFmWfrknB24Tz5c4lGWua0rLG4vaxCMzkOnzIqN/sriX7ST8jMQW96f3gNQ/yoRs
         Xk+A==
X-Gm-Message-State: AOAM532DtHV72CkABNq74LykV6neuRruwOnV25LFYpqEORAXl5gZ2AAz
        0X4Q0QRlwYG9HKEj30xHNClzjQlvQIX0dnQKcziHoCItQ5Ri1IabIPHnMEzmi1urAkJV/8AWzRb
        aRTpPlXJQ9Kbm6W4mFtyOh4dY/iJXUXlPr62kBTw=
X-Received: by 2002:aa7:c78a:: with SMTP id n10mr16235098eds.239.1618820257642;
        Mon, 19 Apr 2021 01:17:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyEC1eWVQTu9LMVgr/ILKMxwUXo5jz/WdoxqL0Yi4g29Y+yv0xfxfv1+lWwr2RseWz0zqylAQ==
X-Received: by 2002:aa7:c78a:: with SMTP id n10mr16235083eds.239.1618820257512;
        Mon, 19 Apr 2021 01:17:37 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id da13sm12384781edb.6.2021.04.19.01.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 01:17:37 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 7/7] mfd: twl: Correct kerneldoc
Date:   Mon, 19 Apr 2021 10:17:26 +0200
Message-Id: <20210419081726.67867-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
References: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Correct kerneldoc function name to fix W=1 warning:

  drivers/mfd/twl-core.c:496: warning:
    expecting prototype for twl_regcache_bypass(). Prototype was for twl_set_regcache_bypass() instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/twl-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/twl-core.c b/drivers/mfd/twl-core.c
index 20cf8cfe4f3b..24b77b18b725 100644
--- a/drivers/mfd/twl-core.c
+++ b/drivers/mfd/twl-core.c
@@ -485,8 +485,8 @@ int twl_i2c_read(u8 mod_no, u8 *value, u8 reg, unsigned num_bytes)
 EXPORT_SYMBOL(twl_i2c_read);
 
 /**
- * twl_regcache_bypass - Configure the regcache bypass for the regmap associated
- *			 with the module
+ * twl_set_regcache_bypass - Configure the regcache bypass for the regmap
+ *			     associated with the module
  * @mod_no: module number
  * @enable: Regcache bypass state
  *
-- 
2.25.1

