Return-Path: <linux-omap+bounces-4926-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 22462C65888
	for <lists+linux-omap@lfdr.de>; Mon, 17 Nov 2025 18:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1684A4F07E9
	for <lists+linux-omap@lfdr.de>; Mon, 17 Nov 2025 17:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157B13081CA;
	Mon, 17 Nov 2025 17:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="G3U6WAjD"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191912FD1B3
	for <linux-omap@vger.kernel.org>; Mon, 17 Nov 2025 17:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400627; cv=none; b=kU2w3Bd7psxVAmhMEXBBfDksis4RTxwpGGKVSUieD9AYoeMY7GBSOJZ+wN7i3sl80vi9PVSytp4XHLuMbsAnJvUEzhEyuPXjkjf8+FyKBaJLgqcjmZdn9Ki6P0uErE+m6DWoKGIOti37oG5atI0WGXZ/uvgapArMpGUOaFjNcHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400627; c=relaxed/simple;
	bh=qEs+o5CIyHf0ZNKyaxJr3YN9Ls7Oi8fYy8iYSoqh0w0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Kk+4rKwwcmXVSHY4BBPalwWT4Q+CRCZmKjO4NIwxqmVjZhZrBDjDEjuVhnx0vtkAANBhFlHgrbsDboRVt76tMWlLj/J52OHMsFYuJti8NPOPkluqEQ4JQ2YWx4Qj9D6RQ7RoWNK3GCBjzhlusy/b4ZJFkhdPXnfFJqrSxbNcmBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=G3U6WAjD; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso2651568b3a.0
        for <linux-omap@vger.kernel.org>; Mon, 17 Nov 2025 09:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763400625; x=1764005425; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BByjwH6DP+Z4+u9FvWdxBfSB14chnUdtzQgKngoILck=;
        b=G3U6WAjDjKx4LCDpMCBH2lrB+hKCvxE2IeOQcgsddpu3JRNPEiAO/6BuUAqtXhpDRT
         CDU8REq3rrfIRkUyROmWO/Vjy7NPeWCT5mOP+m2TzL3u3neI023s0gH59uEppI/vqFZv
         DG1Cp8w8zg1B74x6nLbeBRN7ghsJsOHz+0ZhWnJdExQMhxfq/ht57Il1pG8QM+RlZcAp
         42bXNGRVNn41SLpky7RzTv1h9Z3cp2D8UXWippxHqP0ei0ELpKunGBsurlauMRoTR2lS
         4r0ThAUSWj2CejYc375HSTt66BnAYtIcJYkgqWOaYfQPJxYGc/yeOJpPdW21uBOKXMd8
         ZlFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400625; x=1764005425;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BByjwH6DP+Z4+u9FvWdxBfSB14chnUdtzQgKngoILck=;
        b=UMafZnO0Otfo7u04KoF3fJLrtgDTiF6owV6euyxve0aQ9q90s2IodCbiir+R/jx/og
         f0ZBl+e9Nd67kkoG9BfkGtSkauKD1pht85oXKAlou3w+Ppn/WG++XwPE7h8ehSTfPOFK
         zbiXAKFv9xCuNtG8ZCU9nBk0LG7ROz+3N8FLcQz5i6Q5crVm+R7Jy/ebSZK8DR4FbmF7
         PCP1tafnJ0BaibW/sWUm0Z08WkNKq36UBcYH5PZaBSe7RHTPXbZqzAfMSK5X2SnepsbW
         FEpoS28BahrJnmN4LLgyf7c6o9lUEct/aw9WJqtu/nExq9QlVZ6Z5Xdv4fJWZk1rpDwL
         c+1w==
X-Gm-Message-State: AOJu0Yz1i6xdzvNgy6ND3n41ZXBo0rMK/TP07Qh4EuzTwPZr8MY5SjXj
	Xwa3mdGBbX4oJ/OIKKR3Cb2Ox0zRm6Puue6j9QORmtGuuug20fyUp/KCgAcxLuzrU/E=
X-Gm-Gg: ASbGncveG4A/9vpW/0UXvlVxBfc270nfsZ84ndQbycXLuC7HPfvA1QFh1uvRtjCEPAd
	UoGtBgk8oCiYXTWc3ig2BQFobZchXu+wtW7ZSwuvscAmMXirSDTkakpA7QZTJTozT+heJcfuJIq
	wZ8B/yKf904M3Jt8+SoukwBlFt447WCfLyPDuBz0VjWdolQTcqQ3dp6el1twli2Ld0+AEpgr5mM
	yWqBd7TUxxGRGlcpRXQLKXt9S/pyjWmpCd03lGidUKMcgsCw23U9IT+/S2YxrbS80oUZGZ806zE
	N+A2jD6zw5HaV9mRjfHaPSkLxN25K4dZMWvv5FxE4Us8DKvWp3mqN72KHJ58qe3xdCBCP1pkfnO
	xvI5gfyYA+0yrOXHC02sF/aFoiLMHlC3kf2oDzW1lrWTZgKGtOxqw63F2yTEEz9FwaAwElajGvt
	rgmr61Je4ykIMkFWJpasA=
X-Google-Smtp-Source: AGHT+IHbbc4k5mrkfMylyT8qgfnNnq3tN3oQVQf2oywmj0nq47cgWECuGlPIaeZHCeK9mw/C6man6A==
X-Received: by 2002:a05:6a20:12c6:b0:35d:6b4e:91f9 with SMTP id adf61e73a8af0-361171ca5b7mr161369637.24.1763400623631;
        Mon, 17 Nov 2025 09:30:23 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36f61bea9sm12609123a12.14.2025.11.17.09.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:30:22 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc/maintainers: OMAP updates for v6.19
Date: Mon, 17 Nov 2025 09:30:22 -0800
Message-ID: <7hqztwk1n5.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/maintainers-signed

for you to fetch changes up to 517d066dc080fc297f1ab5e8c6fda7c59d48ef8d:

  MAINTAINERS: Add entry for TQ-Systems AM335 device trees (2025-11-17 08:53:39 -0800)

----------------------------------------------------------------
MAINTAINERS: Add entry for TQ-Systems AM335 device trees

----------------------------------------------------------------
Alexander Stein (1):
      MAINTAINERS: Add entry for TQ-Systems AM335 device trees

 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

