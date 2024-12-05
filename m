Return-Path: <linux-omap+bounces-2787-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 056089E6119
	for <lists+linux-omap@lfdr.de>; Fri,  6 Dec 2024 00:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1A0518856EA
	for <lists+linux-omap@lfdr.de>; Thu,  5 Dec 2024 23:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE59C1DD872;
	Thu,  5 Dec 2024 23:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="u0Eem8cN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9FE1CD210
	for <linux-omap@vger.kernel.org>; Thu,  5 Dec 2024 23:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733440026; cv=none; b=DioAO4LFRkOrOmHnmqbFz7iMFolfJRQpf1oKiQrQRa5SyTYJaU8hl9V/GmguQEymcRB9Zy//PvWtdH64Vip/jp6j0n9fERYMLfgex5UvQqoh4rKHL01TBKMFgSqfDdZSeZxyx/YgKE7GFceZ/eMpc+O+JnMYbhJ1dPbreGusrRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733440026; c=relaxed/simple;
	bh=CCO50Zue0Xdj/fk+qKD58FhQn3S/oqKwUZ1sNgA60vw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=J9nARnoXJ3QI8a6OMukJIRBau4LK1hrMCtzEWtqVMw8MM7FS9NPOnYb83yI/js7mH5mNaN7F9lm1rHO8Vu3EwFE5Omnw4NdoxRdSRq+lQjebAjqz5eTtOhsapwndlAwG6szZhUUxLemU7Q1afRjPM8otakvB2z+jEQTsdAH1+Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=u0Eem8cN; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7252b7326f4so1283517b3a.2
        for <linux-omap@vger.kernel.org>; Thu, 05 Dec 2024 15:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733440024; x=1734044824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHr0wvrqV9j93xPxdFahGVGm+ykMuChm+8HToI4FbxQ=;
        b=u0Eem8cNfp+rCylX4VakoxayCb9KQX4oJ2bsZahWkA8MhpShPSb524Rgiz3Q7SbZnM
         GDNk2HtXQjnH7/LYh6w/6HQCaCOxI2pLcFpRdQVrS5bpT6+zRVcf5zJAAAt/alypz+ac
         mHCxRDRfiEfZMhp9z2QCyBvzB5RxQpQm6tSVskWOr1VweJHLq7gsenMrAbfZ3j5a3mIp
         gXq4sgKREkvSisXdD0UNM+DFVzWU9nJ5JlPtMNj88GBOV/NAlxPsEIc7hLHOdt0jhvsn
         qsAO7NOQr1DR6x2l2zsRqECumpOfR2XmfdbtPoonTgFhhhROevhdsaRLQ7FTJ0B00IvV
         BMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733440024; x=1734044824;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHr0wvrqV9j93xPxdFahGVGm+ykMuChm+8HToI4FbxQ=;
        b=BdnjfdlZcOSw5iiCgi6pOlegjYodGZauRCJn8RHHIvzr7s9wORKPBJY0SMTTkEKl+t
         6h6UFNTRwyDMLFvVKX3D9nfXZ7lLSUzfv3s6whf+K8mDJGzLZQC2A1omAFNMw/FuWmXx
         ZSUkdQl2bdHq6GtLjjp1MzjfDY01ls9y1vFeQVGWudrEoGMr/Xn3iPVYFaWnZ5bXoj2W
         G2Bp7np5X88TXG/wBoTw7ZeL6fpyRISX61Tj/NEkq4DTdqIe3yjjCfaJo8mRURpr0ej/
         0Ajk/BOSvI5VvdCQ472WGlOypjTR1/a9FiXBVjo4sCwoeXwcbCqdahr6uJBtbday0Bdo
         oXZg==
X-Forwarded-Encrypted: i=1; AJvYcCUipqrWHSP3JiZY6NroUC9FKrbfPvjii8xXBYfFKb5JgiCw0QE6cUp1vuyCmsoIAxNyz2KLO6NTKOvc@vger.kernel.org
X-Gm-Message-State: AOJu0YxIrhkqC+N0omIBtpRfsk4rS8QP6AWeTFj91NdIsLEcn8cRLG6j
	La9v2P6UoIDJyYnr9DB8t/Dw4VUXrgzPoWjkUGSUNaUt9BzN8Li8jQeGkTiC7SE=
X-Gm-Gg: ASbGncvEMMDsUUDZMmYXUdsNv7CXNAoqzABuwp/CeMvdThUMYoyOJvJoNszdasjxmV+
	0WE8gBen8KCL4u34UQ8q+gKBZCG/ZM151HBBRlG3tZEbzk2QEmz5GcIbdoBLJN5PtN7Ne8CCOav
	nLF6omD6VikM/U9TFblx4TMhyNd58slb0Y6G7yVO09NuFUA6TwyoxsMFMRIZzif/qBr9uLhaKj9
	DEZUxKssIZ211BDPAZpHWVS6nYvd3iChbLLikgS30C6SN11
X-Google-Smtp-Source: AGHT+IFa/tMdzlYgmSpyyWIuzMHOlTyyH5aaxdzqWaBNMPhD6FY5xDPdWjyhOGetFe7TxDwBl+cLKA==
X-Received: by 2002:a17:90b:4f46:b0:2ee:eb5b:6e06 with SMTP id 98e67ed59e1d1-2ef6aaf3a46mr1402911a91.36.1733440024409;
        Thu, 05 Dec 2024 15:07:04 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45f7eaf8sm1937864a91.11.2024.12.05.15.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 15:07:03 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: tony@atomide.com, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, hns@goldelico.com, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 aaro.koskinen@iki.fi, rogerq@kernel.org, 
 Andreas Kemnade <andreas@kemnade.info>
Cc: stable@vger.kernel.org
In-Reply-To: <20241204174152.2360431-1-andreas@kemnade.info>
References: <20241204174152.2360431-1-andreas@kemnade.info>
Subject: Re: [PATCH v3] ARM: dts: ti/omap: gta04: fix pm issues caused by
 spi module
Message-Id: <173344002345.407600.12027474109362942288.b4-ty@baylibre.com>
Date: Thu, 05 Dec 2024 15:07:03 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cb14d


On Wed, 04 Dec 2024 18:41:52 +0100, Andreas Kemnade wrote:
> Despite CM_IDLEST1_CORE and CM_FCLKEN1_CORE behaving normal,
> disabling SPI leads to messages like when suspending:
> Powerdomain (core_pwrdm) didn't enter target state 0
> and according to /sys/kernel/debug/pm_debug/count off state is not
> entered. That was not connected to SPI during the discussion
> of disabling SPI. See:
> https://lore.kernel.org/linux-omap/20230122100852.32ae082c@aktux/
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: ti/omap: gta04: fix pm issues caused by spi module
      commit: 93dadbfbd19fa45405e7ef04014c100b4f7a94ca

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


