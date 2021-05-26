Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B25F8391208
	for <lists+linux-omap@lfdr.de>; Wed, 26 May 2021 10:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbhEZIM3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 26 May 2021 04:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232342AbhEZIM2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 26 May 2021 04:12:28 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B6A1C06138D
        for <linux-omap@vger.kernel.org>; Wed, 26 May 2021 01:10:56 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id n4so102110wrw.3
        for <linux-omap@vger.kernel.org>; Wed, 26 May 2021 01:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JztoHGPfbJX6opl4beOmM6DMp8PEn+O4FmF9Qdbe1bc=;
        b=WK1bB8Rg/DcxNUAohdTLPuiB/c8I85dRvuRTpaX+Ds2wCyWDKdjPwuSJuhHdlRONig
         xtQ0rZjIG/tVrFWTY4WyiG/9YdIeBXRqpENRz7nsOSVlSHG9P1QDwkP+gvQFDxVARPpf
         FVSBOgUptV14cHyri3mO40/DmLJI8iPYXOK5JnF3/PYK1LlfJ+WkESUz6EqhPAbS6Df/
         3i21QYqFlx3F9HYD4s1KMqeASN+dKaUry/ufLp1FBVOikaF1+oEMcny0qsqmxB/f1AyM
         RAAMuKC/itkC/b1cCdQzHlQqaVaid3UMifSNOqEbUbMJAo/hMBqmkdHf434nH5aeSx25
         /NBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JztoHGPfbJX6opl4beOmM6DMp8PEn+O4FmF9Qdbe1bc=;
        b=n4N6yRkqcYxf+bdAB/zy867EGttZl1Wj+OUXgQnednzj7Y4QV50RAdbNRLGBQuQ7o/
         50kOp0CseIDUk33redxVmkOm9MsENt3r67eHusXsnGmI0mWggvpI++pFqLoelKaMdFgP
         cgBQZNXnQuA69boGK+CVDf/U8qYc1wjZwdJPTsKoqXuHS887HnJr9r702GEVzocok+kK
         mPuCe7y3CA1odBEcKGa993dlhkzERcG+uKHfTbA1IATWJu49Pq36ZIw2lTBxrceB6AT5
         GoGoaLIBblCVqf/WlawZiEKeoraQQC7IjieVtZ+Hn1Ahkd0jCBOT4Sl8bx6i6a+s2Pxk
         24jw==
X-Gm-Message-State: AOAM531GSPoj+c6tKk3yLI4Uam/EFq5OmYD0pdi33OXRb7d/+7MlvmqJ
        ZevIb0T2VZo6nOsdNIP4rjN9Vg==
X-Google-Smtp-Source: ABdhPJxRI2p/b8h8df9aTKlakSbDJbr9KVFJ9uLD8/6A6n7ATfMjoca97xEoC+XmpnU2JS5IB5eNZA==
X-Received: by 2002:adf:d4c7:: with SMTP id w7mr31206801wrk.35.1622016654874;
        Wed, 26 May 2021 01:10:54 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id v11sm22628319wrs.9.2021.05.26.01.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 01:10:54 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-omap@vger.kernel.org
Subject: [PATCH 09/10] bus: ti-sysc: Correct misdocumentation of 'sysc_ioremap()'
Date:   Wed, 26 May 2021 09:10:37 +0100
Message-Id: <20210526081038.544942-10-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526081038.544942-1-lee.jones@linaro.org>
References: <20210526081038.544942-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/bus/ti-sysc.c:867: warning: expecting prototype for syc_ioremap(). Prototype was for sysc_ioremap() instead

Cc: Tony Lindgren <tony@atomide.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/bus/ti-sysc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 5fae60f8c1355..0d4a1104b44ad 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -853,7 +853,7 @@ static int sysc_check_registers(struct sysc *ddata)
 }
 
 /**
- * syc_ioremap - ioremap register space for the interconnect target module
+ * sysc_ioremap - ioremap register space for the interconnect target module
  * @ddata: device driver data
  *
  * Note that the interconnect target module registers can be anywhere
-- 
2.31.1

