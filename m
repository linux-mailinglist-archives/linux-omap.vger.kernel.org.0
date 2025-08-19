Return-Path: <linux-omap+bounces-4262-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF37B2C543
	for <lists+linux-omap@lfdr.de>; Tue, 19 Aug 2025 15:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B2B9164F11
	for <lists+linux-omap@lfdr.de>; Tue, 19 Aug 2025 13:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7E2340D9D;
	Tue, 19 Aug 2025 13:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rESsUOet"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FC533CE8A
	for <linux-omap@vger.kernel.org>; Tue, 19 Aug 2025 13:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755609423; cv=none; b=XzFL/7EF1UK2HiVY00Le+enx2C8e5oXOj3mfqxBZURU5imyVau9rzibZYZBIE+OnL5Y9v/J+eGJ92MpMVPjx0PFH/6bHtFyWFiDsAP4+BIAiF2I+JwvX0h23PkpDQBswMQ+YSi5Kel3hS4RLFUFsIPdpNzkx7lgcinvJasXo3to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755609423; c=relaxed/simple;
	bh=+VLxqH0ESqnHDuk3E8kCPOtSdGHTD/8yFJeuZ9BiCYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WVCshDGkAVmwexb5rcBixAvK/DkMLuXeeQ8hNXSjaeP/8He9PrGi2Tatdwy5qjPJfyOPmcnxHF8rVBjqpNPNaYL7md2mbieCjfpq5MTM25S/RmKETBameG2PfAAJeiYbjmnCcsnW6DAFkTsO0HI5tkzxR3FqvzITgBMU8bGCfhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rESsUOet; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb7a5cff3so97916766b.3
        for <linux-omap@vger.kernel.org>; Tue, 19 Aug 2025 06:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755609420; x=1756214220; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qESptQ/dmYUlk6re8+r+sev9Qhuuz0N3hfWZa+wWogk=;
        b=rESsUOetlTKYUMTap3LQaHi0BeKDzt6tMbLeLwxG91MOgdZA0DOhNof/J/LCMQ42KS
         9tcqmwp5L3Tx7y/oO5+kJQZwAqzHX4kwGDHhjKEWzJk8r6tABn5e2TH7oTJLd2v7zqLi
         GEYL9LCAhWxJu3k+ocT4UmiXSv6l0wq+8GDoksXvXtzp4DJlgRXfmeczzJQY0ZVyBSr5
         wK0806TMywOFQH6OhLe8xywHA9fLhp5ODSxxJa51GxITKpSoirv2D6Q/XfSZmO3BAM7y
         06r0muJB9z6L5EJ3TBUSoCob9OfXQhXe9jlp6fJsF9HXUYo6UctDW+rqQ3zeQmJ6K3eI
         1zxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755609420; x=1756214220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qESptQ/dmYUlk6re8+r+sev9Qhuuz0N3hfWZa+wWogk=;
        b=Mmthad0kGLQlrSJwQbqYnYEISw+W3Bnjk91mR+sdr+/tSAvUuA+B9BKsvPZ5icRhGo
         qUk29eKD6MUGrD49kRAhxZBYQV/giNbY41TnIXbZAd+csoKfQPeinClVFajfMxIq+r+d
         tWELKZcgxc7VE0TRDqvMY+sK8SKLjRxwDZuMFPFQVkLaFABlYFIw1yulJQykYulgyWid
         SjzpQpayFJDBfRdVNLqubdmAJbwyelgEM+qo64PdICFH5F84yn989+62khx0jMhCHEYb
         96t+cwR4Zz0DVkAA8xD5+p3E+kmqtN2rRIr0sKT2YD4kigoYHmj7f0GTvmXoWnrl9CX2
         ObPw==
X-Forwarded-Encrypted: i=1; AJvYcCVBUcp9PtQmpOD9IlFSdh6bzsVnPSBT/caPiu0T84HzxTCon1bgy6NgGa9hl6W7vff+FqUIoyvlfFUM@vger.kernel.org
X-Gm-Message-State: AOJu0YyIsKitKEIpY3CFkpgAbXDE2VtiX48Jjn/ZRoSk+rM/qKH9jYy3
	+RurniNAFtYKDL5V3u/07S3J0V6L6Vza9buOIUnVcIguG6mXOeIsOdkJUcYACHs9VFo=
