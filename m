Return-Path: <linux-omap+bounces-4634-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6EAB56B89
	for <lists+linux-omap@lfdr.de>; Sun, 14 Sep 2025 21:26:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41355189BFEE
	for <lists+linux-omap@lfdr.de>; Sun, 14 Sep 2025 19:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C988F2AD2C;
	Sun, 14 Sep 2025 19:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZG4Uf7I"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893C9288C35
	for <linux-omap@vger.kernel.org>; Sun, 14 Sep 2025 19:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757877972; cv=none; b=ph9gkiMInWmrGq3m/SL3ED22/8vInuNVYZkGE0JI+62Q4/l/8XeiWU0hnB5LX4Sz95HZ4VxXMpvhnJV8qwakiy/g8r5z0OH8FaESzMD6NEmLq35h/az6GJXuD0eZqXEAr35RurYv4Emv6lbsqUYhPKpekNWvLGFF5Riz3PE2Rfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757877972; c=relaxed/simple;
	bh=d7u1JIqjgkuTAjQngOZ7W52Fqia/WzmKATwV61FnzrQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=elvYBaLf65dDe7kBEuSZENaZznF2Xt9V2uaxO0V779lrTykN10791A+hyiXU4eA7Jj1eE7cakkd0/IxX/iQ5tszZmTx1bv+8ReA5SbQGmbeSGOp80GRLcioSZsrLlR+2w4ystTOunGuTm//dSZrnblBXVSP/A2CmeJXVt/fyIgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZG4Uf7I; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb7a16441so523870466b.2
        for <linux-omap@vger.kernel.org>; Sun, 14 Sep 2025 12:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757877969; x=1758482769; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PSIN9RzyqCPmQgqHLeTMza5/h93nH1xHywvp8sYYYA0=;
        b=EZG4Uf7IDNLDEQrOv+VaRMRDISIqwD7qPwavGS5Sj4d18nUu8i8ZEdZcXt0oV+DqJu
         LsWol1y1L09td0N+nF3ul5pipB2ELc5qTwDJ5IjIrTtPEn6mkOJ3u7u9/jdf24dajMvJ
         LPvlzxJsF72di4qFXKqSjgvDpIL1MSZkETDqVfTKCGIcSNqTorF60tPDbljTZYtKQx8C
         XV5JTxZYVrIo4uU4JutVTNEK2z56Q/HPUYTXffZbaqQAB+h9WziG9VHbXsaX+OlCSNUc
         zzlVyZcAbjbCtLILxSs2+16oeivKgpvyql+Wj7lMtOIV+60H34YgFYX2TJ2ceHyNYdI2
         g3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757877969; x=1758482769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PSIN9RzyqCPmQgqHLeTMza5/h93nH1xHywvp8sYYYA0=;
        b=bEMpecv2Sre99eZ/vUGduIPPb2sUQNFcazzDEk33LANE/b96MnNE+68aoQ7PVFBMjS
         buXKXXeqsK2fezvt9espKUf5Refdp1fgZ1SkGhfntcpjd0UnEMU8GN/Qn/KBkmLbVMGM
         h9obUU4YrEOD3t0dGf02PNs/MHSX76Udb3CH2yj7qNRqYZ2C2ZukNrgK6FfzV0aMS8mP
         qdYye5Ytb6bCutM3fUB4FcESuzgXmqDRkwiLfoCu0mwWkSNMt8mFo7qq5zfpCb/82u7x
         4KkEG8I2yGYGk3na1L9LqkhluSXHFpBfryIgP0oZ+YOUBEO5+jBVhB/uA4tmW99DMEd3
         EaEg==
X-Forwarded-Encrypted: i=1; AJvYcCXkRKY4/lV0JmTI7QgGXi95UdmTPh6si/Bb5QvP7eHS24wfJ3P8OyhLFSNCUMLdndmtw9J+HcVjVnPq@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt1CrqOZ2t4An59TdAMDWhG1YGIkN6/YsbfimDy5FDE1mHSJfT
	89IeG2qNvCoDMOCxvyisKDRs5mFgcEJsYJIFeTHq07CyOB862kYTS/I=
X-Gm-Gg: ASbGnctoPpNXrk389TZMCNMx8yr7454DqF9kCJt7zJ+DWzD/6Iqrvo+uYbUatRjWTYF
	6PX58fJ209VmVhuPe01/0GR0tXMBtS5Xf87DefyhhjccGXlW9+uvpjuNrYiQ2tBTdCgM4Mtfka9
	I8O3oqZHF5fCeWbNxx+yJXCPXGrLy/5s/PA/0WswpvdEo4ilOf5rMnCxMZU1iGcG87rK0yv6yx9
	q4TE2751gaVLLcoaeuna/KSCGi1YSxEdOz6Q7NqmO9cO+c7E+Ibwh7nn1eS3tzX0KC31BI6Bvhq
	R2njg4sCdU9zKmriRheOVd3Hok7Cu9a9SZZS+w7KkA0k/FFsLhmzRQ2Lkqhpp1qRC5NsYBItGo+
	ybMZTb1Y4H/9BZ8P4wlD8BR//ywjjwCK8BwHVfAQSqIGS1q6Z/jxF6lZeBw==
