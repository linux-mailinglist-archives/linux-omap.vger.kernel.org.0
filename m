Return-Path: <linux-omap+bounces-2662-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE259C50C8
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2024 09:36:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F2A41F22FEF
	for <lists+linux-omap@lfdr.de>; Tue, 12 Nov 2024 08:36:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632C820C01C;
	Tue, 12 Nov 2024 08:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="YxSo4ZTK"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCC020C019
	for <linux-omap@vger.kernel.org>; Tue, 12 Nov 2024 08:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731400558; cv=none; b=AmubBX7umz2lGPtP30pcY1hVsfIVcwxfgXpUOBXSstitTs8IOTP18gGpVuTeeyZbOUcNL7gSxrnKtiC4qHdyr6M7I4XDv4/ROFGsj67HQhIPmAKdxULjx7wAx4/ujQY8V4qxWzOrasVu5mi0CmDBOUVJyIdHSbs+pd8W5/OiUtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731400558; c=relaxed/simple;
	bh=rgLboLCaUdlJWjcAhhH52j9nJn/G65xEOruyM378a48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=tbUBMwfAdv44mWYpGahPydZ+Mqw5Amv8zqIKmXIhdpDbK0lGEe9p3UCKvnqWDhe1HxV4FAwjbtqpvNPC2vrsxFn9iD+pdP6BAcyHX1pT+I0IHRI8RlHQUgilhGSJXM304Sm7iS2kWSg8LMU09u3e370KQ2OVHy9q0/4+3sDv24w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=YxSo4ZTK; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-37d538fe5f2so3921899f8f.2
        for <linux-omap@vger.kernel.org>; Tue, 12 Nov 2024 00:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1731400554; x=1732005354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qJl6gQahQ6INKrNHbk0dBjtN96KRkbwEjYWLmPhvKrg=;
        b=YxSo4ZTK8da2r+CZIRmynfNIbMhH5at8AFZQs9xEzbYlQ+7Kv1i9Jj76IW9xsPSvVX
         r3nNrqfWrAuiDc+uW9lUI/ZaEhCWNqfjpsWKYqx6Ti6M795IqJzq9x2QnaPJvtnL25pW
         3qWKGFTi0NlZkpdWuRUn3GL/VLYa+JUhP1M5ZN1ApwgvewDvQOx6ngNY9LrmGxM0aBv1
         aLi794joOiSvXIjFXIzunKJR2i/O1SifobDeHzhyRPa8Z31j1aFjwubK9w64VQvgBixc
         wZV6J/eATh+p4+yeM+iEHb4V373No3VzTKpxbqXtLVRGgEY1MrFyoLLqioqhZqlzbT3c
         wGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731400554; x=1732005354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJl6gQahQ6INKrNHbk0dBjtN96KRkbwEjYWLmPhvKrg=;
        b=S4pVRJl2ARCRCXjlAAvfGt1F7/z1iev39a1t9BA3s228KhrU6T8vs1fDzfaLsHNNQ5
         SyKvlfznqAQotEyAvOH1HubUD1gy2nIEMSRa48IkJfNDTATYE8vhwaWtUVSZx5d9UzHm
         jhIxvT4d3WON2wQDN1IPWIEtFRN1BmbgyKSpxI3loNacSv/DU5tLbF+IjChMcn+ptKHg
         SEtfMWToe6omjP7RAewtDwCeIJgmcX1MwSQq90GohLIwGxWmdtwKVbc9ZmAcGZ7qe3fr
         JZADfvpKq0P9l8qNUCpxXFStaq6IzD1Y/6NHpGRIqXbQw1eSpq661OLVS1Q5v+oYFjtX
         8Hug==
X-Forwarded-Encrypted: i=1; AJvYcCUmprd7rLNNGV2uEAe7ybxxRVLkAISwJLhav/UgKt4czZsM/KvKbaZdrK1KRS0tPoX4gyq1LUoy25gU@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6FIA4KB3LWW6OnGE4gmwS9yQKyOaqBmMo6J8YIjFZHFmoVC9m
	zY8lReiOGTMGCaaWXXHfPmfNQxYGyxFUwYlgWCt18/U72iDlkgKdJakkzTOFPss=