X-Gm-Gg: ASbGncuFwtt+3TtPoJDAzq8Daju+HSmUdoPker/fy08jjVV+GZxEaJg8KQbxgTWYQa0
	Q6UjLgRalV3HYX+IplP6dY6YEvRNOXuKVyw9cGoV9OuZhMRdr+gReVlWoFtbTJRKaXFNuWJXpv0
	uZ8EUeWK2Lp0LbyFa1Jv/Yp0LTNbCosc2VjmmN8JWz0PpuJy33zgrwnnqCzQt2aPKm24wQYCb8J
	sAHshdPXW8sEhsYrHqKbIRPE6mV5XroD/waZX0DqSRYrl1g/f0MKZy1FsaP/Ve6iCB8P2npgq8S
	uAG/cZnG8+wUPlwGSud69J/rgTJsxBfQNKCu3Ys5P6iQHcYiBIvyylaMTuwfr2ykhxyP0kDWqEv
	eH1ZhTK8LHIwlKCr3uXIbccVv12BXqEgMJQ==
X-Google-Smtp-Source: AGHT+IEg8a2b47NedlvviLuwG8st+X2x0l+Y/YjWI2l2AzTIN3x0F4/UgFHHn1iSDfVurcfwrHIMew==
X-Received: by 2002:a17:907:2dac:b0:ad8:8e05:e5e9 with SMTP id a640c23a62f3a-afddcb7f48fmr110735966b.2.1755609419572;
        Tue, 19 Aug 2025 06:16:59 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfccea7sm1005948066b.67.2025.08.19.06.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 06:16:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] ARM: dts: omap: dm814x: Split 'reg' per entry
Date: Tue, 19 Aug 2025 15:16:52 +0200
Message-ID: <20250819131651.86569-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=980; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=+VLxqH0ESqnHDuk3E8kCPOtSdGHTD/8yFJeuZ9BiCYs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopHlDEWYdXbyxtFtlpDztgTjcbe3aHp61Er42M
 sDr4UPxApaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKR5QwAKCRDBN2bmhouD
 11jVD/9UYLfz5ELR6Fcra1tWfRFifgZ5ZybkjRh8OL+71XNyumO9EegMvfET0kkKjxUkuY4uT+U
 fCZsJMPevZYPepjPp+yuaWGL0EI8o+jxrOBKshhFfvl+Y6DTQ/FaNgMkrNWztTV6olKaZOVWTXw
 f+r2lj2mfZFsIP5LgfVsOdhuJAkYGZptmHb2hOTHbW3VPWjD6hHxbHBSOV/ENzWEl0T8/Gb++Uu
 IdbbFyDNR81ouf4Ff23mvNjZc73zVt54vwUgZKZWPCtEVWjCbBWe2S1FxgpSqZaW4gpbtXNgg68
 soBWg43YrHaT1TLCzjdpnlht5Mih0Y3EnHaLZTtWAvX4n+JW8gs6s7KuHzflipQqRqycNryh2Ua
 4BijL9irYBIvIIOqEj0NKdRxciMJOEhbebiv9GLfqH4+UiBdUmYNBgZzg3rberIORc9lPQ3iHRr
 s0EadnuYQ7iIID1oIUD1ZElMN4iPJbctQl4rJmfRR09P83zOMcQp2spkwU/qqoEVx2uowOowHs/
 cJMDIRB37EnSpL+rHdyb8F1tFa1X945OECQupe3I3WRH6MLo34pDpN//wE1C8n7+0ZF2BB+zeTd
 FMUOWWgwBQ0CB6caKMfL7BJ69MiQiB3hA33MreO26vremnzLj5X0QQfwcf5UURmNT2b8E/rzieq wuCoQDSCL4jLtkA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Multiple entries in 'reg' should be encoded in separate <>.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/ti/omap/dm814x.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dm814x.dtsi b/arch/arm/boot/dts/ti/omap/dm814x.dtsi
index a8cd724ce4bc..27d1f35a31fd 100644
--- a/arch/arm/boot/dts/ti/omap/dm814x.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dm814x.dtsi
@@ -155,10 +155,10 @@ &cppi41dma 26 1 &cppi41dma 27 1
 
 			cppi41dma: dma-controller@47402000 {
 				compatible = "ti,am3359-cppi41";
-				reg =  <0x47400000 0x1000
-					0x47402000 0x1000
-					0x47403000 0x1000
-					0x47404000 0x4000>;
+				reg = <0x47400000 0x1000>,
+				      <0x47402000 0x1000>,
+				      <0x47403000 0x1000>,
+				      <0x47404000 0x4000>;
 				reg-names = "glue", "controller", "scheduler", "queuemgr";
 				interrupts = <17>;
 				interrupt-names = "glue";
-- 
2.48.1


