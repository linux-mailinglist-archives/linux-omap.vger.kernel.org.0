Return-Path: <linux-omap+bounces-3175-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B42A196C1
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 17:43:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56602188DA85
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 16:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39308215799;
	Wed, 22 Jan 2025 16:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MLOKJOzy"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308AC2153F8;
	Wed, 22 Jan 2025 16:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564106; cv=none; b=uhdiKcmiXGxXHgQfPi7UYr5+0sNZAy6xKSZvfq8CpfEstsvAdO94YTCN/bs7Eb6Gvt3Wg4IMmwRniqtp7RGXSM0F0SunSrxKKmorMesrmvznBar/KUH4g6winrGTkuDNypfA+LDF2RVnTHDJUwQB3Z9LtnMtmsFm6vRS0H4x1sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564106; c=relaxed/simple;
	bh=UJZR5eGX81EZ8QCacoVBr7T+dtwgTxWLrhCxR8MKSO4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=muLhJWCZpafHvk6kpT0wwSHqdJORaUIZvsHQQiFp6m97nyRKIjIbhoo3zjWWTPHU/t3NJ8bWMV+3X8eu9XU8IExP+0uzyAjaq6spa5ichnyKeQodyy7EItnwIQkU6mf1FPvk4GEigPkxPNn3XlS2Luh7ojkU9gMq+TJpQo6+dcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MLOKJOzy; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3cf094768so12663421a12.0;
        Wed, 22 Jan 2025 08:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737564103; x=1738168903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkrLNR1N8oTtp2ONm8zlCt9/U3KQIfyGfSRbXwsExTk=;
        b=MLOKJOzyOvDX/JpiphdE6MeR1/xHc88EVREMQNXKpf1tns5retuJLYoVdmrb7iKp3C
         qYGQJTWwSVV4EEKq5cMX0CAl9sfDJyN6j7KOMztTKheUjHYDctqeNroI6tKsgACLMeut
         Uhs1kZG5p+qUfyCqDcg6mVaheJr0C+2zjggr/A/L+MtvrP9pp5VNBRD0oOp2mroRiwUR
         L9nOaiFtz9pdQ03j965EdausSf8R67WVimu5F+FPz0Uu1HmDzhJxeXA7Bpja4XT92pdo
         pEu7TrX1xMOTV28z0KCPMmysSMqT6Z/BmWJ+eh8OTa9mrFlO2k5G2vcGFzIK7OCMqYrA
         im3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737564103; x=1738168903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NkrLNR1N8oTtp2ONm8zlCt9/U3KQIfyGfSRbXwsExTk=;
        b=qOsWtXuvLjSahHxqHMC9USNbLKpgVlIaXqgh+HiZA5AXBmCEMlcjj4gwEm/cVqxi58
         WE9vNKX8wRB3omNWOo1MhRaSgO0m2U6z/scoH9XkTl0SFB/wgEZOtoCjNYm01GVoLOIU
         AwWAlaaJrnl5CQ5+imE/jfgwbgZs/WhuUSAlmkFdVV6BhJr0dWROGxVrftQJrM9zI/QM
         01Ubj5ZjRzbf4FndhQMIDMvi0cFuQCHFpNqG+UmnelJHuAEWQve+3jxTpPKiMMAjA7l2
         pckat5fWlMqL6q8bgwCnb9i9G101G4j0IxRD5UJXiUbYmL2x5k7ioNBvh73kMGnMK+Er
         KaNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0Il4chHoZswt8aMJta81KcUuVrHaHFi9XaEMYbwjHMtG1qZAqpK5yWc08kccqPDI4iqNh1VeGQBFJyN8=@vger.kernel.org, AJvYcCW305zSahmJvcCi15/IhP9CLWfLQqRUIE5vTkvkirAzZqfo5Ji0KkgsJOqQfDsYKPa2ZtbfAC6tpxq1gA==@vger.kernel.org, AJvYcCX4vnZEMdp2mbD0Fc5kHLhJmTBaVXY6O+0EIXO7UkSR/TCrjmyiXMubVn8zL2uAfOAbkR+cZn92bysmMXo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDykdsPljZHEBXhLo2CvUFPugEZgYTrteHA0XyoUIvt/VSP30L
	3cMzfksqm/Tel+8qhYAtpAH6tVwTT7h6DX5PMUz1Es1/pKjd8Y8+
X-Gm-Gg: ASbGncsmq9yQsFgkQ30N+qo/OS9QzSY60cY1kuiJ8Z/oYJBqVJH1poQYaIB2rWaVqLv
	y+6sk6FotyXlfJiDL0iY/htmqAWu2oyViF8wdxfQJR0guNEDVJPvjd1Yn9etde9B/lSfL/sbkXu
	RrLX88qJzI056aqPiBuv3/Ero8tiwT2s/NlpwGPRxgW8xiGd9ifSmxc1KM1MRTy3X0NXgGGoXdu
	vdczkz1T2VavsG5OvT1iHKBL75UKB6odU2QDZhI718AABlKNHccPnaOgSL6SGWe2AZg8wmTZ+19
	h3wfQedVwnFTrBb6
X-Google-Smtp-Source: AGHT+IFnLn39emvG1lAhwg4us/Q0d17UC/eY9waKPuMcn5ZhI+bNXuDQqyXAi2J+PyGzepIIvg0aCA==
X-Received: by 2002:a05:6402:254e:b0:5da:1544:7733 with SMTP id 4fb4d7f45d1cf-5db7d2facd0mr22094344a12.9.1737564103308;
        Wed, 22 Jan 2025 08:41:43 -0800 (PST)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73642580sm8647061a12.15.2025.01.22.08.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 08:41:43 -0800 (PST)
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
Subject: [PATCH v2 4/5] arch: arm: dts: cpcap-mapphone: Add audio-codec jack detection interrupts
Date: Wed, 22 Jan 2025 18:41:28 +0200
Message-Id: <20250122164129.807247-5-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
References: <20250122164129.807247-1-ivo.g.dimitrov.75@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cpcap audio-codec supports headset/micrphone detect interrupts, configure
them.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
index 83fd58157579..73e27b95105e 100644
--- a/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
+++ b/arch/arm/boot/dts/ti/omap/motorola-cpcap-mapphone.dtsi
@@ -69,6 +69,8 @@ cpcap_regulators: regulators {
 
 		cpcap_audio: audio-codec {
 			#sound-dai-cells = <1>;
+			interrupts-extended = <&cpcap 9 0>, <&cpcap 10 0>;
+			interrupt-names = "hs", "mb2";
 
 			port@0 {
 				cpcap_audio_codec0: endpoint {
-- 
2.30.2


