Return-Path: <linux-omap+bounces-2572-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1B79BBD82
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2024 19:50:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19E841C217F1
	for <lists+linux-omap@lfdr.de>; Mon,  4 Nov 2024 18:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84F961C9EC0;
	Mon,  4 Nov 2024 18:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="adb5gYEk"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046241C9DDF
	for <linux-omap@vger.kernel.org>; Mon,  4 Nov 2024 18:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730746227; cv=none; b=sA7bhlWj9oryIGD3DZmV7vjv4ad426jogM7/tVx0Q84NyeuGlM0sqlqTSMk2eHxTIutFt7Y2rSXMwEeVxqUvbz7vgxIEw9MPGO5t+NiOaRuGUEj3g7i0DNTQEGGe5bY00zubod3R7eVD/JoIJ7vzClU4hDkshU5GEA9pfar9SKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730746227; c=relaxed/simple;
	bh=BiURnDypCTHkTHYBVR9sKK/ECoN9gxqZVE3LBc/9/lg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sD4whp6Dg7x2RWYe3bB+wOT1LxDSrVjyxCl4Ghnw0wXDjdwQrvzqpJecUMQrQgGju0LaYMZrlrVu+LMGCMGf2uim652VdaM/3Zg7jkR7V5tJs9O3jl1M3aKN0NIAFc4xdZeTCT4gDmKuWKufnahdT/I/hVSaktGKARVmCiW2REc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=adb5gYEk; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20c803787abso35672255ad.0
        for <linux-omap@vger.kernel.org>; Mon, 04 Nov 2024 10:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730746223; x=1731351023; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y9ByzT5rhkqv1UFXFeAa7XDWoMGVN9DTUnpFtsiZv98=;
        b=adb5gYEkibWCGaSdXHW8BLeOB5/o+GVetaqN6WJ1TKmui3pP1JPqFxm9C6jwbe7oVe
         KW1MZYqwS13COcqVo4qhxQQBehI4XRlJQMT3sTFdsY5g3Aa8t76P5yhxYenv9mXnzhaF
         Mcvwd30EJzCEW9Dd/MLUbIFayTH+psi0f8qdp+wXtMmSJICs7AJLLi5B1/lCKBJCt0fl
         gw3x5ClMUrmU/E8RaX7OFksABfWNGkYKuBrLPJPNMKXHhQ5WuczIER5DdECu3jszS4a0
         QpLwFRDJbJWQ4/CM47RUGkCXwWYU+VFrp5rWojP2SvCDimr81Ey5XPTgvUmeoCnFr8VV
         GaEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730746223; x=1731351023;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y9ByzT5rhkqv1UFXFeAa7XDWoMGVN9DTUnpFtsiZv98=;
        b=jkmzgSYGfsACLn5gkU8x9wHatq/Z84S09A3Pw7KS6XPJQApTvHJB3/X4byFt+NsyVN
         73c4GLa1O0GCTRFB2T1b7b8Fc85KJhpDvhpm+TuGSzJ28oFCLqHa1LLGiZZ+9XxjVkMg
         lKWP7/UqJ3a13x3gNlMR/f/581bMrJkUPl727DWHXF/VNALV+a/Kz2q5CsatA250E3km
         oTZwbBiLZI6G+gLO/EnzMbwcdcy2gZ5tkVsPPQHKHj9ltKVefYpAeFqKVwbposcab9Co
         vQBYKK0pbaABr1j8tS8bprimqYNLOM1pcs5yWuEhmdAz8wqjTSyZKJ7pvlaMsnscJjvd
         +ypQ==
X-Gm-Message-State: AOJu0YyH7mH/8oDjogm4sMIryPc/ZtsNqrgQUigMyFhpp9tql6lE2gmQ
	iXCovD8QHVshWuHQnXFb2rT1vHrUtskNEXNmcpx6HikJGmiLoUR7Nk0ysmZ1QDI=
X-Google-Smtp-Source: AGHT+IH49Bn3FifJ33FPD5Gz33gFu44F9HIMX+OnVbzafXRnP5Wsu0eGXm5Lc/0fHXbLXgtkonLylg==
X-Received: by 2002:a17:902:dac6:b0:205:8763:6c2d with SMTP id d9443c01a7336-211056b2c5dmr236699765ad.9.1730746223147;
        Mon, 04 Nov 2024 10:50:23 -0800 (PST)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056ef03bsm64652515ad.37.2024.11.04.10.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 10:50:22 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc: ti: driver updates for v6.13
Date: Mon, 04 Nov 2024 10:50:22 -0800
Message-ID: <7hplnaomtt.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.13/drivers-signed

for you to fetch changes up to d8ee46b226ace0110f82233ba4c06ff1742ae443:

  thermal/ti-soc-thermal: Fix typos (2024-10-04 14:37:23 -0700)

----------------------------------------------------------------
soc: ti: driver updates for v6.13

----------------------------------------------------------------
Andrew Kreimer (1):
      thermal/ti-soc-thermal: Fix typos

Jinjie Ruan (1):
      soc: ti: smartreflex: Use IRQF_NO_AUTOEN flag in request_irq()

 drivers/soc/ti/smartreflex.c                      | 4 ++--
 drivers/thermal/ti-soc-thermal/dra752-bandgap.h   | 4 ++--
 drivers/thermal/ti-soc-thermal/omap4xxx-bandgap.h | 8 ++++----
 drivers/thermal/ti-soc-thermal/omap5xxx-bandgap.h | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

