Return-Path: <linux-omap+bounces-2559-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B51A69B935E
	for <lists+linux-omap@lfdr.de>; Fri,  1 Nov 2024 15:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A31C282315
	for <lists+linux-omap@lfdr.de>; Fri,  1 Nov 2024 14:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 728071A2C06;
	Fri,  1 Nov 2024 14:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CCLifXC+"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92E6179A7
	for <linux-omap@vger.kernel.org>; Fri,  1 Nov 2024 14:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730471770; cv=none; b=fvk+5IB2TdZt1WfuhzjA8Vl0jneUH4CVI6QL96EyHj/bZBk5k/CI16v3NxOmxu8nSEXXWap6vFNidZgH2XbwjUj06j4XC7weupCQHhxpXSZ5m+khECXfKLUbpqgVFE7eTVHj+ts073h4XxtbgHOqsOrYS9uaLwAL5YSmHEHxP34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730471770; c=relaxed/simple;
	bh=/74uiFbmkeRXoszji4oN4iOLNw27uMzzqAhMfk+VndM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=i9Ga9dHkwN10WnIZR7/XLDfDlsOa3I8v5CsHYyqjJPjdln8yYwVc/jWcpcSUKb/XudJcOdtrMR8h4Gy5so1q1wY0AZQI1+gKdUgcP5AVDD4G5mC4VW4Hj5aHxuoC1QP09ZTaECZ/wdupNL3ec/M/EFSrogpF3hy0RQakLBhBjJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CCLifXC+; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-71e79f73aaeso1726831b3a.3
        for <linux-omap@vger.kernel.org>; Fri, 01 Nov 2024 07:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730471765; x=1731076565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IoXvpMPyv+sDPClN8pjmFGHQt3n9px2NbZdIhR284AQ=;
        b=CCLifXC+yVobqETxwYUBqI5IcezfGPXC9tzPG2dcUn2f1RrP6iwr+i64HgZtE6sxek
         LfqvEPw1NBxyKwAvw9Ae46L77T62wwodaxEAPokM8e66CpExLVRBU4TC7U8QFF+Yoc7W
         HHOmy6SE8gc0+r0kTN1Z1/aVeKg9icWFbUYRpeGEOhstj2/JFOcGibZH4eChBZyGlUdj
         N+p+XpUmE3e2ts1iGMt67+IhXHghHTtDpzVr9JRcMoJLgIxvXrOBIa04OfwOE1G+2KjF
         IZxqiNkzQ7v9rZVISboiqG5VUp/GSoxfX+HJYpw5mjyiK9oP0ZQ4TbJ+Xt7ur4xFgNK+
         1OVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730471765; x=1731076565;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IoXvpMPyv+sDPClN8pjmFGHQt3n9px2NbZdIhR284AQ=;
        b=SfdE2zb/Irmgez/tfgT2ycz/7IRYWuCg5vW7HcD25vlfiHiyD3TX2kfWaBGvU19JBu
         jyXKzLOC6hZr0cfLaHacd8ZzziN2pnNa98i4UEaL57xaMB7Uzmc50kdNJRmeyC7wO7Hi
         CXS3KUpC2DcpKQJyN6tfffG00Fwnf384vQuaczAqJJrcS9At7EYNBwQmQflqA5s5Bjzg
         Bp6DMMR+FzbbpLoKyNJWTRBpeFKrwvCZEu/l9lJEesFnlCN2tI4GqpMYC4+2qy+bh7CL
         coXDPh9Dtu8YW54THBdr071WVrvMKqT24S7Z6qwcRRmCX+UrOpzwax8C+0746jMWTIFF
         f38g==
X-Gm-Message-State: AOJu0YxLjf6fNrz0hDLpmBAVXgrCo1dPxs4X2Y7Gf3sST0ZWBpxNo91Q
	uqchZDTOdRd+OhSlWLJizpgDNMODrpzvALoi4gei8fT7So3BNfSePRHbbIo6WC6oMEbwjTxodoF
	/NT+Csw==
X-Google-Smtp-Source: AGHT+IEu37t9gRqr4EwxWBSZEWMi5G/9ki4gSlSR74wBR5lgdbmk5vzV6I2p+0V8+JbgYip3LNNObA==
X-Received: by 2002:a05:6a20:db0d:b0:1d7:2249:689 with SMTP id adf61e73a8af0-1d9a851ed18mr30293341637.33.1730471764998;
        Fri, 01 Nov 2024 07:36:04 -0700 (PDT)
Received: from localhost ([97.126.177.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e93dac03a8sm3114555a91.30.2024.11.01.07.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 07:36:04 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>, 
 Robert Nelson <robertcnelson@gmail.com>, 
 Colin Foster <colin.foster@in-advantage.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <9002a58daa1b2983f39815b748ee9d2f8dcc4829.1730366936.git.geert+renesas@glider.be>
References: <9002a58daa1b2983f39815b748ee9d2f8dcc4829.1730366936.git.geert+renesas@glider.be>
Subject: Re: [PATCH] ARM: dts: am335x-bone-common: Increase MDIO reset
 deassert delay to 50ms
Message-Id: <173047176427.2845265.16393132183520369094.b4-ty@baylibre.com>
Date: Fri, 01 Nov 2024 07:36:04 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-cb14d


On Thu, 31 Oct 2024 10:29:51 +0100, Geert Uytterhoeven wrote:
> Commit b9bf5612610aa7e3 ("ARM: dts: am335x-bone-common: Increase MDIO
> reset deassert time") already increased the MDIO reset deassert delay
> from 6.5 to 13 ms, but this may still cause Ethernet PHY probe failures:
> 
>     SMSC LAN8710/LAN8720 4a101000.mdio:00: probe with driver SMSC LAN8710/LAN8720 failed with error -5
> 
> On BeagleBone Black Rev. C3, ETH_RESETn is controlled by an open-drain
> AND gate.  It is pulled high by a 10K resistor, and has a 4.7µF
> capacitor to ground, giving an RC time constant of 47ms.  As it takes
> 0.7RC to charge the capacitor above the threshold voltage of a CMOS
> input (VDD/2), the delay should be at least 33ms.  Considering the
> typical tolerance of 20% on capacitors, 40ms would be safer.  Add an
> additional safety margin and settle for 50ms.
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: am335x-bone-common: Increase MDIO reset deassert delay to 50ms
      commit: a74a1ada3651c0ff8a05d0ecb74d84de3930e63a

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


