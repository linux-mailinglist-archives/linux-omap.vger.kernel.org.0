Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF860773BDE
	for <lists+linux-omap@lfdr.de>; Tue,  8 Aug 2023 17:57:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbjHHP5K (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Aug 2023 11:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjHHPza (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 8 Aug 2023 11:55:30 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78DF559F4
        for <linux-omap@vger.kernel.org>; Tue,  8 Aug 2023 08:43:41 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-99c1d03e124so764524966b.2
        for <linux-omap@vger.kernel.org>; Tue, 08 Aug 2023 08:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509409; x=1692114209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1tJ6rclTR0PEh2oroSnTnDtEG+/lNahgfPTnucDt2ik=;
        b=gBucaKh9UWbEHt9Hyzx51lYoXzgtqGTfrSe+Y0HQ2JTt/LxMTeFdPS4RSjHB1lmDwZ
         nPKLY6jRBeYYXfU00RLlSjyGvbarvQYE8NMIKhtVG5iaX/Ivx6UnysXzn6/CslNkCHjP
         zqoZr0pzCvR+Xe1K2IaV7Y6CNg9WjLqQ33kCU12PZfLG49UnqLWXzmNKoZr3rbPc/ng2
         nhBNhvmko4wv50r9j6e+NmigRqWziOSfmTXSS+gKOrPVeL1416yzQV1H5ZoXQtOVWh22
         D9NfrjOVdfBl/lFYlFwWugCb6OYSlQ6PUf96CZFskAD7ebROx4vo71UTfvQv2dvZ6NE0
         H6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509409; x=1692114209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1tJ6rclTR0PEh2oroSnTnDtEG+/lNahgfPTnucDt2ik=;
        b=gNRkKMBlNx3dMcSlMOQdsSFKGtXHYHgF/OSsUPy4wd/iF0Eavm1t5GK40cNpfFzw9W
         F9/LZoFfnrYcAfrV6Ojhmqk1XXnMfn/DbFxfWuusYor5a6fr1ZkkeR0kiBUj8xsZJwcj
         0DvLaXFulencEtnkklP4rp2jKlqiW+3FQMMr9HRk3/EU0W+hH82Zd+nyN1vW+S881/BX
         r3T0HHkzb5bfrELSb6ZfUQMrE1zOaw3x5KO5nttFXDp3ffFaI9dVxQDAPEhBBGz81w+4
         tAMJxi1Z9hj/NUrn7clLNedOcN3PreXKMHT5R4wO+AkZ9dY7L8Xb32yArrJ7FENGOplI
         Hy3A==
X-Gm-Message-State: AOJu0YzceKOPc+6zFXMbIBEmESnq8/KABtqRcFpVSZg246VmCPgsVFLo
        2NWWSBYL7unhQhFBlLSfR+EDVHUeXvBfkJgHoIc=
X-Google-Smtp-Source: AGHT+IFYJ1tDnISQpqIa3O1xFstJdgHXSmoJBbKAjvv0Omwmg90Vc69nrF9vgwo5e9S+tacn/hSCZQ==
X-Received: by 2002:a2e:9b01:0:b0:2b6:c790:150a with SMTP id u1-20020a2e9b01000000b002b6c790150amr9582164lji.22.1691502405476;
        Tue, 08 Aug 2023 06:46:45 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id u23-20020a2e8557000000b002b93d66b82asm2284493ljj.112.2023.08.08.06.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 06:46:45 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 08 Aug 2023 15:46:33 +0200
Subject: [PATCH 06/11] regulator: mt6311: Drop useless header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230808-descriptors-regulator-v1-6-939b5e84dd18@linaro.org>
References: <20230808-descriptors-regulator-v1-0-939b5e84dd18@linaro.org>
In-Reply-To: <20230808-descriptors-regulator-v1-0-939b5e84dd18@linaro.org>
To:     Tony Lindgren <tony@atomide.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The mt6311 includes the legacy header <linux/gpio.h> for no
reason, drop the include.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/regulator/mt6311-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/mt6311-regulator.c b/drivers/regulator/mt6311-regulator.c
index b0771770cc26..63a51485f2cc 100644
--- a/drivers/regulator/mt6311-regulator.c
+++ b/drivers/regulator/mt6311-regulator.c
@@ -4,7 +4,6 @@
 // Author: Henry Chen <henryc.chen@mediatek.com>
 
 #include <linux/err.h>
-#include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>

-- 
2.34.1

