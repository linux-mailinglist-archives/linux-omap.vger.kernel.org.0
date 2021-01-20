Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76B152FCEBB
	for <lists+linux-omap@lfdr.de>; Wed, 20 Jan 2021 12:06:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730361AbhATLCE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 20 Jan 2021 06:02:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730348AbhATJdm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 20 Jan 2021 04:33:42 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A93C0617BA
        for <linux-omap@vger.kernel.org>; Wed, 20 Jan 2021 01:31:02 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id c127so2168982wmf.5
        for <linux-omap@vger.kernel.org>; Wed, 20 Jan 2021 01:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZlxWqB97396Z/1CTd7JjSdXD/AayRN7t/x5G26LknOw=;
        b=YW8CLG2amwNwESLYt8j2slhiMdqoBHjc3t9MBSkQGbtJ9tiNc/C38kXcKSQxORb6XD
         jq4X2o/AdyIonvu+iNGV0nPBkc1+GHus2lYFwxJM01UE5MObgcw009+epNk4rDV11iRl
         LfSxGbrNKChJjsjW6RyPy6+dak4PfdI40njSOTW0+DCMFmws1ZpwY4PEivLAyq5MdwSU
         XvUXuDZGKOFTUxsQL9WFRUNeXaDtt+cKWDMXoNJyZ0joRQm+BAhXi0m/lRoDv1u9wtnu
         bb+QLTB6b6bvECBYjOMlFgXQNs4ccybT4j/WJFSCTgiEChqlFK4ZGkTLs6+nrqMYf77G
         CiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZlxWqB97396Z/1CTd7JjSdXD/AayRN7t/x5G26LknOw=;
        b=O5DiiZ7CaZEJRmLGvK0byTJoPeYFBdhStlm35+YDEpK3HVZder2PLOWKlyByknjtVc
         VMhOIaftY30R3Tm5gG8t7TSCXMvLIE8nECgsva0PkCyVX2UWyQX0/yzg6Za0RnC16OXc
         Gsb9vJGbVqeXn4HNdRy2aFNtYIAkBDiESrrQWjljc9nI436hp+2rxsdhUN3L9FkOSiM0
         SswTmSFi3Due8xMXLXPOMK2VWHstrt6cOgog+aJ8uh/fmgo0UYjkC4gKiPOasvdnw0yT
         pI/MnJSjsqY1yifUAnY3GOI2bJRjfLupW6VJFKpAeqBa8Z7a4l8AoDyxLCiWU7GKCAYf
         iZyQ==
X-Gm-Message-State: AOAM533vZPJL7JOL4o7RacflcTT6nQK71rbdAXtqsqBt0KgzdhWP12/6
        VYl9Pa9yKm64e1AzOYPFCEO7gw==
X-Google-Smtp-Source: ABdhPJz3CMwq3lUrKSRc8gEuNGfqALvjLL4ApeskT3BX/9cQHX/dTMIgwY2+r417x7R6omOj+oJ3HQ==
X-Received: by 2002:a7b:cb09:: with SMTP id u9mr3483431wmj.61.1611135061623;
        Wed, 20 Jan 2021 01:31:01 -0800 (PST)
Received: from dell.default ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id z130sm2889201wmb.33.2021.01.20.01.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:31:01 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 15/20] clk: ti: dpll: Fix misnaming of '_register_dpll()'s 'user' parameter
Date:   Wed, 20 Jan 2021 09:30:35 +0000
Message-Id: <20210120093040.1719407-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120093040.1719407-1-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/ti/dpll.c:163: warning: Function parameter or member 'user' not described in '_register_dpll'
 drivers/clk/ti/dpll.c:163: warning: Excess function parameter 'hw' description in '_register_dpll'

Cc: Tero Kristo <kristo@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-omap@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/ti/dpll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
index 247510e306e2a..d6f1ac5b53e14 100644
--- a/drivers/clk/ti/dpll.c
+++ b/drivers/clk/ti/dpll.c
@@ -151,7 +151,7 @@ static const struct clk_ops dpll_x2_ck_ops = {
 
 /**
  * _register_dpll - low level registration of a DPLL clock
- * @hw: hardware clock definition for the clock
+ * @user: pointer to the hardware clock definition for the clock
  * @node: device node for the clock
  *
  * Finalizes DPLL registration process. In case a failure (clk-ref or
-- 
2.25.1

