Return-Path: <linux-omap+bounces-3688-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53332AB2999
	for <lists+linux-omap@lfdr.de>; Sun, 11 May 2025 18:37:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBABA1891016
	for <lists+linux-omap@lfdr.de>; Sun, 11 May 2025 16:37:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 796FD256C82;
	Sun, 11 May 2025 16:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="lrXXORVE"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579CB1426C
	for <linux-omap@vger.kernel.org>; Sun, 11 May 2025 16:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746981439; cv=none; b=nha89PNDdK4o9U60Flex6KKXDQTCko4ikH0P8ccL4kouJuQmzoHDhPg1ElBclfJaqu7XQgDwkRvA1W32qozaaWfhqJVqOTvh/Nv8JOxgrltw7qYP8h4BsOiFpOqRwVwFV2LMSvpUkkfsYvbW7L57/zn+DHTKZSj8a/AY+D8XBJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746981439; c=relaxed/simple;
	bh=v2rgd5xQW/L8uOvlqVSBY8k/lEKYRobz4m5B20mQsPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hr2RomYOzNCbFpwdUrcMNqLtGgghK2NdUXQuvmzACLBMXe6YyKLCIj5uKdiNiaoN2kF505OJHQsq63OVAWzkDpQaHHWuM4qUP2ZkbQqpbE5fEUUIcFu//iKhP0E25dcA7gbm5FoEFw2lu+1QNexIHvAXRAsmLthIC2fC0ILlRwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=lrXXORVE; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22e6a088e16so25802965ad.1
        for <linux-omap@vger.kernel.org>; Sun, 11 May 2025 09:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746981435; x=1747586235; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ozKqR8KiFMnJ8RNfvHlmDOW/X82IjMy0+nGHj+kzslY=;
        b=lrXXORVE34U5e89k2Sju0rdN+J2nOvVr2COriP9qf8NuevroJJgT+NGlzcyGLQTXO7
         SolLD1UCElePAkJYS7ivW45ma1xN6/5ceajqZyMoNR5P2Kw4MSZmbob4398XhqWySmni
         TIKE8xpBjdqK4XOhSraqs+2boXlNwi5UIpjsJKJhWV/dZSHCC//mXrlohYpUapQiuhQP
         NZvpMC0VsAxp/ExSUCqqHilSLlgEOltbxIaUs/xZ2kmh8LtnpFe+vqeK/8r60wF/7tJi
         IsnBdu0+VNOTZvs6IW+wqH0fzNgD6I+xLsxFPVZmyU9MqaFq+M5/2SNAkbi5TR2gwQpJ
         DkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746981435; x=1747586235;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ozKqR8KiFMnJ8RNfvHlmDOW/X82IjMy0+nGHj+kzslY=;
        b=Kqgb1OKa+/zKD2himIc86ldm0JiYItCV6h7ZC65iH388XZrgTYf3gu7DdykH8J2jGH
         gN3EOzMaScOwjhM2l0Whpgvw9u7YNl3iH3VCvufgsBfDo0iOdYxjcJR6rAoyWdqXC5hh
         MBhpMhHMxo/W82d6n5X3OGJOqdiYe3/w5a2TrfFIJQWDDkb8igAuDGGjnUf69fKoUvBg
         ASEPxmKXAiCP3R+1yD2rUnb8RmaiykEjq5e/XiK6L4Ugim/DFnfkVoVKmXfAxphXYlje
         NY2ZTo3T4Xi89GO0S2JPWbe7gRITFPHV2gDvc1QM95BONvFR7pBB5QwU0nU7kPS8yOxV
         RORA==
X-Gm-Message-State: AOJu0Yzb/xlmk6ZNGvCfcusQQBwtKjVzDglI/r5WDe8WRjK/QEs6ctOm
	IgKRsR8XXX/7l9JwhqbCJjecnSoGIWcbB7s6q4ileuglRMl41wIx7vVbsVWDgCQ=
X-Gm-Gg: ASbGncv37WQYsoOHGNOKoNHdNacypbrKhS7Q8VLO5uRv484RTgnqbKh+xZIHrwbXAB4
	9f3f2LW2H9A6yc7KsLcHnZvtVTZD9qEsMWQgvs2+xscHfAr40VPSqkSFrE4/SejUMb/PTLerNL4
	uAiq2zTa2fktRXpop9JDxArh8jQtKeYJd7SRUnLBw4FZ9LhrVtJFAuwosUcghVVHVlcgLJGb37S
	xlUvIXlOBH/XYNdF6TCqWyE33u6+mtVMYsYnFU5VUCbPP7ppzmSJsq4tsltUf+REGsHk0VAsnAl
	Y+KuSkstMygaePGH1ErZ0qwZfnjq6SLumbo2+S3UZpWcMY0wsw==
X-Google-Smtp-Source: AGHT+IFPEY8g82RGp5yhOqpGmRIP7cEY2ruWZiZR0/cuOw+7hTLUKHCqDioAZJqYRH9/2X6lupqZlg==
X-Received: by 2002:a17:903:3d06:b0:216:4676:dfb5 with SMTP id d9443c01a7336-22fc93dc352mr153833875ad.21.1746981435274;
        Sun, 11 May 2025 09:37:15 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7544d86sm48146985ad.47.2025.05.11.09.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 09:37:13 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: omap updates for v6.16
Date: Sun, 11 May 2025 09:37:10 -0700
Message-ID: <7hecwvrtmx.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.16/dt-signed

for you to fetch changes up to 550e5608c25e0a886da1182386a6477f49caf2b7:

  ARM: dts: am335x: Set wakeup-source for UART0 (2025-05-08 06:15:58 -0700)

----------------------------------------------------------------
ARM: dts: omap updates for v6.16

----------------------------------------------------------------
Andreas Kemnade (2):
      ARM: dts: omap4: panda: fix resources needed for Wifi
      ARM: dts: omap4: panda: cleanup bluetooth

David Heidelberg (1):
      ARM: dts: nokia n900: remove useless io-channel-cells property

Sukrut Bellary (1):
      ARM: dts: am335x: Set wakeup-source for UART0

 arch/arm/boot/dts/ti/omap/am335x-evm.dts          |  2 +-
 arch/arm/boot/dts/ti/omap/omap3-n900.dts          |  2 --
 arch/arm/boot/dts/ti/omap/omap4-panda-common.dtsi | 39 ++++++++++++++++++++++++++++++++++++---
 arch/arm/boot/dts/ti/omap/omap4-panda-es.dts      | 32 --------------------------------
 4 files changed, 37 insertions(+), 38 deletions(-)

