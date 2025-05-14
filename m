Return-Path: <linux-omap+bounces-3722-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3955FAB6BCE
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 14:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B53024C15D5
	for <lists+linux-omap@lfdr.de>; Wed, 14 May 2025 12:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEF427934B;
	Wed, 14 May 2025 12:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aT8JaSyO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0580B202990
	for <linux-omap@vger.kernel.org>; Wed, 14 May 2025 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747227129; cv=none; b=cwrwzE7+YwdNsddU7P1oUiANO9u4pCLlA85zSv6Y7HB8nq9kETk0/pHFwBJFQwzh221ktSKFXUeuvSn/ROTVbOAA8qr/3JNykoNiLDZL87ATxNjubs2mb+4iO00QRFKY8M97U3+gakQdtNNicAaILza9auQnMm+3KMKg2WwGB18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747227129; c=relaxed/simple;
	bh=r0UAET3u4O10Z95IN00IAwMDZWY6tEVI/2uuYA8w2G4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d/QAXEvqwRYpMpvQHA54w81TqdDS/VKkXjnk8vrSZRZSKMOIATcY61ZCSyEHE/bsRCnvnoCjKgr+0zbEZ6eaPm5yZ7xKTtmXJp2Wefxpyb5SJrEMfSOyx+p+LAaMSAN6OiGVeyZ68HnrHuyOU1ttJS04wouYOiu6ehc3pXwaqRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aT8JaSyO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-440668acbf3so3833985e9.0
        for <linux-omap@vger.kernel.org>; Wed, 14 May 2025 05:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747227126; x=1747831926; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Icx5r//j5xtN6M3xRCGMrBcZJl6vrsvOrbn/XQKDqk=;
        b=aT8JaSyOsoEVqEmm0hOoe8POhudj+s3tcfwhRvglSzYrZ+X7M+ojtAw/fWSlghKoPh
         Vqm97BS2unBjrKyeQ0Mn/xQHshn1eqEve0GlwFNPCG5c03g1mFiH0TwRw1024pGyqMgy
         s6edlzrzFqVlD9WkHIE0LytK5DCkDwf+47tv8nKAneDDEjbULoYyy7+O1kwMsoRQonlm
         v+JPbBtIB8VWQUIFhyvgFclD4M3ixq+LOmV5i3yUGNRYFMxB4R73sn5Yw3fpR712ZPyk
         6Db2Yy5nxrF/AZKzcAsY9USHMI7W7qGGwWtVsneUVu/hSWQ+0brOUEtMMT453M2nK5gb
         0WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747227126; x=1747831926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Icx5r//j5xtN6M3xRCGMrBcZJl6vrsvOrbn/XQKDqk=;
        b=hJQ3llhJJxdLBHQlIoJzx88bD6qoVt7aJbYksCic6K1tpwKfruBdAaYbT/S0jJs57s
         wa00eoMvZRPzLz7+Jef+BhU+c/J6DXAwVtAia3A7YSY5GQg2zi46q+If4+kL98Lxown9
         TULgSzyNA74qJ3+Gq8hajqUIRVbgPlFe5go+HDCjT/47GMiC+p+B1fcKgYoj0z9QBXr1
         hQPkY3ZJhxZBatcTp7U6cJ3954cfZp0AtiizxGZEo3Tai28YOolJOP72wkSb4Br2PPKm
         Je2pRqdsfCEdY1UqYKvAB/yGAerh5lhHwifI4URzgceHBGQE9URubuu9wkAytOjwGvIw
         5zKw==
X-Forwarded-Encrypted: i=1; AJvYcCU9ENyXg9rhOTNws0dUXuM2dWmEDpgMhA0fYXxzcUeo5eZPtmApYrf6J4wR3tzRkWZoIxzSTZWZSORL@vger.kernel.org
X-Gm-Message-State: AOJu0YxP0Hmkkxu8amoxHw3Mso89Ym72GrOgw1StnjNE2T1zcdXGOrVr
	fxW9GLWrPzp9n6u9MNA/Iqt25xM6XMmydaKRfKouSMH+FJFOyb8zPZ0EbLanaAyyL4dO+CR6M9y
	/gRU=
X-Gm-Gg: ASbGncs6rp4mxh/bbr5cFayDHoSfUke1+n35Lhcb0h2rYCR0dQpZ21JPs9dXT/PzRIk
	YYNKJYo2Kjgwq+vojtg7Lp82NAeJdhtglwASRy7d75eI7FAoorpJMH8X0EaDpJX2mH5DnBIyUr3
	A15RgizdDf8OJQIyz+RKYVY0Klb/miNdE6dt3s+NGC6DzXLSgLjj34uUOOQl5mSrrXGFK450K3L
	4lBKSjBt+SmssEURRMj5JMK7lLVhzUdKpP6iOj6o+veuqoMOz7OYz78Vfuf7A2k45wb/4IMbJ1l
	Ow6gTe20XhAmkRrwwSNTICcusy1bLHm8szsQpAGGrx8OKZCGLamY4hbVHlKLv/l4eEEoRb3+Iwl
	xACTfJcHL925/MHxzRQ9gAAiWR74mpYlUTZmZSPk=
