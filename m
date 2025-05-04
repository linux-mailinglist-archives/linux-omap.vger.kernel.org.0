Return-Path: <linux-omap+bounces-3637-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E97FEAA8633
	for <lists+linux-omap@lfdr.de>; Sun,  4 May 2025 13:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F39C3BBF56
	for <lists+linux-omap@lfdr.de>; Sun,  4 May 2025 11:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91CB81A9B5B;
	Sun,  4 May 2025 11:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="afOhK/bt"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6848C0B
	for <linux-omap@vger.kernel.org>; Sun,  4 May 2025 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746357886; cv=none; b=KlYwSIL/mWEF9IfFv+wwtj++8J42vRjMCcUXHrrWa98DWcPi6JqA/SVRLZAYJj2sN0TPPUMcIMsMCWJti2PuPl23rKGSYWDJlDkkPdFeYNbzZw14u8X8zc23dYt8dAX7zN1JREq88WsLG2lYQgz7rqW+jHte7W+VnHJfNtC/gV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746357886; c=relaxed/simple;
	bh=dB+eSdk5bmJLofe21KHiRL9lm/wFp6a0skcb5cnR6rU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=tgeXS77gkzya34JXbss/EhAJB8prDjQQ9Jzvr6VhvIdNJwEcszKMglNVPl4Pm8Xh7ZJlbH7N3oaMOtl72BF48z6erqE9JpIRcKVmeSXOlZ8rIH9rdSDecxhcWHEqH938HkIpfe3c48LAtSpOspj7KKSxqBofNydIKsHtFpvNRgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=afOhK/bt; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so32126215e9.2
        for <linux-omap@vger.kernel.org>; Sun, 04 May 2025 04:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746357881; x=1746962681; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rCvX4uJY7+qc0Sa1nCHPGxvQLNSrnb7aHcxG3bQRQw8=;
        b=afOhK/bt9WYNcxRQ81bpkpz3FhoaVFXsFrnqMkOndLgbxFonqwK1MfBziOR9LltpsG
         LckHJcH66eXE6jfEZ88Qe4wjZbQE5f40nGTzaLUvqRJoSeSBaAYQBy4D+Z/b6yEF8cGc
         kAdCaM9YjYQpznlRefu6LR82LkHkGA7Oj5JxqIzpmfh10ZPl1fdV6ZvqZ6Jn0bwGT4Gj
         zIneHE4TqwoWtlAAvkoNAyyeCnun9PKfRJh2YmglNURbj25HyHVoj1U6zaZBlP3Mp5Hd
         dRXW3R0Yl57EUMEkSzcIxjcNOFkm2qgX30CQCMwksfHbVKOaG7K23se8D6rwRbE/3C+3
         HRpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746357881; x=1746962681;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rCvX4uJY7+qc0Sa1nCHPGxvQLNSrnb7aHcxG3bQRQw8=;
        b=Solnc4Kb8lWc+kr9cr1nOB7DffZbGHRul/PcPzBuNRmbbjt0RA6fONROq0vtrdsliT
         Ga4qyqeVHC2IOyx6OMCH59igE2z1ziKK9pr9KNM725SUrmi6QU/TZzzdCBxPaIuV9RVv
         miyXJAdYoggmccydsTPuqjmhPjRm0OWOagtSqbvHM0ViRzwD8WNhtyh1NxP1B6OU2q9f
         UgdrpW79kxGgVw7Zg7FirgAH9oz8su/zDnlv+eYff3QKSgh9UDCM5Gee6PaEc3X9lCan
         NOR3eTXyZAYdcKuRRW1mSalqwH12EbI/8VlqoFUfl8k8K9RqJxnHEg1c1FxFWi1HtuQY
         ggAg==
X-Forwarded-Encrypted: i=1; AJvYcCUXGaVLwAhqrJYBXFGf82uup7ohD/3rdCsTTz+w2NvRoQ4EKCiAgKN76U6mPAugzw/03+MvelqYOiCD@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsg7CnNW8OIDBOPiVpfz20sDZUbinh8MbrrYAXAX8fxCzX9a0+
	+g4FUFInkqMJ5rSIp8D3OYZmOB9QND8eN7gaDdDeANNqrxsYOydfeW4fG2uq+hg=
X-Gm-Gg: ASbGnctWlDhdV9FFHTszsfEFSVw20dgv5Gj6BBUakao/2iHjO8d18CL0DsSjtUCaw1E
	NKDJYZ5WbjkBddaICl7HjtblhDDhVq6QMMWU2XZ/ySvN+PCjLJAP2rCl/fbNhGtkAHUL3W1IdbO
	ZJwH4pcJbGTznWGTULEQ6DTikVzoo3cRBNUrFJysMRuDqS7XiaZ/fXs8iZW95f+yRwJIkgpZ0Q1
	6AdmuajGWo3QKR2/5D/MqcKCa+AfQX+PPPst9MxxStrrUaHLMMQ1goHcj38TspBzo6FwzVVFfuC
	85bU5blnGOqybl4Md6XbEGcOql+1LQp1HDlkiGFvXkve
X-Google-Smtp-Source: AGHT+IF/nTjowgFTpX4DBmNA53Y4LVnmPuQntazuU/vu02j6XLWVnIjjuNgsMm6A3VC25/HRU1jVEA==
X-Received: by 2002:a05:600c:4e88:b0:441:b19c:96fe with SMTP id 5b1f17b1804b1-441c48bdfe5mr30770245e9.10.1746357880705;
        Sun, 04 May 2025 04:24:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860:9356:7b97:9d4d:d944])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ad784asm144447685e9.7.2025.05.04.04.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 04:24:40 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Sun, 04 May 2025 13:24:39 +0200
Subject: [PATCH] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAHZOF2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDUwMT3ezk/Ly0zHRdM4s0Q2PLtKQ0Y2NzJaDqgqLUtMwKsEnRsbW1AH7
 Au9tZAAAA
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nishanth Menon <nm@ti.com>
Cc: Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.14.1

After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
select on ARCH_K3 are not needed anymore.

Remove it and give possibility to enable this driver in modules.

[1] https://lore.kernel.org/all/20180828005311.8529-1-nm@ti.com/
[2] https://lore.kernel.org/all/20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com/

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 arch/arm64/Kconfig.platforms | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..5b63a42c4dff 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -138,8 +138,6 @@ config ARCH_K3
 	select PM_GENERIC_DOMAINS if PM
 	select MAILBOX
 	select SOC_TI
-	select TI_MESSAGE_MANAGER
-	select TI_SCI_PROTOCOL
 	select TI_K3_SOCINFO
 	help
 	  This enables support for Texas Instruments' K3 multicore SoC

---
base-commit: e8ab83e34bdc458b5cd77f201e4ed04807978fb1
change-id: 20250504-kconfig-68f139fbf337

Best regards,
-- 
Guillaume La Roque <glaroque@baylibre.com>


