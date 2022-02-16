Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E36584B8F13
	for <lists+linux-omap@lfdr.de>; Wed, 16 Feb 2022 18:22:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237076AbiBPRW0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 16 Feb 2022 12:22:26 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:57168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237075AbiBPRWZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 16 Feb 2022 12:22:25 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACB17131F7E
        for <linux-omap@vger.kernel.org>; Wed, 16 Feb 2022 09:22:11 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id o34so1640472wms.1
        for <linux-omap@vger.kernel.org>; Wed, 16 Feb 2022 09:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/NAXHTqHaH78x+T8sVGOJ2gQZ1jGHBNk1VyLMuwhC+g=;
        b=GthiHW4tjsZ9lcnGzpqU84FNocPSA4PsKarrrZfDtye0KfQOwTtottmZqPctU4GnBv
         7eWfhXypC3B23dOS0gjVZGUa3cQunHbgaZ+L+TpRclrtCcK2iqh6u0G5nmr2tkDm0h4a
         J2cq1EZ/IsmJ0wzj8Dsnj8X59NfpwnJIZYpMHrqtEXwlmidaEnftzeeF05vUBEt9kDWb
         pTkXAQKMNxHsVAOvfc9csoBM0qRXVLYdJA4TwP/rrEuZT3h7t6+lW3VFtLgL7IIOdADQ
         dwoWYgPf+iuBtKaG8rYeKI9swC0b0a4YCkesSDWRWBHeFPXWWqSD3r+AZCfxGL6XVDAy
         y1SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/NAXHTqHaH78x+T8sVGOJ2gQZ1jGHBNk1VyLMuwhC+g=;
        b=b42i25bU/JYpILJ8BOaiYvNYH9mxXBtQRSt3Tqw8Yz2x1iEb3uuMSXeCR9cBHJaHOw
         iRWR6Rew7CqC74u51sCz94IpSVg1ySTWiMyprRQVYuKYyC81KosF7Af9zFVC+Ds87gJI
         MrxMPOgCfx11EBMTfrskC1405UTBaQXGUn73TmwEnX325H/PlUVtWONbNpNZikaU8Cik
         o8oFy5MbOXngPkurYQRBHYgwbhH45unmp0qlgJhpvIutcSMKH2MrUf+M18wi8feZKnI9
         EGMnwZogFLMiG9HBdQAJEYYZMAo1xcMHmeclg+gDcSENcVbEosx6o/7eGzcAc1nMjj5Q
         7oNA==
X-Gm-Message-State: AOAM531MSk1+2C7ZwNEHKT8F1zxymNbGDD3rsbUVQ//yTce/qgXvzOOJ
        tTjVXJgm0pFetpKPnV4sremlWZ96kGtxzw==
X-Google-Smtp-Source: ABdhPJwH4hynpcgx1CRuAaoPnH7xTFd2T1HC8Yee7QqNT7H3Mpa9oRWA0+2tDL2XcKYutlWEIM0Ykg==
X-Received: by 2002:a05:600c:1f05:b0:37b:d9aa:e210 with SMTP id bd5-20020a05600c1f0500b0037bd9aae210mr2598637wmb.63.1645032130297;
        Wed, 16 Feb 2022 09:22:10 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id s7sm1282484wri.5.2022.02.16.09.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Feb 2022 09:22:09 -0800 (PST)
From:   Romain Naour <romain.naour@smile.fr>
To:     linux-omap@vger.kernel.org
Cc:     Romain Naour <romain.naour@smile.fr>
Subject: [PATCH] drivers/thermal/ti-soc-thermal: Add hwmon support
Date:   Wed, 16 Feb 2022 18:22:06 +0100
Message-Id: <20220216172206.7448-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Expose ti-soc-thermal thermal sensors as HWMON devices.

  # sensors
  cpu_thermal-virtual-0
  Adapter: Virtual device
  temp1:        +54.2 C  (crit = +105.0 C)

  dspeve_thermal-virtual-0
  Adapter: Virtual device
  temp1:        +51.4 C  (crit = +105.0 C)

  gpu_thermal-virtual-0
  Adapter: Virtual device
  temp1:        +54.2 C  (crit = +105.0 C)

  iva_thermal-virtual-0
  Adapter: Virtual device
  temp1:        +54.6 C  (crit = +105.0 C)

  core_thermal-virtual-0
  Adapter: Virtual device
  temp1:        +52.6 C  (crit = +105.0 C)

Similar to imx_sc_thermal d2bc4dd91da6095a769fdc9bc519d3be7ad5f97a.

No need to take care of thermal_remove_hwmon_sysfs() since
devm_thermal_add_hwmon_sysfs() (a wrapper around devres) is
used. See c7fc403e40b0ea18976a59e968c23439a80809e8.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
index f84375865c97..0959632b2170 100644
--- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
+++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
@@ -21,6 +21,7 @@
 
 #include "ti-thermal.h"
 #include "ti-bandgap.h"
+#include "../thermal_hwmon.h"
 
 /* common data structures */
 struct ti_thermal_data {
@@ -189,6 +190,9 @@ int ti_thermal_expose_sensor(struct ti_bandgap *bgp, int id,
 	ti_bandgap_set_sensor_data(bgp, id, data);
 	ti_bandgap_write_update_interval(bgp, data->sensor_id, interval);
 
+	if (devm_thermal_add_hwmon_sysfs(data->ti_thermal))
+		dev_warn(bgp->dev, "failed to add hwmon sysfs attributes\n");
+
 	return 0;
 }
 
-- 
2.34.1

