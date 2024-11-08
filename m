Return-Path: <linux-omap+bounces-2628-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 536779C261A
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 21:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C3FD2842D2
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 20:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEC11F26C2;
	Fri,  8 Nov 2024 20:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zfzm2NJL"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3511C4609;
	Fri,  8 Nov 2024 20:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731096310; cv=none; b=h9X8q9iQdI56Mu7N2nG/YJKEGZsJU4J1AMvdZO3voKjk8+RNu9gC7yqSZjER1QP565CxK3OJCuEoWWcg5SLhHloBoyypCdXkEZ8O4mr8eUPt45hXGmzeWxpid8ZTNCqvjlQc+aLUS1XShOVN6kC6hKdqRKexw5yBcI316yB2EXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731096310; c=relaxed/simple;
	bh=4qvDhqGP/Cvk78ZNcTXV1M1zGpmYtxAECuKXUmUpRbk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4Vk7zRT9d9SrjF2rAfbMCFaKkx4s2YPtYhiEfkTsZEkC8+4vgugDiIjLyAq7tvTzT/w2o/0HIUMgFtvijGdn7yEHUnrEtvc9CxtRV1PyENw05s+pE/+a+pE/BuhGYkpIile44VGol28vwDms1SUNioeQc0FSpSWPiUTuKdh9js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zfzm2NJL; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e52582cf8so2139539b3a.2;
        Fri, 08 Nov 2024 12:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731096308; x=1731701108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fiygXowfj2xS0ANkI4lNzcEmZTYJF85QwdGr+dM89hQ=;
        b=Zfzm2NJLQUUBNIEYtclgdilQMJQzOysd3ux6hj8s59Mp4CcY8hNh8Sl6vEConTjT03
         YvZwJMcIJJd1+mSFiskr1rbp+ddSCUYFC23n1XFZVXx07GM2MRGNF/UcXxGFraLKCG8l
         bKfk772xjpTSJwTbGqkw0kM0qXQUiWf9AQhtiL4aA+MQQqAhmHtG0AW6CDTZQ4f4CsNZ
         OKvONldZeT0r+TCsk1LJN0xBy7vSMHlDBkp3Brlrr6CKjywsMH7Yz36XgpNnBNpY6H40
         SZYXqfeqEqGrnueU5lHn+G1oAqt9R+0KLYcmWke5aBehNm9Dr06aeTvmj+KmDr/MzaFT
         Xt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096308; x=1731701108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fiygXowfj2xS0ANkI4lNzcEmZTYJF85QwdGr+dM89hQ=;
        b=f0wVhTU09MVEvAvoEec8ZGppMqDdiAFqgVTd74J199xpQGApvpKTyYxutkWmZVqLhK
         eQdlpLxr3VRw+tq38ITatZ53fcf/VnZh1XqC13uyvmy6urJtCf3lxvhxc8I5vtxsQzx1
         NloVQST+r2CwEpup3HrptzgIgLdHAO6QTJkQwy6Da9f9lyK2891AHdBmx6OuRXud36Xk
         d+p6ay2t0WRYOrqXHyVGc+3PHzGL8/bg6b85vhGie09jY+iOSGai7kijIC+zelJL+G8B
         JBl+Es5kf0yU5XfWFhAQE3KxUr0c8CCcRTVERuPeqJsJ6MYKlJI5/qD/tAmmKn0S3RLC
         gfiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwzoZM1aOCXK/5sYbtk66iqj1uVJNBY6UYx/cMWsSgma9NylAM3c4f0WH+b83c/kJeMSxE2aygUOoNNnabxjCf@vger.kernel.org, AJvYcCW9grBO5zPAfdxg3DJiCPSHuzxtFMQHhtSxv9ugyy2ympnyalTQ2icX5CQDJM1XKTBtAm6JPPlph5Gq@vger.kernel.org, AJvYcCX8O0i3FhG0WOA8H/Al5IalWQdxkaUXRQEEQ24G7n/8hWGEL5FinhbaiASqnjxJjTFYkrj3UmXwH3NmnvJ0@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtpu1wVKRIgx5uY/9xi+Pg/pEHr/1u1UzOG2hrl7/2RCnOrS0j
	/CK53uOd31yHql2RRI/HxynNkysuATSrtirgVkle8vayTsxnKVzl
X-Google-Smtp-Source: AGHT+IHFVcWsj4wQxT4Lvx+sGGBEcUtl52l528efG+ad5oEcb6k9RWZbAuObnKv7LbWbEMApNtaWGQ==
X-Received: by 2002:a05:6a00:1a89:b0:71e:2a0:b0b8 with SMTP id d2e1a72fcca58-7241327d630mr4861845b3a.1.1731096308018;
        Fri, 08 Nov 2024 12:05:08 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a56a30sm4323418b3a.188.2024.11.08.12.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 12:05:07 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Mithil Bavishi <bavishimithil@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v3 02/10] dt-bindings: vendor-prefixes: Add Doestek
Date: Fri,  8 Nov 2024 20:04:31 +0000
Message-ID: <20241108200440.7562-3-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241108200440.7562-1-bavishimithil@gmail.com>
References: <20241108200440.7562-1-bavishimithil@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for Doestek Co., Ltd.
Link: http://www.doestek.co.kr/

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b320a39de..3ef4c948a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -392,6 +392,8 @@ patternProperties:
     description: D-Link Corporation
   "^dmo,.*":
     description: Data Modul AG
+  "^doestek,*":
+    description: Doestek Co., Ltd.
   "^domintech,.*":
     description: Domintech Co., Ltd.
   "^dongwoon,.*":
-- 
2.43.0