X-Google-Smtp-Source: AGHT+IEGWv/EAuzgSEUtp2T9EmVVlNbYX1xEJpRNtUQLpEg90WgKSuE7467gfTGWbp2Pkrj8w6UEgw==
X-Received: by 2002:a17:907:9443:b0:b09:d915:1416 with SMTP id a640c23a62f3a-b09d91547c7mr511335566b.54.1757877968616;
        Sun, 14 Sep 2025 12:26:08 -0700 (PDT)
Received: from localhost.localdomain ([2a0d:e487:226e:7d72:f695:46fd:3aef:7487])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07baf35488sm707841066b.38.2025.09.14.12.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 12:26:08 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: andreas@kemnade.info
Cc: lee@kernel.org,
	krzk+dt@kernel.org,
	tony@atomide.com,
	robh@kernel.org,
	conor+dt@kernel.org,
	ukleinek@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	linux-omap@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH v8 0/3] dt-bindings: mfd: twl: Consolidate and fix TI TWL family bindings
Date: Sun, 14 Sep 2025 21:25:13 +0200
Message-Id: <20250914192516.164629-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Following extensive maintainer feedback, this patch implements the
"define then disable" pattern. All possible child nodes are now defined
at the top level. Conditional if/then blocks are used to explicitly
disallow sub-modules that are not present on specific chip variants.

This refactoring also moves pre-existing sub-node definitions
(e.g. madc, pwrbutton, gpadc, etc.) out of the conditional blocks
to the top level, following the new pattern.

The complete dtbs_check for this binding is clean except for two
warnings originating from pre-existing bugs in the OMAP DTS files,
for which fixes have already been submitted separately [1][2].

---
Changes in v8:
  - Restructured binding to define all properties at the top level
    and use 'property-name: false' to conditionally disable them.
    This includes refactoring pre-existing sub-node definitions.
  - Referenced the existing ti,twl6030-charger.yaml and
    ti,twl6030-gpadc.yaml schemas for the TWL603x charger and gpadc nodes.
  - No changes for (2/3) & (3/3).

Changes in v7:
  - (1/3): Moved twl4030/twl6030-specific child node definitions (audio,
    usb etc.) into the conditional 'if/then' block to improve schema
    accuracy.
  - (2/3 & 3/3): No changes.

Changes in v6:
  - Refactored the ti,twl4030-power compatible schema to be much stricter,
    removing obsolete board-specific compatibles (-n900, -beagleboard-xm),
    that were added in v5. The schema now only permits specific, valid
    fallback combinations.
  - This series presents two new patches (2/3) & (3/3), which update the
    affected DTS files by removing obsolete entries.
  - Enforced the presence of the compatible property on all relevant
    sub-nodes by adding 'required: - compatible', closing a key validation
    loophole.
  - Applied various formatting cleanups for readability and correctness.

Changes in v5:
  - Restructured the entire binding to define properties at the top
    level instead of if/then blocks, per maintainer feedback.
  - Added specific compatible enums for new child nodes instead of a
    generic 'compatible: true'.
  - Set 'unevaluatedProperties: false' for 'pwm' and 'pwmled' nodes to
    enforce strict validation.
  - Expanded 'power' node compatible enum to include all board-specific
    compatible strings (used in existing device trees, e.g. OMAP3-based
    boards) for more complete coverage.
  - Corrected the schema for the 'power' node compatible to properly
    handle single and fallback entries.

Changes in v4:
  - Reworked binding to be independent and bisectable per maintainer
    feedback by using 'additionalProperties: true' for child nodes.
  - Added board-specific compatibles to the 'power' node enum.
  - Added definitions for 'clocks' and 'clock-names' properties.
  - Renamed 'twl6030-usb' child node to 'usb-comparator' to match
    existing Device Tree usage (twl6030.dtsi).
  - Fixed some spelling/grammar erros in the description.

Changes in v3:
  - New patch to consolidate simple bindings (power, pwm) and add
    definitions for all child nodes to fix dtbs_check validation
    errors found in v2.

Changes in v2:
  - This patch is split from larger series [3] per maintainer feedback.
  - Added missing sub-node definitions, resolving dtbs_check errors.

[1] https://lore.kernel.org/all/20250822222530.113520-1-jihed.chaibi.dev@gmail.com/
[2] https://lore.kernel.org/all/20250822225052.136919-1-jihed.chaibi.dev@gmail.com/
[3] https://lore.kernel.org/all/20250816021523.167049-1-jihed.chaibi.dev@gmail.com/

Jihed Chaibi (3):
  dt-bindings: mfd: twl: Add missing sub-nodes for TWL4030 & TWL603x
  ARM: dts: omap3: beagle-xm: Correct obsolete TWL4030 power compatible
  ARM: dts: omap3: n900: Correct obsolete TWL4030 power compatible

 .../devicetree/bindings/mfd/ti,twl.yaml       | 319 +++++++++++++++---
 .../devicetree/bindings/mfd/twl4030-power.txt |  48 ---
 .../devicetree/bindings/pwm/ti,twl-pwm.txt    |  17 -
 .../devicetree/bindings/pwm/ti,twl-pwmled.txt |  17 -
 arch/arm/boot/dts/ti/omap/omap3-beagle-xm.dts |   2 +-
 arch/arm/boot/dts/ti/omap/omap3-n900.dts      |   2 +-
 6 files changed, 275 insertions(+), 130 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/twl4030-power.txt
 delete mode 100644 Documentation/devicetree/bindings/pwm/ti,twl-pwm.txt
 delete mode 100644 Documentation/devicetree/bindings/pwm/ti,twl-pwmled.txt

-- 
2.39.5


