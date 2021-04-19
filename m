Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34A77363D3F
	for <lists+linux-omap@lfdr.de>; Mon, 19 Apr 2021 10:17:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237367AbhDSISJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 19 Apr 2021 04:18:09 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50455 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233313AbhDSISH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 19 Apr 2021 04:18:07 -0400
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYP68-0007vd-PY
        for linux-omap@vger.kernel.org; Mon, 19 Apr 2021 08:17:36 +0000
Received: by mail-ed1-f72.google.com with SMTP id r14-20020a50d68e0000b0290385504d6e4eso829117edi.7
        for <linux-omap@vger.kernel.org>; Mon, 19 Apr 2021 01:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UpAJNzbD9MKVQi14LfzEiS6XF3kyB2Fc0GZ6ydruDWw=;
        b=iro7JlF866guhfQ+S2YOdI5hLBEStUSC10ag5XbfynmPbPba9mV2Ks2akxh+IGFEi3
         FIYGVRqC7KLJ9cgVHiaeao7zx/rUXpM0FAEydXUgpPP5MG3LZFwqafHhJBS4Qera6asT
         SGC46ZLz+S5kAmlsannVoxc6DjGp72DTAbyKQcKc6RxeuWann/QzamlR2kv54BEXpZLj
         9LCtWTWuazgIIeFPzaDIlwmnC1niTbQptQCRgVfZUDVA+fnJw35qXBGLXr035POb88aT
         Nh+pDia3fmT4beTllDLP2ewpwRdIv/1T0YjYMX8auTmyzJ+u0hbvDkl99KkdrxYgSCjz
         7o/g==
X-Gm-Message-State: AOAM5302Yp8DlSnwP8vJ8MeDE4ky7q/rRvsl53P1SIG8+FjG+GKmHE6o
        bOGGrTmXnBccZgybWEwv2TWcYOJWTDsVRoDdnv1bRpWCG8EgWnOPtufQqZwYLSO1eMfnRHKEgJn
        0IOrDXm+N5gXDNgeGN/WKc3rF7bzGN+iP7CQENF4=
X-Received: by 2002:aa7:cd83:: with SMTP id x3mr23871125edv.373.1618820256546;
        Mon, 19 Apr 2021 01:17:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwrRRvmlGCkxx4tXzhKQpNcCtZtp5i5u5JPY0gywyHuqwKmdgiNtXRNYyjndMc/zdrzzTv4fQ==
X-Received: by 2002:aa7:cd83:: with SMTP id x3mr23871118edv.373.1618820256448;
        Mon, 19 Apr 2021 01:17:36 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id da13sm12384781edb.6.2021.04.19.01.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 01:17:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 6/7] mfd: wm831x: Correct kerneldoc
Date:   Mon, 19 Apr 2021 10:17:25 +0200
Message-Id: <20210419081726.67867-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
References: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Correct kerneldoc function name to fix W=1 warning:

  drivers/mfd/wm831x-core.c:121: warning:
    expecting prototype for wm831x_reg_unlock(). Prototype was for wm831x_reg_lock() instead

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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

