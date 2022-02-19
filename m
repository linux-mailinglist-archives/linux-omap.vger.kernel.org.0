Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D23AB4BCACC
	for <lists+linux-omap@lfdr.de>; Sat, 19 Feb 2022 22:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243204AbiBSV4Q (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 19 Feb 2022 16:56:16 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243209AbiBSV4N (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 19 Feb 2022 16:56:13 -0500
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1B3C54685
        for <linux-omap@vger.kernel.org>; Sat, 19 Feb 2022 13:55:49 -0800 (PST)
Received: by mail-pl1-x62d.google.com with SMTP id ay3so1059539plb.1
        for <linux-omap@vger.kernel.org>; Sat, 19 Feb 2022 13:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=CHkmrYvj5o3Fvy+E5fMWk8LislxIdO58ETqj8OSQKGc=;
        b=cS7KyWnM1357k+YCng24Fih0jgFnP+ZaK0QNBtuh0U98ESMyakH971ptDSZAKHJSqr
         gQiK+13pz5YcRpIRf9RLWnb01Yt+oAM/vBAH9WkXJS+x7fXTEXqU/HwzvznPNZx7EI4D
         +9PAorOQjHodo/XaFAH5lcDpJhWbS9fIuC/nTZdVsB3+ZhVecVhmFBld6hrdzc7Z08ke
         fQDx3Ur74vXYAoaz2En6XXWMzLCckz49CRwjfPsLHdUgW1cjMiHVSdQ/O8z4tZFeoK7K
         7cutFt6sV8FRaf/7DP3/fmsfpXwFAdjFcwX2NO2pM5m3+KqUrUrp7gMiMq9sX2EuHaAw
         bbaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CHkmrYvj5o3Fvy+E5fMWk8LislxIdO58ETqj8OSQKGc=;
        b=aa3XYHgTnnhgY6vVEyfBV13dspUIzes47ai8CAA0T3fKq0QxT1RYZEklEpwIOiTNLU
         0Eqs4FmkRbqFEmeq+HG2tZbxoAknpDIEcb6JglwaO4qH3AfZsWytKw8+LB6QegYpgBhd
         z2GKhGjGxjj3rfFXLDJIhfyUSOyNV8YRcbLM1E9ut5gWCk0FrkS/acJ2d81ve6UnwIvq
         qhqt7a4nvaguvYi5ZVrbFQWzwsAw5/EfC7AryyP57BrjVkAewV/9jVYiR4MH0dlcYU+Z
         88s5gJzj7OqZS3QabYLhwspJvDUQvgSRZ1D7/+CLM8EJ5761gjUoVGwuRExixFbI3fVG
         FPAg==
X-Gm-Message-State: AOAM533WyHHnvOr2IxwGqVcKf+mOHT7CFE1uwzRHslbQJTFF7eOg5J39
        TShYMF3OBkwNUSAhz07fyrd5qA==
X-Google-Smtp-Source: ABdhPJwpaKlSS0zWq/DC5GlNZ7JnBiaOFnULT1QI8rhBXIzxuZrY1N+KNe6Y/5hmSg2nymovw4b1hg==
X-Received: by 2002:a17:903:2311:b0:14e:eb4f:4559 with SMTP id d17-20020a170903231100b0014eeb4f4559mr13034737plh.138.1645307749017;
        Sat, 19 Feb 2022 13:55:49 -0800 (PST)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1001:7090:31ab:1e81:9550:f30a])
        by smtp.gmail.com with ESMTPSA id i17sm13447337pgn.82.2022.02.19.13.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 13:55:48 -0800 (PST)
From:   Drew Fustini <dfustini@baylibre.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dave Gerlach <d-gerlach@ti.com>, devicetree@vger.kernel.org,
        Drew Fustini <dfustini@baylibre.com>,
        Keerthy <j-keerthy@ti.com>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Tony Lindgren <tony@atomide.com>, s-anna@ti.com,
        khilman@baylibre.com
Subject: [PATCH 07/11] dt-bindings: wkup_m3_ipc: Add scale-data-fw property
Date:   Sat, 19 Feb 2022 13:53:24 -0800
Message-Id: <20220219215328.485660-8-dfustini@baylibre.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220219215328.485660-1-dfustini@baylibre.com>
References: <20220219215328.485660-1-dfustini@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

From: Dave Gerlach <d-gerlach@ti.com>

Add documentation for scale-data-fw property on the wkup_m3_ipc node to
enable I2C PMIC voltage scaling. The property contains the name of a
binary file for the CM3 firmware to load.

Based on previous work by Russ Dill.

Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
Signed-off-by: Keerthy <j-keerthy@ti.com>
[dfustini: split dt-binding change into separate patch]
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 .../devicetree/bindings/soc/ti/wkup_m3_ipc.txt        | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/ti/wkup_m3_ipc.txt b/Documentation/devicetree/bindings/soc/ti/wkup_m3_ipc.txt
index df6b600abf4c..01b78a9da943 100644
--- a/Documentation/devicetree/bindings/soc/ti/wkup_m3_ipc.txt
+++ b/Documentation/devicetree/bindings/soc/ti/wkup_m3_ipc.txt
@@ -56,6 +56,17 @@ Example:
 		};
 	};
 
+Support for I2C PMIC Voltage Scaling
+--------------------
+It is possible to pass the name of a binary file to laod to the CM3 firmware
+in order to provide I2C sequences for the CM3 to send out to the PMIC during
+low power mode entry.
+
+Optional properties:
+--------------------
+- scale-data-fw:	Name of the firmware binary in /lib/firmware to copy to m3
+			aux data.
+
 Support for VTT Toggle
 ==================================
 In order to enable the support for VTT toggle during Suspend/Resume
-- 
2.32.0

