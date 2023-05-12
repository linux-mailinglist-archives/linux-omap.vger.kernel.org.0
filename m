Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13C30700D41
	for <lists+linux-omap@lfdr.de>; Fri, 12 May 2023 18:45:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237257AbjELQp3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 12 May 2023 12:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231363AbjELQp2 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 12 May 2023 12:45:28 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46696A25D
        for <linux-omap@vger.kernel.org>; Fri, 12 May 2023 09:45:25 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-50bcae898b2so17992292a12.0
        for <linux-omap@vger.kernel.org>; Fri, 12 May 2023 09:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683909923; x=1686501923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DzkqAQLe+Gk5RNSaFXPZZ/iJILetoG15+4I/37fqe1o=;
        b=gFA9k9uHBjkAZX78IGqJYhI/+fRUE00vuVnpTz9gC2avgrz0tpvMje2QY/rjdS0532
         M7qsBuMpYPcLpuWFr5TgLmNL5U8qgOkAZ60h5xTfJ5nly5LwyTk/1quJU/goLo+DkKkB
         kUFVAXJNwWU5iARh5wCwRkVqsiES4gXBo8QV41ojlZgBT5pl7LwClx+ueoCaX4N68uM+
         ADPahOfldV6YNsXMPsr22Nd5ghG+VTRs8w4o5yTucoRMKviSrnwI1O42BBl0M6Q/hMex
         1Bh3p1MXU/szPOfaiC0fKSCJUY7tofIsQQC4u26hF1kBbP56NwSylhkIwkvY/ykFnfbM
         WCVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683909923; x=1686501923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DzkqAQLe+Gk5RNSaFXPZZ/iJILetoG15+4I/37fqe1o=;
        b=ClkKsUcyQNs7a9Mdc7hpozLvwcfxcfSpEbgSuOZAynhv7VL6Inpyvbh1POPmmN8WRp
         uY12m2H/9N26u6hLnNnt/mBiPVbrqYBYulli/1lX86rGKkeeNax67vizm1KO9DtLkcRI
         Qpw9hAMIzOgXfvidRjreWKZ1oS+OKtWwYXphrpi67Y3PwDQDGh+1cq/IthPDROpUDym3
         VHTFNa2HnJdaLcL3sWE5Mm/wBt+mfwk2BpBekLAjiqhzPLZHaOlsIptcgRDE8Y/ncsiQ
         58oFC5ygePfHx5J1F6Pv/BRO+wrvFdHDrGT4qsAN/153JvD4pLPEhnzaafDwFSnuvsJf
         Bl1Q==
X-Gm-Message-State: AC+VfDzCq26T6epSd8hRCgXFumaP3EISzCVrQJ/nTg/cUeHMdRtYh3Qc
        lES6yNPEv7pp9XYcJb4sgMn+8A==
X-Google-Smtp-Source: ACHHUZ6ywBP3RpMKkiYl1efT27yyOsd3QbfuA1004ctOSmXIwJy3JJFnSf4kAhBgqGhhf1JTyVjhAA==
X-Received: by 2002:a17:907:9686:b0:966:65ee:beb7 with SMTP id hd6-20020a170907968600b0096665eebeb7mr19501763ejc.71.1683909923616;
        Fri, 12 May 2023 09:45:23 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id x4-20020a1709060a4400b0095ed3befbedsm5599306ejf.54.2023.05.12.09.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 09:45:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        linux-omap@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RESEND PATCH] hwspinlock: omap: drop of_match_ptr for ID table
Date:   Fri, 12 May 2023 18:45:20 +0200
Message-Id: <20230512164520.212312-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).

  drivers/hwspinlock/omap_hwspinlock.c:164:34: error: ‘omap_hwspinlock_of_match’ defined but not used [-Werror=unused-const-variable=]

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
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

