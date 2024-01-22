Return-Path: <linux-omap+bounces-331-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F4D8361F4
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jan 2024 12:37:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D0152B29059
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jan 2024 11:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 065673BB38;
	Mon, 22 Jan 2024 11:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="K7vvULpI"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACE63A8DB
	for <linux-omap@vger.kernel.org>; Mon, 22 Jan 2024 11:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922459; cv=none; b=QKZkrknjFiJPYk16JssjQDnYOHcy3N84LpFo1SDE7OH0AADB5wCOxTYlzdQkuTKfcK6eIy8J5Wu4VvVf+MTqTE6yQYmw5yhnq2Tb/skKfMIGl8hrHuWhT+A7n3RRV9bTEAL27a59b9pmCJcZFcvhCgFl8t0RDLhCl/3fPeUhahw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922459; c=relaxed/simple;
	bh=IKk+Kfg2Q6fOryNZ72gJ8GQi48EqO5hwpMryGw7culg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UdR5ZocQrdmH/oQPkb1EnH+tRj0OW7O+iRx3mJgV19WWmsqOrOzYn1oj09+4JecTYuZnriDr14uutp/aNO+tGHRlWdpZpQRObcfB/66butX3nIt0bI3s9q/5PePEbbT8/vPJKSzFJ4czJkMns5d90iO1ng+xhKLK0VQy4CHkZbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=K7vvULpI; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40eabd0414aso12402445e9.2
        for <linux-omap@vger.kernel.org>; Mon, 22 Jan 2024 03:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705922456; x=1706527256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yKaD+NiZsbhR9Mm1hV4svlNvNE9hMLyrTMWG7T9RT88=;
        b=K7vvULpIogDOqr7FQO7gVoxsorV77ux8F2J3U6nzthAhb5Mo00hTEKvDujqbDr7y5L
         8dEaoLkOcFBPw6BTELgoGdNJLxMhxN2gMVKP971LJQlJlqLgtZuqsS9t6lAYIDnarPO/
         llIcqlraFtulv0OoHVn1/t+q+dBF0nwPZLAQgPaEPMqsmGXSo3feH84ow/NEmcGb1zkY
         6Wuv0lklTDcueWb18UtH5o3QekVhQtDBwZ2gKPFRyfldJ9SeIkkjyVWSIr8YyNHVqhP0
         JQw1OqAnb3VDsFFuBdHmjyTxKGqUcgCv/diImXzcobn0kY2CkmlGRd8QxPgGLYEyGImM
         06Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922456; x=1706527256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yKaD+NiZsbhR9Mm1hV4svlNvNE9hMLyrTMWG7T9RT88=;
        b=Idxk7pQ03vxzPZ0tNUwjFTvSun+D/CWBBcSwSqEaS2pICbMKuAmAtCA3n+c/ACcO3D
         /Ne/peVFgh3LReZprdb33Zh3Z/UsnyNl1NcabTIXFurW5yLgx3iDF0h3Bj30XwrJqzoD
         +dAwppwfKfYniVB3JBCOPS5jRMMalCXRnCkCV6yfbKJ2qeudT7HutEIVN6lILFZwwCyE
         fYIj2wK2aeHJlZJM7WGcyPWm3GMkqYxb7+NgABZxLpU0s09bKmgoLtYvJv9ZxVdPXgWO
         xrh3h6xuDHeQsjY0DZUsot7GJkI0kElBQj7TOOB5ukSXVp9t82NGkpPbRW20mqCMuERE
         5XJA==
X-Gm-Message-State: AOJu0YxnB342ZSvDFCxc8wKNnGhBPaEtXdUILKkCuF6AL1OBTdg2TFvV
	/TzJOJ8Jwwr09U7vdUhsYsp1hL7A4UUUPc8zyaEZ9GuxVtmIFxsZsnNSigxlB6nybxD78PRik7m
	G
X-Google-Smtp-Source: AGHT+IHAhiTJn4iKjM+5TWBYD8zolPLRvbbeGRKB/M8W+eruWGVTxhWQawrt63+op3Xf6vvvT2FjnQ==
X-Received: by 2002:a05:600c:16ca:b0:40d:5c56:5545 with SMTP id l10-20020a05600c16ca00b0040d5c565545mr1254978wmn.298.1705922455951;
        Mon, 22 Jan 2024 03:20:55 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr. [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
        by smtp.gmail.com with ESMTPSA id w18-20020a05600c475200b0040d2d33312csm39204614wmo.2.2024.01.22.03.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:20:55 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Romain Naour <romain.naour@skf.com>
Subject: [PATCH 2/3] arch/arm/boot/dts/dra7xx-clocks.dtsi: add missing unit addresse
Date: Mon, 22 Jan 2024 12:19:47 +0100
Message-ID: <20240122111948.416444-2-romain.naour@smile.fr>
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

sys_32k_ck node have 'reg' so it must have unit address.

Fixes:
Warning (unit_address_vs_reg): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/clocks/clock-sys-32k: node has a reg or ranges property, but no unit name

Signed-off-by: Romain Naour <romain.naour@skf.com>
---
 arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi b/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
index 04a7a6d1d529..06466d36caa9 100644
--- a/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7xx-clocks.dtsi
@@ -1685,7 +1685,7 @@ ehrpwm2_tbclk: clock-ehrpwm2-tbclk-22@558 {
 		reg = <0x0558>;
 	};
 
-	sys_32k_ck: clock-sys-32k {
+	sys_32k_ck: clock-sys-32k@6c4 {
 		#clock-cells = <0>;
 		compatible = "ti,mux-clock";
 		clock-output-names = "sys_32k_ck";
-- 
2.43.0


