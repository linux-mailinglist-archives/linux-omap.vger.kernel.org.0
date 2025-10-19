Return-Path: <linux-omap+bounces-4712-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D479BEE5EA
	for <lists+linux-omap@lfdr.de>; Sun, 19 Oct 2025 15:06:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5B3CD3BA3A7
	for <lists+linux-omap@lfdr.de>; Sun, 19 Oct 2025 13:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE3A2EA730;
	Sun, 19 Oct 2025 13:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZmMODl/U"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D64D2EA738
	for <linux-omap@vger.kernel.org>; Sun, 19 Oct 2025 13:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760879137; cv=none; b=SF+omMLKLDNcfB6hNfjDa+OF4MW/Wdf7iLRJtDPkhwH1rD/RIFwF7Qs4pMgDgsRcLl78mVZI9boCar8uDB7Uv9GWpBVadMnDXrJMkry8IMDD/WR6t3pEgMaCkMButRF0qvoJ9xodTsb910yLtCsthx1K70EXMPYHzMkQb2lZO8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760879137; c=relaxed/simple;
	bh=WupZjDzp+mYLUnPliPNHAA8llyM+D76W7Nv/oh/99/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RWE7b+nwXHilQthJ3g71+eRYqzCKiQMZEAg90d9SCsWd6p4+7xJQYgAa3eMpxEFcqKVApO/XZd4pVCJ6qf2Svt34IoN0Un9Pl7Ql9Fd5XrXVcpBtCb1s4Fk9uvjhT2Jla7sORDrIVzeiGUWhHhEZDkoNGrUgXo/ahasRe4Atut4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZmMODl/U; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-290cd62acc3so29026175ad.2
        for <linux-omap@vger.kernel.org>; Sun, 19 Oct 2025 06:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760879135; x=1761483935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8kUPDmdGFI5dlB1Y4l1vU9fWBs35HJfqSRekTM7U1A=;
        b=ZmMODl/U5ZBaJnWBOI0JWM8cWaXuxDw6R68L9tVivnXa3qyug7K66F3ZkPXw5np6dp
         HdQYrNjoOS7R4mzcnPuECTrLmgbQKgkZsd4gbyFJb9uuOg2ZnYb2+nAHP3nnMnhW8G3/
         rCH5OanDFXb/XAXGIl5Xae2OW80FlXu4u4/ZCnFj4N71trbtdpcwu9B2Mb1gz6tI86r6
         E3ecctQtwRnJa87kYJgHRu/B5D7EXS2vk0RaHcCrpr14yh7KzF+EVvhKZ4Uh2AQOD0ne
         n+LfX1OQZdYsWwY2a1wUqO7P8ylPfihhFoTWkZQw67r+IEovOx4Wyw69wg8fBkV1ECHW
         gJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760879135; x=1761483935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8kUPDmdGFI5dlB1Y4l1vU9fWBs35HJfqSRekTM7U1A=;
        b=NDIFW5Hq0Eg2yw56E7f5sgG4omzGeYyfIFQyTPqL5F4i6fo7uSyHpLIEfdxul+d24j
         2GLvSXqPAfG9URzS1cpRBQRYI5EM+pvq44W74wmETSvVdegmO5MY1i4RI4KJTPqqq9fc
         e00i+S3EuZZyV6oYrirRw8akQXTEFcm/NBN4PDjrS5czwzk2yqhriGDdSoHwcQRjcUG9
         a+PFqaelKVLuWkq0JvN7FhPDClnDH16C09gIP0OZ5z1AzENcB7UR9A1DofsFqmKCt5Ow
         cRtM9EVqLmZ4pG0Qw/1Xh0RC/FRnzZz202cXbahmDNl7iTVMzomakQGoDyWBlx9FCSSk
         ifXA==
X-Forwarded-Encrypted: i=1; AJvYcCU6O6SJeurMvuOZG4SUuEy+nXtacTDnUawDt7JGpBLQWxgeJ7P9YnUicRvpf/06le2kUvhfFLvxXpWF@vger.kernel.org
X-Gm-Message-State: AOJu0YxJRXcghzfmjTsBKBPKt5iJI9kbYthmUP0VtT7sjRIfUADEo+rv
	yd1fpIHpX7HrUaHzE+7UtDBjOn+iAnZmFFAshJeesYtLIuv0kkUBe4fn
X-Gm-Gg: ASbGncs4rS6c61m1LV0GvwSqPwSGKadDYlJGkVmEmTau2HTVbgv6ImI/L4yuKUuF6mk
	xnMGFZW8iddxyZJCN7zwHpxLb5YM4o/gTopObU4QDNzPcGLKar1HjX7SpyxO7uN0aohtaEUj+zW
	+DZo1MKfRw9FblZthPbj3w5/PrJZW6TsCQbSeYXPLGdjsIREO+knAB+c6icyh4aukuDOvDsyJQF
	G/v54NdtmLe93+022+nJgadUXnlDWcmtexwS5Ke4XobN27318skBsPikitLJNaQ4Coq2+GMb8rS
	C50OI1jiTbLyL3zLTkgWCX67z4/9HS62NZ5rgkxR6oA00qyOtX2hDUZLHWkeieAlWUDz9AXBWpv
	0OoR9aQ8Qugo1WSMRAXySlmypBzr0yLS+aUy38DpKUmU65GkcZXEhzZezhCN090MBK2SR0gfO30
	3do/J4tHST7hcdJfsXxYviQ+V0
X-Google-Smtp-Source: AGHT+IGna40/zgNzr/p+PlcAD+sAsPiE5QfzBrHx5lk8tHw0QkZCgRgKv2JV/dzTPM82UtUsADs1Mw==
X-Received: by 2002:a17:903:2990:b0:264:8a8d:92e8 with SMTP id d9443c01a7336-290ccab59b1mr119270255ad.59.1760879135435;
        Sun, 19 Oct 2025 06:05:35 -0700 (PDT)
Received: from Black-Pearl.localdomain ([223.181.116.113])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-292471d5c33sm52842425ad.73.2025.10.19.06.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 06:05:34 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sun, 19 Oct 2025 13:04:37 +0000
Subject: [PATCH v4 1/2] arm: dts: ti: omap: am335x-pepper: Fix vmmc-supply
 property typo
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251019-ti-sdhci-omap-v4-1-fdc63aaeb083@gmail.com>
References: <20251019-ti-sdhci-omap-v4-0-fdc63aaeb083@gmail.com>
In-Reply-To: <20251019-ti-sdhci-omap-v4-0-fdc63aaeb083@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Barker <paul.barker@sancloud.com>, 
 Marc Murphy <marc.murphy@sancloud.com>, Tony Lindgren <tony@atomide.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.2

Rectify a typo for the property "vmmc-supply" to resolve the errors
detected by dtb_check.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-pepper.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-pepper.dts b/arch/arm/boot/dts/ti/omap/am335x-pepper.dts
index e7d561a527fdd9eeb15237ddee4c8db1dfd48edd..10d54e0ad15a7ff9770ad02c224b4b47aa5040de 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-pepper.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-pepper.dts
@@ -347,7 +347,7 @@ &mmc3 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&wireless_pins>;
-	vmmmc-supply = <&v3v3c_reg>;
+	vmmc-supply = <&v3v3c_reg>;
 	bus-width = <4>;
 	non-removable;
 	dmas = <&edma_xbar 12 0 1

-- 
2.51.0


