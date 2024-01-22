Return-Path: <linux-omap+bounces-332-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1E28361BD
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jan 2024 12:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BC6E2920FA
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jan 2024 11:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CEA03A8DB;
	Mon, 22 Jan 2024 11:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="is7zf3ei"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244023A8D8
	for <linux-omap@vger.kernel.org>; Mon, 22 Jan 2024 11:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922459; cv=none; b=aPilblFJSUcGT9gMVZFlY6YWg84uv8guZpaTWeDa+Vn5KzsGl6FFnt6PCpzvWVd8Q2nxRlODjJX8ZPvvDKVFDxpcW2aZajLAbrLX+U+vaYgYRcKt4l9rQjWWsYQ5NJmJYETBQLTMKh8LQLPfOvPRmDq30pv9uv58cZyhZeOvSUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922459; c=relaxed/simple;
	bh=ka/YWnYO71wVj2LTeee75OH2fQvxjGgTlJ9lY9vTP4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hjOCsZo/7rOncPuE5HpVQhyYI6hbX15kEw4n7xp00RZWN/GLi9i6Nk2DJmscLUeDVQO7bdTHhpTRa1HWdt6HLm7tiWYnki3bwGAv9UPC/+ZgpC4aEJMhOcxGStjK6VbvPQLidofjqcS0UvfSnAH1gU3b3CZ6OVFrPv7byoNYpHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=is7zf3ei; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e72a567eeso37270445e9.0
        for <linux-omap@vger.kernel.org>; Mon, 22 Jan 2024 03:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705922456; x=1706527256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OqplCx4aFnfmLBjauycIiJ63cmJG88QgQd5RUSern+E=;
        b=is7zf3eiqs6Js7reW1IyBF+/B/JutepU8rzhSfjQn445jacmTJ8Emsw+srs21juq7V
         m3Fh0vkM7dVh21UBseF3MrmqprYJfcfZ1AR9eamFLsmN1vYA18Yn1Pjm5aHXQNEw7czQ
         vENVmBq+ymMubxUky1Q31Ce4EtOcEv80VseCXfuOhRKYvw06xGZCD+CX9KfqJaIUJ4IU
         OyM0aMwkpyR6EBQkzert4OurWTfsUgZyuVY9nDXGYL35bQp3339BUAh81R1nosojNJZP
         Kqp0YTBFHMImLAWPy/V2xQnweOHthygIkTgT3zDgmM9CoR4dlrBmo0qdOa5i/yr+M8W+
         g/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922456; x=1706527256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OqplCx4aFnfmLBjauycIiJ63cmJG88QgQd5RUSern+E=;
        b=k3RXp0grT8gvcJ44PTMk/X1UMIQRUYptbym+mXNrXRF/hx4GtBDpn4ZltAtPFG6F3+
         Fj91aOWRwflAgHp2rrKAAq+fEX9ZTcwExkNDPW/dVwXDbmHWkX8B8yi+fqVTZH7fIHGI
         1I8W4wfT3eBd0Zg7JyGL+sNdk8po2iOtZv5OhiYRje6nBY4sc++so9X0nrrc+/P4uVVB
         A1barhINfGHiFHnEcjpBn2muE+VsETXYREbroLjfuSbUID2yLdQT305okYsWm24q43sh
         mdzhq1nZ2tzsNeM8y2ckOXy2432A/qWuFieO9bkZMoQoG5h8fe3PB1vqkVRcyBKYurLG
         SEQA==
X-Gm-Message-State: AOJu0YwUR4zyEzsttb+ifR7o6kaONz1wxAUrQdrwbk40Mh45H+eruDKD
	49Hdmwc8d5CBKFNfUTIqSLXe+B7zG1ERmnLwQEUJVu9N8+SwwLHr4Ba4tngv7IQoLB1rVgIQ1AG
	Y
X-Google-Smtp-Source: AGHT+IHKOIuqQwrtvviYLgdS9NyIi9OfVwZxGTCGxfpg4rM2YX4gt7DOFWPJ+fKO23tfiXwY9hQJQw==
X-Received: by 2002:a05:600c:4897:b0:40d:8fcd:31aa with SMTP id j23-20020a05600c489700b0040d8fcd31aamr1153660wmp.327.1705922456510;
        Mon, 22 Jan 2024 03:20:56 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr. [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
        by smtp.gmail.com with ESMTPSA id w18-20020a05600c475200b0040d2d33312csm39204614wmo.2.2024.01.22.03.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:20:56 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Romain Naour <romain.naour@skf.com>
Subject: [PATCH 3/3] arch/arm/boot/dts/dra7.dtsi: add missing unit addresses
Date: Mon, 22 Jan 2024 12:19:48 +0100
Message-ID: <20240122111948.416444-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122111948.416444-1-romain.naour@smile.fr>
References: <20240122111948.416444-1-romain.naour@smile.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Romain Naour <romain.naour@skf.com>

abb_{mpu,ivahd,dspeve,gpu} have 'reg' so they must have unit address.

Fixes:
Warning (unit_address_vs_reg): /ocp/regulator-abb-mpu: node has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): /ocp/regulator-abb-ivahd: node has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): /ocp/regulator-abb-dspeve: node has a reg or ranges property, but no unit name
Warning (unit_address_vs_reg): /ocp/regulator-abb-gpu: node has a reg or ranges property, but no unit name

Signed-off-by: Romain Naour <romain.naour@skf.com>
---
 arch/arm/boot/dts/ti/omap/dra7.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dra7.dtsi b/arch/arm/boot/dts/ti/omap/dra7.dtsi
index 6509c742fb58..565ac7691a2a 100644
--- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
@@ -638,7 +638,7 @@ mmu_ipu2: mmu@0 {
 			};
 		};
 
-		abb_mpu: regulator-abb-mpu {
+		abb_mpu: regulator-abb-mpu@4ae07ddc {
 			compatible = "ti,abb-v3";
 			regulator-name = "abb_mpu";
 			#address-cells = <0>;
@@ -671,7 +671,7 @@ abb_mpu: regulator-abb-mpu {
 			>;
 		};
 
-		abb_ivahd: regulator-abb-ivahd {
+		abb_ivahd: regulator-abb-ivahd@4ae07e34 {
 			compatible = "ti,abb-v3";
 			regulator-name = "abb_ivahd";
 			#address-cells = <0>;
@@ -704,7 +704,7 @@ abb_ivahd: regulator-abb-ivahd {
 			>;
 		};
 
-		abb_dspeve: regulator-abb-dspeve {
+		abb_dspeve: regulator-abb-dspeve@4ae07e30 {
 			compatible = "ti,abb-v3";
 			regulator-name = "abb_dspeve";
 			#address-cells = <0>;
@@ -737,7 +737,7 @@ abb_dspeve: regulator-abb-dspeve {
 			>;
 		};
 
-		abb_gpu: regulator-abb-gpu {
+		abb_gpu: regulator-abb-gpu@4ae07de4 {
 			compatible = "ti,abb-v3";
 			regulator-name = "abb_gpu";
 			#address-cells = <0>;
-- 
2.43.0


