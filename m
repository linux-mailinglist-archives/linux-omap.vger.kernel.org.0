Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93CEF6F285E
	for <lists+linux-omap@lfdr.de>; Sun, 30 Apr 2023 11:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbjD3Jke (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 30 Apr 2023 05:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbjD3Jke (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 30 Apr 2023 05:40:34 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B026310E7
        for <linux-omap@vger.kernel.org>; Sun, 30 Apr 2023 02:40:32 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2ab25e8a4a7so13495321fa.3
        for <linux-omap@vger.kernel.org>; Sun, 30 Apr 2023 02:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682847631; x=1685439631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T4tW+JUvn0qJYJh6zL1Rp2b6Ylx+5Npn6jfzpDtcTac=;
        b=W+BzE8AjB8VgucIEZr6hYJSw+KZoryXAGtWgZoAVenY6PUzDkmfl4uVxAH3aE4oPrI
         hnIwuS5pcmQw3VDESRDE8q9yy/yTe+A4/Rq6xtFdby3jP2VVzAp+MzhMRM/EhxtdAdG5
         U0KMWqQn3xM5Cj3NGJJxozhZqbKTcHcs5I055ecS0ZDN9fgEne4T964po/Zk/hmDMF/H
         OG7oKbIwMvSg5XLJc9JXR8mlHZAfkNz5mIFvDKgMWWWsVJzf5QVMTquKCd1vyJc+rX/M
         Idv7UH8uwENYTtiJbO1STehEMUNAoUQAQz3dYSWeMir0bHyQwDACXija+4+vmdVeCHTd
         ecVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682847631; x=1685439631;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4tW+JUvn0qJYJh6zL1Rp2b6Ylx+5Npn6jfzpDtcTac=;
        b=V60G3/Bz+4kRVHMjLFfL8N7OBknYlXPDR7q6TqRpQzmJywDWoRhSyewaDbC1LQWTre
         puY1y6dbtp2oc6mkqVqhdqia/fRG/NNNHin9PEmDOpnuZCJoZaS1ZklpFnOaRMcvHwpi
         CBvRjgiyk9f1kHGmSLBpOcI6Dp0DmReHVoblNNLpD19GZd0B1g5FaoXcLeHRPo7i6HRi
         Uyo+PYxqggk7Ac2SQjCzSSTyUyqrUGlh2Rl7EDSrMzHSgYC6ibKo0Z2L3/mvFAJgEOU/
         xvxw8tqqLUwcGtW65f+vLughKcgM9h8pJqx8MpHAyheVqWxxEXc8A2MSVeDjVgZs12Wq
         JwFA==
X-Gm-Message-State: AC+VfDzeviV8bK82+i215FHO8mUgtx0amrCgRN6SBwzbtvnqvwRn2lI2
        uw11zDILsNHcJKFXFirV+d2Heiz8Femjo/5faU8=
X-Google-Smtp-Source: ACHHUZ6jUSVndIeUg43gzYQk8xPeTWDVJSLSBiZlOIO5+J7NG9oFe1nXrqHIqfq1aMbWQiZxWRY4uA==
X-Received: by 2002:a2e:901a:0:b0:2a8:abaa:794e with SMTP id h26-20020a2e901a000000b002a8abaa794emr2875054ljg.28.1682847631010;
        Sun, 30 Apr 2023 02:40:31 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id u24-20020a2e8558000000b002a7aa25c3b6sm4082988ljj.88.2023.04.30.02.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 02:40:30 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: omap1: Drop header on AMS Delta
Date:   Sun, 30 Apr 2023 11:40:28 +0200
Message-Id: <20230430094028.561451-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The AMS Delta board uses GPIO descriptors exclusively and
does not have any dependencies on the legacy <linux/gpio.h>
header, so just drop it.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-omap1/board-ams-delta.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 9108c871d129..ac47ab9fe096 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -11,7 +11,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/consumer.h>
-#include <linux/gpio.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/input.h>
-- 
2.34.1

