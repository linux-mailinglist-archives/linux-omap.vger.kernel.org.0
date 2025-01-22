Return-Path: <linux-omap+bounces-3174-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCBAA196BF
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 17:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51F97188DAD7
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 16:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F284215777;
	Wed, 22 Jan 2025 16:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TFC3kF5g"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A3E2153D0;
	Wed, 22 Jan 2025 16:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737564105; cv=none; b=A7PMOM/k9VJMJDnbhGP/EsbOKIVu8d3oug50Z4Y/+0yP0i0cMLjv3G/JmqpLhIGNSxIr9glQ0kD8Mg+OOQojaNx4fR8O8VjaBH7cQfBqLPUiMbpGmVMnhzGDQDjFdkDCsG/7BSiMjthcQZddfCxpN3Dr+Gwe32qRmEqAeFojjOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737564105; c=relaxed/simple;
	bh=g8NMn0hLHVMBtvTbXlh21awyVS2jHYWL19EOOVOENnU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hFvrpk8H3fAuBK+SKH9BuQnb5HuWX0pO3SDF/OHjKaqY8GGaYBDwtYiQwc2FChVrLuJSriGRGk8Lzm4Spnl6T8OjBM2T+yyzi7Oeu4nFgePFLnz9n3sHbDEiyoZxMJTxNRDRDxmX2LlRmd335oyh9STuF2sGnRFOkFl7hXCfuEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TFC3kF5g; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab65fca99b6so55603066b.0;
        Wed, 22 Jan 2025 08:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737564102; x=1738168902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3m7xaPUWwm9tKrVHWVOsPlcUqaEpE8/oiuxIl2jQkc=;
        b=TFC3kF5g1bGz/VRftmo7eZqxLLixA5RJskXTzCQ3QPo4nDy3U0TjYwHFLUjUErQ7dm
         +1okodxPwXUi0OlpDTHQ/obERBrJj7EZkzRnmhX1xipMBEgCJEGHAQv2qcQ6r5kjMVC+
         75fDtaJtEVfV8LznfY/BLP6ytQWaJr+Azg2lVwWKXr3Na1Dl99CP6h/Q/WGaKzB34Yf8
         Wedl2sZfgwGkTnPCuckhSTPnvi/1Qgzfywl66Ad9geMUjEqVqWI/4F6uLjBaCW1Re6ro
         YjAjwIHZEFPYmrIP51eWyZKkn2SeU/VWCzZv7a5c6PMsvVC8rSuZfyxMjnabHqznrGtz
         maIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737564102; x=1738168902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3m7xaPUWwm9tKrVHWVOsPlcUqaEpE8/oiuxIl2jQkc=;
        b=b7BURu4mdAbEzdUK+BXlq6CM4LzFSs2yEGwsNeL1kGbIQhXUZvhyntB1UQNgf3ChZq
         Du4HXgzWAilzIZ71zp/rujzSjR73h+VtK/FM2bgSOLQMQQtFd5uIrTgK4Q4/SiKY2tgW
         3NYqGQb84+8NlA4+hIN75spdORBDzfOMVjLf6jg1BebSS5rXZDWQmzLK2Rvgp7iGx/Mk
         7ZuwW/fpJHb0UZmrD4ayp9+/uaszBa2tbqnscOCsbdBmyjIdMMSufd8SilNqbolH0m64
         KvOjLlmvWEh+EjalX7loRArOukLqVsgwm2RjjDl/ccLCKRg1/krpqrpNjJpwpm17e84Z
         ULBg==
X-Forwarded-Encrypted: i=1; AJvYcCUE0JKAUxNkbo6meMnweDXMJGA7l3fZpKaur3XUx2pIxlxJm53+x5tQhk9uuF9Co2+eNy9UD77kxOfF89U=@vger.kernel.org, AJvYcCUpt1APtA+ADTgExV4uyIniQNK+wbYYkga1yW6MzxjvH45VhpKd8J2gHzMYyBmgzb1cpHxNbPVIEIaxlg==@vger.kernel.org, AJvYcCXSlc7L9GDTSA6QEYrNfokvEaEexRan1j53esBqT5ZAHPgCPdzow/zAVTlOoQVrhdRBzJ4du9wiIv0LT6w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4sgAevfEtCiVjT4ufKKPCX1z4Z8ZFjyzzXy0u73RK767W2Qvx
	UmeYIH0uXGsDAFz6JKNEiloWOFCtSq6y6INXsQT14M7yoYs3ZJiCOTVeLA==
X-Gm-Gg: ASbGncsCmq/NmHeZg48IcKS24ptGHWKRfDbyzIim7ADvBr20klijFSOP9sU7hNSyozy
	5Yh8Iz80tUNEf2bdPsHJomCYeof7QVksY6fYoYw9BTuDNqE27dsetPqnr0gTQD0hdop2wp3af5z
	mTgDkV8CSDgkUjVYimEPKZ1L17zM9h1QE8AKKb6GAA2vc+poRNVnE8DYaySHIY8w4ERkwdcGxdD
	OIUVgPiCLlRov3PH1b/2s0c/8jj78Gy3yLRh8K8vwhATtYZ+6A1hhNXkMQNmc88KzbPcWy4dDce
	zUMu6dsrM5SyPLCX
X-Google-Smtp-Source: AGHT+IENnzFBqZyKsqA2ktcAu/q43qm9D2kIfJv3kLbA9I/ptXXE/Pkd9GhJSpQCDrIKoL52pQ8ofA==
X-Received: by 2002:a17:907:7fa3:b0:aa6:707a:af59 with SMTP id a640c23a62f3a-ab38b4c6b1amr2188613666b.50.1737564101889;
        Wed, 22 Jan 2025 08:41:41 -0800 (PST)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5db73642580sm8647061a12.15.2025.01.22.08.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 08:41:41 -0800 (PST)
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
Subject: [PATCH v2 3/5] dt-bindings: mfd: motorola-cpcap: Document audio-codec interrupts
Date: Wed, 22 Jan 2025 18:41:27 +0200
Message-Id: <20250122164129.807247-4-ivo.g.dimitrov.75@gmail.com>
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

Add DT binding for the audio-codec headset detection interrupts.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
index 190230216de8..f00827c9b67f 100644
--- a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
+++ b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
@@ -31,6 +31,10 @@ node must be named "audio-codec".
 Required properties for the audio-codec subnode:
 
 - #sound-dai-cells = <1>;
+- interrupts		: should contain jack detection interrupts, with headset
+			  detect interrupt matching "hs" and microphone bias 2
+			  detect interrupt matching "mb2" in interrupt-names.
+- interrupt-names	: Contains "hs", "mb2"
 
 The audio-codec provides two DAIs. The first one is connected to the
 Stereo HiFi DAC and the second one is connected to the Voice DAC.
@@ -52,6 +56,8 @@ Example:
 
 		audio-codec {
 			#sound-dai-cells = <1>;
+			interrupts-extended = <&cpcap 9 0>, <&cpcap 10 0>;
+			interrupt-names = "hs", "mb2";
 
 			/* HiFi */
 			port@0 {
-- 
2.30.2


