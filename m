Return-Path: <linux-omap+bounces-2828-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B156A9F3CD0
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2024 22:30:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FFB71884BC2
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2024 21:30:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC881D54CF;
	Mon, 16 Dec 2024 21:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jMMetBhu"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2871D47D9;
	Mon, 16 Dec 2024 21:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734384604; cv=none; b=qPVyO2SD52izJ+IEmqYiKy9+q24rHx1esNkl1ASpuzM8cQV8USRcF8mmiRZZ5LzvMW9bSu+5BoE1bwhBB2qA0tCnss6J5eKLGcV+1cX77QpPsg1ezSJZOxTkpYIOeqe/iT44OBs8WCE2oCq9PGZw/0+drKDl+UiW4HF2dnWdwg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734384604; c=relaxed/simple;
	bh=AW/V8Fu2RuvafAMEbVN2akePITfXrBSk9itJ6Uc81co=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=VTIMu5DQK49x/JVAJ673o7+oAUZxQhv7r7ddJIgn+Kwe1mN2gdOgcGAjwTAiyMiFXXZsCAhz4fH0iG0jiLynYy9xmF6NQWrvBl9isp/hYjWBCRqnUXMFw7QQ73EmwHCs9X4u56lEd9ieOaK5sJeaaUp+6//Cmg5Lz4NTQuQLyDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jMMetBhu; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aadb1so6393941a12.0;
        Mon, 16 Dec 2024 13:30:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734384601; x=1734989401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivXQolInHQKl3ZpWRBcppoPj78t0GchPR0FiUjf5wog=;
        b=jMMetBhu90syelq+kQVOCWCS6KJjigqsizVYO42wtoIVMf+VcaGTXsDLk6rbSytqIG
         VTS8yB59jPdXha8rC9/PX4jbIQ/LrWIJ4Bm6zDhsWTu1AHzU4gkGFAMbe2/j8vlDh+4v
         H8PSEP2EFL9hwagE1WOWqYWdLKSb7ScE78un1hi/94s86kpcSpvo8EM77ormTwjPklGa
         CtBDNmaP0G2zJhOulEwa0ZyI6jr7cWHZxRdvN2cPQmTmlnX0rxm5QcMFUHlGLzicz3ew
         nHE5jKn6V+JaP35w9gUTCp+qTJgMwkdXgL19Qi1OPLY9uUf9+mx9VludEc++Z9b6v/0r
         LLvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734384601; x=1734989401;
        h=content-transfer-encoding:cc:autocrypt:subject:from:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ivXQolInHQKl3ZpWRBcppoPj78t0GchPR0FiUjf5wog=;
        b=YsyAl0YCNgwSGV95zKpk7GbcTGp/Kt63HOSh7zzH3rlvr19a79qxphTJDDlvvRZb9z
         vRhLBZeBs6By0a1cwBcKazrHyjk34gtY7K+tanMcNhK/tZ6TboNUs1jBp/uAApAi61Th
         F9ptZWBRddG1y+AJeG84IJ+PlUsQHcoqhLQ8GztFEHBzG7f2ukD7uIZdlc7bi97n+6dV
         oXPvECh6d1GCOS97a0RkgUKCLeoRHelu0gEdTaX8YomB2S3os+CZv9AmzcQk8NYfGiWm
         V0LQPQqwqgsygLVCiRmD/VunXtEnro0m3l4UBDvUFHLJcp/NbXYz5UTb6MwebQA1Q8H1
         MszA==
X-Forwarded-Encrypted: i=1; AJvYcCW2aNpk8Wqzrcee1P024j9/wVaEJy15JbeFUrvvHgJg9KhWFX6j1Gpkc9oc22ZMP8555sNJd/8c@vger.kernel.org, AJvYcCX5TZD014KseMzVjhH6lu1ENBMf5ZP+KTvJtrX66FiagQrN5J+ul0eZzaiof9ubh1jmwXRiFA0bL55T@vger.kernel.org
X-Gm-Message-State: AOJu0YzrbW9V+9JRY0YtVm59j5v+jcyVcHgaHxW9Ogmz6hEwuuKbOSk5
	Swd4PWnfRbOJXcx96+ZiT2tsiFGBJUzhPfuEc5sJrFKtiLCPvgpO
X-Gm-Gg: ASbGnctR4cY7DTYQFsRl/eaPEOJ0JtfTAhDUftoJ1ld3CLN+g9DsvSDGvhTUcM5qqEI
	jIbBtENEsd9Entm48+2jGIZMbzw4X88RrxYzW9jzCzPmMTOqZ8NhqsCnORfoOkE6luoyTnFJGSQ
	IPwnyY5dSUEPbm6Zi1Po/lTPnmNzD2ZUULUUcUhNTVdLNI1m2YVAMkSSc9nGW8f3h+ftLyw1L6z
	tnOykqGTQVP3cpFYV/FzYrddgjLXkcgyZKO4lA0SfU2Evw8KPAJEYwa8d5VGPQRU5GpJX2oRMss
	beUGiZpGX8c15124jqhRqA07GLhqKoww7CFp4mCezO8xFckUKhzm8PsKM/nkvFSPdCm7xHD2Z/R
	WvbCyLxMNDQf98zRh3n2SGLosM5xON77FIA/DUyGGNw2i3b9J
X-Google-Smtp-Source: AGHT+IEUDMnroSpQzNcT0mWkL6KBmeFgV7KzoBApJQY/Nd4YZdJan3a/08FQxsl6dnyfiRQfWUZbkA==
X-Received: by 2002:a05:6402:2787:b0:5d3:d4cf:fea0 with SMTP id 4fb4d7f45d1cf-5d63c3b171amr11932184a12.21.1734384600986;
        Mon, 16 Dec 2024 13:30:00 -0800 (PST)
Received: from ?IPV6:2a02:3100:a874:3500:f430:df67:6714:d87b? (dynamic-2a02-3100-a874-3500-f430-df67-6714-d87b.310.pool.telefonica.de. [2a02:3100:a874:3500:f430:df67:6714:d87b])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5d652ae123fsm3592615a12.49.2024.12.16.13.29.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 13:29:59 -0800 (PST)
Message-ID: <5139374e-7151-4d0d-8ba9-9ec3d9b52f67@gmail.com>
Date: Mon, 16 Dec 2024 22:29:58 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 0/3] net: add and use phy_disable_eee
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Cc: linux-omap@vger.kernel.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If a MAC driver doesn't support EEE, then the PHY shouldn't advertise it.
Add phy_disable_eee() for this purpose, and use it in cpsw driver.

Heiner Kallweit (3):
  net: phy: add phy_disable_eee
  net: ethernet: ti: cpsw: disable PHY EEE advertisement
  ARM: dts: ti/omap: remove eee-broken properties

 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi     |  2 --
 .../arm/boot/dts/ti/omap/am335x-myirtech-myd.dts |  1 -
 .../arm/boot/dts/ti/omap/am5729-beagleboneai.dts |  2 --
 drivers/net/ethernet/ti/cpsw.c                   |  3 ++-
 drivers/net/ethernet/ti/cpsw_ethtool.c           | 12 ------------
 drivers/net/ethernet/ti/cpsw_new.c               |  3 ++-
 drivers/net/ethernet/ti/cpsw_priv.h              |  1 -
 drivers/net/phy/phy_device.c                     | 16 ++++++++++++++++
 include/linux/phy.h                              |  1 +
 9 files changed, 21 insertions(+), 20 deletions(-)

-- 
2.47.1


