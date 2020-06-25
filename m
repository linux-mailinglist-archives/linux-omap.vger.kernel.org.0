Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8E3E20A2FD
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jun 2020 18:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406259AbgFYQcJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Jun 2020 12:32:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406182AbgFYQbj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Jun 2020 12:31:39 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36211C08C5DC
        for <linux-omap@vger.kernel.org>; Thu, 25 Jun 2020 09:31:38 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id o8so6189044wmh.4
        for <linux-omap@vger.kernel.org>; Thu, 25 Jun 2020 09:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/bWGv4VBKOqL31GzcG0gB8CKWRpsoEmNceOm2KS99aM=;
        b=Zjs+Wwp+7x9CksZF3ZsaA6S8W81k699KS03axTaAPYPfNau/zqgV3kktdkfj62cfpa
         E4hX02UAX+KL4mHDuso3yT2uTFKg4RE75yZ4URWvK4eEt+14A87dPWi6X6E59k1pUhBD
         xbhXWXGSrn8ByiYfzzwfxy9fj1CcNFW1/UWn1esb+iQ9UIHLqobiwHuUYYoOZFHNbDfU
         lBBG30lPDe7MGubZpNBVzTDmYIZ6x8fLhwZM3YtNjxeHeC82g4b1m7DTS1AnIPPqdqjI
         BDcehCfNNB3DFg613gUBJYFddVSMYe9BtD/PnhFqlaqYZQpbQoJ1zmqvNociCGQ+QJI9
         QhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/bWGv4VBKOqL31GzcG0gB8CKWRpsoEmNceOm2KS99aM=;
        b=oheMXS0MhhMN8PpaCH5Y919zY9QpPS9WMKY0I32tJJ77FzER0T2iVpK+fCQIhmIpuJ
         hOuiVvyQOp6+qGTA4frSk9SWRIRevZTlc1w3mT5QGYQJztnPEe2fkhqtuOEFYK3iWn5p
         ZkEk+qPZdKrurKcY4mrfqcFTAIkSd4MtPNSMGiQQ/9V9vqm8V37RxjqVLZNd2s7rQSAU
         F/xWiGUovpIdpgZgho+QfQnM5A6iOFNaHdGLZR2hfizIyuUhIe+U4Qri5d3YzbWs3AEj
         I9Zg0hyrmNIDraFIPYJax9WHe9fWklFhvC/WAkF07xS0Ea6jaBl3fYXhtOelA/DXzI5h
         uzhw==
X-Gm-Message-State: AOAM530+Acsr63iQfS7Zva1pJSVyEtB1JwOEpH/Ionq0B26vXCWfA8Ww
        hSl/hC08iQq5pTEGOWzdI5uZgj44tyI=
X-Google-Smtp-Source: ABdhPJwowkoEHG814z9kcM+1wV92pQB2K++HtdG/lFR3I8yuJjUhwKOoenqUu6c1TeBI6+cOh5n1Rg==
X-Received: by 2002:a1c:24c6:: with SMTP id k189mr4485173wmk.9.1593102696971;
        Thu, 25 Jun 2020 09:31:36 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.144])
        by smtp.gmail.com with ESMTPSA id l8sm32090847wrq.15.2020.06.25.09.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2020 09:31:36 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Tony Lindgren <tony@atomide.com>,
        AnilKumar Ch <anilkumar@ti.com>, linux-omap@vger.kernel.org
Subject: [PATCH 03/10] mfd: tps65217: Repair incorrect function argument name 's/tps65217/tps/'
Date:   Thu, 25 Jun 2020 17:31:20 +0100
Message-Id: <20200625163127.4000462-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200625163127.4000462-1-lee.jones@linaro.org>
References: <20200625163127.4000462-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The kerneldocs for both tps65217_reg_write() and tps65217_update_bits()
describe their first arguments as 'tps65217', when in reality these are
simply called 'tps'.

Fixes the following W=1 warnings:

 drivers/mfd/tps65217.c:215: warning: Function parameter or member 'tps' not described in 'tps65217_reg_write'
 drivers/mfd/tps65217.c:215: warning: Excess function parameter 'tps65217' description in 'tps65217_reg_write'
 drivers/mfd/tps65217.c:261: warning: Function parameter or member 'tps' not described in 'tps65217_update_bits'
 drivers/mfd/tps65217.c:261: warning: Excess function parameter 'tps65217' description in 'tps65217_update_bits'

Cc: Tony Lindgren <tony@atomide.com>
Cc: AnilKumar Ch <anilkumar@ti.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/tps65217.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/tps65217.c b/drivers/mfd/tps65217.c
index 7566ce4457a01..923602599549b 100644
--- a/drivers/mfd/tps65217.c
+++ b/drivers/mfd/tps65217.c
@@ -205,7 +205,7 @@ EXPORT_SYMBOL_GPL(tps65217_reg_read);
 /**
  * tps65217_reg_write: Write a single tps65217 register.
  *
- * @tps65217: Device to write to.
+ * @tps: Device to write to.
  * @reg: Register to write to.
  * @val: Value to write.
  * @level: Password protected level
@@ -250,7 +250,7 @@ EXPORT_SYMBOL_GPL(tps65217_reg_write);
 /**
  * tps65217_update_bits: Modify bits w.r.t mask, val and level.
  *
- * @tps65217: Device to write to.
+ * @tps: Device to write to.
  * @reg: Register to read-write to.
  * @mask: Mask.
  * @val: Value to write.
-- 
2.25.1

