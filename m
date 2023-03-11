Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 375716B5AED
	for <lists+linux-omap@lfdr.de>; Sat, 11 Mar 2023 12:17:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230522AbjCKLRT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 11 Mar 2023 06:17:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbjCKLQN (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 11 Mar 2023 06:16:13 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D3E19271A
        for <linux-omap@vger.kernel.org>; Sat, 11 Mar 2023 03:15:12 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id i34so30687288eda.7
        for <linux-omap@vger.kernel.org>; Sat, 11 Mar 2023 03:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ii5x/Q+JtDY3RQJyVxBKzIOeCRWyExkm9YhpbbdrbmE=;
        b=j/5MoepSDsQf9wzHX9Q+DN5qGfZKFOp6ro5TkCXoVjU+nBP06h2lHLeWmavj9sDwTh
         7gv60EHqlQpJnsMPJYzgblxY/481pFHJtsgkrdG8ehdXqO56/8DnHGE9gfjeiHaT092K
         lseVBUzoJyVOEAByxjxwp4/0Qnuf8MUGDRHvPHpYdgix26pk1OAbZAjXZEAiR1QEyKrZ
         0AL/+PKSIEZOSuWHygTz0ZoDaKi0x7C9uUm/aBJUj+ela2wffdRQnVQPt2zHaoD5oPrj
         qWEDK+buTmHAzJtXsGkcWl0VQaPZ78dIsfIUU0vd6JJkLSbSTrU24uBTPm+QaUQWUcV6
         Zu2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ii5x/Q+JtDY3RQJyVxBKzIOeCRWyExkm9YhpbbdrbmE=;
        b=pyuYOCCLt7gHKuCh+c2saqL8Dt5E43np0n5mGIld58z9pb/64cInbM1VXCf2mnQcR8
         PfuNEL1vYYB2GXTsqQSfouNNPTAqRoZaPTzcuxBCLNSgcWyMVrlWfDxQVUv5QRLgFOZa
         2CTTzBUMtHZn6HgVKhW3JMtAjD2FPvmrTzgyXFODjq+hmvEWjuvVIndhOM9yd8yFxmQq
         +awzylyUErljXaDiDi2aYTZt6YUngXnw2caGGf6fK9t/1c0HNDawrxyOpqGf3BMa7YaP
         rp9WmuaivddRv9gj7ocZb9Ir+pKxzBWD0Dm3BEiqhiX+/1bLAtZQXcRe8J1ZdSpUx7A5
         IQXg==
X-Gm-Message-State: AO0yUKUh8uqu1rhp2ZDlqKzXZpIS+HWhuc7koV/kFXp99p+KSUdT+mfg
        87ZB5SiPR0zJRCNwoFiDjffGCkvvJtTHC+S0qks=
X-Google-Smtp-Source: AK7set+vTbLLS6UrZSQKDhTEr5i2GL37TKhcaz1X9MdNgwjIEfT2ez7VQidkZv39srr2rWZLT7KDSg==
X-Received: by 2002:aa7:c493:0:b0:4ae:eb0f:892e with SMTP id m19-20020aa7c493000000b004aeeb0f892emr23230349edq.20.1678533279881;
        Sat, 11 Mar 2023 03:14:39 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id hv12-20020a17090760cc00b008b17cc28d3dsm990803ejc.20.2023.03.11.03.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:14:39 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        linux-omap@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] hwspinlock: omap: drop of_match_ptr for ID table
Date:   Sat, 11 Mar 2023 12:14:38 +0100
Message-Id: <20230311111438.251422-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).

  drivers/hwspinlock/omap_hwspinlock.c:164:34: error: ‘omap_hwspinlock_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/hwspinlock/omap_hwspinlock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 1fb3a2550e29..dfe82952671b 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -174,7 +174,7 @@ static struct platform_driver omap_hwspinlock_driver = {
 	.remove		= omap_hwspinlock_remove,
 	.driver		= {
 		.name	= "omap_hwspinlock",
-		.of_match_table = of_match_ptr(omap_hwspinlock_of_match),
+		.of_match_table = omap_hwspinlock_of_match,
 	},
 };
 
-- 
2.34.1

