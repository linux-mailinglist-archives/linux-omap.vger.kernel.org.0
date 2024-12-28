Return-Path: <linux-omap+bounces-2910-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC779FDA3A
	for <lists+linux-omap@lfdr.de>; Sat, 28 Dec 2024 12:46:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3047318835ED
	for <lists+linux-omap@lfdr.de>; Sat, 28 Dec 2024 11:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32EE515B0E2;
	Sat, 28 Dec 2024 11:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k0q6X+py"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DDE158DC6;
	Sat, 28 Dec 2024 11:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735386341; cv=none; b=WYWwpL6jj7jAJnbpLoVBaNNvRQQIW445nHGEMe4m+sNxRpeaj4TIftJ0ccevMMuCfq/nlamPuFgBpw+h1AM+pglX8iS+UpXcqnwYLDe7SMAhVygXcvbIL2tSGhZyN9fKwl+CtkYPcfSclsLU+wZdB7SQWcIQu+OHMwx8GNcWBPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735386341; c=relaxed/simple;
	bh=d6UyrRejsmAfm96ju9NgqEy2wiiUs0ECRS5QBVZv7yk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NNLgu4LWJHYs2zJaHPIGBW91rqyaM3NC6QSyuhAu3BDWEzMfB4ggq9W7c5HwJ6u0kCG/e9t5b15sLBx8UF+uAWiLzGLp9XW4H8Q3dT6QM1yRGcIk8XaaQKNg5jNvUBTIii105pIqmVwOkMAwgHLWKb8rnmw28rb1o2pdoLgAFm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k0q6X+py; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso78938035e9.0;
        Sat, 28 Dec 2024 03:45:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735386338; x=1735991138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFopIDpO+r6tipeoCoOKjYN5R3LZIo87O8iXRWy2xZo=;
        b=k0q6X+pyZsOXtSpjp6s10FqNrD5XzZmzAQcvtvAHOFUeLriLQqPrPSiqP7harCAHrc
         5LreHtlawE2LJY8CRM6agjVn23xGo5+VYL3TgvvOBsb15YDxSh8VucySQ2p/QKraitk9
         A5GXU71c/ndOZO3jIH0/4eYcXSVf2Wzt66xkjZlbMUazbUguLeDQcMnh9QOwj4ZqEJZc
         1bTK06GeAr4FGpre0r9LKD/NL3fGRW073zZRHzPBUmcLi6lz3nY3edDYh9254NqrD3DR
         BsjvA2Yvb8YELeVqo3/viXGvOvGZ2cdOLKjlZCsbvB+hjldbAKndp/XNG4JiqXV721XX
         8wEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735386338; x=1735991138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFopIDpO+r6tipeoCoOKjYN5R3LZIo87O8iXRWy2xZo=;
        b=vF5r0QwHbW9Wr37xyByu4VxvfHqIxxQgky71CB+PgCd9517pbrMCVeN5UL6DiWJ5ve
         w1zizVoAIMBhncQB7SIQXcUGDyyJlCLXAmxoexlosS2AxSsFDOwwHLOofNrMuSekBKTl
         c5sYo00rnw1Ixsrsn617RgUDRIOymU4p9xiOv9LkeJCxGom7cZPWO2vt+WyECOvhpZ3S
         C4ad98tDjsgdpY8x3Rb0cgvvzQ4rw9c477k/SJWQs/E5/tdqnJusE2afvqzABELIpHBR
         F6H0B37/pHHDjy3VKfeXSMHgM4h9wstUrM8RWMjOHRhfD8uAii5JduIRaJWsZR4F7ww8
         iYCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT5b0CNRsjq+EOC4Cpa8iiCaKFzjmfcC8LcPcpJ+/nZ41vxv5pGZqVb9JwjkYvm6IR30R2WmNPaoEvM9M=@vger.kernel.org, AJvYcCWH7v2a0XIzK0AQv+uMg475IlwLmFPhuC5mTJy92LXFUP2sHhsS28umKDCzD0stOevIpVUc2t2vDx2TMeA=@vger.kernel.org, AJvYcCWiRjad28GP/PP1sA0+DZqWuCqODMKqsCd7thlSU14PQ70VvJqSBa/Is9eT8jTOj+KTenqF1VYRgc7DzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTmtdX8CHwsXsFsNz1RgdnUr7dhP8PwOMJATH7l16OQ0eXoEnq
	NBjCfiPVWK7P0D1BogmDHpo1qjkvQxA+jou+xvk9gxd/5G3wv+NlawZ7wg==
X-Gm-Gg: ASbGncuGWY/mMNlH0CnSNxCNC8qaKw74NBoGAqPLAg+n7PbfISJ+izGkcmKvElCDOMy
	nbZCSlr6ARwiUdBYn9qydwF9OrGmSKeGz1ec0dPW1M+edBkxaVBFMr1MOHdU9yVmJ/3LkHvhfRY
	/M8JVb+2xf1/B1dhVGnIoY9KWw+Rba1D87dPhlhwO4cnBVbqrcunHrSlqIOd1cgJJtxuXJKtY5d
	n7JmRkxlvBumRMNB96ZTYNj6/Ddmmdk/hhFC9+eBl3tMngRjS9Tgj96V/vQqONKzfNeD/toHJLH
	IuA=
X-Google-Smtp-Source: AGHT+IFHEAJ5xGTydhruVrlDtkHtKRh4GSthe6tGTbUqhPFVUcQdVtILaaGTux8S+FCIHdMgz2zzXg==
X-Received: by 2002:a5d:64a8:0:b0:38a:418e:f3f with SMTP id ffacd0b85a97d-38a418e1085mr10220236f8f.3.1735386338214;
        Sat, 28 Dec 2024 03:45:38 -0800 (PST)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436604e9c2csm295344975e9.43.2024.12.28.03.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 03:45:37 -0800 (PST)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH 1/5] arch: arm: dts: cpcap-mapphone: Set VAUDIO regulator always-on
Date: Sat, 28 Dec 2024 13:45:10 +0200
Message-Id: <20241228114514.91594-2-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241228114514.91594-1-ivo.g.dimitrov.75@gmail.com>
References: <20241228114514.91594-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

VAUDIO regulator is used by cpcap codec and currently is enabled/disabled
by dapm logic, however, when regulator is turned off, various cpcap
functions (like jack detection) do not work.

Configure VAUDIO regulator-allowed-modes property while at it to enable
low-power regulator mode being set.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
index ea02fd403a9b..83fd58157579 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
@@ -267,6 +267,8 @@ vaudio: VAUDIO {
 		regulator-min-microvolt = <2775000>;
 		regulator-max-microvolt = <2775000>;
 		regulator-enable-ramp-delay = <1000>;
-		regulator-initial-mode = <0x00>; /* NORMAL */
+		regulator-allowed-modes = <0x00>, <0x40>; /* ON, LOW_PWR */
+		regulator-initial-mode = <0x00>; /* ON */
+		regulator-always-on;
 	};
 };
-- 
2.30.2


