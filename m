Return-Path: <linux-omap+bounces-2527-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A479C9B6CFF
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 20:42:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6C221C212A4
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 19:42:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197B71E130F;
	Wed, 30 Oct 2024 19:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPCQ3P/D"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00551D1730;
	Wed, 30 Oct 2024 19:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730317322; cv=none; b=Fa2cHBm+UXL5WtS6gTcmvuh0sXqOzDw+YVcinhwSXLSSJ8FBlsEF81t+xwIcdyzngvBVZvX1LIQKgx038TUCcQ2bHAmlksr3qLbCqanGAVkkjjqPMUvi+llKo19929Xp6VliAKFbDHca172Xti4c6S4vkxtlWTSjCZYK6XRXK+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730317322; c=relaxed/simple;
	bh=XdOmvDolgsg316/LoEhz2Xof9L0XlyeF4ghIAS8RWAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZTshjmQMIplIE94jUM4rwZgpWmu//acvvisAGjcbo111azK93srS1C4szRNzy33jKkqdjxIKoOD+5tLeQDE/xl9SK1I8OPBLPTjvzIeQoZMsI19RL8Ws+VOF3touIQx97dtk2snIn7F6ZnDJPIAJnpq1PxvjDsB+Pi4H8knpZv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPCQ3P/D; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7203c431f93so151613b3a.1;
        Wed, 30 Oct 2024 12:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730317320; x=1730922120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EItZw59EPW9dB++eM4lBpPIiCqgZ04QUsEmbNBJSClQ=;
        b=NPCQ3P/DQ65/ocTL/6DaqU9gdco0iWRAEWpCg7OhAosLI7dIqsRs4UBCjckUpXDieH
         E7uzAX9KWMJ0Z6SB4/DXJ+YHe5LRsxNsQnSl87LwAsUivQP/xjAQC5vWQc390sKxOh8Q
         lCMuqhKN2wed5OWGITVYN7MbACkxf8xFRCfx2SwN6AvFTOk9HcRUtjfkseu2Lr2ZtJIG
         3lowrE0XMaCB8UqmlN8yTn+YHtkHFKSBfEdc41/kYMzK1pH56RBKDwMDZOcRN/0YGaOQ
         D19cW9soxDJC6/ScGBKjPmpuNJNQNUvcZgFRnDba5ogOdbuR5Fvyn7GBNiGgOC6OVZtW
         32Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730317320; x=1730922120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EItZw59EPW9dB++eM4lBpPIiCqgZ04QUsEmbNBJSClQ=;
        b=NFoLklm0+Tpng8rBhjJRpH3RKZmWBWhh0+HpGM2fDpVHsniTP1hvisigKK3j94v5uY
         w67gTM72xWSQjXlZBM9/+B46eA7vVso7xG+9rgQOKV4UPhqj5fubOdDDmWC7K+w1Nj15
         5QR/OPBYFmKLzaPJpoU0mifS+w6hxoMlwmOSnTPbCAzI1kvv0qSh7TtUJiUBCQ/RTkcY
         iLfkiOwRtGB95tZVWKzXUY0jkFJjQlYtoMQM3t53fLktjXcCJ7Sh/+gw/E/qyAZ7u0qK
         ASWvO5ksMmz4BOTD2ATXat3Rk4BcmfjHmecLu+VJTsJVLCkzYVMUc/yyrGd9fc+Go2Sj
         Jc2w==
X-Forwarded-Encrypted: i=1; AJvYcCWeDsOW37GeUB6oQqnjyx8ohc3/hF9t9PrpozRfG9gpKCBRv1llsVD9HtsA2kfGhYtdhV0PPtOiGZ6w9ne1rXrN@vger.kernel.org, AJvYcCXBM3l1hO3k4cvTg4EJOlAGr3HOYaVTy26SSihZqhqXnNApjJkwQUgSSAxdgi2eCd3dzfkudC5TtnNJUKDk@vger.kernel.org, AJvYcCXuM849bFmap5mg+6D2cVNb38FKzZwfEjTDw1uDLfIf9PDfdSQtWsJ3pEv8UshaTC4XpyhSUST+tP9p@vger.kernel.org
X-Gm-Message-State: AOJu0YzMBxfyTZ+q0/70jbCtRDs0oVsyTkdmiXV+Z8wtQQYerL96g5E/
	Wg+Z3SfwCXt4aJdGv4xL9pYgG0YjO6Ir2HStko2duJ2TVdYFO7pZ
X-Google-Smtp-Source: AGHT+IH9WiXeIAZL02bgmXLIsZDR8DhnE76P0UcoN0vfO0Zygxk8obEeEoMBmU3fY5yVtZQeyieZCA==
X-Received: by 2002:a05:6a00:9aa:b0:71e:5b0e:a5e4 with SMTP id d2e1a72fcca58-720b9ddc8f1mr1014319b3a.27.1730317320222;
        Wed, 30 Oct 2024 12:42:00 -0700 (PDT)
Received: from mighty.kangaroo-insen.ts.net ([120.88.183.142])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8495cabsm9661839a12.0.2024.10.30.12.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 12:41:59 -0700 (PDT)
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
Subject: [PATCH v1 3/6] dt-bindings: omap: Add Samaung Galaxy Tab 2 7.0
Date: Wed, 30 Oct 2024 19:41:33 +0000
Message-ID: <20241030194136.297648-4-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241030194136.297648-1-bavishimithil@gmail.com>
References: <20241030194136.297648-1-bavishimithil@gmail.com>
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


