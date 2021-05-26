Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E11333917F6
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 14:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234447AbhEZMwq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 08:52:46 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56894 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234887AbhEZMtO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 08:49:14 -0400
Received: from mail-ua1-f69.google.com ([209.85.222.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llswn-0000yc-I4
        for linux-omap@vger.kernel.org; Wed, 26 May 2021 12:47:41 +0000
Received: by mail-ua1-f69.google.com with SMTP id f15-20020a9f2bcf0000b02901f8fe91b89cso746314uaj.0
        for <linux-omap@vger.kernel.org>; Wed, 26 May 2021 05:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WIVLcdNNtMYgH1JGfFPDDOgy1+OAkNQskR3ugQF/qLg=;
        b=Oa7Vyx81dczeLtNvtVsWh0BYbY8PkWDpF7uTkyN8JBrQfHN/7rRwrrxh3pT4svzaeA
         lJ4+dIRn4LfdtJBGzFOMNIrG9I0iyfzAI1L1B1mCZN0pzAJ+ZJlYuHoveeJOa9RRKuYC
         XUi7hFJ6WrLWUHlsFfmzRCXWjZ0e0SexTpJTXUGV4qrLS2Osgsx9AzCNLe8dGpYnx8E+
         jlEqvxFSML/7CsPinLPYqUVJR9sWFkYQY2O8pVzfL21xwvRwPefhy+wDf1w1cehlm24R
         BqmkURD0bFNlijckXAVBTzbFJ57u3O3nCFkB9iGdxSA+pB+FpWssvycovY6HlqIwJFRC
         pyCA==
X-Gm-Message-State: AOAM533bBy6kzri1Xvq/G9/p7CLbUxUOutdsoTOyWinCND/Fq9ZPGIKU
        kgZlvayVxFfrIDzmNKCBMLvm7ENVUOj138pGi/B0KUa9lCz0p/LMZRKj2SJ+lEPKT1r/n72HG+t
        HHFgAsVusd954xt1ScqwIS2iVUmMgOaAUs737pjs=
X-Received: by 2002:a67:ee07:: with SMTP id f7mr29741178vsp.55.1622033260695;
        Wed, 26 May 2021 05:47:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLAavyPatTn6lusqjCi70ec2x9vA5s1Emg7eGeEsn1Ovy17QVDFuG9G6nwebdsE/DwG++62w==
X-Received: by 2002:a67:ee07:: with SMTP id f7mr29741168vsp.55.1622033260560;
        Wed, 26 May 2021 05:47:40 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Cc:     Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [RESEND PATCH v2 06/13] mfd: wm831x: Correct kerneldoc
Date:   Wed, 26 May 2021 08:47:04 -0400
Message-Id: <20210526124711.33223-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
References: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Correct kerneldoc function name to fix W=1 warning:

  drivers/mfd/wm831x-core.c:121: warning:
    expecting prototype for wm831x_reg_unlock(). Prototype was for wm831x_reg_lock() instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

---

Changes since v1:
1. Add Ack
---
 drivers/mfd/wm831x-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/wm831x-core.c b/drivers/mfd/wm831x-core.c
index bcef08f58fb3..c31809b17547 100644
--- a/drivers/mfd/wm831x-core.c
+++ b/drivers/mfd/wm831x-core.c
@@ -109,7 +109,7 @@ static int wm831x_reg_locked(struct wm831x *wm831x, unsigned short reg)
 }
 
 /**
- * wm831x_reg_unlock: Unlock user keyed registers
+ * wm831x_reg_lock: Unlock user keyed registers
  *
  * The WM831x has a user key preventing writes to particularly
  * critical registers.  This function locks those registers,
-- 
2.27.0

