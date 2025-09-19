Return-Path: <linux-omap+bounces-4642-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 574D5B8B6AD
	for <lists+linux-omap@lfdr.de>; Fri, 19 Sep 2025 23:55:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D6201CC17B0
	for <lists+linux-omap@lfdr.de>; Fri, 19 Sep 2025 21:56:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101352D3745;
	Fri, 19 Sep 2025 21:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Kt7vd0+a"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C175C1DEFE8
	for <linux-omap@vger.kernel.org>; Fri, 19 Sep 2025 21:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758318937; cv=none; b=h3V5pi3HmS9+/09hyS71o/tR2LHFkUaoXmjcTNrNEzC7hMUC38mof+gDYeR9A2w90bZX+OdY0yUieoF2ma6u5WLrjFamWjKh4SYYqiJFJyfOYAAbUjjFz2VeDwIWSGVVfDrLI8BBoeLoSETaUH7rmVAZlldTvI1frEOSzLWl4uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758318937; c=relaxed/simple;
	bh=Kfflr/n9x8ObUPUWxY5SiWbDDf6rBC37dCoRqlvYqbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KNimFt5h5SByxBfHuaeIbw2hoU5JVMNYf/G5NZQNroYRUrraolHBaKptZl1e7djUTE9kIXlUJrK0OHhlsPItR5QbgZ/bbuUCxUeVsgDLt96dxW80ND4IKPBswzVDwcn9wgrLQwH0XzOPP+G2Ca5+jfXRZ8MuVz+PQBivSdNjayo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Kt7vd0+a; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7459d088020so1521954a34.3
        for <linux-omap@vger.kernel.org>; Fri, 19 Sep 2025 14:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758318934; x=1758923734; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9GhVAJ8zczcdk5RoUmHUOCQ0cenVmOQiaDZXnPFubC0=;
        b=Kt7vd0+aOUlONGNU/8OTZK9DwMd1Vw8blLK/a2srsSikjnAHgCgzWqWK2qhXtGSSyr
         pJK4FWkCbJgp9lRrgvbYusBqFVPRhPU73+/FRzVneZ2UHqEXgxvRB5NJ6V89xZ7sPFpN
         mLOh6cqNrYCvgO8AAQ79YufcBaL2qsK4/sIoV0tX8554oLiWLfNiM3WB7prAhR8sAhpZ
         vtZXSLDRszjSrVAmsNmTffy4ZAb/ubQrzHfVhuXsQEi4XHIDL56H7WZ+hppkpMM2LmH3
         jJE7zfUq968+5uoVDZ94kisgw6JOnBEQ/O7HdUmRhZh1xGGYiqI89UE1oiOvbF5HVzy+
         kGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758318934; x=1758923734;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9GhVAJ8zczcdk5RoUmHUOCQ0cenVmOQiaDZXnPFubC0=;
        b=U+G0szvKQCxu7Up6NU8skot3DR84SvTs4rz6VjCX3ofyf/Y15PfAvMO2fBzwUUkthh
         u3QN5IPvZTeRpHBeUZiaxsJWyvFHRhMA8mj3FI81sw+0Ef6wZWGU+h0BMvYxThOz4KGs
         75Li5XllhxvTMfb0dqMYsWRYiu5wYrPrbUSt+r0E2PnTvvsB3z9aeWd0/rt0xaniD0DL
         GfqYOao8bYyO75WfF61mfRlfocZXTgQhKkXQDW90R0p2gh9lDwIKyqTHwLmK5eiFDDB7
         wALmCc+0FMibnjs1+KPNceHUQE05Tx+Sl9P0wmAxWCYBVa6dg4Z62Cc57C8XGYD1Gbkf
         U5LQ==
X-Gm-Message-State: AOJu0YwbdjMmi/DeZf5C/+Hx0WsH7pr9YrwvT7NbrUoQAB3IF8ta3S8X
	nYC0G3LAdJLVlnsIlv5oVw3k1YuMzzk9a+N5LX0zDcthmkEOJWEYiF3RjOJZXtjeTzSmLFqdJg7
	MRIuxon82Ug==
X-Gm-Gg: ASbGnct2cQiMYyPAge2hHDvgvSv8UvyxQhABZSpWRcfuB3WBnKlwSmnaGmmJSLXAdND
	EprvMaUXcV1GfzeDUf6QB9S840U52XU96Vy+orjtpZxBmXF2qCtcUyEs8qnxwPFnf5O8vvjlL5j
	6xlQQW+fEQU4FOqnMg1MKepKSj8E7spb2T2zK2RW6OMGvKUWSl5oBJNK/IxwUkgWIi+gpLIgIYH
	jOcqWM0csendoTF26DmGchrYaYpRwIFARGylYWWJsgiEtTsFuEf0TjyRz6tEGfcu1prN9+AZhRr
	RK/WKqOO0sRWlsPR8WM7ylilmKMuPCc6+HsDIob1d59aAw7Kc2bwYlyq5MNFHXk/PVyJ53TkvMv
	X93U3iODT6hndtMErZz79wpu6Qnkh2GM52hQ+elb62tyIjcQk1sgkjoBBkg==
X-Google-Smtp-Source: AGHT+IEakeFSJ15e4E3+APHquCTiCy/olIvfzEu180a/k/E2WjZFyGY8R305NCwW8HGY7XD5NOI+Hg==
X-Received: by 2002:a05:6830:6d25:b0:741:3929:31a with SMTP id 46e09a7af769-76f70de94femr2698840a34.12.1758318933696;
        Fri, 19 Sep 2025 14:55:33 -0700 (PDT)
Received: from localhost (static-23-234-83-233.cust.tzulo.com. [23.234.83.233])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7692de28b95sm2926581a34.45.2025.09.19.14.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 14:55:33 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: OMAP: SoC: updates for v6.18
Date: Fri, 19 Sep 2025 14:55:32 -0700
Message-ID: <7h7bxup0ob.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.18/soc-signed

for you to fetch changes up to bb676996ed583464504123721195e98a708fbba9:

  ARM: OMAP2+: clock: convert from round_rate() to determine_rate() (2025-09-15 16:18:01 -0700)

----------------------------------------------------------------
ARM: OMAP: SoC: updates for v6.18

----------------------------------------------------------------
Alexander Sverdlin (1):
      ARM: AM33xx: Implement TI advisory 1.0.36 (EMU0/EMU1 pins state on reset)

Brian Masney (2):
      ARM: OMAP1: clock: convert from round_rate() to determine_rate()
      ARM: OMAP2+: clock: convert from round_rate() to determine_rate()

Kuninori Morimoto (1):
      arm: omap2: use string choices helper

Miaoqian Lin (1):
      ARM: OMAP2+: pm33xx-core: ix device node reference leaks in amx3_idle_init

Yang Xiuwei (1):
      ARM: OMAP2+: use IS_ERR_OR_NULL() helper

 arch/arm/mach-omap1/clock.c                  | 19 +++++++++++++------
 arch/arm/mach-omap2/am33xx-restart.c         | 36 ++++++++++++++++++++++++++++++++++++
 arch/arm/mach-omap2/board-n8x0.c             |  2 +-
 arch/arm/mach-omap2/clkt2xxx_virt_prcm_set.c | 12 +++++++-----
 arch/arm/mach-omap2/pm33xx-core.c            |  6 +++++-
 arch/arm/mach-omap2/powerdomain.c            |  2 +-
 arch/arm/mach-omap2/voltage.c                | 12 ++++++------
 arch/arm/mach-omap2/vp.c                     |  4 ++--
 8 files changed, 71 insertions(+), 22 deletions(-)



