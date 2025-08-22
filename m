Return-Path: <linux-omap+bounces-4312-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C275B32509
	for <lists+linux-omap@lfdr.de>; Sat, 23 Aug 2025 00:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 73469189D2C4
	for <lists+linux-omap@lfdr.de>; Fri, 22 Aug 2025 22:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D3D2D322F;
	Fri, 22 Aug 2025 22:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESv9/Sq+"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F303723505F;
	Fri, 22 Aug 2025 22:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755901566; cv=none; b=ll8GKTHdkT2EOyMDZMmrJOPjNEZi7ogMo5M96nXtwwIawNTtCzGXDgLroT2r5kELrvAttxcLJcZkUqlAvcbVIkTGtCPoLTG440GCvlOXI15CfQxu2bC0Wd+1/R1kNO4VfV51+nkykUyI9gnjMcO64us6TqLSd+cpbf+jzgK6Pjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755901566; c=relaxed/simple;
	bh=T5U3T59xMxutbqhRQ80mhcOf2qZtze/ckJ399JrRFoo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bBUYCSDWNZEp9dWPEuQTlh8oecNBXeYruI+Q+JM98NxSW1ZpMxZQPB26Idcq+A6YT6l4RzPDwT/kIvMZHiELyNwcP+HU6hUuvOlnUIH1RiAX7twXC/O6EGdWTzfgAOlmluNO3ymRQJw+3CGQuVfVpd+85A0vyp11iH/nZe365Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESv9/Sq+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a1b05d252so20308125e9.1;
        Fri, 22 Aug 2025 15:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755901563; x=1756506363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1yIf7UahS4pxZ1gqlZo5h06LoLmN0soC2fUAOI/fcBk=;
        b=ESv9/Sq+HEn9fRM7+ndfKCD92JaMaMv6k8Wvgs8ImUho55+b9m817uK4t0otOkTYuh
         1A9aHXpDjNohGHSYL0gkDd8EBUtuZcza75Mv254hgXd3hT5q8jk047+YJkr3uK49By4n
         bq68LzooTl8IwBA/IVYvdCg3XJs5dHxcNUhJ0wZUdNhu5j7Jd54JtRcXkjdPZX1y/CHz
         tL3S6wd0Zuu8V++7MBNRb0pT/k4ZnUvJJ2/kQDQowiIY9RCFdQCjt5J4fem8Qy1/BrrH
         5jHVT7Vl7fkzYcvcHYMpCNW86TNSeMRUR4EUpU+RGw1P6y0/3RcxK/V+TWeljXujmmOk
         jPyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755901563; x=1756506363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1yIf7UahS4pxZ1gqlZo5h06LoLmN0soC2fUAOI/fcBk=;
        b=LnyoenPowo/k/stBjvUx5GiJYkt07Hj6iOkbpBnbeINA5Zbv8yr4E5qwID2HvvA91I
         8rYEUl1QuZldUnUUIItCcv62YUMoJYm518kU0Jc6KziqE6/0yssYRyGnlAf6dG15RmXa
         6cM06MCumfscJDswnkZ11mcAYwC8XEwUSjO6GLw6qUMJG7iLDZy3aq+gzwwj7w3S6i2x
         CeGLSQ+1dVg5E7EXVA9klZwF1OfaxfSJfORt1TClA6rzKWrrLryQQF4rsgqrE58NuPdR
         NXG5xjur2FJrdvIx27IXIc/wKlLyTCLTVpulBtGDRXejAWlasE1rEcAOxykkJMR/fWOT
         03dA==
X-Forwarded-Encrypted: i=1; AJvYcCVHXA8/EqzEa8ngRUr4rRqPrl3lkcTg5Zv78Weto1weMmrEWHCRCoh3ShF3ACdHlfcItZwn2vYu0vLy@vger.kernel.org, AJvYcCWHSw3lzFgFjHif9AWu/Ov5eka/ffHlWQrQ9LYdrJ30oVc5e2WmFVj+MMlYY4fnQ+R5rUi8AN4AOS9tGqS7@vger.kernel.org, AJvYcCWjxlr2T0bKs+Zu31UqxwmnY/BgatynUX6gLuRNiocvdWXcjpoEVjMPTHpNR5wxtk6p/5AbWXxVeJVNxw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq4hTNpL4Ku+ZRnN4CXrGajK+RcBg2Mx87V7efj0Md7Nebr/iS
	iQ9P5Syj4c57BW/Mje/5I7rxh52yNQzkC0dasMmBztekGhQiQXKCHsQ=
X-Gm-Gg: ASbGnct3Je/iIqct+Y0ONeamDfO56oGmWQMD42Mw+UpWJtjCfRy++wL3OpfqcbkxQbp
	V5Xseijqz+XXWFCB7ECHiHT4dHOW9UC9Fmvea52tSqlO4d84nBSH2Z8UcbCn5XxzArgZ5otz3xr
	7mZWY4U4JwCsvupcsIAupNkdWG6NbSwpkJNZ71SBU3r9VkZRaLSZDcMjZogI81j6/BkE2EeoKD2
	hkVZT3IAomS7+QmO5c/XCJ7mZoFOTTdtg/q9eJGpodKEAtJSw7bFBbYZGkGa8WQnySd/dTu8xiK
	LoXG5ZmsuJg0RwkvV07g4ez/oPrmcI+uvd1kmXgFvJfaz02jYThKGFkf0YlZbISeZ3RdqUG51+X
	FORlBFQKzEbMxsx7aZCJLRNGQIAkt0mRuTiL2pYpa2NzuyQ==
X-Google-Smtp-Source: AGHT+IEJMybfO8956xjyYvUhaELGFJCgGASiKmKJ7a5pJizulPbRSnIF/KoBKRBTVTDjZPCdLYkenA==
X-Received: by 2002:a05:600c:4715:b0:458:aed1:f82c with SMTP id 5b1f17b1804b1-45b517d3b30mr34477415e9.22.1755901563145;
        Fri, 22 Aug 2025 15:26:03 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:58f:6d42:4e65:e74f:bc8e:3791])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b4e8f4552sm41226025e9.8.2025.08.22.15.26.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 15:26:02 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: ti: omap: am335x-baltos: Fix ti,en-ck32k-xtal property in DTS to use correct boolean syntax
Date: Sat, 23 Aug 2025 00:25:30 +0200
Message-Id: <20250822222530.113520-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ti,en-ck32k-xtal property, defined as a boolean in the Device Tree
schema, was incorrectly assigned a value (<1>) in the DTS file, causing
a validation error: "size (4) error for type flag". The driver uses
of_property_read_bool(), expecting a boolean. Remove the value to fix
the dtbs_check error.

Fixes: 262178b6b8e5
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi b/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
index ae2e8dffb..ea47f9960 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
@@ -269,7 +269,7 @@ &tps {
 	vcc7-supply = <&vbat>;
 	vccio-supply = <&vbat>;
 
-	ti,en-ck32k-xtal = <1>;
+	ti,en-ck32k-xtal;
 
 	regulators {
 		vrtc_reg: regulator@0 {
-- 
2.39.5


