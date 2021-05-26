Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FB403917F1
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 14:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234907AbhEZMwe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 08:52:34 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56913 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234889AbhEZMtP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 08:49:15 -0400
Received: from mail-vs1-f72.google.com ([209.85.217.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llswp-0000zV-I4
        for linux-omap@vger.kernel.org; Wed, 26 May 2021 12:47:43 +0000
Received: by mail-vs1-f72.google.com with SMTP id u21-20020a67c8150000b029022a6f03b431so194764vsk.9
        for <linux-omap@vger.kernel.org>; Wed, 26 May 2021 05:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xmq4az+LVVwXfHSluC5ybVO0wHBrYm+QPRvC663g7hE=;
        b=Jmt66mBo46p+uzhw6zoSAZV2OwRg1ZF4/adqv02/qzJrIvpN/aLW+zRk03IUBTzSBS
         wKItxulxQ7j0W7QkRhkHTFWUI/C/NWjy/VeKCJkniqoCCzN/JmCdSPrH0ZgIf6CJl8dE
         cimD8xOxhRW3aQXjXyh8wsr4qy2ATvElJ9xuGZWhL389FegnEy1PsQ9PM6SFcym58AUc
         ez2YZr3OPwG/mU4OTc0n9DlobIR58vF62FDzOYMs4veV3XSj3cxDWtgz2zjlc/ERz0Nf
         2C6cSYPnZnSz6rtETGNPo7SVo2ZTvJUo+nu9mRSDqYXXinvQ1aVROT6TP9FrjYs9jDF/
         cjAQ==
X-Gm-Message-State: AOAM53206hIVGnkA1kq48RWEiV1wujq/RwTVFWVfrrDtkhS9uOWlEkPL
        Xvkpm31O59xqjyyJtu0AUZ1BlEW3olGRcBbJ+xZ2odx/dVQABnv50n+MzrauXU0SKul9XzkMRB0
        zEgv20QbFnbNXniK/yBWrHC73ibKIaYhBPpUq6mM=
X-Received: by 2002:ab0:2690:: with SMTP id t16mr32616241uao.9.1622033262224;
        Wed, 26 May 2021 05:47:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAQIaZSYaw/87n9WsaeWRycw8n9xSrM+/O2sXVcNtI7Ic5NMnYJIKikee5mCmgG0Yw6URGoA==
X-Received: by 2002:ab0:2690:: with SMTP id t16mr32616208uao.9.1622033262021;
        Wed, 26 May 2021 05:47:42 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [RESEND PATCH v2 07/13] mfd: twl: Correct kerneldoc
Date:   Wed, 26 May 2021 08:47:05 -0400
Message-Id: <20210526124711.33223-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
References: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
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
2.27.0

