Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6656D8980
	for <lists+linux-omap@lfdr.de>; Wed,  5 Apr 2023 23:23:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234609AbjDEVXp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 5 Apr 2023 17:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232876AbjDEVXb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 5 Apr 2023 17:23:31 -0400
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018A211D;
        Wed,  5 Apr 2023 14:23:18 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id AE8783F8A3;
        Wed,  5 Apr 2023 23:23:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
Authentication-Results: pio-pvt-msa3.bahnhof.se (amavisd-new);
        dkim=pass (2048-bit key) header.d=dalakolonin.se
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id O0BBc1TQFAsG; Wed,  5 Apr 2023 23:23:16 +0200 (CEST)
Received: by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id A11AC3F7F6;
        Wed,  5 Apr 2023 23:23:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.dalakolonin.se (Postfix) with ESMTP id 7D4F294E16;
        Wed,  5 Apr 2023 21:23:15 +0000 (UTC)
Received: from zimbra.dalakolonin.se ([127.0.0.1])
        by localhost (zimbra.dalakolonin.se [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id X-BWrBWRI1uS; Wed,  5 Apr 2023 21:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.dalakolonin.se (Postfix) with ESMTP id 79E9294DD4;
        Wed,  5 Apr 2023 21:22:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.dalakolonin.se 79E9294DD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dalakolonin.se;
        s=D374B428-D0A7-11ED-A657-75977B426508; t=1680729771;
        bh=WEa42btgt5YoGy4wRFO15STm/DxrasoQ4xEIrCOV4as=;
        h=From:To:Date:Message-Id:MIME-Version;
        b=jcL/+c1up0GWwUPaFBdcGhSDeWRBe65UcZ8RltysdL7W0It0+txIHC8mQtsCG1yRk
         CVb9rsNWDjxSrwyEbqRNbLlUxCrrfcvyJsBlxqXafsar4tYnJTzyABeGQkQ05LNH2U
         MpzmNlYkQ8/yTO+YywHs7sZ/wES3BzFvaWV0WPwVbaIbs1J70jF813CRM4+Fd1fMzU
         k6t9oZdfBZXQFGr1DDGsuTqp22IVqprOARfo9hbbl86nPoVncf+G+axTcE3exSUT0Z
         uIL/sVClmiIbaNG7GIihKBFhrcVGqcTsqmc90Wg38aXWoATGIvSIhbuXOXelKEusDT
         4L5G0GJk0JG+w==
X-Virus-Scanned: amavisd-new at dalakolonin.se
Received: from zimbra.dalakolonin.se ([127.0.0.1])
        by localhost (zimbra.dalakolonin.se [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id Dl_JdPTUq3Db; Wed,  5 Apr 2023 21:22:51 +0000 (UTC)
Received: from rack-server-1.dalakolonin.se (unknown [172.17.0.1])
        by zimbra.dalakolonin.se (Postfix) with ESMTPSA id 0491494DCF;
        Wed,  5 Apr 2023 21:22:50 +0000 (UTC)
From:   =?UTF-8?q?Patrik=20Dahlstr=C3=B6m?= <risca@dalakolonin.se>
To:     linux-iio@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org,
        kernel@pyra-handheld.com, pgoudagunta@nvidia.com,
        hns@goldelico.com, jic23@kernel.org, lars@metafoo.de,
        linux-omap@vger.kernel.org,
        =?UTF-8?q?Patrik=20Dahlstr=C3=B6m?= <risca@dalakolonin.se>
Subject: [PATCH v3 2/7] iio: adc: palmas: replace "wakeup" with "event"
Date:   Wed,  5 Apr 2023 23:22:28 +0200
Message-Id: <20230405212233.4167986-3-risca@dalakolonin.se>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230405212233.4167986-1-risca@dalakolonin.se>
References: <20230405212233.4167986-1-risca@dalakolonin.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The palmas gpadc block has support for monitoring up to 2 ADC channels
and issue an interrupt if they reach past a set threshold. This is
currently used to wake up the system from sleep, but the functionality
is more generic than that. As such, change the naming of functions and
variables to refer to it as events instead, except during suspend and
resume where wakeup still make sense.

Signed-off-by: Patrik Dahlstr=C3=B6m <risca@dalakolonin.se>
---
 drivers/iio/adc/palmas_gpadc.c | 50 +++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/iio/adc/palmas_gpadc.c b/drivers/iio/adc/palmas_gpad=
c.c
index 03af6cd73ec8..55fdf59ef711 100644
--- a/drivers/iio/adc/palmas_gpadc.c
+++ b/drivers/iio/adc/palmas_gpadc.c
@@ -76,7 +76,7 @@ static struct palmas_gpadc_info palmas_gpadc_info[] =3D=
 {
 	PALMAS_ADC_INFO(IN15, 0, 0, 0, 0, INVALID, INVALID, true),
 };
=20
-struct palmas_adc_wakeup_property {
+struct palmas_adc_event {
 	int adc_channel_number;
 	int adc_high_threshold;
 	int adc_low_threshold;
@@ -117,10 +117,10 @@ struct palmas_gpadc {
 	int				irq_auto_1;
 	struct palmas_gpadc_info	*adc_info;
 	struct completion		conv_completion;
-	struct palmas_adc_wakeup_property wakeup1_data;
-	struct palmas_adc_wakeup_property wakeup2_data;
-	bool				wakeup1_enable;
-	bool				wakeup2_enable;
+	struct palmas_adc_event		event0;
+	struct palmas_adc_event		event1;
+	bool				event0_enable;
+	bool				event1_enable;
 	int				auto_conversion_period;
 	struct mutex			lock;
 };
@@ -591,7 +591,7 @@ static int palmas_gpadc_probe(struct platform_device =
*pdev)
 	return 0;
 }
=20
-static int palmas_adc_wakeup_configure(struct palmas_gpadc *adc)
+static int palmas_adc_configure_events(struct palmas_gpadc *adc)
 {
 	int adc_period, conv;
 	int i;
@@ -617,16 +617,16 @@ static int palmas_adc_wakeup_configure(struct palma=
s_gpadc *adc)
 	}
=20
 	conv =3D 0;
-	if (adc->wakeup1_enable) {
+	if (adc->event0_enable) {
 		int polarity;
=20
-		ch0 =3D adc->wakeup1_data.adc_channel_number;
+		ch0 =3D adc->event0.adc_channel_number;
 		conv |=3D PALMAS_GPADC_AUTO_CTRL_AUTO_CONV0_EN;
-		if (adc->wakeup1_data.adc_high_threshold > 0) {
-			thres =3D adc->wakeup1_data.adc_high_threshold;
+		if (adc->event0.adc_high_threshold > 0) {
+			thres =3D adc->event0.adc_high_threshold;
 			polarity =3D 0;
 		} else {
-			thres =3D adc->wakeup1_data.adc_low_threshold;
+			thres =3D adc->event0.adc_low_threshold;
 			polarity =3D PALMAS_GPADC_THRES_CONV0_MSB_THRES_CONV0_POL;
 		}
=20
@@ -648,16 +648,16 @@ static int palmas_adc_wakeup_configure(struct palma=
s_gpadc *adc)
 		}
 	}
=20
-	if (adc->wakeup2_enable) {
+	if (adc->event1_enable) {
 		int polarity;
=20
-		ch1 =3D adc->wakeup2_data.adc_channel_number;
+		ch1 =3D adc->event1.adc_channel_number;
 		conv |=3D PALMAS_GPADC_AUTO_CTRL_AUTO_CONV1_EN;
-		if (adc->wakeup2_data.adc_high_threshold > 0) {
-			thres =3D adc->wakeup2_data.adc_high_threshold;
+		if (adc->event1.adc_high_threshold > 0) {
+			thres =3D adc->event1.adc_high_threshold;
 			polarity =3D 0;
 		} else {
-			thres =3D adc->wakeup2_data.adc_low_threshold;
+			thres =3D adc->event1.adc_low_threshold;
 			polarity =3D PALMAS_GPADC_THRES_CONV1_MSB_THRES_CONV1_POL;
 		}
=20
@@ -696,7 +696,7 @@ static int palmas_adc_wakeup_configure(struct palmas_=
gpadc *adc)
 	return ret;
 }
=20
-static int palmas_adc_wakeup_reset(struct palmas_gpadc *adc)
+static int palmas_adc_reset_events(struct palmas_gpadc *adc)
 {
 	int ret;
=20
@@ -718,20 +718,20 @@ static int palmas_gpadc_suspend(struct device *dev)
 {
 	struct iio_dev *indio_dev =3D dev_get_drvdata(dev);
 	struct palmas_gpadc *adc =3D iio_priv(indio_dev);
-	int wakeup =3D adc->wakeup1_enable || adc->wakeup2_enable;
+	int wakeup =3D adc->event0_enable || adc->event1_enable;
 	int ret;
=20
 	if (!device_may_wakeup(dev) || !wakeup)
 		return 0;
=20
-	ret =3D palmas_adc_wakeup_configure(adc);
+	ret =3D palmas_adc_configure_events(adc);
 	if (ret < 0)
 		return ret;
=20
-	if (adc->wakeup1_enable)
+	if (adc->event0_enable)
 		enable_irq_wake(adc->irq_auto_0);
=20
-	if (adc->wakeup2_enable)
+	if (adc->event1_enable)
 		enable_irq_wake(adc->irq_auto_1);
=20
 	return 0;
@@ -741,20 +741,20 @@ static int palmas_gpadc_resume(struct device *dev)
 {
 	struct iio_dev *indio_dev =3D dev_get_drvdata(dev);
 	struct palmas_gpadc *adc =3D iio_priv(indio_dev);
-	int wakeup =3D adc->wakeup1_enable || adc->wakeup2_enable;
+	int wakeup =3D adc->event0_enable || adc->event1_enable;
 	int ret;
=20
 	if (!device_may_wakeup(dev) || !wakeup)
 		return 0;
=20
-	ret =3D palmas_adc_wakeup_reset(adc);
+	ret =3D palmas_adc_reset_events(adc);
 	if (ret < 0)
 		return ret;
=20
-	if (adc->wakeup1_enable)
+	if (adc->event0_enable)
 		disable_irq_wake(adc->irq_auto_0);
=20
-	if (adc->wakeup2_enable)
+	if (adc->event1_enable)
 		disable_irq_wake(adc->irq_auto_1);
=20
 	return 0;
--=20
2.25.1

