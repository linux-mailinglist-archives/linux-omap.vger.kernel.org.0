Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C98E69C0C4
	for <lists+linux-omap@lfdr.de>; Sun, 19 Feb 2023 15:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230166AbjBSOi3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 19 Feb 2023 09:38:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230248AbjBSOiX (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sun, 19 Feb 2023 09:38:23 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C23FFAD1D
        for <linux-omap@vger.kernel.org>; Sun, 19 Feb 2023 06:37:58 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id j41-20020a05600c1c2900b003e1e754657aso554021wms.2
        for <linux-omap@vger.kernel.org>; Sun, 19 Feb 2023 06:37:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/N/PusoT+hDJ8mhxwt7gAFO4vRcraA+apO1+Zvf8Ao=;
        b=dXdJbs92siaoCYwl/ajGVp4YuI2jjPE4kHE41wCR9fO+GllbGhGOjR2ARb2+k45MkY
         oe9bNl6ueGIKEUWQmV7PX9WpZ6o7HrZQIDLG7r9TpgGlfUydarNL4iaY1MwvvCm4vOM+
         HBkEYW3NzF7STStypOLML79Lpr4XLxXIiqgHBvreCxa1AgIFNuEVs4kzQ0ta/Vr47vUR
         y2cUJ104CHPVm3RN6WLFXs9sAr9MC58rvhRq1/F4UCX/n4hiwBctWjbGutT4CFicQyD9
         hU3sBDcowGUs1Fa+hi8ID1FB+XguXSKJtgRHvNFoWsJowAxolE2aeN6vZG3ypPYnA4U0
         AdyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/N/PusoT+hDJ8mhxwt7gAFO4vRcraA+apO1+Zvf8Ao=;
        b=MeL2PUzXNxcbN/Pat3zL4MNvaSe+vSKUgI/60B9EQaOcsDDb2W4SN4CF83Q0MUm9KU
         R3JiUhhORx7cCKaWvF/U+/O1mZEYviU1bVrOAQ6duXDUYkpI1wCprmb+d24mS2572Kix
         UssTCd828K2kCpxwq+0XLH0RmQ3XpZJTsAd1je5blMbOfS1woaMmSuqmuEGUjcPFK9SY
         J4iAgxyeSA+eURKsv/qX5QHAGilJCBHyIo3HCN5wvrsFGFudEUWXluXburFhdwUa5LqU
         KY1H+t4RJRICuxJ8LVzixpdP5HZjJ5qd7Yo/2BjK29m/XI5sQv7/nkQMyfqQP9aPPd9e
         PNUw==
X-Gm-Message-State: AO0yUKW7KDMxkPHsHQUaHLE/Z2TiG8uKSARI3PVsTKaImmA9bp0+fy7u
        GYorxzIceMsT3E+GzAp761n6MQ==
X-Google-Smtp-Source: AK7set92wguRhlEv6GXujA4tqELo1AZxoqd4sByefmk7Dqmh3mm+83wnvuaS9sAzZifH5oTtjzoYoA==
X-Received: by 2002:a05:600c:4b10:b0:3e2:9b4:4303 with SMTP id i16-20020a05600c4b1000b003e209b44303mr9955738wmp.19.1676817476807;
        Sun, 19 Feb 2023 06:37:56 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:6f43:b92:7670:463])
        by smtp.gmail.com with ESMTPSA id a18-20020adfe5d2000000b002be505ab59asm86176wrn.97.2023.02.19.06.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Feb 2023 06:37:56 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     rafael@kernel.org, daniel.lezcano@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Guillaume La Roque <glaroque@baylibre.com>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Daniel Golle <daniel@makrotopia.org>,
        ye xingchen <ye.xingchen@zte.com.cn>,
        Randy Dunlap <rdunlap@infradead.org>,
        Balsam CHIHI <bchihi@baylibre.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-amlogic@lists.infradead.org (open list:THERMAL DRIVER FOR AMLOGIC
        SOCS),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX
        / MXC ARM ARCHITECTURE),
        linux-arm-msm@vger.kernel.org (open list:QUALCOMM TSENS THERMAL DRIVER),
        linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
        linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
        linux-omap@vger.kernel.org (open list:TI BANDGAP AND THERMAL DRIVER),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC
        support)
