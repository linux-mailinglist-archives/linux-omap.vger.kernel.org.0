Return-Path: <linux-omap+bounces-2536-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 767179B6EA4
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 22:19:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 226AE1F22B90
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 21:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0EB1F12E0;
	Wed, 30 Oct 2024 21:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tb/9x4bb"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23AC1DD9A8;
	Wed, 30 Oct 2024 21:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730323145; cv=none; b=M2qZi3KfMlol0DXbh60JJF9CIp6nuQX1MQcnY4AS/J8yqQgCnhgXt480zZa6laXuarM3SUq/CXwn6fkJ9F9KNICCsaQsWUJblEW3hNE6M9q9iw1ctwfAilE4WP8hCsQjXFPP8uJhDCCLiQ9BfjeEZySrJ99vEGNn3N5nd23nvew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730323145; c=relaxed/simple;
	bh=XdOmvDolgsg316/LoEhz2Xof9L0XlyeF4ghIAS8RWAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fZ8eThRwFlZQqczm3FGGUysG4xuB3YOYYjUU5Z6aZdN/HWQFu4Faj05V3KqQgL90Znpd+uStwO0+57G0TfIMnCYv+WAF9x7gWxDD1OXlYrNdQE4EpPj+PEYEi++yKlS8jnoKKydpK4zHRn2DzGknr4VnjGmyq1aC1JNtlDQVkfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tb/9x4bb; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7ea0ff74b15so250053a12.3;
        Wed, 30 Oct 2024 14:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730323143; x=1730927943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EItZw59EPW9dB++eM4lBpPIiCqgZ04QUsEmbNBJSClQ=;
        b=Tb/9x4bbj9Dbuy8OAYFlWHVc0gcpiSswCIfIp9UqXGu24NdjQRzKwgQz/MolnoRwl1
         m0XucA/zzdzkyLlgg6QikuCHtZU652MpsKBioxLggQNsR1cSukagjgkPciW3YABU2Y7+
         sK5u62jhCTtftHFT2hZmiosQQemv9SkMTvf+3hE5FxWNMmtmgaJdlckEha7IEghVrEEQ
         MKO+pYtWM3qvS7b0txEuqfJgzqzkoE5KfCFg3tSSW9c1xWKkbglWAKuzLEprlbIKR1SY
         kF0bGY7eJ2SVa8TpJpitrzCXPC9vof2YvS1gM9GNT5bLkOQ3Nvl6z+FEF0fvQSKSGjS4
         I6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730323143; x=1730927943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EItZw59EPW9dB++eM4lBpPIiCqgZ04QUsEmbNBJSClQ=;
        b=so8j5Gl3qhMD1lVgwOzWVCu8/MGdZtB0PMxDw72DbW6KPm4xq5/Jq19s6lhyTRCCNT
         kebPHNelvp4an7sFs8cAeyaTH1iaw7nZeL6dgeWb53RQmgzNp1yutHw3p6A9nI6rcohe
         9QJMl/kP0OGAmitr3fRhqGFWut1yyT9LGlUc1q9bcPIlFKQCeXatVfFvHMhDrKgejzGv
         uZ7f/zpESZWbyWwQLtNxSsrwsNEBH51cJPFKU8U0Xmda62hGxfvA23rA6SjJi5HAFzxw
         RciNbrCqxaUFON4nPy8NXVh5ub/hA+yeUOV2BX8rw/XiI+HVLsUGrbopDw55mGCSTUZd
         yf8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUbzC7MUpx4DXpimaOZ3nAn2UEdRfOtfp9BN+Zop95om5sj5tFAdR572viTTIkCtkpnTmdj2g1sLOHQs+o@vger.kernel.org, AJvYcCVE0jIzcKFkIUaSsCMefEWqwYHlYFXhFkE0ocuyf10qnfYiSdguKvx03xcKV0QQFrux7rDNpN+DuAziruc+Lp6x@vger.kernel.org, AJvYcCVuWAcZkewcwU+EU/5OZeWfGd34Y173tQZkGN8FLz6Qt1NjhVeBlmo1pYVcpbvb2YAcRTLhK0LGO+HJ@vger.kernel.org
X-Gm-Message-State: AOJu0YyKV83xy5BAQtAGrDhNMRfKrot/Fj7D/DW0PeK+6JVtX0V8tzWu
	gwO5fgZAjRd6NKWwYk2419QxSiR7H1mFVNpjQCeOOHEJHC7Y5893
X-Google-Smtp-Source: AGHT+IHyfQiZotGwZQwLQh2MV4kreDKeBHyemuGX3McUX/Ct2pZzPbmy+ZUAdmOfAa2fU5wIy5IQLw==
X-Received: by 2002:a05:6a21:1193:b0:1d8:d6b6:94c6 with SMTP id adf61e73a8af0-1d9a83ab108mr22416443637.2.1730323143154;
        Wed, 30 Oct 2024 14:19:03 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.142])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b9daesm78938b3a.10.2024.10.30.14.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 14:19:01 -0700 (PDT)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 3/6] dt-bindings: omap: Add Samaung Galaxy Tab 2 7.0
Date: Wed, 30 Oct 2024 21:18:43 +0000
Message-ID: <20241030211847.413-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add samsung-espresso7 codename for the 7 inch variant

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 93e04a109..3d09ec1ad 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -136,6 +136,7 @@ properties:
               - motorola,droid-bionic   # Motorola Droid Bionic XT875
               - motorola,xyboard-mz609
               - motorola,xyboard-mz617
+              - samsung,espresso7
               - ti,omap4-panda
               - ti,omap4-sdp
           - const: ti,omap4430
-- 
2.43.0