X-Google-Smtp-Source: AGHT+IGc0QiVA+jVnUwTo6TMUTaOQP8dwxrO1h8wUeEf48cEcgf/wVeBxK6XAbl4jJoqNqJWMj+z9g==
X-Received: by 2002:a5d:5889:0:b0:37d:48ec:547 with SMTP id ffacd0b85a97d-381f17255c8mr15078629f8f.29.1731400553962;
        Tue, 12 Nov 2024 00:35:53 -0800 (PST)
Received: from localhost (p509159f1.dip0.t-ipconnect.de. [80.145.89.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05e5871sm202196645e9.37.2024.11.12.00.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 00:35:53 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Jay Fang <f.fangjian@huawei.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Andre Przywara <andre.przywara@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sumit Garg <sumit.garg@linaro.org>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	Zhang Zekun <zhangzekun11@huawei.com>,
	"Ricardo B. Marliere" <ricardo@marliere.net>,
	Sean Young <sean@mess.org>,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	soc@lists.linux.dev
Subject: [PATCH] bus: Switch back to struct platform_driver::remove()
Date: Tue, 12 Nov 2024 09:35:19 +0100
Message-ID:  <77ef3031ad2d27f4ae695245cf7f62b3f9dda859.1731397206.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=8332; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=rgLboLCaUdlJWjcAhhH52j9nJn/G65xEOruyM378a48=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnMxNVqYnKYsfMQYFqk+WxukXoIil0oOuioJU68 rc4Lnvd5h2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZzMTVQAKCRCPgPtYfRL+ Tk8sB/0aNAqsBtbPSP+Lj7YIcg4DYUH0S8Kqu7f/eS/cA0InWB6J2mcYPq2uv9DlsTgwK78O7QT cfETM/MRIpzCqXJlq6a8NsUrX1yhAdWpV0eYbgory/mSdNsNP1kypKWIFZqsDR1o5bQNfnyEod4 bzUOUK+g1lAuuVcG1I7V0j9u6zaOHQRNljBrlhbIvFrr9hlZk2WUil97+6y+ucmR98Y9Z0J8f4J o+r4fDsFdsR1ewqoFCYiTnGXaMxuGDJG3Hmjeqctqqg/3VwRh0RmXe+vp73pv72CpvnQzyh2Sci N6YYg4E9YDcBegCIZxWRPuxwCszNsJRwiNtU2TArRMENAfLQ
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all platform drivers below drivers/bus to use .remove(), with
the eventual goal to drop struct platform_driver::remove_new(). As
.remove() and .remove_new() have the same prototypes, conversion is done
by just changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I did a single patch for all of drivers/bus. While I usually prefer to
do one logical change per patch, this seems to be overengineering here
as the individual changes are really trivial and shouldn't be much in
the way for stable backports. But I'll happily split the patch if you
prefer it split. Also if you object the indentation stuff, I can rework
that. There is no dedicated maintainer for drivers/bus, maybe Arnd can
merge this via armsoc?

This is based on yesterday's next, if conflicts arise when you apply it
at some later time and don't want to resolve them, feel free to just
drop the changes to the conflicting files. I'll notice and followup at a
later time then. Or ask me for a fixed resend. (Having said that, I
recommend b4 am -3 + git am -3 which should resolve most conflicts just
fine.)

Best regards
Uwe

 drivers/bus/fsl-mc/fsl-mc-bus.c  | 2 +-
 drivers/bus/hisi_lpc.c           | 2 +-
 drivers/bus/omap-ocp2scp.c       | 2 +-
 drivers/bus/omap_l3_smx.c        | 2 +-
 drivers/bus/qcom-ssc-block-bus.c | 2 +-
 drivers/bus/simple-pm-bus.c      | 2 +-
 drivers/bus/sun50i-de2.c         | 2 +-
 drivers/bus/sunxi-rsb.c          | 2 +-
 drivers/bus/tegra-aconnect.c     | 2 +-
 drivers/bus/tegra-gmi.c          | 2 +-
 drivers/bus/ti-pwmss.c           | 2 +-
 drivers/bus/ti-sysc.c            | 2 +-
 drivers/bus/ts-nbus.c            | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
index 930d8a3ba722..2916d1333649 100644
--- a/drivers/bus/fsl-mc/fsl-mc-bus.c
+++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
@@ -1210,7 +1210,7 @@ static struct platform_driver fsl_mc_bus_driver = {
 		   .acpi_match_table = fsl_mc_bus_acpi_match_table,
 		   },
 	.probe = fsl_mc_bus_probe,
-	.remove_new = fsl_mc_bus_remove,
+	.remove = fsl_mc_bus_remove,
 	.shutdown = fsl_mc_bus_remove,
 };
 
diff --git a/drivers/bus/hisi_lpc.c b/drivers/bus/hisi_lpc.c
index 09340adbacc2..53dd1573e323 100644
--- a/drivers/bus/hisi_lpc.c
+++ b/drivers/bus/hisi_lpc.c
@@ -689,6 +689,6 @@ static struct platform_driver hisi_lpc_driver = {
 		.acpi_match_table = hisi_lpc_acpi_match,
 	},
 	.probe = hisi_lpc_probe,
-	.remove_new = hisi_lpc_remove,
+	.remove = hisi_lpc_remove,
 };
 builtin_platform_driver(hisi_lpc_driver);
