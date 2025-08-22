Return-Path: <linux-omap+bounces-4313-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C74B3252E
	for <lists+linux-omap@lfdr.de>; Sat, 23 Aug 2025 00:51:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DCF962407E
	for <lists+linux-omap@lfdr.de>; Fri, 22 Aug 2025 22:51:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8092C286426;
	Fri, 22 Aug 2025 22:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXcjQn72"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E086393DD1;
	Fri, 22 Aug 2025 22:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755903091; cv=none; b=jusirpi1SAVAO41P4XAidnsfgRNimNUu96dj/MlU+940olox8muUds1gEhaZ3Qt5cYcqRDJXvlKpe7Zs9HSXshs2KzNmPTFcZWmuowCmNHYyvnBavKNyWhtA6OMD7VBq2ukU2sOKZdJip/2Fy6niY5nCc8tTCU0VZi0Op+DPNto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755903091; c=relaxed/simple;
	bh=Uz29xE1qbqzTWhtbr3c/Z6BR8TzeeHky0+FO0Ei5cmw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fZm4/2v+yA8QDzqVtfJLqm2kJ6Kh+/vOqji7yAQGfsUT8tmPp0V0Q3OnBEhammkjA4OUmedJgVz1T4it6qJgJ1PFn0NNVBX9Dqwq6wIiLKGxkbC48icUnKkuKKTnLGVFDulp34iACvu4jL52AC8GdXWWySsTC0k0y/ADPehvafg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NXcjQn72; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b0cbbbaso21379935e9.3;
        Fri, 22 Aug 2025 15:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755903088; x=1756507888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LSy7EHMySIO//R5YCS2sVhYb42707dFi8CoMq1zKKi0=;
        b=NXcjQn727AnSy3bj9gmYPP0fMPciMgzcy55OC88gywber8FtupUB2LR4NYuWVw2hGb
         amjnb/y/jCyGtWuRyOFBBoBVfxnoeG1F8j8yXiAK+oj28jzpdfEbBYYtyzJkaQoQzpZ0
         J1xllxTQbCfzH12OAx4rPNMAat7JAG9Z6+7UO7C1J/yT6jhDLA0PVNfItww61mCGLEve
         GoEvSVfFutUF+9VKgkmFYciffkTSZNexr2DX3DUs0Mb4YrP18IHMukE7Yb2jmdRof6xL
         lIRIecPJilCJZXiF6dbevP1/x/XezTay+G+3ZPFUFuOritRQdLtZUMD5njVT1ljr18uH
         qAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755903088; x=1756507888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LSy7EHMySIO//R5YCS2sVhYb42707dFi8CoMq1zKKi0=;
        b=BCUdFpEJK3BoWYgJYE5TM27knwsOw/nirqx+C9ugXSM8xrHxJyR9rJaPh+hkPyeeqE
         fuqDArPcnvZUnMihJl9iKTlYh7Ha5OlOhRs1ebyZbavPDAZLqQrK6RprPBSfCX7+kQFF
         57yAn2BC7wBLFp0oMpThXVkI8jfzrnyWBe5fn09CcjWAqkTbBSePMT8jrpQ4YW5Sk5pv
         d22Dnf6kAlSJquHwNhcXLP1UtTz2dcURLMQWSZW3ln/T9e81aHC9eExcaLrSAetLkuZQ
         YY6r1YGYTHytkfpO3ZSlnOi13ybKWah23kiT/ddYYbM29xg1eTtQNYPQmHWRnoT6Ri8J
         GTSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPIGbjpXEC3iKvEQIBOK6izhzZg6bRYfZoDm1ph0xCR2ITPAt707jXr3jfcXUjH97XaGdZlY4pwWSDwQ==@vger.kernel.org, AJvYcCUgtrSV/Bj2xqGUHqsnXaaRchfJft1BCQBbN2nTlWYZdkxTc7o6EKsWLQB4qOHF2edD5E3B/niM8xT7@vger.kernel.org, AJvYcCX89LPYGOpp0mGCmq2yqwRAzdZARFVzxlVrVQEyGHr3wR0UpMovsj+g/thxyJ83GFYwsMfuT0apB1T+GMWc@vger.kernel.org
X-Gm-Message-State: AOJu0YzClUZTAKxOIEjhjnN0MzrxnZXzdjHcuuznn69abY+W8j1D1OyH
	hvjHWzE2gHI3DW/9xdqDXXi0djDY4Y+XcZGA/d/4VcAABCdrK1Ste/TDAWPNLx0=
X-Gm-Gg: ASbGncuLMq8jXIgavDcilkfZBlbXWe5b3n+NdzQ7EatAbTSAULsAW6LqHTbPAG/Q/h3
	QuxhLZgMoTqSW08sLHJ1aO6MaWaXz0aRlJ3avfwYRYnl0TEAbI6Lg+G/QVR+6NNz5yYKVwKNRYN
	jDW8SvSKCaaxjFllzWPUPLRthWlxgb1jeJC8W+D5CV/1cUt44+uPKJKIDMS6G5nSxNSpy8kz5V8
	0yn6BiP7vmNfVNUYYTjsaImq6pfRKw2SRBmbQ+2XSZq0UgKZNFi2EbBHMtOdkXQtLNhkA7GhBH2
	Kyf1lrx/3gdUOEn+z+P6dvM92vmIr3K6oqTiRsJCzs8n0d5LjXuxWNGurHO9jcXzCUearN1BNNp
	r9RcsoBWpSDweHjhkT66d7iCIsG26RHGYJWGhHpUyrm0KKznZpnM6wxqE
X-Google-Smtp-Source: AGHT+IHBO6okrpkC0T39ssbGUbsElQTLTtnQfx5AXQSe+Ek4U5TLl/I+PqBPbSQHVHKQEIQ4m+L67A==
X-Received: by 2002:a05:6000:26c8:b0:3c7:6348:4089 with SMTP id ffacd0b85a97d-3c7634846admr62067f8f.11.1755903087769;
        Fri, 22 Aug 2025 15:51:27 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:58f:6d42:4e65:e74f:bc8e:3791])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c70e4ba1eesm1273301f8f.2.2025.08.22.15.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 15:51:27 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: tony@atomide.com
Cc: krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shuah@kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] ARM: dts: ti: omap: omap3-devkit8000-lcd: Fix ti,keep-vref-on property to use correct boolean syntax in DTS
Date: Sat, 23 Aug 2025 00:50:52 +0200
Message-Id: <20250822225052.136919-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ti,keep-vref-on property, defined as a boolean flag in the Device
Tree schema, was incorrectly assigned a value (<1>) in the DTS file,
causing a validation error: "size (4) error for type flag". Remove
the value to match the schema and ensure compatibility with the driver
using device_property_read_bool(). This fixes the dtbs_check error.

Fixes: ed05637c30e6
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd-common.dtsi b/arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd-common.dtsi
index a7f99ae0c..78c657429 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd-common.dtsi
@@ -65,7 +65,7 @@ ads7846@0 {
 		ti,debounce-max = /bits/ 16 <10>;
 		ti,debounce-tol = /bits/ 16 <5>;
 		ti,debounce-rep = /bits/ 16 <1>;
-		ti,keep-vref-on = <1>;
+		ti,keep-vref-on;
 		ti,settle-delay-usec = /bits/ 16 <150>;
 
 		wakeup-source;
-- 
2.39.5


