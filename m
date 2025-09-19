Return-Path: <linux-omap+bounces-4641-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C54B8B51D
	for <lists+linux-omap@lfdr.de>; Fri, 19 Sep 2025 23:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E3CD9189D02F
	for <lists+linux-omap@lfdr.de>; Fri, 19 Sep 2025 21:20:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD0FE2D027F;
	Fri, 19 Sep 2025 21:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="HDrRpcy6"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D8927F170
	for <linux-omap@vger.kernel.org>; Fri, 19 Sep 2025 21:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758316804; cv=none; b=LrzdzaBPW6dDCrts7iitvplP/l2neaKsrZWmzEDtZKRXrgVupSiARpZKtpOrXczwmozt2yfjzmAqBP6TDnlV5BCsNPuGFOPtlc03Bt51wEwskH7shz82GxnwI7G3Hy2j5gIL7o2huWdTCMsvuvsxd2h2buz3/iWZwCwjBuDgf2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758316804; c=relaxed/simple;
	bh=7rpTCHq0tg2boyWWPz+AlsNfcsmC/Bi2r7ZhyD96jfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JwQx9Basu1pdf1Yz8Kmq9bN191S0ygBOvUjR6PFvjFSJBdffuM2SKCBN8iJ1whqSQa9mwQ2nyxSoGX7kE4myW9sm9ogjiB/FuJF00ITGG0JklyY49y6zklVYTtY1742nKyxkrAXS1ASURKw9SenPr9TQPHspgJWz1PsSd15F34M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=HDrRpcy6; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-42487ec747eso7092625ab.2
        for <linux-omap@vger.kernel.org>; Fri, 19 Sep 2025 14:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1758316800; x=1758921600; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s92tP4t5WFXZr2GKT9tyo2yphzIt1odXMwCHBG052no=;
        b=HDrRpcy6zgwaPk0MchkjnNv+4XrLlAb2LwILLjsOUv515NevqFsbMIf/lnG/pWSd9/
         sTZILnYgqYiXrtZnAlh3Gk2hj5xSaJNw4jXP54af4Xndq86l5WIGNWKjus/mchD7YZ3A
         huxVrU9Oe5eXvePiAbheErLQk51jWYs/m+R5MobQyYELX9ryMEXMIk5xre+21SG/SsK4
         pcHYEgU/FSnPz7TzXRpXjmI9SbC5/vkSXb8rTRjfV6M8XbgKEjwySFzx01wiZjJRloab
         oOhtbyNIUMVo2D/hUAhZ1BoCk0yjqaBZ2/3gKQGfZupFAspo4dfyZHJzBEcs6GLARnlr
         wPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758316800; x=1758921600;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s92tP4t5WFXZr2GKT9tyo2yphzIt1odXMwCHBG052no=;
        b=G+eqtUq8XK0+N7Mr/5DdFdHernRnd4iug4AIloptVaZII3NpGNB0BBMM2reVWQRYDQ
         +uIP9DAH653MDnW7yc4jim1xImMOQV8400HmwXWKlcJRUppKweVT3JCQaihmJkUgTSWU
         cYY/jAsGMwY8B87mZ9os/t80mZgDmHPCauMnuMN/V9qzkxW3jBwtekxEejZ2ZZJ4YXAb
         J50eLCifjcavQFmj/Y2WDAoO+7+bjyJbLCWbGIAslwL55Evn52M3YrApvCtiq6G4mIxi
         b89GV9iJkH0MeDxT2WQ7i4lm7+NdWATSd/Y6WR2vBz4PdhHYN4eVb3owynuDyF/X0IUy
         vVpw==
X-Gm-Message-State: AOJu0YxkU0S8tMqKKZ8oBC7AyctK8l5rpUjRmc5L4o9TKQwUbnHKtPzr
	q4+0ywykSwmF78tUnbjyMTrMRCzJHJVFS41p+eWLZGf2Fmi+GWK7j5DkHzVUZ67GtA5cFB4C/f7
	anvmXmhrEPw==
