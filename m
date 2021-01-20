Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6D562FCEB7
	for <lists+linux-omap@lfdr.de>; Wed, 20 Jan 2021 12:06:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729234AbhATLBv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 20 Jan 2021 06:01:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730495AbhATJdm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 20 Jan 2021 04:33:42 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC50C0617AB
        for <linux-omap@vger.kernel.org>; Wed, 20 Jan 2021 01:31:00 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id g10so3993248wrx.1
        for <linux-omap@vger.kernel.org>; Wed, 20 Jan 2021 01:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LY5q2+0hG+fXtIws99tmFRHfiKbz2t7mHZqBtPU26u0=;
        b=qp5ivHIwlPA+mxn7LHz6fR+aGvcqN60QpoPN+nH3YCn0g5OQy7c2P2LFzNZRy7FGge
         hg2ivmGMDSU7cyhjyhZnZgwBQr0ZelkDjPGIRol04lKsfbMpcK/DF1iuHh4iiAvLHUrJ
         4OS3eqZnZu9V5YFZzPzt2Y1+eAg/YlihiacFkH9T/8LZT6mBGQM1Vau2uhk5jCnJfDUE
         Y9c2ZRdHI6t0xFmv10qomVdFhExs9yTbEU38LJK15kLAI8zs8PtF+sAu2VAdH+06Hi8J
         XBpwD4SjiVm2Dp02z3/xHdesudpSzTi0sNwIy9ckSdZQK0LZF9kWrTrGUMx0pbW9vVLt
         QMxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LY5q2+0hG+fXtIws99tmFRHfiKbz2t7mHZqBtPU26u0=;
        b=bZiffmcLzOx7KVDZqerbYa1L89TeaLX5wipxEgCqxZycDj4ofT1K1nvig0hzxOUO8i
         Im4ZJXdLCkiIOkj0izVOLHWLUL0J2nlYk4fZu5y5nAuBWjMfF792srSdOJ2Z0bNpMiVP
         CoDuJgv8QioQ9I0LNzfucoGlGp3n7eqy34tP87pS/pmjy9H0ZGLbWF4eoJ/HzCbXrGAk
         m+ZOI9d108QLmYohmD7CItPALnPivgLXXPFfgkO7se0IkQzq48AnkbC+Om7AL7kejRWH
         Clhw2ECQ7F24d59hHqdTHrTK1uHfO2KQhSHsKz8Ge7t5+/8c3r5gLdV8Cut+gjl1sPVn
         wr0A==
X-Gm-Message-State: AOAM530jV4LdH3yJZN45BD9zZBNWLeBqxBjnBD+9S/dfKB3Tnev+9k8E
        Ef9G7R9zlwYaVLHHteIGhGU9IQ==
X-Google-Smtp-Source: ABdhPJywOFFPw6GKnzaGJjvfN+49Y8p8EZJ0VaWdz576grsWMJnhyftNyIUQPnzaGNAr0bQz60j9+g==
X-Received: by 2002:a5d:58d3:: with SMTP id o19mr8594118wrf.250.1611135059258;
        Wed, 20 Jan 2021 01:30:59 -0800 (PST)
Received: from dell.default ([91.110.221.158])
        by smtp.gmail.com with ESMTPSA id z130sm2889201wmb.33.2021.01.20.01.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 01:30:58 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 13/20] clk: ti: clockdomain: Fix description for 'omap2_init_clk_clkdm's hw param
Date:   Wed, 20 Jan 2021 09:30:33 +0000
Message-Id: <20210120093040.1719407-14-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120093040.1719407-1-lee.jones@linaro.org>
References: <20210120093040.1719407-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/ti/clockdomain.c:107: warning: Function parameter or member 'hw' not described in 'omap2_init_clk_clkdm'
 drivers/clk/ti/clockdomain.c:107: warning: Excess function parameter 'clk' description in 'omap2_init_clk_clkdm'

Cc: Tero Kristo <kristo@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-omap@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/ti/clockdomain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/ti/clockdomain.c b/drivers/clk/ti/clockdomain.c
index 700b7f44f6716..74831b2752b3b 100644
--- a/drivers/clk/ti/clockdomain.c
+++ b/drivers/clk/ti/clockdomain.c
@@ -97,7 +97,7 @@ void omap2_clkops_disable_clkdm(struct clk_hw *hw)
 
 /**
  * omap2_init_clk_clkdm - look up a clockdomain name, store pointer in clk
- * @clk: OMAP clock struct ptr to use
+ * @hw: Pointer to clk_hw_omap used to obtain OMAP clock struct ptr to use
  *
  * Convert a clockdomain name stored in a struct clk 'clk' into a
  * clockdomain pointer, and save it into the struct clk.  Intended to be
-- 
2.25.1

