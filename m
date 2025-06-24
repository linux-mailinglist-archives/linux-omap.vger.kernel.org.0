Return-Path: <linux-omap+bounces-3954-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD90AE63DF
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 13:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7372C17F086
	for <lists+linux-omap@lfdr.de>; Tue, 24 Jun 2025 11:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F9728E61E;
	Tue, 24 Jun 2025 11:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codiax-se.20230601.gappssmtp.com header.i=@codiax-se.20230601.gappssmtp.com header.b="MPyaUrd5"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248DD28E5F8
	for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 11:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750765757; cv=none; b=eeMVThHGX1+u6/p6KyxsVGfDjiKToFKqcTee8KPh8RVG9dWi8yj0yEhu2KBA64eB8mAfBKeemmONPbHWDnasywWwSJEAP0tGCOjfmocNNFuVwZv6S0CWHDbNhLAKvrWyV7I36nGRLZ/242ASIuGBK/59H+1ioNywNAiDgl6QNI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750765757; c=relaxed/simple;
	bh=C+ldSKk8CmcmIkATHZDyFz0szza0IdxJ0ts1fTi5YiM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XxanCol2Gee4rNiSdESFFnFxzWlcKDQmor4AvQ6g/fMJ7m17t6MLpLGzBRkwcyMWPN3PsF/9sA2AWMh3AHpsIA3owmaAUIqVI6YtoS3oG4lD8hHL3DuSimMxd8iT9FscrSwEoz4bMgWBUHQYhMYc+vtFfE9b3CHZd4o+ZUcuNiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codiax.se; spf=pass smtp.mailfrom=codiax.se; dkim=pass (2048-bit key) header.d=codiax-se.20230601.gappssmtp.com header.i=@codiax-se.20230601.gappssmtp.com header.b=MPyaUrd5; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codiax.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codiax.se
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-553b584ac96so334755e87.1
        for <linux-omap@vger.kernel.org>; Tue, 24 Jun 2025 04:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=codiax-se.20230601.gappssmtp.com; s=20230601; t=1750765754; x=1751370554; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrUbcmZF3TAdKKDR84X6iLmpavcaVxBgM0j4vAqCqGs=;
        b=MPyaUrd5PYYE4IGNfXqoUsY4Uv9jrcq8rHPHT1JWbrzqZ9fNJ7NP5eEv61atC4e+4h
         gKe3vGgVtEB6rOI53kUs0D1309u9Mr1hBD8Y6/236FHZKday0IaqZFgmtCWR7uwajY4u
         PKKALhuJrgaIuoj2oMyu1yv/eHz4rcp9omRRI2tI26QppDY7yXfQ3OKKwAjSC9cLNHCY
         zkmzFKwrCxkonP7ufXQuTqlVJBKmjgY9wSNuqouScG61br52ijabfQG5fxQw1/7eOu67
         D03NJ286MO5eynj+8GPheNchsimAtkhNvo4vBNsv9xeGTznb4RLv5vFZ/tEO8ULgXW/D
         f63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750765754; x=1751370554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rrUbcmZF3TAdKKDR84X6iLmpavcaVxBgM0j4vAqCqGs=;
        b=IJLP8KvuqNOp1js+yacM8tkptCqgi3+sxxc0u7QdwKdHdw8SvIc8cCg05nGaHAd53n
         eYacyIxWVV6DessTKHqBfYbTzejOeNJkwVv/9SfUGycgh7d11fVWDxXk+jLQSEr1bJ21
         iwm4vC6dyIAzVcWfxUaBrVza5pGRjgdQ5w7xqsJH74ObUdXcjZJkB8d4EA5j0zuMS5xH
         UW1nod2dY5TvKtnjGtc07HS1rTC7YS7yfkzcKRnDEOPZAq/wTylIIWpqB0LuTbpd1DbT
         N2/MBM6+3s62DBYx+V6yAE66h10QVsJArlm/iBTVWhQ8vBrkAzfNqqJJ5YFqD1vZFewJ
         rM3w==
X-Gm-Message-State: AOJu0Yw/cnWZg/VmYMdCt6+m777dfsT2OW0h7FSV/3zJL7DJkGLiQ+7J
	QjfNPgFs9wSyizZZMvE2LP4iYyqgsX/P2n38bONn41YlmCqhysw2tP+sNpubxORsZ1o=
X-Gm-Gg: ASbGncu7AV3TH+gw7xXo0cdIJRxhIA5XB4fNOmSBC02on/InlWVyhX9GF/LuzWqKlyU
	e5KPa1zobODCT1oHObcrAVWrYwBZOKgt1ap/ahGHeOqTOA8nWIRsoQ4SZoyuvXqsGCSMVhKoL+l
	d/S+iVyLIIuwPB4JOxPbtsxgBJR9aK/0cgPkGQcnQqPC0rMa/pZXAsZAxdS+w6hFrpljj+PJN3s
	ale9Llegu9OJjgVoCp1YllaGTeNnuBBtfDc+F9Ig6KtvWewi8TpfC1fZC/SeicsbC+IIFb7dtOG
	dpzzcxj82LwDA1GrEFyGkzHTyOSQHJEZX9s/vns0dki0mmlbXVAxhJGGK2jA0TnhxwEDY6McHVS
	B6aTpVj8r4ZaxxMbFzcUYi4uXdH1k88/B
X-Google-Smtp-Source: AGHT+IFSGexEtfcMzAQ+fzVvPpnt09+h/hiP53/5GJBuSDikVVM5naJcA0DuDdEg78KtDtVifjADUw==
X-Received: by 2002:a05:6512:b87:b0:553:a456:a0c1 with SMTP id 2adb3069b0e04-553e3d04850mr5554575e87.43.1750765752686;
        Tue, 24 Jun 2025 04:49:12 -0700 (PDT)
Received: from falcon.codiax (h-37-123-161-8.A137.corp.bahnhof.se. [37.123.161.8])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c2e5csm1806724e87.155.2025.06.24.04.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 04:49:12 -0700 (PDT)
From: Albin Tornqvist <albin.tornqvist@codiax.se>
To: tony@atomide.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	albin.tornqvist@codiax.se
Subject: [PATCH] arm: dts: ti: omap: Fixup pinheader typo
Date: Tue, 24 Jun 2025 13:48:39 +0200
Message-ID: <20250624114839.1465115-2-albin.tornqvist@codiax.se>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624114839.1465115-1-albin.tornqvist@codiax.se>
References: <20250624114839.1465115-1-albin.tornqvist@codiax.se>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Albin Törnqvist <albin.tornqvist@codiax.se>

This commit fixes a typo introduced in commit
ee368a10d0df ("ARM: dts: am335x-boneblack.dts: unique gpio-line-names").
gpio0_7 is located on the P9 header on the BBB.
This was verified with a BeagleBone Black by toggling the pin and
checking with a multimeter that it corresponds to pin 42 on the P9
header.

Signed-off-by: Albin Törnqvist <albin.tornqvist@codiax.se>
---
 arch/arm/boot/dts/ti/omap/am335x-boneblack.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
index 16b567e3cb47..b4fdcf9c02b5 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-boneblack.dts
@@ -35,7 +35,7 @@ &gpio0 {
 		"P9_18 [spi0_d1]",
 		"P9_17 [spi0_cs0]",
 		"[mmc0_cd]",
-		"P8_42A [ecappwm0]",
+		"P9_42A [ecappwm0]",
 		"P8_35 [lcd d12]",
 		"P8_33 [lcd d13]",
 		"P8_31 [lcd d14]",
-- 
2.43.0