Subject: [PATCH v1 05/17] thermal/hwmon: Use the right device for devm_thermal_add_hwmon_sysfs()
Date:   Sun, 19 Feb 2023 15:36:45 +0100
Message-Id: <20230219143657.241542-6-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230219143657.241542-1-daniel.lezcano@linaro.org>
References: <20230219143657.241542-1-daniel.lezcano@linaro.org>
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

The devres variant of thermal_add_hwmon_sysfs() only takes the thermal
zone structure pointer as parameter.

Actually, it uses the tz->device to add it in the devres list.

It is preferable to use the device registering the thermal zone
instead of the thermal zone device itself. That prevents the driver
accessing the thermal zone structure internals and it is from my POV
more correct regarding how devm_ is used.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/amlogic_thermal.c                  | 2 +-
 drivers/thermal/imx8mm_thermal.c                   | 2 +-
 drivers/thermal/imx_sc_thermal.c                   | 2 +-
 drivers/thermal/k3_bandgap.c                       | 2 +-
 drivers/thermal/mediatek/auxadc_thermal.c          | 2 +-
 drivers/thermal/qcom/qcom-spmi-adc-tm5.c           | 2 +-
 drivers/thermal/qcom/qcom-spmi-temp-alarm.c        | 2 +-
 drivers/thermal/qcom/tsens.c                       | 2 +-
 drivers/thermal/qoriq_thermal.c                    | 2 +-
 drivers/thermal/sun8i_thermal.c                    | 2 +-
 drivers/thermal/tegra/tegra30-tsensor.c            | 2 +-
 drivers/thermal/thermal_hwmon.c                    | 4 ++--
 drivers/thermal/thermal_hwmon.h                    | 4 ++--
 drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 2 +-
 14 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
index 9235fda4ec1e..337153042318 100644
--- a/drivers/thermal/amlogic_thermal.c
+++ b/drivers/thermal/amlogic_thermal.c
@@ -285,7 +285,7 @@ static int amlogic_thermal_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (devm_thermal_add_hwmon_sysfs(pdata->tzd))
+	if (devm_thermal_add_hwmon_sysfs(&pdev->dev, pdata->tzd))
 		dev_warn(&pdev->dev, "Failed to add hwmon sysfs attributes\n");
 
 	ret = amlogic_thermal_initialize(pdata);
diff --git a/drivers/thermal/imx8mm_thermal.c b/drivers/thermal/imx8mm_thermal.c
index 750240f4fa32..e0830dcec4a0 100644
--- a/drivers/thermal/imx8mm_thermal.c
+++ b/drivers/thermal/imx8mm_thermal.c
@@ -343,7 +343,7 @@ static int imx8mm_tmu_probe(struct platform_device *pdev)
 		}
 		tmu->sensors[i].hw_id = i;
 
-		if (devm_thermal_add_hwmon_sysfs(tmu->sensors[i].tzd))
+		if (devm_thermal_add_hwmon_sysfs(&pdev->dev, tmu->sensors[i].tzd))
 			dev_warn(&pdev->dev, "failed to add hwmon sysfs attributes\n");
 	}
 
diff --git a/drivers/thermal/imx_sc_thermal.c b/drivers/thermal/imx_sc_thermal.c
index 26102d1c6bde..631bda2401eb 100644
--- a/drivers/thermal/imx_sc_thermal.c
+++ b/drivers/thermal/imx_sc_thermal.c
@@ -116,7 +116,7 @@ static int imx_sc_thermal_probe(struct platform_device *pdev)
 			return ret;
 		}
 
-		if (devm_thermal_add_hwmon_sysfs(sensor->tzd))
+		if (devm_thermal_add_hwmon_sysfs(&pdev->dev, sensor->tzd))
 			dev_warn(&pdev->dev, "failed to add hwmon sysfs attributes\n");
 	}
 
