Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 937496A750A
	for <lists+linux-omap@lfdr.de>; Wed,  1 Mar 2023 21:16:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbjCAUQj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 1 Mar 2023 15:16:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjCAUQS (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 1 Mar 2023 15:16:18 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFD974DE29
        for <linux-omap@vger.kernel.org>; Wed,  1 Mar 2023 12:15:46 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso257383wmp.4
        for <linux-omap@vger.kernel.org>; Wed, 01 Mar 2023 12:15:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677701746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dexA46MbFD/1LJf//eW76xTgHB+gKrlRAfZ8jnkaOvM=;
        b=ukkjFNfgK59eu1LeshuNmpkbqUe+57GbYmcQvpYODW4eZc+/Eq6TviqWeezCFCnshm
         virQlpn5g0pq5dm0tCb4La0RxiEepuXJ0ATEarJnTRo5L8kW0LuVLeL/QTLb/cYJ2876
         cQbDvyf6N2XuYiBCXId7qImjTLXYL2KmFERCHLCfpfWgff35YPxmw669uMYTZEI6Od5x
         u0AdvvvxIOdT5F0INCtrz755ZtjnqQ6UMFMVp+avsAlis1j1mLMZYvb8AB88hrq18UWh
         HlmsLFhEVn9Xin7EvoiMYtCOV5K6vMHyJsJZJ8i3AV3jxXkr2z/oBGTV8Eow78dq+qQs
         GVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677701746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dexA46MbFD/1LJf//eW76xTgHB+gKrlRAfZ8jnkaOvM=;
        b=DKdPmtSDJg4W0/2sJmKgQhLQu0yOu5A/PoyGLyL8NR2Kfsv4fubJfpUjzXaaF8DJl/
         atUk6DdyOdL9t/vz2EHI0SKUYNM7l5xfHltC4RgQWhz/hgjI9LivHKojk875oyJ2b//+
         vP0I89qmEW9Pc6N1N/AcsOFD/8uaFyxE42pbOQumvjKfkyhMOKPlielf7Y6mG+x41aP1
         k23aiZ/ZaMVN6Sf6kEoR8JftcZlxIhh+ZabSzs57YvKQD+pcBU56uZsLH5wF1PyuRM+4
         d+2Np7ZstbDCOXmdWDC3g+VrYlBPwJ1iOg/utVLcvCT3SOwzZkauuTLYSfKZs+8kylkz
         q2kA==
X-Gm-Message-State: AO0yUKWVRK7SRZIY4AjBHK4jTZlqcJVZi9Xf77lgv8OF/QvmzOpMe2rF
        79EfJ738Q0fn59IcXpn+2B0dMQ==
X-Google-Smtp-Source: AK7set9sVSbQhQevjSNopAXDfJiA3HK0YMzMlVoLJ/jyJ4/SWnabQbYwdqwMzhMc8PU0zFG7/gjZ9g==
X-Received: by 2002:a05:600c:30d3:b0:3eb:376e:2b9c with SMTP id h19-20020a05600c30d300b003eb376e2b9cmr5682213wmn.36.1677701746296;
        Wed, 01 Mar 2023 12:15:46 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:6ffe:ce4f:bd31:1e6d])
        by smtp.gmail.com with ESMTPSA id x16-20020a1c7c10000000b003e70a7c1b73sm576546wmc.16.2023.03.01.12.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 12:15:45 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     rafael@kernel.org, daniel.lezcano@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ido Schimmel <idosch@nvidia.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Petr Machata <petrm@nvidia.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Balsam CHIHI <bchihi@baylibre.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Mark Brown <broonie@kernel.org>,
        netdev@vger.kernel.org (open list:MELLANOX ETHERNET SWITCH DRIVERS),
        linux-omap@vger.kernel.org (open list:TI BANDGAP AND THERMAL DRIVER),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support)
Subject: [PATCH v5 13/18] thermal: Use thermal_zone_device_type() accessor
Date:   Wed,  1 Mar 2023 21:14:41 +0100
Message-Id: <20230301201446.3713334-14-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301201446.3713334-1-daniel.lezcano@linaro.org>
References: <20230301201446.3713334-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Replace the accesses to 'tz->type' by its accessor version in order to
self-encapsulate the thermal_zone_device structure.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Reviewed-by: Ido Schimmel <idosch@nvidia.com> #mlxsw
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> #MediaTek LVTS
---
 drivers/net/ethernet/mellanox/mlxsw/core_thermal.c | 2 +-
 drivers/thermal/mediatek/lvts_thermal.c            | 6 ++++--
 drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c b/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
index 722e4a40afef..b0a169e68df9 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/core_thermal.c
@@ -177,7 +177,7 @@ mlxsw_thermal_module_trips_update(struct device *dev, struct mlxsw_core *core,
 
 	if (crit_temp > emerg_temp) {
 		dev_warn(dev, "%s : Critical threshold %d is above emergency threshold %d\n",
-			 tz->tzdev->type, crit_temp, emerg_temp);
+			 thermal_zone_device_type(tz->tzdev), crit_temp, emerg_temp);
 		return 0;
 	}
 
diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index beb835d644e2..216f53eb1385 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -305,7 +305,8 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 	 * 14-0 : Raw temperature for threshold
 	 */
 	if (low != -INT_MAX) {
-		pr_debug("%s: Setting low limit temperature interrupt: %d\n", tz->type, low);
+		pr_debug("%s: Setting low limit temperature interrupt: %d\n",
+			 thermal_zone_device_type(tz), low);
 		writel(raw_low, LVTS_H2NTHRE(base));
 	}
 
@@ -318,7 +319,8 @@ static int lvts_set_trips(struct thermal_zone_device *tz, int low, int high)
 	 *
 	 * 14-0 : Raw temperature for threshold
 	 */
-	pr_debug("%s: Setting high limit temperature interrupt: %d\n", tz->type, high);
+	pr_debug("%s: Setting high limit temperature interrupt: %d\n",
+		 thermal_zone_device_type(tz), high);
 	writel(raw_high, LVTS_HTHRE(base));
 
 	return 0;
diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
index 060f46cea5ff..0c8914017c18 100644
--- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
+++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
@@ -44,7 +44,7 @@ static void ti_thermal_work(struct work_struct *work)
 	thermal_zone_device_update(data->ti_thermal, THERMAL_EVENT_UNSPECIFIED);
 
 	dev_dbg(data->bgp->dev, "updated thermal zone %s\n",
-		data->ti_thermal->type);
+		thermal_zone_device_type(data->ti_thermal));
 }
 
 /**
-- 
2.34.1

