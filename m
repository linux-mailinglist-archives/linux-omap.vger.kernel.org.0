Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC70635FC0
	for <lists+linux-omap@lfdr.de>; Wed, 23 Nov 2022 14:33:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238340AbiKWNct (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Nov 2022 08:32:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238846AbiKWNcO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 23 Nov 2022 08:32:14 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02951F0E
        for <linux-omap@vger.kernel.org>; Wed, 23 Nov 2022 05:17:26 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id bs21so29357359wrb.4
        for <linux-omap@vger.kernel.org>; Wed, 23 Nov 2022 05:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mXCYaSmMqqEDfVGfKyWMjlG4vgxEb1dGWfZP4Ic23TM=;
        b=WXBPukmmS14aMCOS8w61k/jTzofcIacWIKg2AVDdO7Z5wxkzk9sK9Vj4lW+3kLHjoS
         exNhsZJmoevUqtTaFjMV0Uwkf/UZRMUVvEA1+C9zHszd01/B7ExO9W/0TkW6elTQUjvb
         D6YsWU6Wk6Ns1bEEyihNxIv57Y9amYQL6s5sio8kiO5MStT58bEop3QkwB1AOk8SuisC
         PuGuzf1SB9rNVZLn6xAUGTPIWzbsHpf66NnRXIE5/21sdB1hSwZNCi3YQghMSR6z2IF2
         /4KZxGN00SCZDBOkNb5ZINywcHB7g7HZBOblVCFqYBmqQppVqgCdPYN2ISvZfyZ/C3MH
         biSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXCYaSmMqqEDfVGfKyWMjlG4vgxEb1dGWfZP4Ic23TM=;
        b=AkSik4snK0B+Dtwon5DTkCiDMdFAsrFGj4kMIDqmx/a01pjueAD3S3eNV0sHG7Ecxf
         cWqyacywjPAYjJ0xr9TaFGzUv8Pd9A5p6uaBETlsddaj8t8X213WZoKp2dOuRdu/lIwI
         5MtLuOTgysLwBQ6ZKuPsEp6Aud//YsiiccOZRdsudjH8tGMvvr8F/TmAdlOOCKxa2H+c
         qaQdR6U8j7Qiehd0uCr4OdiToS7tc+bkGL7WJAciOMEPqdHztKr/3IQNh2jU45K1bfed
         AHO5Ydw8lwoEI6DISP1XVK/yhCxJTjKcpzJsHvDQk2nvZcGY/VWxn9imNDIiySTq16Rm
         0rLA==
X-Gm-Message-State: ANoB5pm2DX2pg9rSMG0bJGwTTjlCIaHbGeSH5XAYEkplQwiitBgitYLi
        wNCfk5LaK6yq3qIB0PKJRoQ=
X-Google-Smtp-Source: AA0mqf7+5+uLz6CrlL6Jrbc9v9nwDW2r1RFdQT1c3LdlTxiqEO0Rka7q9hIH8njfyUYHq30orvlNLA==
X-Received: by 2002:a05:6000:910:b0:236:56a9:65cc with SMTP id bz16-20020a056000091000b0023656a965ccmr17234074wrb.563.1669209444282;
        Wed, 23 Nov 2022 05:17:24 -0800 (PST)
Received: from niros.localdomain ([176.231.147.83])
        by smtp.gmail.com with ESMTPSA id y7-20020a1c4b07000000b003b4c979e6bcsm2206148wma.10.2022.11.23.05.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 05:17:23 -0800 (PST)
From:   Nir Levy <bhr166@gmail.com>
To:     tony@atomide.com, linux-omap@vger.kernel.org
Cc:     bhr166@gmail.com
Subject: [PATCH] arm: mach-omap2: Fix spelling typos in comment
Date:   Wed, 23 Nov 2022 15:17:20 +0200
Message-Id: <20221123131720.79978-1-bhr166@gmail.com>
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

Fix spelling: adress -> address
Signed-off-by: Nir Levy <bhr166@gmail.com>

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

