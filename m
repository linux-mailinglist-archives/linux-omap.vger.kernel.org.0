Return-Path: <linux-omap+bounces-1778-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0105938E13
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jul 2024 13:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8A231C211F9
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jul 2024 11:32:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F7616C87D;
	Mon, 22 Jul 2024 11:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOsD0D1H"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765B017597;
	Mon, 22 Jul 2024 11:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721647941; cv=none; b=cXlRETxlNt75dqk0IrQWwyRD7BhoIBEeIv/r4m03GzaaErtq2qTtT9srPSNfxg1zQtv9Wia4Yw7FOPRREfqW0l+0mfLdxgs1oEIbAQKmTpcu2q5MrvgRUqshhmtS6veUIZOdK/BKcratj1kb57cFKu4x9iy+EeRmmfmvh0jtGOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721647941; c=relaxed/simple;
	bh=bNWR6uTMWJQGKdowbpsLpPrhaqFIPiKGA+lAQrvgWsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YArwcK7FP5M6KFAChkJ7Bs3ULOgg/h/rzyPZNcugb7i7Yam0H7HzQgNf5OecNUpvpL+/FitmmJaTNt7tPmit/0O87XOJ7o51V+A5Q9JvJqJjrLZ2p7iUP8nHzScFj63rr108k4orJBBOwYLPOKcEeRXxBbwPgaJxOkXxG9k0Yq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOsD0D1H; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eeb1ba040aso60571041fa.1;
        Mon, 22 Jul 2024 04:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721647937; x=1722252737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nHnibW9fGzD0XJnhen0S8ODYpXPQlfZnbD0icDe5c3Y=;
        b=YOsD0D1HbVNF8K5ouQRbb1frkOfW9mPSrdb7yZYgdOVJDJfam4ft9KSaWr7AvY6Cpa
         h/EKQ4VWkXAIsJxOV9/nMslpa3MFy17Xpoi2BR97rHgKul9xr3Ur+Vl8BUYrEWlZkAjg
         uvhP3Qac2NJ4/GWcSi42xkdNAXkxNPrX8IgqJwV38ZjJVm3QpD6szDjmOAwx9hdIA2XH
         QD9i7LTScra0pJNbrCcJmdJRfs89c2T2SBZg0ZNCSuFnn9LS890Q3H119g6LfrEjp59G
         fJyzvXteXq5gVBF9NpwLsBcJIuUYXHzJ3NGchrQqhxLySZbs/LAAXVOS6sBGjUhdUySU
         +weA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721647937; x=1722252737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHnibW9fGzD0XJnhen0S8ODYpXPQlfZnbD0icDe5c3Y=;
        b=bWwtx5Yslw0kWs3JLQprcLi1zOSq4JJ8MkyV21FN8ahTJe4ey0OfA7pz4qoj/LbiTh
         W4jJu0rJ6oOFdWHJlyEXHCO7HZC1jxBZXNe92FCNCG91kZ87HSAjgJ1EZy0dGVV4shsB
         goSUXklRZeElTZQoMozCUhg+/6f7EwEY4XvT6DQx2I35I+gyiWYu4XqFxRkYNvjkRBH9
         8E5TKUJb5PUOa/w+EPPoFFXWqQofLRW+0lKM5vvFVGA+jaQOnWNpqVSEruBn2pMSeNOp
         q/edc6R6gco7wIDttcsLPk7Qs9NttEvZ/RWjJy3DqY5f/d29B0zrlI/QGwQBm7LVMVIb
         /aVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHhucpQ3JpEl+RTASfiDyCOgXVROLmgQXcqjp/VN1Mkfv89UJgTGKBqwrtNMNt3RtUpeXtJCT+slVyHu3w8vWDWWJtXfQbdWq5f+LkGuUB5yFiGcpDD7akYgoNruN4106AehUTNx4=
X-Gm-Message-State: AOJu0YwRPTST5MyAMhnRsUmSqf8inGhGtG5Y+qP4zvh2PBabKdGlN0Pr
	bdkucs49ojn+WHyixXwHApyvGlwcCuI5djj+G03C/2oZ/Yk2HAUG
X-Google-Smtp-Source: AGHT+IHlgvQUltK2v+AQrsvvvb6zJbqvEVg5gbCCTQxHMvsaOtyz26mdjrkyVm/qVvnG4nj8lBhQNA==
X-Received: by 2002:a2e:a582:0:b0:2ef:7fef:3b27 with SMTP id 38308e7fff4ca-2ef7fef3d88mr14502861fa.35.1721647937257;
        Mon, 22 Jul 2024 04:32:17 -0700 (PDT)
Received: from tpt440p.steeds.sam ([2602:fbf6:10:a::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a5c3d4sm150309835e9.17.2024.07.22.04.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 04:32:16 -0700 (PDT)
From: "Sicelo A. Mhlongo" <absicsz@gmail.com>
To: tony@atomide.com,
	linux-omap@vger.kernel.org
Cc: maemo-leste@lists.dyne.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	"Sicelo A. Mhlongo" <absicsz@gmail.com>
Subject: [PATCH] ARM: dts: omap3-n900: correct the accelerometer orientation
Date: Mon, 22 Jul 2024 13:31:11 +0200
Message-ID: <20240722113137.3240847-1-absicsz@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Negate the values reported for the accelerometer z-axis in order to
match Documentation/devicetree/bindings/iio/mount-matrix.txt.

Fixes: 14a213dcb004 ("ARM: dts: n900: use iio driver for accelerometer")

Signed-off-by: Sicelo A. Mhlongo <absicsz@gmail.com>
---
 arch/arm/boot/dts/ti/omap/omap3-n900.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/omap3-n900.dts b/arch/arm/boot/dts/ti/omap/omap3-n900.dts
index 07c5b963af78..4bde3342bb95 100644
--- a/arch/arm/boot/dts/ti/omap/omap3-n900.dts
+++ b/arch/arm/boot/dts/ti/omap/omap3-n900.dts
@@ -781,7 +781,7 @@ accelerometer@1d {
 
 		mount-matrix =	 "-1",  "0",  "0",
 				  "0",  "1",  "0",
-				  "0",  "0",  "1";
+				  "0",  "0",  "-1";
 	};
 
 	cam1: camera@3e {
-- 
2.45.2


