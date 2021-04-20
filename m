Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C33F3657BE
	for <lists+linux-omap@lfdr.de>; Tue, 20 Apr 2021 13:40:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbhDTLkP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 20 Apr 2021 07:40:15 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39148 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231987AbhDTLkM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 20 Apr 2021 07:40:12 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYojD-0005Wn-QS
        for linux-omap@vger.kernel.org; Tue, 20 Apr 2021 11:39:40 +0000
Received: by mail-ed1-f70.google.com with SMTP id t11-20020aa7d4cb0000b0290382e868be07so12940970edr.20
        for <linux-omap@vger.kernel.org>; Tue, 20 Apr 2021 04:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nq4Jf1F7QpCUtSWxlU+CaxhBrA9IV/0TddbI2jzDURU=;
        b=QCdBmOzf5NL9em0Nmc9Kd7b8DSPdkV4vgxg/lRk0sKwpH97RyYUMy4ZqJudPC9B8+n
         zqsfHEjIzMPBX4aLowqq8WWeWwsF21f5sopErCLFfKTgwDMGyA7FoGrTcjd7w1YW1ccL
         ATCTGBT1q1kirq12myxj0sAJV+er/+r5Zl/3AfFvrerPoTbIWzVl9KnwXAmfddy9YTOm
         XgeQOIU0/MpnXGy6Hxl6fOta/n0B/eENjWNIVRr/jE00gTK2IosDJrm7PDL/L1G7gBs1
         smXeivdp39etz+8NooeV466QeaHEyq3doMj2Tx81/nLC52+CsV45fTsjp4UHz93C7OlT
         K7sA==
X-Gm-Message-State: AOAM530WYx8qi+eyhtDAioxbqqMZgPpl5SgzjioXHT5UI5yVLvlfJ/TW
        DAGUQf7q/C6ugmUlvO6abUDRwoUrdODd60pT2wRIo8LYnRYcstvCTvOWT95KCfj5gMYiEOSpY55
        ljoeCdXVSAQQWDi/jgpuMvcWPgjH7HvmuDfWowfM=
X-Received: by 2002:a17:906:a20c:: with SMTP id r12mr26633994ejy.554.1618918779366;
        Tue, 20 Apr 2021 04:39:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyj66eOrcvi2YX4tMopSyiC5EDZvHf8zPXH8NgNMphzXRuWMeYLO+VDG3ozJ9NT6dLeU7BnNw==
X-Received: by 2002:a17:906:a20c:: with SMTP id r12mr26633982ejy.554.1618918779231;
        Tue, 20 Apr 2021 04:39:39 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id bw26sm10109007ejb.119.2021.04.20.04.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 04:39:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [PATCH v2 6/7] mfd: wm831x: Correct kerneldoc
Date:   Tue, 20 Apr 2021 13:39:28 +0200
Message-Id: <20210420113929.278082-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420113929.278082-1-krzysztof.kozlowski@canonical.com>
References: <20210420113929.278082-1-krzysztof.kozlowski@canonical.com>
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
2.25.1

