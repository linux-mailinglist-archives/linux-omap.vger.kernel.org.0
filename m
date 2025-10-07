Return-Path: <linux-omap+bounces-4656-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A666CBC0C7E
	for <lists+linux-omap@lfdr.de>; Tue, 07 Oct 2025 10:50:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 52EEE34DA93
	for <lists+linux-omap@lfdr.de>; Tue,  7 Oct 2025 08:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8FAC2D594D;
	Tue,  7 Oct 2025 08:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Gn1bR3mQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68AD158874
	for <linux-omap@vger.kernel.org>; Tue,  7 Oct 2025 08:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759827049; cv=none; b=DnxaViUXq83aZqDARkwACSME0++iLzU0EEDjQIKprqiaClwHhHMBQ0qU5YcAK0ZohbTVvl7deVr9rTnUmE1Dnh8xgzfrTAtbxK3g7FF8iv/pQpxPyVmAr82MDZSVSZBjFBD1hrMN3SB369hyRrPciBreqVGHdd0mv3s+iff4K0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759827049; c=relaxed/simple;
	bh=lFQQD1kfwmUI6v7i/ui2xsw2z6+nFOrNxxiZr8pKY5o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=guFhm4SHXD93ELTouHjLixaUvF4BTz/+VDWe4YQspBoapr7S5h+eJGDZ4/wLFyOdjbkFGHpVgkynoo1kM7tQWIWs2EYlZtQvFF0sFP9Ak6DZkiUnKtDL3/9WiG1yZTJtkG/oF+MiOWhwpmQ0obT4wh0qYIafsVscVNYHQGrdzek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Gn1bR3mQ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6349e3578adso10857786a12.1
        for <linux-omap@vger.kernel.org>; Tue, 07 Oct 2025 01:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759827045; x=1760431845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9RR0C/JB1d7ykj+jJFgkQc/kXwCszluvkRpWmLXUJs8=;
        b=Gn1bR3mQy9eUlIj+VzHszpb1YkD6usAjNuhC9P7AfkOMARVIw+EuthV5IIY53WIqdA
         hQBxDsBnwiuZSn5dHuwrkmWckGzHmbIf/2K8ucSHEgrjbVMlW1ebD1BG4H83+EWoKwBg
         AzXlTCCCqgL3k9TWdJKXQEe0ElG0gdGcqzMXAKP1DWPzILKplnbwsqw2XS8UqfXVwRJ0
         dKFyZCcp6gz+ANa3qhZ5IDftAQcqXfWFoYsRTdsQSoQmov+Pi7BuYdVP/uLSTy2vDTv7
         qv9YeOdwSVL/SbBSCMon9Dg2iU4IZcdQ/jzqXJTYWd9jQH6GW6Kud14ivevbpn9LuMQX
         wcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759827045; x=1760431845;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9RR0C/JB1d7ykj+jJFgkQc/kXwCszluvkRpWmLXUJs8=;
        b=b/5CNUBNGqL/Hljf7pgwnfnvZ+GhjLFtB5WkjVKvocoAqc90RXrNotWIkuGDQ9lhQY
         KRHdHo4yJ4yvVuvgGh58SFBCXsUkVnP5vKkhkMksTlJLPQjztCHyr7ku1NzF/XJ4q9Ey
         eLBr107GbBwX9c87GkAKGnUT3VuZw2zhaMqwPrCsL8JdHhsfCrZwp8osRWCfMExnhovO
         rK5wYKUg5JZYVd8OJOnrvwI1xYuZ75LWdnapstTPG/dbg6e45jnMwvBrrRmMFsE/hD/t
         tQYawRvao0HUhSzufbJBECE48oNIyYkoojr5689pc8caETotD1KPWjxR+vtX2xQ47l9u
         3jDg==
X-Gm-Message-State: AOJu0YxUtVrC1ADH3TYkUdNylFa07B3oxTWZ44WWDG3aN1aHoS1dH74w
	qEIhpfqBQ8NADZkBUrGYQuMTDdTdTl015QVtySvra3QpC4N4t40f7yEN97JQ5w==
X-Gm-Gg: ASbGncu4P1VV0Tg7KYeFDlsGtaR9VZIIxVPWqnT7ERiGZd2KVlNYkA8IT2B/8MbXN57
	EIOGFDOlUwm0ev0Ka7IoY5weh9+tjcO5UhX0QblhKNPgXCx28U6i/ZHyPnI0xjO4T84OdzGLeLM
	hp7ByjwRWp9GnBnRVHghwK5LC4gEvs9yq+zTXOfi/bSNyXAlSiYpmpoj5lzVplqR48AD2d+wvjA
	Yz3GdNciIDYEVzx2S0teAegONkP8bdCPpnuP1wqrmjJq2/uHj6lUCN/3aIj5oCaZWTZ35/bmrQD
	bsbiP3OiDu8LHDOhjbFTY7dfLm04LSFe7lk/wWrYYfvdjpj4z794RHgbgHeLTZ3hVAL+C0QkYZt
	snoyN+lEkxproR+oZ/UDATGu8T8XHGzyxmfcCqq8zcSnE7pZSkPW7U3sZK/paok932GNFY9OkZ2
	d5c3ryj1I1aMp5Mw0S5euPcMvTt8o=
X-Google-Smtp-Source: AGHT+IE5I6pAehl64dLI+tk+cDMSA/nXs9NV/Qr4tTYFn4D1sGRgfc5sdTa3WnU/2IhzWgfZzzbt9w==
X-Received: by 2002:a17:907:3ccc:b0:b3d:c42d:6655 with SMTP id a640c23a62f3a-b49c429b4b2mr2133994966b.54.1759827045051;
        Tue, 07 Oct 2025 01:50:45 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869b4e49esm1339090966b.72.2025.10.07.01.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 01:50:44 -0700 (PDT)
From: yegorslists@googlemail.com
To: devicetree@vger.kernel.org
Cc: linux-omap@vger.kernel.org,
	tony@atomide.com,
	robh@kernel.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH] ARM: dts: ti: omap: am335x-baltos: add a regulator for the mPCIe slot
Date: Tue,  7 Oct 2025 10:50:37 +0200
Message-Id: <20251007085037.3605676-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yegor Yefremov <yegorslists@googlemail.com>

Baltos device provide a mPCIe slot that can be power cycled via a GPIO.

Add a userspace consumer mpcie-power-switch that references a fixed
regulator attached to the GPIO3_4.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi b/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
index ea47f9960c35..afb38f023b83 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
@@ -45,6 +45,23 @@ wl12xx_vmmc: fixedregulator2 {
 		startup-delay-us = <70000>;
 		enable-active-high;
 	};
+
+	mpcie_regulator: mpcie-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "mpcie-regulator";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 4 0>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	mpcie_power_switch: mpcie-power-switch {
+		compatible = "regulator-output";
+		regulator-name = "mpcie-power-switch";
+		regulator-supplies = "vcc";
+		vout-supply = <&mpcie_regulator>;
+	};
 };
 
 &am33xx_pinmux {
-- 
2.34.1