diff --git a/drivers/bus/omap-ocp2scp.c b/drivers/bus/omap-ocp2scp.c
index 7d7479ba0a75..e4dfda7b3b10 100644
--- a/drivers/bus/omap-ocp2scp.c
+++ b/drivers/bus/omap-ocp2scp.c
@@ -101,7 +101,7 @@ MODULE_DEVICE_TABLE(of, omap_ocp2scp_id_table);
 
 static struct platform_driver omap_ocp2scp_driver = {
 	.probe		= omap_ocp2scp_probe,
-	.remove_new	= omap_ocp2scp_remove,
+	.remove		= omap_ocp2scp_remove,
 	.driver		= {
 		.name	= "omap-ocp2scp",
 		.of_match_table = of_match_ptr(omap_ocp2scp_id_table),
diff --git a/drivers/bus/omap_l3_smx.c b/drivers/bus/omap_l3_smx.c
index ee6d29925e4d..7f0a8f8b3f4c 100644
--- a/drivers/bus/omap_l3_smx.c
+++ b/drivers/bus/omap_l3_smx.c
@@ -273,7 +273,7 @@ static void omap3_l3_remove(struct platform_device *pdev)
 
 static struct platform_driver omap3_l3_driver = {
 	.probe		= omap3_l3_probe,
-	.remove_new     = omap3_l3_remove,
+	.remove         = omap3_l3_remove,
 	.driver         = {
 		.name   = "omap_l3_smx",
 		.of_match_table = of_match_ptr(omap3_l3_match),
diff --git a/drivers/bus/qcom-ssc-block-bus.c b/drivers/bus/qcom-ssc-block-bus.c
index 5931974a21fa..85d781a32df4 100644
--- a/drivers/bus/qcom-ssc-block-bus.c
+++ b/drivers/bus/qcom-ssc-block-bus.c
@@ -373,7 +373,7 @@ MODULE_DEVICE_TABLE(of, qcom_ssc_block_bus_of_match);
 
 static struct platform_driver qcom_ssc_block_bus_driver = {
 	.probe = qcom_ssc_block_bus_probe,
-	.remove_new = qcom_ssc_block_bus_remove,
+	.remove = qcom_ssc_block_bus_remove,
 	.driver = {
 		.name = "qcom-ssc-block-bus",
 		.of_match_table = qcom_ssc_block_bus_of_match,
diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index 50870c827889..5dea31769f9a 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -128,7 +128,7 @@ MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);
 
 static struct platform_driver simple_pm_bus_driver = {
 	.probe = simple_pm_bus_probe,
-	.remove_new = simple_pm_bus_remove,
+	.remove = simple_pm_bus_remove,
 	.driver = {
 		.name = "simple-pm-bus",
 		.of_match_table = simple_pm_bus_of_match,
diff --git a/drivers/bus/sun50i-de2.c b/drivers/bus/sun50i-de2.c
index 3339311ce068..dfe588179aca 100644
--- a/drivers/bus/sun50i-de2.c
+++ b/drivers/bus/sun50i-de2.c
@@ -36,7 +36,7 @@ static const struct of_device_id sun50i_de2_bus_of_match[] = {
 
 static struct platform_driver sun50i_de2_bus_driver = {
 	.probe = sun50i_de2_bus_probe,
-	.remove_new = sun50i_de2_bus_remove,
+	.remove = sun50i_de2_bus_remove,
 	.driver = {
 		.name = "sun50i-de2-bus",
 		.of_match_table = sun50i_de2_bus_of_match,
diff --git a/drivers/bus/sunxi-rsb.c b/drivers/bus/sunxi-rsb.c
index a89d78925637..7a33c3b31d1e 100644
--- a/drivers/bus/sunxi-rsb.c
+++ b/drivers/bus/sunxi-rsb.c
@@ -832,7 +832,7 @@ MODULE_DEVICE_TABLE(of, sunxi_rsb_of_match_table);
 
 static struct platform_driver sunxi_rsb_driver = {
 	.probe = sunxi_rsb_probe,
-	.remove_new = sunxi_rsb_remove,
+	.remove = sunxi_rsb_remove,
 	.driver	= {
 		.name = RSB_CTRL_NAME,
 		.of_match_table = sunxi_rsb_of_match_table,
diff --git a/drivers/bus/tegra-aconnect.c b/drivers/bus/tegra-aconnect.c
index de80008bff92..90e3b0a10816 100644
--- a/drivers/bus/tegra-aconnect.c
+++ b/drivers/bus/tegra-aconnect.c
@@ -104,7 +104,7 @@ MODULE_DEVICE_TABLE(of, tegra_aconnect_of_match);
 
 static struct platform_driver tegra_aconnect_driver = {
 	.probe = tegra_aconnect_probe,
-	.remove_new = tegra_aconnect_remove,
+	.remove = tegra_aconnect_remove,
 	.driver = {
 		.name = "tegra-aconnect",
 		.of_match_table = tegra_aconnect_of_match,
diff --git a/drivers/bus/tegra-gmi.c b/drivers/bus/tegra-gmi.c
index f5d6414df9f2..9c09141961d8 100644
--- a/drivers/bus/tegra-gmi.c
+++ b/drivers/bus/tegra-gmi.c
@@ -303,7 +303,7 @@ MODULE_DEVICE_TABLE(of, tegra_gmi_id_table);
 
 static struct platform_driver tegra_gmi_driver = {
 	.probe = tegra_gmi_probe,
-	.remove_new = tegra_gmi_remove,
+	.remove = tegra_gmi_remove,
 	.driver = {
 		.name		= "tegra-gmi",
 		.of_match_table	= tegra_gmi_id_table,
diff --git a/drivers/bus/ti-pwmss.c b/drivers/bus/ti-pwmss.c
index 4969c556e752..1f2cab91e438 100644
--- a/drivers/bus/ti-pwmss.c
+++ b/drivers/bus/ti-pwmss.c
@@ -44,7 +44,7 @@ static struct platform_driver pwmss_driver = {
 		.of_match_table	= pwmss_of_match,
 	},
 	.probe	= pwmss_probe,
-	.remove_new = pwmss_remove,
+	.remove	= pwmss_remove,
 };
 
 module_platform_driver(pwmss_driver);
diff --git a/drivers/bus/ti-sysc.c b/drivers/bus/ti-sysc.c
index 270a94a06e05..f67b927ae4ca 100644
--- a/drivers/bus/ti-sysc.c
+++ b/drivers/bus/ti-sysc.c
@@ -3345,7 +3345,7 @@ MODULE_DEVICE_TABLE(of, sysc_match);
 
 static struct platform_driver sysc_driver = {
 	.probe		= sysc_probe,
-	.remove_new	= sysc_remove,
+	.remove		= sysc_remove,
 	.driver         = {
 		.name   = "ti-sysc",
 		.of_match_table	= sysc_match,
diff --git a/drivers/bus/ts-nbus.c b/drivers/bus/ts-nbus.c
index b8af44c5cdbd..2328c48b9b12 100644
--- a/drivers/bus/ts-nbus.c
+++ b/drivers/bus/ts-nbus.c
@@ -336,7 +336,7 @@ MODULE_DEVICE_TABLE(of, ts_nbus_of_match);
 
 static struct platform_driver ts_nbus_driver = {
 	.probe		= ts_nbus_probe,
-	.remove_new	= ts_nbus_remove,
+	.remove		= ts_nbus_remove,
 	.driver		= {
 		.name	= "ts_nbus",
 		.of_match_table = ts_nbus_of_match,

base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
-- 
2.45.2


