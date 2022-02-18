Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB7E54BB737
	for <lists+linux-omap@lfdr.de>; Fri, 18 Feb 2022 11:48:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233059AbiBRKsK (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 18 Feb 2022 05:48:10 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232023AbiBRKsK (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 18 Feb 2022 05:48:10 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67F3E15A02
        for <linux-omap@vger.kernel.org>; Fri, 18 Feb 2022 02:47:53 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id v12so13868265wrv.2
        for <linux-omap@vger.kernel.org>; Fri, 18 Feb 2022 02:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/NAXHTqHaH78x+T8sVGOJ2gQZ1jGHBNk1VyLMuwhC+g=;
        b=ELqApx/nj5zvhbHYyDfDfFr3aBTNL8JZQOkUsl23VWKlKB4vyQlqkNqf/b7NGtj7ak
         ZxiZ2N+03n25ZkKbdEXuy9Cw1biGP1jEehR3sKBiD7a91KBk95a+/gDQQeIRClNx541R
         NZhyUP5Xa84AiLUmKbn7cm37IYbVJVJd3EGPtxH6xuwJwDlCeEcSi6skuolQUwa7Al0E
         fNSuYgo78VNCYoAFFyqhyCUE28acknwMjKydyD1KuM2qdbMfWthzKz2o10Wn7U9OSHqP
         +pKSklot1iQB+yMHKgjAZw5tVrGsl9K7U9h+oVR9RGyCClEGJNoOawAFY9o09/IhQH6+
         qXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/NAXHTqHaH78x+T8sVGOJ2gQZ1jGHBNk1VyLMuwhC+g=;
        b=Dc6tnP7NWHoSME0jNSLHM/FtL5542zac1JZR2/iYUQhdUyuOilIjByTzWqVrcwvknr
         rCdG8eibEkv5Ade2+ONeWJmnpT39eK6/LmmjqqPc+b2FGvaw/q5JE74DQ3TdNRim+iC6
         W5zLOusUaVfhCIayCa6126idUPYa6kpyT/pzaGBlzRc7SyuNw2yhL5PQ6h/xpEDZ6M9w
         pZwNuXQ7NhLvXOY9OWFryJjJrOhUG3Vq4bcx+HnmrvONKN6/4SCnB8Q9mcycPat1Ctq6
         s2SJTynbttDWFc6LBrk34kbZ+SCCwc1q0gXgpWBVZ7a/tMDhg4y3c9a2XksXNUZw4Z3Y
         jFHw==
X-Gm-Message-State: AOAM533FBzbT2loEaVoeEtv6Dw2sQwg9zCGz9v80UzcyO+EnFw5yP6jO
        qVSYEsR084RXxvTw4NrbEdgGhQ==
X-Google-Smtp-Source: ABdhPJy5ub4bz/4FbMdXE7kBnFr9y51RMw7niKkrpl+lfi1V+6YzanliVJMb5QhJm3LaPjxlCLX+qQ==
X-Received: by 2002:adf:f3cc:0:b0:1e7:4fd9:6fd3 with SMTP id g12-20020adff3cc000000b001e74fd96fd3mr5370603wrp.266.1645181271952;
        Fri, 18 Feb 2022 02:47:51 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id b11sm16823250wrd.31.2022.02.18.02.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 02:47:51 -0800 (PST)
From:   Romain Naour <romain.naour@smile.fr>
To:     linux-pm@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     j-keerthy@ti.com, edubezval@gmail.com,
        Romain Naour <romain.naour@smile.fr>
Subject: [PATCH] drivers/thermal/ti-soc-thermal: Add hwmon support
Date:   Fri, 18 Feb 2022 11:47:25 +0100
Message-Id: <20220218104725.2718904-1-romain.naour@smile.fr>
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

