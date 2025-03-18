Return-Path: <linux-omap+bounces-3436-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FDBA6805B
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 00:02:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0D073B7E03
	for <lists+linux-omap@lfdr.de>; Tue, 18 Mar 2025 23:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929552144CF;
	Tue, 18 Mar 2025 23:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="UqMxC/Ws"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999AD21420F
	for <linux-omap@vger.kernel.org>; Tue, 18 Mar 2025 23:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742338863; cv=none; b=DbWQvi20sSoPYhWn6j07CmkW59IEAgJe6BFTFkgR/iYTGi0APvjgz4f1EEMevX/8mFr3xxiH370CgDcn3f5xm9vj1+rvFUKHuLO1m73COVTnNvCnw6NHypt/2CdFtpRe992VaIKmfy6WYyWQWqnYexM3mcEeuYHNMmNwr7ApGRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742338863; c=relaxed/simple;
	bh=Dlk5H4z+VhU5Q7nLlJ6DokEx98BkmTjtJY03Wn8wrdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FeMTfQgNWsmWr4sKhIb5tAI5FGkZQUcZSBF/t9fb/xI3M9uCp8Pysnzrk7OxFJlvCE1h0s3P13zpXKKUBWbpE4yV2O1Yvig8Q6IYv01y0BWEx7k6F4zHxOl8GA71uNxSI9oeIr8DLIx2C0Lr9nutnniLUInQlTMmQ4bNyXd7Kno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=UqMxC/Ws; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22548a28d0cso17411605ad.3
        for <linux-omap@vger.kernel.org>; Tue, 18 Mar 2025 16:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742338860; x=1742943660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmCr9y/zny2ubL+q+EvXUgJdImEUCfchERMe1C0cWbE=;
        b=UqMxC/Ws/KRLfEqF7NZkXoWc9+4bWSLVKult+CEP3cZQKHDNcxgcGaMLZyAsprJv/w
         O/Vwirgo8gX8ZZRjDWEjEhmgB95VCSMAySKO3BG8vZvJtBDQp5mL8JwNbx3jJOmZlO+a
         FvOfoEprIdD7T7++LJVzBXQ7yh8iMWlIfzt3cIczoUXx38zovzMIHouaWMtvvmK3d4aJ
         XuxJHLP8OgcoF9gCq4giyW4Gi7l30uK2d6RcHxqLAbj1HcyA10BCGqA/+vJuqcPRSuLy
         J95mQP3CtDh1H7lk+tZrGuVpF3Pw3EAs1/lvGa3w2BOy51HzRzYfBayEUVnpNKtth5Pu
         VejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742338860; x=1742943660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmCr9y/zny2ubL+q+EvXUgJdImEUCfchERMe1C0cWbE=;
        b=ejZdDtTx9yvbh8yHuccpnmqcRioH1dC6YTLd3ZnKNspGt7oU1JFwNkaf+2f9fN2V3k
         DjAUGEdWvC17Dcac7b5nRsKIqBqE7KaYF/xNz0o+N933/biZS/mvIx7F6q/amuoA0uFe
         0LE1+4xIa1waCrx3lm1RY72pZNZnXsk+Sb+BEQXgBJuS28DCqXi7p5EphsYBkfa9/McE
         5uDuQdrgmJJoY8NRzfVtWj9P+Y0aJlFxMO0YFXMOG/+wcxJFaf7tDd1mvjNOB1QWN1i+
         R6Sm5JU/yiudMHA3oyvnT+kMHUfVdWgoS51/cdJWcl+94CFsZ70I7EWCZlRmJTFiq/QQ
         be9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFahnV3z2Yb1jPYtp89taXMH+hTcSpzUv01Z8wCgzPaKQ4gaqQMRsL82OVmCQ7i16Ubd/9Aw8cFeNw@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh4j2sdOzT7c540ukoIt8MZtZqOmSl4e6GAfVgmqb/7xszQh+v
	MvlaFLScX69KeOlbfqKVCX7HmUaFlTUz8DzR4NBGg2bdT7c2AhsyMiZJJvS4p+w=
X-Gm-Gg: ASbGncuQxm3976NENyWPsc6nk4Q5IM+sVXqRS1WBblDOQ7R6A/uyKz19vEVJFhPvj9Y
	NiLCn2o2b55nUIfUoIjpxYB1CGDvqpQQHM0OLSC80RiSP1eHKddFmnU7iLur6cONvO8MUjr+kkj
	t3mgXzXpZAbW1JCv7LAV6zbdWOqab1tmZ/+/P0PV3rKCPBVcx5H3+hbRL2KoBqGN9d5etFOhKXp
	MHsrKJ7V+uVvtacZpj+9sZPWhaKMBogAWitDrKaeUA7U6nzU2dACMYJKCrbrFH0Bj0M8BZ3l4bo
	pUEJAKI7TShnK4I3vZkNuEwg5gWvXvJUMhVDWjhK+7gN+bDRnEizNreoLuTJ6YBS6ZLicEHUN2b
	nyQt2tRR1EFKah/fwIQ==
X-Google-Smtp-Source: AGHT+IHoN+lflWvy8IsxGNjvVcOT3P03WGhfooUosnPSGHOlgyWeNcf/Uk7lY1kmD1/bWRv0OH1Aeg==
X-Received: by 2002:a17:902:f647:b0:224:f12:3734 with SMTP id d9443c01a7336-22649a43b2amr6644945ad.30.1742338860084;
        Tue, 18 Mar 2025 16:01:00 -0700 (PDT)
Received: from dev-linux.. (syn-076-088-115-008.res.spectrum.com. [76.88.115.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6f14sm100739465ad.111.2025.03.18.16.00.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 16:00:59 -0700 (PDT)
From: Sukrut Bellary <sbellary@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
	Russell King <linux@armlinux.org.uk>,
	Rob Herring <robh@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Roger Quadros <rogerq@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Bajjuri Praneeth <praneeth@ti.com>,
	Raghavendra Vignesh <vigneshr@ti.com>,
	Bin Liu <b-liu@ti.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: am335x: Set wakeup-source for UART0
Date: Tue, 18 Mar 2025 16:00:41 -0700
Message-Id: <20250318230042.3138542-4-sbellary@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318230042.3138542-1-sbellary@baylibre.com>
References: <20250318230042.3138542-1-sbellary@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On am335x evm[1], UART0(UART1-HW) has a wakeup capability.
Set wakeup-source, which will be used in the omap serial driver to enable
the device wakeup capability.

[1] https://www.ti.com/tool/TMDXEVM3358
[2] AM335x TRM - https://www.ti.com/lit/ug/spruh73q/spruh73q.pdf

Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
---
 arch/arm/boot/dts/ti/omap/am335x-evm.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-evm.dts b/arch/arm/boot/dts/ti/omap/am335x-evm.dts
index 61bf8bcd4c4e..20222f82f21b 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-evm.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-evm.dts
@@ -388,7 +388,7 @@ AM33XX_PADCONF(AM335X_PIN_UART0_RTSN, PIN_INPUT_PULLDOWN, MUX_MODE2) /* uart0_rt
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
-
+	wakeup-source;
 	status = "okay";
 };
 
-- 
2.34.1


