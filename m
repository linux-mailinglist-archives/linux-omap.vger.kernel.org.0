Return-Path: <linux-omap+bounces-2911-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFAA9FDA3D
	for <lists+linux-omap@lfdr.de>; Sat, 28 Dec 2024 12:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A19E3161E81
	for <lists+linux-omap@lfdr.de>; Sat, 28 Dec 2024 11:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C825B161310;
	Sat, 28 Dec 2024 11:45:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LEThKUpK"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B877615B547;
	Sat, 28 Dec 2024 11:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735386344; cv=none; b=GVtBa8AGdUCNNGrzA5khDKsIcD8MiHI1QE5q/9/gxt58+NhNJNxtp0tHCvWfpDswPZ30VdsjT5xPcM2uSAwoK5TgvBxikvbQ10Ao/eiPffsdqVU0Js/WeC6jsNIndxEXOjkfo/K8M28K270FuyQqYENfG8TpP5woWZxxWqgkB8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735386344; c=relaxed/simple;
	bh=DUAc9HZSl9erguOlLaChUT/uhGpliQdM4qk4Qx6t8V0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KtHmloMsu2pz3CqB8nnvBncJkTneoYoTgsD8y05xO2PR77mrY0K1RyV0l4ZKHTAxQgwe/Mz0vkl7GB9+L+uYnk8nHEgkmN9IsqGNn6b24QxaxwBZX5OtxEQ9NIdIf+UZGy/GTnBHNqeehpPcWM7g4BrkrCUTXDjF9iu5+7d32bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LEThKUpK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4368a293339so36352865e9.3;
        Sat, 28 Dec 2024 03:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735386341; x=1735991141; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSgsXD4iYArLNZe0DXDvxbYGmey8AYc/G5vzDfo3ins=;
        b=LEThKUpK1TEEBf+V55o6pTprrFVtzSnh7zjbl6nt/RjwQiNiEsZ4LIMOb1s6AffN1o
         PZSFBv0JQPm0DaPIh7NXZE5+Wm5+cmZwhpHpRDuc0B2as615FzOAEiVSQ4wBkGyAR6QI
         b6S+XjE/RryHlj1bow8YwkVCSpnh8D8xbfgwyUsLzjE8lzKJfGVQIkn/7HCq4IAFlHz0
         HA15n4b9Wtp/RIdzoHPmsDz5+McLccFE6c3+riDKVXjYc26nLpV4nu17esfNcpyp+/S6
         gAGeu+DI02xJ+8D20Lb9OCfz2SO872UeOyY0NHL6vTBqFxDnk0vBjVyIJoJ8RxsPQYP8
         brlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735386341; x=1735991141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSgsXD4iYArLNZe0DXDvxbYGmey8AYc/G5vzDfo3ins=;
        b=nTD4l8PPWwtLGVTo/c8bYpFsul3/waUrduLIvT04AjOBLyFhReakMQxvNFfm3FqmdQ
         yFlH1rOlhwjgHrtn9Fo77TiHAX4u93C52Q4440hBEixBxcYXwuD5j3L4Y0FyLPDd0mFn
         o/NLIMNvttaJin1Dx0KrzVBPhPNC9bV4uRsyQ0LP2J6uf00bKwxpsEwe+O7Iez+EvGBk
         vfnSEG8rwNgsZ/Y9WnfVMhkHSZUbhjWb83rHuGw6cYl6PbeLiJ5NCewD/OOooYw+v5rA
         3l2AU9iAceP+oSTZb1z5zRRSF4E5z9c3oZPo4Ue/bXADx++MZS0eKczHkm2UMUI04JGY
         cKNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCRmYnenSB0tZNiig+/BSG8Ei96RHA+lb1KeWwOlZNPStWCtyqpkfOm9TzWTQa86eH7apY2es4x1IrDlg=@vger.kernel.org, AJvYcCW1TVZaZVKW6D5mlNc1ZP00q7QsfxwfeeAjvy09IAa31dxYO5D6mNhYDVU6uWu4kVat5HuXKikE4Sfl2g==@vger.kernel.org, AJvYcCXBUOFgmkFQYckPV5StAD+fLrC/tt/omjpuQQBXeZE2PaKkXBcQrxQKK5ZfmWCMbj87CZwq3HizM82MJyo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDBl9tgULnEtHSeVVFuHBcLEZwCk6pZkDBeeHYqSWH6hF8OMZU
	hd2Dhwb/LjpmA4Vj6/r1EYUwoR9+w+pgMUA3KT8FlaY3/xUahz2G
X-Gm-Gg: ASbGncsveaGOMlSW4LrIOyhop7E5EPXdX/1rNy+YJS+9dddpmRC9f+7ZUW6HcUbjBrc
	aEcJbrak0hqJxqhoNSLXnDcuCUjmBQKH9UDiKO8fd35td3bx59ls5VY8NSlL7sBmibededJRJhx
	ct2mGdkc4c/pNCgRHPzOnj6QQF2ayelyyQVRbf7gxkKKExuYe+lMHE/DI+3EA51vKranVDO1Y5M
	1lvgCQ4+YX+bO33KR59ZQBTo2vrJ8+llXa3GBT4EkqbyU1WCibO8LSPjdAX96BcXLPxNZ0TsDIq
	BGI=
X-Google-Smtp-Source: AGHT+IF7Lks9Lexc76wTSzCJF5qkL/G7cfx0Zj9NJeSQXXuoF9AodjKIhLMsIy76RoPf27o5yrdaxA==
X-Received: by 2002:a05:600c:3ca4:b0:436:6460:e680 with SMTP id 5b1f17b1804b1-43668646b20mr265094505e9.16.1735386340726;
        Sat, 28 Dec 2024 03:45:40 -0800 (PST)
Received: from localhost.localdomain ([95.43.220.235])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436604e9c2csm295344975e9.43.2024.12.28.03.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 03:45:40 -0800 (PST)
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
Subject: [PATCH 3/5] dt-bindings: mfd: motorola-cpcap: Document audio-codec interrupts
Date: Sat, 28 Dec 2024 13:45:12 +0200
Message-Id: <20241228114514.91594-4-ivo.g.dimitrov.75@gmail.com>
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

This adds the DT binding for the audio-codec headset detection interrupts

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 Documentation/devicetree/bindings/mfd/motorola-cpcap.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
index 190230216de8..3ad809e119ff 100644
--- a/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
+++ b/Documentation/devicetree/bindings/mfd/motorola-cpcap.txt
@@ -31,10 +31,15 @@ node must be named "audio-codec".
 Required properties for the audio-codec subnode:
 
 - #sound-dai-cells = <1>;
+- interrupts-extended = <&cpcap 9 0>, <&cpcap 10 0>;
+- interrupt-names = "hs", "mb2";
 
 The audio-codec provides two DAIs. The first one is connected to the
 Stereo HiFi DAC and the second one is connected to the Voice DAC.
 
+audio-codec interrupts are required for jack detection, "hs" one is headset
+detect and "mb2" is microphone bias 2 detect.
+
 Example:
 
 &mcspi1 {
@@ -52,6 +57,10 @@ Example:
 
 		audio-codec {
 			#sound-dai-cells = <1>;
+			interrupts-extended =
+				<&cpcap 9 0>,
+				<&cpcap 10 0>;
+			interrupt-names = "hs", "mb2";
 
 			/* HiFi */
 			port@0 {
-- 
2.30.2


