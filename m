Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2FBE303D99
	for <lists+linux-omap@lfdr.de>; Tue, 26 Jan 2021 13:49:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391662AbhAZMsq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 Jan 2021 07:48:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391915AbhAZMsf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 26 Jan 2021 07:48:35 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D25B6C0698DA
        for <linux-omap@vger.kernel.org>; Tue, 26 Jan 2021 04:45:57 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id h9so6071125wrr.9
        for <linux-omap@vger.kernel.org>; Tue, 26 Jan 2021 04:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iORMEqJhCnrh6wIXXy7N9zvOdfWOGFh+mnFrMk+Wc4I=;
        b=Ut1+hsKMp53ICFgNhpIw0ZooAhqTLBGxRB1GLTU+ou42L9Dcz2FMt2o95jvhCa5CJf
         ZdlD9DBP1nU2IMrEQ9ly3HLM8tv74yCFWf3FpjdMVG0AGTNgKqPii/2dhd0ZSTMWHSke
         SfKwvE+l7fcjMACW9iCx/76oeGNAriPw3VvxzsJlySd9/zOTfQUIsd5T5jPfqnf+CfEn
         PEdLuEobbG2jPX0Gf/vBfIPoyJk2F6FLkDxVjXkK5SOztcfDLiR2N+b/QRpWjYsMV3c2
         o3wVGKiDJsO/jHItbpGtc7Eet8TetxgNijbinf81a/1UNccJcvd1b63IVx6aw38fnnvk
         54kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iORMEqJhCnrh6wIXXy7N9zvOdfWOGFh+mnFrMk+Wc4I=;
        b=cKEz0D062CZipXcmtCDnkGMn5TpouZt7fQb3/gr2YFGZpRxbFPNcv+vDjojBdTi1a8
         ZomC5H/6iY/pzdWIhNWImS+o2Q3s+dFrz6cIFRX2rNiPOEnJ37PyIueK+yWVqWg9BCSw
         5JQV3OapEAanCjK0l2ZHHKihy7FD03L7qK2os08QEGg7Qufj8KgtM03QsfsopC7sN+kG
         Oi9bPi+IpYbXQkVdX9TZOySSymhNmEdpCfXG4ZSlbLmV2T7Spk/93e3gcQTQhgTbnZhR
         0bLkueE89x7gQ2dG8VHLyabF9ExaK/iyx54YHpHG7zpar6jpxkWbCgjDxNusHXO250TH
         UYRg==
X-Gm-Message-State: AOAM533X/WhxWv/4/jf0MC4Lnf8epeoGQFvhLZd6Gqz9Hw/WIU0XuD/w
        mZK/bf0y5g9hYIDX8ga8PB0EmQ==
X-Google-Smtp-Source: ABdhPJw2nx2B0oh6rm7aHoz4WYg84KTipml2Niimp8U30RwYdhTXFbsI0bCANZV1kpnLUvqsibBRAw==
X-Received: by 2002:a5d:6c6b:: with SMTP id r11mr5998536wrz.38.1611665156576;
        Tue, 26 Jan 2021 04:45:56 -0800 (PST)
Received: from dell.default ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id i131sm3263073wmi.25.2021.01.26.04.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jan 2021 04:45:55 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Tero Kristo <kristo@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-omap@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 10/21] clk: ti: dpll44xx: Fix some potential doc-rot
Date:   Tue, 26 Jan 2021 12:45:29 +0000
Message-Id: <20210126124540.3320214-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210126124540.3320214-1-lee.jones@linaro.org>
References: <20210126124540.3320214-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/clk/ti/dpll44xx.c:114: warning: Function parameter or member 'hw' not described in 'omap4_dpll_regm4xen_recalc'
 drivers/clk/ti/dpll44xx.c:114: warning: Function parameter or member 'parent_rate' not described in 'omap4_dpll_regm4xen_recalc'
 drivers/clk/ti/dpll44xx.c:114: warning: Excess function parameter 'clk' description in 'omap4_dpll_regm4xen_recalc'
 drivers/clk/ti/dpll44xx.c:150: warning: Function parameter or member 'hw' not described in 'omap4_dpll_regm4xen_round_rate'
 drivers/clk/ti/dpll44xx.c:150: warning: Function parameter or member 'parent_rate' not described in 'omap4_dpll_regm4xen_round_rate'
 drivers/clk/ti/dpll44xx.c:150: warning: Excess function parameter 'clk' description in 'omap4_dpll_regm4xen_round_rate'

Cc: Tero Kristo <kristo@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: linux-omap@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/clk/ti/dpll44xx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/ti/dpll44xx.c b/drivers/clk/ti/dpll44xx.c
index 89c3ed1a24b82..3fc2cab69a3fe 100644
--- a/drivers/clk/ti/dpll44xx.c
+++ b/drivers/clk/ti/dpll44xx.c
@@ -102,7 +102,8 @@ static void omap4_dpll_lpmode_recalc(struct dpll_data *dd)
 
 /**
  * omap4_dpll_regm4xen_recalc - compute DPLL rate, considering REGM4XEN bit
- * @clk: struct clk * of the DPLL to compute the rate for
+ * @hw: pointer to the clock to compute the rate for
+ * @parent_rate: clock rate of the DPLL parent
  *
  * Compute the output rate for the OMAP4 DPLL represented by @clk.
  * Takes the REGM4XEN bit into consideration, which is needed for the
@@ -134,8 +135,9 @@ unsigned long omap4_dpll_regm4xen_recalc(struct clk_hw *hw,
 
 /**
  * omap4_dpll_regm4xen_round_rate - round DPLL rate, considering REGM4XEN bit
- * @clk: struct clk * of the DPLL to round a rate for
+ * @hw: struct hw_clk containing the struct clk * of the DPLL to round a rate for
  * @target_rate: the desired rate of the DPLL
+ * @parent_rate: clock rate of the DPLL parent
  *
  * Compute the rate that would be programmed into the DPLL hardware
  * for @clk if set_rate() were to be provided with the rate
-- 
2.25.1

