Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A9D52004A7
	for <lists+linux-omap@lfdr.de>; Fri, 19 Jun 2020 11:08:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731874AbgFSJHZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 19 Jun 2020 05:07:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731860AbgFSJG5 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 19 Jun 2020 05:06:57 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43CCDC061799
        for <linux-omap@vger.kernel.org>; Fri, 19 Jun 2020 02:06:55 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id o26so7044684edq.0
        for <linux-omap@vger.kernel.org>; Fri, 19 Jun 2020 02:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+0u89dpmgvQy4plYwwslEmSBiru+bR25mmVExT9ZnYw=;
        b=UB/REUZqGhSab2IhwMetGxClUkd/oH91Eb1YMtnqkqAxIYIsM5YWJ4a17MUa8/08et
         0KoPGo9oOwe1emR2wQSQNrT5mDdb5rPGbQPYSjM7oAM0AmVr3nITPyO5xBU0y99uSaYS
         GceF0JPmFhlA4OqkmdjhyRfE1guxkExlPCp0DWWvNnsOZnKJIUT+xfTjyP1zTVLFmjP2
         dMylqWecptZAOuQnxr4pfUQnYY3XKand3fm9DpP1DYG41QiDNvEzeMJVk82vaFfE2K9D
         qtb13ihfkOU5g1JKWZXaspFlc8GMvyr56s1ipcyGwqqbQPiOZwcx/nYfvYwyMjpAPLcZ
         I8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+0u89dpmgvQy4plYwwslEmSBiru+bR25mmVExT9ZnYw=;
        b=bANKpP6vZEgCwWppKQS4ASVnDXsddIcjCQi0wJ1qXVEJxO4HcLZH+lLtH3AnORm5w6
         9n7XfMmsBokMCdaOsEdsAAlmQQ7eECEk0S/gbvdlwvLVzVVJsCjdWVqCXLG/gqvyugnf
         NYaHuBho4YTF2qENmsT63sXphUauNrsx99eQCCKnEuuUhi3nrj7uVScBEYI65Pm0466w
         7J3cNIOU3J7yr9bEJfODsx/VuZ4wuaXP5DV/Eq8wqcPmgt2Xj+hiS4q9Oum3xnVF4Nkv
         8jrCJmtAFep7CXN+kifUHxJ1/Uvhw5DPNRDujVe11wQEETrWNsybA+xscofZdHGXFFbs
         ELtA==
X-Gm-Message-State: AOAM530NkTh6vO34NZJuI/Yctk15snj3E2QPGNU3U9czNoMe1DLr9Qb8
        4jHuwVwuIXa5CETJIVVnjR3hhQ==
X-Google-Smtp-Source: ABdhPJy/3Bg56TEDS6v87nEXxy3icDzdDUs8cujpuQA8aXHR5JzzlkpBgh63TY4ie6qdHZydvU1qVg==
X-Received: by 2002:aa7:d7ca:: with SMTP id e10mr2271039eds.45.1592557613971;
        Fri, 19 Jun 2020 02:06:53 -0700 (PDT)
Received: from localhost.localdomain ([2001:16b8:5c68:7901:5c06:6064:338b:4004])
        by smtp.gmail.com with ESMTPSA id dm1sm4653650ejc.99.2020.06.19.02.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2020 02:06:53 -0700 (PDT)
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Cc:     Drew Fustini <drew@beagleboard.org>
Subject: [PATCH v2 3/3] pinctrl: single: parse #pinctrl-cells = 2
Date:   Fri, 19 Jun 2020 11:06:08 +0200
Message-Id: <20200619090608.94948-4-drew@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200619090608.94948-1-drew@beagleboard.org>
References: <20200619090608.94948-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

If "pinctrl-single,pins" has 3 arguments (offset, conf, mux) then
pcs_parse_one_pinctrl_entry() does an OR operation on to get the
value to store in the register.

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 drivers/pinctrl/pinctrl-single.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 02f677eb1d53..e6d1cf25782c 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1017,10 +1017,17 @@ static int pcs_parse_one_pinctrl_entry(struct pcs_device *pcs,
 			break;
 		}
 
-		/* Index plus one value cell */
 		offset = pinctrl_spec.args[0];
 		vals[found].reg = pcs->base + offset;
-		vals[found].val = pinctrl_spec.args[1];
+
+		switch (pinctrl_spec.args_count) {
+		case 2:
+			vals[found].val = pinctrl_spec.args[1];
+			break;
+		case 3:
+			vals[found].val = (pinctrl_spec.args[1] | pinctrl_spec.args[2]);
+			break;
+		}
 
 		dev_dbg(pcs->dev, "%pOFn index: 0x%x value: 0x%x\n",
 			pinctrl_spec.np, offset, pinctrl_spec.args[1]);
-- 
2.25.1

