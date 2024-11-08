Return-Path: <linux-omap+bounces-2633-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C449C262D
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 21:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C35D51F20D4A
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 20:06:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2BE720B7FF;
	Fri,  8 Nov 2024 20:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0u2+uik"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4130120B7E6;
	Fri,  8 Nov 2024 20:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731096351; cv=none; b=cs8bcVJCWJqPQk+kP5H4efca+m02EWGAIEbBDv9c4o8MiZbDOER2/Tvoo3/jWqm415mG1zSGJG+3LYjeH4sGA93h6+mkI25Clhb+pyc+HIh8e8S0+W6NeEifHjlPRK0+xjVy7fKj+FmpF51Jd3tuOzCEBthFvd9TUDmpdVCliI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731096351; c=relaxed/simple;
	bh=YJ1jgvX8/VJNtxtQeBxtWKxFu2oXNXJvx1lyoc/LlNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K1Z4V+yLrdU8HgMbbfksnhQyyIbL2reL1Kln8oUy9IuRUNDQnE60yMXSIcl16V71UIIGqrIIXfcdKzNeHMOHCkXiCjDYZWDAUlBs60DkMYnA4PTTt8Vt+8zxpFF23BDKWEZlMPkyXr/+XJrAWRRi9dEA1XWIOq01LopqyCD+HpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0u2+uik; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-723f37dd76cso2719806b3a.0;
        Fri, 08 Nov 2024 12:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731096349; x=1731701149; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJU01u6dvTS6Al7pIDua0EgkQVSaf8CKKCyoeDXy9CI=;
        b=J0u2+uik2wFFO0hTQ1YGr+CbjLoAVsnmspDaXMjUz2Ryjs0ACOuT2ErW6CqqX8Y7/H
         ZIsDQ7Hbbu7PFUt7ew7xVft70JXFfxhG6mWMybF2M1vZ0/ALeRmuf/qCoK5z1EZmSrN0
         MlljyK6YIHeli2prurrlct/lv5cVDmg/JRHdWhF/TA1BpoHH3O+Tue9RJjilnrgkMog1
         1zFcrS1TUmgsauXv4tbespjmmgND0Eo8jnKRTgn/K54SOyb53g4S9MLrMV/yeyYoIuFf
         fDy37qytktOiHTcRr46oxIiUpjfbnvmmoAYhPn4VIKRjDO+VowSyyCEL7tK1rl6JjnTt
         /I5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731096349; x=1731701149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UJU01u6dvTS6Al7pIDua0EgkQVSaf8CKKCyoeDXy9CI=;
        b=MKq3/kdCxQNDhHB86XGbnWgFodqLo5gQNv3+Bulqpmg1iH8grJ2zm6majfskGFg0w5
         f0YNGkiX21OBjCUPW17f41JnGQsV31pjT44ByTY3iOwqkeoWiUVoJCz6yvFwKXDfPhr5
         Jmhca0xa0T5zkZIZNjN39Qt4kDQe9LjlIPBTiE0hOGJCyB+Xi9GU76UaTrgzK+tT/r2q
         W+rtms2c+4rWevKiT2aScMQS7ErNUkd6TLfyNi0gjV/Vx0pvE1GyCxafb5WiT0ttnItB
         DEiTXiqK4RN6Jklobrm9ESrmQE3lahGNeHIOMOMgRVNY82biPcnF6AuZscnHg2yhpApE
         jlqg==
X-Forwarded-Encrypted: i=1; AJvYcCVtYtygg+QcR1jIKDJqSelu97753Rc26E+n+SYjCksmNrs2mcAjcRmjTKsqQQCslFV3QtkurgfvWuhQ@vger.kernel.org, AJvYcCW2J6MMXTrAk/hlyqXHXpjJObCAQCivCigAqL/KfjuMplCJ2ZBkCjmRzkyz6CXaEEWZPOgKZIhINcmIujlm@vger.kernel.org, AJvYcCXT+M0MBO/yVCHQq05EoItuUZ0DUV+wfEba51uL5n0df10jDdu1vtJV9lTccPaE/9Q9RvfAARe40xDAr2ZXq+fA@vger.kernel.org
X-Gm-Message-State: AOJu0YyDO5OXpPg7f8NDaXtZpF6djSFsLzXOoS2lmG9uLFlESu0XiJXp
	I+oH9KRND4z9U7j+nWZG5+9XQg5fMoGnKT9zxXVcpYtzTBbyP4cc
X-Google-Smtp-Source: AGHT+IFvTazhOJ5wkdfiOQQjdutHEfc5qvJgtEFjjHS+9rcD6OLqullknv0nr1Gd3emk4tX0050mbA==
X-Received: by 2002:a05:6a21:7882:b0:1db:ff9a:c9bf with SMTP id adf61e73a8af0-1dc22b90c69mr5519540637.39.1731096349468;
        Fri, 08 Nov 2024 12:05:49 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a56a30sm4323418b3a.188.2024.11.08.12.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 12:05:49 -0800 (PST)
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
Subject: [PATCH v3 07/10] dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0
Date: Fri,  8 Nov 2024 20:04:36 +0000
Message-ID: <20241108200440.7562-8-bavishimithil@gmail.com>
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

Add samsung-espresso7 codename for the 7 inch variant

Signed-off-by: Mithil Bavishi <bavishimithil@gmail.com>
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 93e04a109..32978dd9e 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -138,6 +138,7 @@ properties:
               - motorola,xyboard-mz617
               - ti,omap4-panda
               - ti,omap4-sdp
+              - samsung,espresso7
           - const: ti,omap4430
           - const: ti,omap4
 
-- 
2.43.0