diff --git a/drivers/thermal/k3_bandgap.c b/drivers/thermal/k3_bandgap.c
index 8cbd7361b492..ee059997d00d 100644
--- a/drivers/thermal/k3_bandgap.c
+++ b/drivers/thermal/k3_bandgap.c
@@ -222,7 +222,7 @@ static int k3_bandgap_probe(struct platform_device *pdev)
 			goto err_alloc;
 		}
 
-		if (devm_thermal_add_hwmon_sysfs(data[id].tzd))
+		if (devm_thermal_add_hwmon_sysfs(dev, data[id].tzd))
 			dev_warn(dev, "Failed to add hwmon sysfs attributes\n");
 	}
 
diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index d7bf725d224b..d4b8246d4991 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -1210,7 +1210,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		goto err_disable_clk_peri_therm;
 	}
 
-	ret = devm_thermal_add_hwmon_sysfs(tzdev);
+	ret = devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
 	if (ret)
 		dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
 
diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
index b0269daf128a..e3c8c9dc93e2 100644
--- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
+++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
@@ -689,7 +689,7 @@ static int adc_tm5_register_tzd(struct adc_tm5_chip *adc_tm)
 			return PTR_ERR(tzd);
 		}
 		adc_tm->channels[i].tzd = tzd;
-		if (devm_thermal_add_hwmon_sysfs(tzd))
+		if (devm_thermal_add_hwmon_sysfs(adc_tm->dev, tzd))
 			dev_warn(adc_tm->dev,
 				 "Failed to add hwmon sysfs attributes\n");
 	}
diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
index c817b03deb00..f82e0051d30e 100644
--- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
+++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
@@ -459,7 +459,7 @@ static int qpnp_tm_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	if (devm_thermal_add_hwmon_sysfs(chip->tz_dev))
+	if (devm_thermal_add_hwmon_sysfs(&pdev->dev, chip->tz_dev))
 		dev_warn(&pdev->dev,
 			 "Failed to add hwmon sysfs attributes\n");
 
diff --git a/drivers/thermal/qcom/tsens.c b/drivers/thermal/qcom/tsens.c
index 8020ead2794e..49c1fdca36dd 100644
--- a/drivers/thermal/qcom/tsens.c
+++ b/drivers/thermal/qcom/tsens.c
@@ -1189,7 +1189,7 @@ static int tsens_register(struct tsens_priv *priv)
 		if (priv->ops->enable)
 			priv->ops->enable(priv, i);
 
-		if (devm_thermal_add_hwmon_sysfs(tzd))
+		if (devm_thermal_add_hwmon_sysfs(priv->dev, tzd))
 			dev_warn(priv->dev,
 				 "Failed to add hwmon sysfs attributes\n");
 	}
diff --git a/drivers/thermal/qoriq_thermal.c b/drivers/thermal/qoriq_thermal.c
index 8b6fe0c9ade2..e6f244d18c59 100644
--- a/drivers/thermal/qoriq_thermal.c
+++ b/drivers/thermal/qoriq_thermal.c
@@ -157,7 +157,7 @@ static int qoriq_tmu_register_tmu_zone(struct device *dev,
 			return ret;
 		}
 
-		if (devm_thermal_add_hwmon_sysfs(tzd))
+		if (devm_thermal_add_hwmon_sysfs(dev, tzd))
 			dev_warn(dev,
 				 "Failed to add hwmon sysfs attributes\n");
 
diff --git a/drivers/thermal/sun8i_thermal.c b/drivers/thermal/sun8i_thermal.c
index 085b7b0b7c72..ec4aa60dd1fb 100644
--- a/drivers/thermal/sun8i_thermal.c
+++ b/drivers/thermal/sun8i_thermal.c
@@ -475,7 +475,7 @@ static int sun8i_ths_register(struct ths_device *tmdev)
 		if (IS_ERR(tmdev->sensor[i].tzd))
 			return PTR_ERR(tmdev->sensor[i].tzd);
 
