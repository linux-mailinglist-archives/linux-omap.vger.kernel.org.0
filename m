Return-Path: <linux-omap+bounces-3199-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B1FA1A930
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 18:49:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4AB03AC093
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 17:49:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7EA189F3B;
	Thu, 23 Jan 2025 17:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="bhbRqbz0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7180216B3B7
	for <linux-omap@vger.kernel.org>; Thu, 23 Jan 2025 17:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737654549; cv=none; b=mWuNoJXVO6Y7wT3d5/Ww2ulJJrLRWYNefRAOWQQrVpBnPbzkMIpMRgy7mVeSN6rlS7zfEZifsBBSRLeb6Rw7ycv6yJIMLyKOIcFCI6DHAH4JYXeyBd1Xz8GeqtPN20wt8cgUkn4SRnsfgR3IkK3DWcZpQLg2t+xsUsU8IuiahAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737654549; c=relaxed/simple;
	bh=NSojA+duzzxOoFog0vBYiL4prIUazZryuZHHprWey9g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=srm0tJ2BAf4Mq4JdHA6be1UUlSeZGVmMB2KDNrp9/CcfFT/QOeEZ+9k/D1ZMKQPeoVGDww6Ivp5qXEayOImnaGBIJQCXC9wKRYYoRRYvd8mkTne6W9pnLRP8AVdcqlvTzJ5szeg7qeX/PvhYgnqglxkuoJz1qDP0H2HOnJ23Ymg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=bhbRqbz0; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7b6f19a6c04so107754085a.0
        for <linux-omap@vger.kernel.org>; Thu, 23 Jan 2025 09:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737654545; x=1738259345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YhKhwXmEFKJ+KW9V7oUyVzf79Oqc/PvSp14CvPLvf4g=;
        b=bhbRqbz0PJRXo82VzTNv5WmNO9VPKOt3FEqZiM7o0Szem0Zi9cQajNN1a6+DNyM+5u
         eXoW+DGKsAS0LDDQ0US+CH9t8VY/Xe4zqtjMotaSB/tOsOcbe3N6G9M6IPHGtfZEVacz
         8WO3k1SxKDjPpEH69++25dRvckLHAUAIGM6Zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737654545; x=1738259345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YhKhwXmEFKJ+KW9V7oUyVzf79Oqc/PvSp14CvPLvf4g=;
        b=Jk9LXlthqxKSy6+cHKsBUlCb6yAM75hVQfwUmThs6pcbW4yP0Wy4zUcbsytsPDCtIN
         Bd/DhkXLkjZsFS0Rvj480i4/13vRPvNQ/n4Deo2ynJRvPqk+/EzhWGzEH4tv6Y9jLe0W
         LXocxMT5NmSeNGYX9RV6dOtWcOtJq1JoRg353TUAJ8/60rq/hX0FkYs4a1b3se7wkFvE
         pxtUOklCOe2nP6nEsbbk8JLWAtBGOwONxam6fUIUMRxd3tgRaGIXR/q8DUEYn1mHz8iw
         1EuPgX982GlIJynDtEZ582F3rytgjQm/a4TYWyyDUeGqpa+umOhZDly0ftsohUEcFSv4
         t6Sg==
X-Forwarded-Encrypted: i=1; AJvYcCWZAHyqm6JzBRaOUkddCZz29WJQCPiEFatk0i6Ce0+iVhFHH6+5Ti7CrGauL64HvPFIyv3r9sSzVlHz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/53oaLEFYZj95ycxudAfBnu70eFKuLFR5N3yiWs+yn3Hfu9ye
	S7JEzwVZwaswuhO3uEZN4ibJFw2S302oFeFrTymCry1zfwA+73xtIUtO11/nnKw=
X-Gm-Gg: ASbGncuMRvzfa7dGgx6axd4yjBZMCO5k4kpovPZMudDsNXNEAzZmoN9b+RLG8mAe73e
	JTJ3qglEiqlSGzdIarfJLflTSgm8ZgmU89eu2nr61btIfg9sO79CbEcwSjyY/NNSKkaUYin7CDw
	VO1FKHSmd8TlvRU+oO+1xbf2bin+RsnJrfM17uFcbFnQR9/fdOnJF1ypX2uTwlOFJXm/fpU5M0T
	Fe0RzmsETCpEHLpUPErPfE065TYKC/eB49ZlfIzdDGozMjoEKQT5kB6mbxF6m+0ZAqsDMi0pncB
	Ih+x2zI=
X-Google-Smtp-Source: AGHT+IF9ra2G/nN8r8Xk6LkxR34WWRGmCzW4zWuzyzPGPFwPVeEuTgg1nHbFpv5qzaYHGHZhwn6cTg==
X-Received: by 2002:ad4:5aa4:0:b0:6d8:8f14:2f5c with SMTP id 6a1803df08f44-6e1b2180802mr421129916d6.23.1737654545301;
        Thu, 23 Jan 2025 09:49:05 -0800 (PST)
Received: from bill-the-cat.. ([189.177.145.20])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e205136e02sm780536d6.20.2025.01.23.09.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 09:49:04 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Robert Nelson <robertcnelson@gmail.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: omap: Add TI Pandaboard A4 variant
Date: Thu, 23 Jan 2025 11:49:00 -0600
Message-ID: <20250123174901.1182176-1-trini@konsulko.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the ti,omap4-panda-a4 compatible string in the appropriate
place within the omap family binding file.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
Changes in v2:
- Include as part of the series with binding addition, make this be
  first.
- Rework as suggested by Andreas Kemnade (slight rewording after Robert
  reminded me A4 a production rev and not "alpha" rev.

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Andreas Kemnade <andreas@kemnade.info>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-omap@vger.kernel.org
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 93e04a109a12..3603edd7361d 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -141,6 +141,13 @@ properties:
           - const: ti,omap4430
           - const: ti,omap4
 
+      - description: OMAP4 PandaBoard Revision A4 and later
+        items:
+          - const: ti,omap4-panda-a4
+          - const: ti,omap4-panda
+          - const: ti,omap4430
+          - const: ti,omap4
+
       - description: OMAP4 DuoVero with Parlor expansion board/daughter board
         items:
           - const: gumstix,omap4-duovero-parlor
-- 
2.43.0


