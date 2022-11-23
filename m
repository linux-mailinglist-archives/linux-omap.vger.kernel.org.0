Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1DAB635151
	for <lists+linux-omap@lfdr.de>; Wed, 23 Nov 2022 08:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235771AbiKWHtB (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Nov 2022 02:49:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236078AbiKWHs7 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 23 Nov 2022 02:48:59 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9FF5FAE98
        for <linux-omap@vger.kernel.org>; Tue, 22 Nov 2022 23:48:56 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id r9-20020a1c4409000000b003d02dd48c45so455653wma.0
        for <linux-omap@vger.kernel.org>; Tue, 22 Nov 2022 23:48:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5P5d+EzlKQPtLhYD9Bm10HppuJ/7kiec/cuhMTow9Ew=;
        b=Is1BjFxtq4aiEJ33XL48JzG3s+4esBJEan3EQk020pZ07+FrQPjCfXvxIGInokZU2H
         WmRMskNhVrz1V3t47tKV5Eo6VbJLdY+kGIkmH5JyEE64KrrqKS6UDDc8Zw6IZ9lTmAby
         wUpI4CQT2/96Exjs7ihHyZ0jtLTh7fAiyf9zGk9/3hTUSr9/6tP7g/4MiR5gZWpXqCip
         VsCJhhH8hXo81KdEYO/UylmjZgT64sNPriF0JqVb9Q/BTPdbr9oYGMJ/Vsa9KdWxEpzM
         thN/FBrMw8FLtsuPHsgeogoScYDIq23XAyySd0uEvGZ6NcDpuTWmKf9MG5kvC0/k7cQ8
         lHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5P5d+EzlKQPtLhYD9Bm10HppuJ/7kiec/cuhMTow9Ew=;
        b=OxoE7vbByo+FlsuvvkZJ4Yz/8dZShQDw2CJut8SNsteqOIrH7FBsH+7oCtJ5lc20Xs
         Q5Y/jJEJZDd57OqqvJbXrn5rT5563JPLXISNP8i7xTxEr48Mn0nzIFtT245zL3Wlpkko
         2Hc7Bol0w1xnVE9RlH1CiHAW3f83SRXnHSWGJ76CFWfoarJIK5vR4xSliquR75RKZr8e
         j0oB5/CzquOJx7/VUTEZU59pTGdSp6/i11aRsA2szCxKsMlYw/pSoNUqAJ2uoJdMTK7s
         /C+PW+fbxun+reDEssltKzMDCW8XOw8bH3jAkfALSZoMtgEDArs8p7UQe+pY6QYla22g
         eBEQ==
X-Gm-Message-State: ANoB5pmE/k3JvWIItVa6U788oZ4T9YVhCzXex8Iihutz0v2zKwhvuspg
        EbBvg4G3BotHCnI8rJAXidNjYpvuMr3DTA==
X-Google-Smtp-Source: AA0mqf7d2zbBL1BKzuLfC59iWZsBGoXySSkrLpeea1YVqUx3P9MGUdmG7b/2ajoYjFSttfUPTR77HA==
X-Received: by 2002:a05:600c:24e:b0:3c5:f9f1:f956 with SMTP id 14-20020a05600c024e00b003c5f9f1f956mr5414402wmj.50.1669189734927;
        Tue, 22 Nov 2022 23:48:54 -0800 (PST)
Received: from niros.localdomain ([176.231.147.83])
        by smtp.gmail.com with ESMTPSA id y3-20020adfee03000000b002365254ea42sm15874917wrn.1.2022.11.22.23.48.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 23:48:54 -0800 (PST)
From:   Nir Levy <bhr166@gmail.com>
To:     tony@atomide.com, linux-omap@vger.kernel.org
Cc:     bhr166@gmail.com
Subject: [PATCH] arm: mach-omap2: Fix spelling typos in comment
Date:   Wed, 23 Nov 2022 09:48:49 +0200
Message-Id: <20221123074849.76989-1-bhr166@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

---
 arch/arm/mach-omap2/sleep34xx.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-omap2/sleep34xx.S b/arch/arm/mach-omap2/sleep34xx.S
index c4e97d35c310..781a131b40a6 100644
--- a/arch/arm/mach-omap2/sleep34xx.S
+++ b/arch/arm/mach-omap2/sleep34xx.S
@@ -465,7 +465,7 @@ l2_inv_gp:
 	mov	r12, #0x2
 	smc	#0			@ Call SMI monitor (smieq)
 logic_l1_restore:
-	adr	r0, l2dis_3630_offset	@ adress for offset
+	adr	r0, l2dis_3630_offset	@ address for offset
 	ldr	r1, [r0]		@ value for offset
 	ldr	r1, [r0, r1]		@ value at l2dis_3630
 	cmp	r1, #0x1		@ Test if L2 re-enable needed on 3630
-- 
2.34.1