-		if (devm_thermal_add_hwmon_sysfs(tmdev->sensor[i].tzd))
+		if (devm_thermal_add_hwmon_sysfs(tmdev->dev, tmdev->sensor[i].tzd))
 			dev_warn(tmdev->dev,
 				 "Failed to add hwmon sysfs attributes\n");
 	}
diff --git a/drivers/thermal/tegra/tegra30-tsensor.c b/drivers/thermal/tegra/tegra30-tsensor.c
index 537413acc6d2..ceb5b1b338a9 100644
--- a/drivers/thermal/tegra/tegra30-tsensor.c
+++ b/drivers/thermal/tegra/tegra30-tsensor.c
@@ -528,7 +528,7 @@ static int tegra_tsensor_register_channel(struct tegra_tsensor *ts,
 		return 0;
 	}
 
-	if (devm_thermal_add_hwmon_sysfs(tsc->tzd))
+	if (devm_thermal_add_hwmon_sysfs(ts->dev, tsc->tzd))
 		dev_warn(ts->dev, "failed to add hwmon sysfs attributes\n");
 
 	return 0;
diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_hwmon.c
index c594c42bea6d..964db7941e31 100644
--- a/drivers/thermal/thermal_hwmon.c
+++ b/drivers/thermal/thermal_hwmon.c
@@ -263,7 +263,7 @@ static void devm_thermal_hwmon_release(struct device *dev, void *res)
 	thermal_remove_hwmon_sysfs(*(struct thermal_zone_device **)res);
 }
 
-int devm_thermal_add_hwmon_sysfs(struct thermal_zone_device *tz)
+int devm_thermal_add_hwmon_sysfs(struct device *dev, struct thermal_zone_device *tz)
 {
 	struct thermal_zone_device **ptr;
 	int ret;
@@ -280,7 +280,7 @@ int devm_thermal_add_hwmon_sysfs(struct thermal_zone_device *tz)
 	}
 
 	*ptr = tz;
-	devres_add(&tz->device, ptr);
+	devres_add(dev, ptr);
 
 	return ret;
 }
diff --git a/drivers/thermal/thermal_hwmon.h b/drivers/thermal/thermal_hwmon.h
index 1a9d65f6a6a8..b429f6e7abdb 100644
--- a/drivers/thermal/thermal_hwmon.h
+++ b/drivers/thermal/thermal_hwmon.h
@@ -17,7 +17,7 @@
 
 #ifdef CONFIG_THERMAL_HWMON
 int thermal_add_hwmon_sysfs(struct thermal_zone_device *tz);
-int devm_thermal_add_hwmon_sysfs(struct thermal_zone_device *tz);
+int devm_thermal_add_hwmon_sysfs(struct device *dev, struct thermal_zone_device *tz);
 void thermal_remove_hwmon_sysfs(struct thermal_zone_device *tz);
 #else
 static inline int
@@ -27,7 +27,7 @@ thermal_add_hwmon_sysfs(struct thermal_zone_device *tz)
 }
 
 static inline int
-devm_thermal_add_hwmon_sysfs(struct thermal_zone_device *tz)
+devm_thermal_add_hwmon_sysfs(struct device *dev, struct thermal_zone_device *tz)
 {
 	return 0;
 }
diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
index 7f6b71d11eed..9fb1ca5e39f6 100644
--- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
+++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
@@ -182,7 +182,7 @@ int ti_thermal_expose_sensor(struct ti_bandgap *bgp, int id,
 	ti_bandgap_set_sensor_data(bgp, id, data);
 	ti_bandgap_write_update_interval(bgp, data->sensor_id, interval);
 
-	if (devm_thermal_add_hwmon_sysfs(data->ti_thermal))
+	if (devm_thermal_add_hwmon_sysfs(bgp->dev, data->ti_thermal))
 		dev_warn(bgp->dev, "failed to add hwmon sysfs attributes\n");
 
 	return 0;
-- 
2.34.1

