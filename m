Return-Path: <linux-omap+bounces-3154-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 01654A188BF
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 01:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E9E137A33EA
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 00:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFA5C186A;
	Wed, 22 Jan 2025 00:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="sEKFiZS2"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC17139E
	for <linux-omap@vger.kernel.org>; Wed, 22 Jan 2025 00:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737504766; cv=none; b=avj32FjFf1bZ0RyXgMqOHl1i9L+Yy6TmoeiElR9+oUnL7Z4ejEvuQO91ZEojwNeN3WX/2eG8v6dYdOjFnGnUtXVxxB6psPdy/I7YW+7Ty3DgZdi+TgfiqEINCKDl7Ueg/dlkFaIrQkMDKvlbK/K4uSD8szZImeRReN9kjIVaddA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737504766; c=relaxed/simple;
	bh=zki0NDt+u+V1WcCaj88mFx68pC7AfO2UaZCB6rbYELc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k+tmKzi1OAcYqlUew+7BxwVz6dvGxK7zMO4/VkiC+wIaTfA/FHmwgBRqJ9Yq4GiVhBoUwGwYwL0zgrPyC1gPB0aDK9uKEZjHOYa4mEiM0xhep8fVBl5jMvWhQlUOLfoXfdbDCRIH/tYDTS7744R+QiVLTc+xFeTAyCx0SQIzpZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=sEKFiZS2; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6dd0d09215aso55929546d6.2
        for <linux-omap@vger.kernel.org>; Tue, 21 Jan 2025 16:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1737504764; x=1738109564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9xQAzgK0Ogi26D6sZWQIofoTNpuYU4aGotfpEsuIEtk=;
        b=sEKFiZS2WPxiCIDuhM01a97eZmNLaSxUtWNNWqbcgEUJMuQlxdpsjdY+bYUe2jWtOE
         GclakN0/Rw9eWbuxDzZyUHJ7gFF+7fVruQflAs1qDbOxhVeHncwmn0S8KPa2ovYeRO/k
         2weVSxAAp1cKW9+/N9vmB0N3m6t1V8T4YFwpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737504764; x=1738109564;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9xQAzgK0Ogi26D6sZWQIofoTNpuYU4aGotfpEsuIEtk=;
        b=KMcmyi/0gNzqAs0TDR66G4i8iBsKZxBdd3YI5W0+jSMz69oddJIeJn4ZlUp622bNXW
         RBBYSGxCBwUFV+HXg8Ij7TtRWjKlz/nZ60BTQcfWiCN1BTnPa1twLjGOHwcoC7c5BDli
         SpPU60yR1+j/0pMTurI5rkWPkIhtX/tM7723hjl040OTzwa8N0/WHvRPjcrjru/TYZyt
         FkvCQirp3ECoYr6Kx7a/yBkjkcb/Gn8jxC0x4BsJ0EGkWiiTPUsbufK7XdnLwWaObTiT
         7XNr1plkYUPGd9QBpel3gBycCFhJ6NUeifVcR9DSqhiRo4RwToXO3yb/ZbiEiJfhkKCM
         ZNPw==
X-Forwarded-Encrypted: i=1; AJvYcCXKTqN6qA7nkLd9TsBjCumhbrxfOvBc9LZ3+DG+79wrH3bke+eVP7E3wdMFAQOGuSLVk8xtrf8GnFc3@vger.kernel.org
X-Gm-Message-State: AOJu0YzSeTvhKLsJbFLESI8NFj/rZNCrlBhn/PEMjAfUjRgtkBF6rNbK
	a4zR6FH3wToB8kVSvW8+DaF1XHqPuOZyC3TXh0yuxic+m81L1zWljpb3YdfFLP8FV9Be5u2N+JX
	Q
X-Gm-Gg: ASbGncv8OFKDx9enAohii3HYgDRl6trQwo22XtG3IvfnZTLMCm4T565bZXvp2DjyipL
	960tH4V0p2fRHXpUxsjLA8LfOanYq46W3oVToHb/eKbl+HN8rpafJOKGSozMeTuEbZ1FWSbWo5J
	vuEl6821EFAgjgCrvpO6hDTXfppHUSg07Zjvk1mHCpOYT2gx0OfOqKNSd1lnARy3j1NAbqLObjW
	dZSrz1D35g+TfudSpRgrdfXnCmDVS/FNia90Fbf+Ru/iNSJR3/GoTFerniPx/q1xe5Fo0U1Fy7z
	Ic50MORdVPOdfw==
X-Google-Smtp-Source: AGHT+IHlqHCOtWWIu6jeCjXsNFo7V1/c1NMKUJkpfavLRNRlnwek8Hj/DAESzcWFpktf/pzsuw1N/Q==
X-Received: by 2002:a05:6214:408:b0:6d8:7fe2:8b31 with SMTP id 6a1803df08f44-6e1b216da9fmr340577116d6.23.1737504763471;
        Tue, 21 Jan 2025 16:12:43 -0800 (PST)
Received: from bill-the-cat.tail58a08.ts.net ([187.144.16.9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afcf6d29sm55855746d6.119.2025.01.21.16.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 16:12:42 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: omap: Add TI Pandaboard A4 variant
Date: Tue, 21 Jan 2025 18:12:40 -0600
Message-ID: <20250122001240.4166460-1-trini@konsulko.com>
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
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Andreas Kemnade <andreas@kemnade.info>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Documentation/devicetree/bindings/arm/ti/omap.yaml
index 93e04a109a12..28e23ca766b4 100644
--- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
@@ -137,6 +137,7 @@ properties:
               - motorola,xyboard-mz609
               - motorola,xyboard-mz617
               - ti,omap4-panda
+              - ti,omap4-panda-a4
               - ti,omap4-sdp
           - const: ti,omap4430
           - const: ti,omap4
-- 
2.43.0


