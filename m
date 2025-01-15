Return-Path: <linux-omap+bounces-3127-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A886A12D88
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jan 2025 22:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D92F916487F
	for <lists+linux-omap@lfdr.de>; Wed, 15 Jan 2025 21:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5FC1DA62E;
	Wed, 15 Jan 2025 21:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wz5AGtSp"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBF91D90C9
	for <linux-omap@vger.kernel.org>; Wed, 15 Jan 2025 21:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736975825; cv=none; b=LxU8i3hC2ihCr/im1Opf8DZNIcmPshWOHBUQMXloGe1dYJhFfRNwaMMSdSiqlVUQYEA21A987BGvFI4b9lGSEhvaQX4mTJAKY+R00ssupq8OFmuI9TNgAqck6zL7flgTeN1wGANLc/Fki93+AgJtVlZ/TIkkQ1Xhmr+4n9MoS68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736975825; c=relaxed/simple;
	bh=etyTNWsyTNBPviuHWvJvwZsCImk9N7fZ8OOQlJn4ck8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bbS8ZnTKSWyfG/63jY10K5Y+AtNJe4hgML5+O1et92adMgPjbutubw98hmZ4DQTz8E9t4aJAr7HXCp9D6s2ghQbEvid05brz4tOh2cqbu9eR7oW3eGL9FuoJ1fNbAroaHKRGW2Ey2FFC9+Fkca/1NGGUvjMTbwiqQFcc+nrO/uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wz5AGtSp; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434f398a171so192185e9.2
        for <linux-omap@vger.kernel.org>; Wed, 15 Jan 2025 13:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736975822; x=1737580622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ms9IEBzpyk/XVKoMAGsaOzSpnjjWL2vmcBPCCTvooQ0=;
        b=Wz5AGtSpPZZLMsGyGIXnKJip09EqIcrhVTHVaen0Lw/tP1eD6JCojJEILLEeHzvOmc
         6AQ7j0jj5UO7j3S/vl45cCOmN3f1lB3RHEKhPsiVDezSUs9140rMFa8gQ/LQct7MFVkp
         GpMiZan2kBRvy/JGLORtnd66Hqa0ZyAHEP4FvS5yn69rEuCXSoJX/CbDg/Wgptu++oDa
         H7nTNzh66njFgcYWjvcrgbEmEQWdnvWeaEwk91e1ZD70YRcCpHDhfpZyvtXWZF2QMyl5
         DnxXCnVoT2hsGYiXbsRMZWt8QSPCPjjhdQwTEH1YJppDsPwx/YS29j5j6jhJWP/ZW/nR
         +8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736975822; x=1737580622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ms9IEBzpyk/XVKoMAGsaOzSpnjjWL2vmcBPCCTvooQ0=;
        b=ilcs7Difavf7zpd+IsToyRMTET96pNlmpJMqeINEHg4wuTxuzyudk5uxd+CB27MFZD
         jYsGANY3yDZHf9OmtIAFc8iS7qKF0R7aZll2+JUVgDz+3U1E/MgcB4GcmcRin6Cv2CFu
         Z6T55ljh92FNfu2/IXZvGgWGhbQOQ4KLSbDyv1ps9QViRRN++QMzyBaY901KXL/2u9Kg
         GaIZ7JK4U6WfDXLUMGQNT7rFpoyWdY5ptma3zWtnBJS/CZm6dZGjdRBU2YFnZyfbwhWM
         Y6xfXu9ZHHy/xXSz6InQvV9HAUEilxGfLbIZCXxrXECP0gInrw8eQC8tUJFEEoLnDnE9
         t3OQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3WmH2ZtIEm7ElFVUISWI3nYXjO0Xdl/WAI6k9RoY+2Nl7BRJV0r2tWvoEoT2UnK+owYzSj6uodsVR@vger.kernel.org
X-Gm-Message-State: AOJu0YxDjDttvGWLLiLUQ2fTGkWYGH/n7JDHo7vY4vEsGuyu/pQ6M94y
	dC5dOujk5mCkfZmsIDWDZQjg1dP4IGdxn2mmEOpMTdBl0CGAafGI5jmOj8GcY4c=
X-Gm-Gg: ASbGncuuwAgifSLA1XPb0GkzEowh6GzftAelpRwS/G19Hi9+LaWtRbL/EPrWThk5IWK
	XPUck/VW/KntOKqP9y0NqomSBobg/iE1BBnPOiguSbJd4yEQh9J95EpZfZdpe5qGcCS+jUxP3dx
	lUTipipIbpSwK8YNP2LqT/+OGCgS1PL/J5GYW73H4TvPFIqnJ/l5o8lzcuMEiCRF0vsrfCys/4Y
	vKl6IDEHkYMhGTtCY40SZrv1wStVqQgaL8fiZo3V3pKqI4/e3n4QiFBkSnKlXhZxGsW+wg=
X-Google-Smtp-Source: AGHT+IG5sxlfm93ZZqieB+RkF9UShh5QqNGMEBcIF5ekOU9Z+J040z2Zi857k3ycfhveU6zzpgKNFQ==
X-Received: by 2002:a5d:588a:0:b0:385:de67:229e with SMTP id ffacd0b85a97d-38a87308e30mr10527783f8f.11.1736975822395;
        Wed, 15 Jan 2025 13:17:02 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c6a2sm18693379f8f.54.2025.01.15.13.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 13:17:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: nxp: vf: Align GPIO hog name with bindings
Date: Wed, 15 Jan 2025 22:16:58 +0100
Message-ID: <20250115211659.194072-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bindings expect GPIO hog names to end with 'hog' suffix, so correct it
to fix dtbs_check warning:

  vf610-zii-dev-rev-c.dtb: eth0_intrp: $nodename:0: 'eth0_intrp' does not match '^.+-hog(-[0-9]+)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts b/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
index 6f9878f124c4..4f99044837f8 100644
--- a/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
+++ b/arch/arm/boot/dts/nxp/vf/vf610-zii-dev-rev-c.dts
@@ -392,7 +392,7 @@ &uart3 {
 };
 
 &gpio0 {
-	eth0_intrp {
+	eth0-intrp-hog {
 		gpio-hog;
 		gpios = <23 GPIO_ACTIVE_HIGH>;
 		input;
@@ -401,7 +401,7 @@ eth0_intrp {
 };
 
 &gpio3 {
-	eth0_intrp {
+	eth0-intrp-hog {
 		gpio-hog;
 		gpios = <2 GPIO_ACTIVE_HIGH>;
 		input;
-- 
2.43.0


