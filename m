Return-Path: <linux-omap+bounces-4657-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BE3BC1082
	for <lists+linux-omap@lfdr.de>; Tue, 07 Oct 2025 12:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69E9B3BEF21
	for <lists+linux-omap@lfdr.de>; Tue,  7 Oct 2025 10:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC1E26057A;
	Tue,  7 Oct 2025 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Vd3OHpdF"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F491230BCC
	for <linux-omap@vger.kernel.org>; Tue,  7 Oct 2025 10:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759833540; cv=none; b=j/sGw6JYKQ+vTQWL+J9zBFdMJGOZGEZbFUkuhNNxS3Nocg3aGmRW5rl4nLPSz4jWcA4E3UKVOCArPs6GnR1h5bdJElXES/MaX9EviWd8+mbz9WqPdPpsqS9TE1AJral8p/j9o0NLlaraPTH9h6xuMDkS7U/7yzwZRVpcOc0oUAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759833540; c=relaxed/simple;
	bh=6MiEMqAqQwyLlqu9lDFaGlJxC3WSjjssQQx1VLQ0+/E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i/NlxFXppVzwDphYkagiEshC4w06zZmUc3JOuIJO8em9T/4CsE3xWPZrOwU7sdDhqLSUG+/u67P4hOblvlEomkkv9Lx5nVb0N6s1Q1D0H1+kd1OYgkc+op11G0Sc5lPWLlbEEBGw9ERgM0R/3KDtL/ABe1W12aSaX8lDV5vjwng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Vd3OHpdF; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-637e9f9f9fbso9687431a12.0
        for <linux-omap@vger.kernel.org>; Tue, 07 Oct 2025 03:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759833536; x=1760438336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6dzB7w8JnCDqEzwBnnCgaQpM3AmShd/iZntpdkG+0HA=;
        b=Vd3OHpdFopCFHYTtZH9JH2O1UUSEUTT2YiEulhJf++lLs0YlKAMW60rqM9NISZA/S2
         dlKbnrLFboYn0bIjRKARd8cJ3rao270mAUKJFAH0O8JkEH83Rw5Alt3EQn+EEv5ERE/J
         pPu7c2YRkHMvXbFnharCZBGw9qgEH1gKbeSfmierllYTqTCoCYs8j/1AVuWjmG8VIlhd
         TUUgslnIALZSelAqd6mGawA8kie+c82tEB/AsioHutST6MQQ3PdDcYi6P0zj2JSBExrU
         cnwPuco8VO6dO4bIWoDdgtRBEyK6XZcUCR2o8b+N/pJOEaxeS1riI0nJOTqzF6uOfLwu
         SgLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759833536; x=1760438336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6dzB7w8JnCDqEzwBnnCgaQpM3AmShd/iZntpdkG+0HA=;
        b=RGwcg74ZLYyQK1n5SmzY3leHqfMUKDeUos5/Vg7Qb1DLOgZrn2Al3ZlHkBJk6Aoq+S
         +clwmfiW8UTU5uiLd72ion47l2xIZuAIgL5GMqa0LSAPCEQEz1XdSFAaAbcgT1BSC9c2
         HGU71gt4HzhSJXDYD3m98AhXW4czvg4W3Xh12/s72IUULeLqm5NLCUsIN0sqC0f3B67b
         aXMdYpmRB6HTo6vMJW0iX1utaMFoL7CJDBsdVVPAvtVM8JHz7qT0FKHfDzkOnBFV9GZN
         G07saZDo1cRL06BUZyPa8eMGxnVdbSwEL4+cdp5mYZcufXqu/EWtpPKQolZ3Cx5ipA4p
         gdUw==
X-Gm-Message-State: AOJu0YzmWe9f7CkfQq/2xz9h1fqLZogEVr0npzh1Xniqlu2/R1ceUm+Q
	vLZ/83J7vJt2GNNkEMrVBe5fWz/2d+XxYPCv7PQCx/4+T63PhmUWVSzpUUDyjw==
X-Gm-Gg: ASbGnctc66wRh6jram9t+SyYXb3E3c8ENA/QLF/Pa0P6OMY8qNUqL6FkGLoYHw0Fn9p
	fxQThrxX4TLOUK0SSyKz2PZRse+4hh5R6hicGnDZi+Pe3Th7B56uTb8sn0AJPK5aUjdN4XqLmHr
	2rMPEsEkICBUWqJj+sDSyUBi7eiMoSwm9x5XDTclv6yCLUGbfDeVGZ7SgjhCvT9KI0ADfG7HniW
	F+K8jv4lmdlh1ybFE8ML+tQcnLhQi6rlyKOagOm/GHltgn0uXYUgwW1NIltOD4kdoS0imf1SWdA
	WRqOXZKIWFjZBLis+2XbzyNC1hAigosU5nJgmnGTImgEzkH3nY//fvL3hLedf4KZVT0NBN4acvi
	CdHsSGnUqFF0mGfk31+NDyp4XFOGm1WtuVXX5QkghgdlzQpuYo9vUBdAySfucjDbtWOvgWWBkND
	Bzsorhk5Djru4zfuRz52Z9A4YUOV8=
X-Google-Smtp-Source: AGHT+IHHAQtjOIHEDbfkHEKG2NfHrgaRmrEgmgbaSUEGGCfJ/unMbpSGdEUv0xTl6RK/QLenVxoU3w==
X-Received: by 2002:a05:6402:3508:b0:639:102b:b8db with SMTP id 4fb4d7f45d1cf-63939c20419mr16928471a12.24.1759833536384;
        Tue, 07 Oct 2025 03:38:56 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de. [213.209.99.202])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6376b3aa9f1sm12026832a12.8.2025.10.07.03.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 03:38:55 -0700 (PDT)
From: yegorslists@googlemail.com
To: devicetree@vger.kernel.org
Cc: linux-omap@vger.kernel.org,
	tony@atomide.com,
	robh@kernel.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Subject: [PATCH] ARM: dts: am335x-netcom-plus-2xx: add missing GPIO labels
Date: Tue,  7 Oct 2025 12:38:51 +0200
Message-Id: <20251007103851.3765678-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yegor Yefremov <yegorslists@googlemail.com>

Fixes: 8e9d75fd2ec2 ("ARM: dts: am335x-netcom: add GPIO names for NetCom Plus 2-port devices")

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dts b/arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dts
index f66d57bb685e..f0519ab30141 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dts
@@ -222,10 +222,10 @@ &gpio3 {
 		"ModeA1",
 		"ModeA2",
 		"ModeA3",
-		"NC",
-		"NC",
-		"NC",
-		"NC",
+		"ModeB0",
+		"ModeB1",
+		"ModeB2",
+		"ModeB3",
 		"NC",
 		"NC",
 		"NC",
-- 
2.34.1