X-Google-Smtp-Source: AGHT+IH70OLtjH8hCoyZN61xOx6Gwct+2Y+hYWBjOeLLeTkhtB7K6QbcHqoPUIiZer6kZhrVbCnzyg==
X-Received: by 2002:a05:600c:1ca3:b0:43b:c938:1d0e with SMTP id 5b1f17b1804b1-442f20bfcd5mr10316405e9.2.1747227126266;
        Wed, 14 May 2025 05:52:06 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951494sm31346635e9.22.2025.05.14.05.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 05:52:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Jackson <mpfj@newflow.co.uk>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: omap: am335x: Use non-deprecated rts-gpios
Date: Wed, 14 May 2025 14:51:59 +0200
Message-ID: <20250514125158.56285-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2257; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=r0UAET3u4O10Z95IN00IAwMDZWY6tEVI/2uuYA8w2G4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoJJHuHLecMyoK1eeXlf89efwj5jb4C3yc70IKK
 hW9xJc8VTGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCSR7gAKCRDBN2bmhouD
 1+nJD/9D13tuP838tCo6G7Y3qU/PXA1AcuULSanion8zxnZ5wpdXNiARStcj7Pw7+/5asMrUXlc
 iZUTLEseHozu4E6Yla9lurNNqv9D+QIEnj0X2j/iztjwdB7GYGwM9TW9ewjZPWTrb4rDXmbVfo+
 5ocR7KoM8vt+YSDZFvPzsAkaQLvvg548/3FNivZFwdohaQaH8G0Ay8Ssg05TmApv6tfhdWqEM/r
 D+4Tox/63adAmLmQMWkNubPhYiNVjw/lxfmXtzz94gm1iCNt0KyepoSoAvM5mmDODZCNRcqRtQf
 jsB6Lf6YaIVetQ4DfjRPPm4hfe5omXq1G8dOxq3WQJzoIAzSzT3VUcXhf2VcnMjqMzC9hEPpmEh
 /ZBXbgbm+aIpNKOcadDXVSyqTHMLmtKnkqZXBN0MJt5viSw3XOuS7DH48jos9dwV3gOsj578ZwW
 Tuvj7sC4jp2aZgKf2P+BvTbmogVZ+at2vuJXBGVdbMz2rHKdJvFfjmponUDB3qDfQpZV1Tg7tp7
 jlKx0EKgfIEvkT2t/dwDWz5lVVqwUQAzmCRLeeb3oLwtS5t1H5AJVjvj793lFP00jPNJMBGG/Jn
 L2nBuJbaiBPhNGXdxBJpnKfFyV9f24svonYV2Y+RV3UNFFbH4tuds0jeXEbbjXrO5z2XoWN565B hCn0bQPc9oQARlg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The 'rts-gpio' (without trailing 's') is deprecated in favor of
'rts-gpios'.  Kernel supports both variants, so switch the DTS to
preferred one.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/ti/omap/am335x-nano.dts   | 8 ++++----
 arch/arm/boot/dts/ti/omap/am335x-pdu001.dts | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-nano.dts b/arch/arm/boot/dts/ti/omap/am335x-nano.dts
index 56929059f5af..d51cdd6e1ab4 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-nano.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-nano.dts
@@ -167,7 +167,7 @@ &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart1_pins>;
 	status = "okay";
-	rts-gpio = <&gpio0 13 GPIO_ACTIVE_HIGH>;
+	rts-gpios = <&gpio0 13 GPIO_ACTIVE_HIGH>;
 	rs485-rts-active-high;
 	rs485-rx-during-tx;
 	rs485-rts-delay = <1 1>;
@@ -178,7 +178,7 @@ &uart2 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart2_pins>;
 	status = "okay";
-	rts-gpio = <&gpio2 15 GPIO_ACTIVE_HIGH>;
+	rts-gpios = <&gpio2 15 GPIO_ACTIVE_HIGH>;
 	rs485-rts-active-high;
 	rs485-rts-delay = <1 1>;
 	linux,rs485-enabled-at-boot-time;
@@ -187,7 +187,7 @@ &uart2 {
 &uart3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart3_pins>;
-	rts-gpio = <&gpio2 17 GPIO_ACTIVE_HIGH>;
+	rts-gpios = <&gpio2 17 GPIO_ACTIVE_HIGH>;
 	rs485-rts-active-high;
 	rs485-rx-during-tx;
 	rs485-rts-delay = <1 1>;
@@ -198,7 +198,7 @@ &uart3 {
 &uart4 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart4_pins>;
-	rts-gpio = <&gpio0 9 GPIO_ACTIVE_HIGH>;
+	rts-gpios = <&gpio0 9 GPIO_ACTIVE_HIGH>;
 	rs485-rts-active-high;
 	rs485-rx-during-tx;
 	rs485-rts-delay = <1 1>;
diff --git a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
index ded19e24e666..f0da94a738d5 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-pdu001.dts
@@ -256,7 +256,7 @@ &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
 
-	rts-gpio = <&gpio1 9 GPIO_ACTIVE_HIGH>;
+	rts-gpios = <&gpio1 9 GPIO_ACTIVE_HIGH>;
 	rs485-rts-active-high;
 	rs485-rts-delay = <0 0>;
 	linux,rs485-enabled-at-boot-time;
-- 
2.45.2