X-Gm-Gg: ASbGncvlyCRU7EYbCAQ56pBt/jLSk4OoAK7QpO7b71GXnmQ7hN06fuqL9iLXKQZ9Aym
	9KZBjWgighEaLJ57auXyCoO3TnOFCa8QYvBWsyJ8rNtD2QLI/9PopKT5jAOppgnUPhpkKNUQizF
	dLObK9EYKhIHDqhrt1Fkf44NQvIZcN3cm28oBQ5Gy2TlHcjlDFeXRMuoV8KDw6LZnclgfZQhzMf
	ojfsHMcJa2H2v6Fjo7+PafiKft/tXRbfvkRpE4Ox6OBepQUz9FR2imfOPXGgGiCCu+tpK35CySA
	IZXa83hr3vAIphd2RqyUWu7XzxGa/SOZF0J60LamRtYTeCFG3ZX3vsLqpAl0rWrd9gE/O2ANWFD
	902Bzmjir9i6vDDpW1Q1P/qD+lQDajJYs1+0N24LoQWlT5+uH8JOllwbVmg==
X-Google-Smtp-Source: AGHT+IGsqsYnhTXUsNgx0wZHnvpKnyrcoUJXU5jyFCHL/FXVHe31eOcLv4p90MIR2Gxa352P4Ejr1Q==
X-Received: by 2002:a05:6e02:4813:b0:424:8650:17ba with SMTP id e9e14a558f8ab-424865019f7mr47008285ab.27.1758316800610;
        Fri, 19 Sep 2025 14:20:00 -0700 (PDT)
Received: from localhost (static-23-234-83-233.cust.tzulo.com. [23.234.83.233])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d56e41e3csm2599947173.71.2025.09.19.14.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 14:20:00 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: ti: omap updates for v6.18
Date: Fri, 19 Sep 2025 14:19:59 -0700
Message-ID: <7hbjn6p2bk.fsf@baylibre.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.18/dt-signed

for you to fetch changes up to 27322753c8b913fba05250e7b5abb1da31e6ed23:

  ARM: dts: omap: am335x-cm-t335: Remove unused mcasp num-serializer property (2025-09-05 14:37:57 -0700)

----------------------------------------------------------------
ARM: dts: ti: omap updates for v6.18

----------------------------------------------------------------
Bruno Thomsen (1):
      ARM: dts: am33xx-l4: fix UART compatible

Jihed Chaibi (3):
      ARM: dts: ti: omap: am335x-baltos: Fix ti,en-ck32k-xtal property in DTS to use correct boolean syntax
      ARM: dts: ti: omap: omap3-devkit8000-lcd: Fix ti,keep-vref-on property to use correct boolean syntax in DTS
      ARM: dts: omap: am335x-cm-t335: Remove unused mcasp num-serializer property

Krzysztof Kozlowski (4):
      ARM: dts: ti: omap4: Use generic "ethernet" as node name
      ARM: dts: omap: dm814x: Split 'reg' per entry
      ARM: dts: omap: dm816x: Split 'reg' per entry
      ARM: dts: omap: Minor whitespace cleanup

 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi               |  2 +-
 arch/arm/boot/dts/ti/omap/am335x-cm-t335.dts               |  2 --
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts          |  4 ++--
 arch/arm/boot/dts/ti/omap/am335x-sl50.dts                  |  2 +-
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi                   | 20 ++++++++++----------
 arch/arm/boot/dts/ti/omap/am33xx.dtsi                      |  8 ++++----
 arch/arm/boot/dts/ti/omap/am57xx-beagle-x15-common.dtsi    |  2 +-
 arch/arm/boot/dts/ti/omap/dm814x.dtsi                      |  8 ++++----
 arch/arm/boot/dts/ti/omap/dm816x.dtsi                      |  8 ++++----
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi                     | 14 +++++++-------
 arch/arm/boot/dts/ti/omap/dra71-evm.dts                    | 16 ++++++++--------
 arch/arm/boot/dts/ti/omap/omap3-devkit8000-common.dtsi     |  4 ++--
 arch/arm/boot/dts/ti/omap/omap3-devkit8000-lcd-common.dtsi |  2 +-
 arch/arm/boot/dts/ti/omap/omap3-sbc-t3517.dts              |  4 ++--
 arch/arm/boot/dts/ti/omap/omap4-sdp.dts                    |  2 +-
 arch/arm/boot/dts/ti/omap/omap4-var-om44customboard.dtsi   |  2 +-
 16 files changed, 49 insertions(+), 51 deletions(-)

