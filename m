Return-Path: <linux-omap+bounces-2819-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AB29F1274
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2024 17:45:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBA202838E8
	for <lists+linux-omap@lfdr.de>; Fri, 13 Dec 2024 16:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A97251E4106;
	Fri, 13 Dec 2024 16:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="y+901lgb"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC7E1E32A2
	for <linux-omap@vger.kernel.org>; Fri, 13 Dec 2024 16:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734108308; cv=none; b=OYnbBLlqv1GBBCfNo86IXDsSRz6lmGBfFMZT5gEyijEXhnKkEdfMST5vjcGzblrHtIZERsmhEXfY+ejZ93t7TeCbJD4ZjEDFYKe3fVRp49iucp8InNAxdy5WTx/VDuAr+VPUaP2Hb6FNRNN9fTmwzeVKa0ljZucRF+bbI4XR53A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734108308; c=relaxed/simple;
	bh=T/GytS+4PmeDHSc8Yokbu88dnVT2T9R2mcNeRjKO2XE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EJtGGhPV8i7SED0+GADH8ulBuYVrXKjnWckWEMI9sUNN6CdwGwE7oSCsoXVeITurQiuBKaAsqHuzhUYL7v8vWysyFmprOQQHyRlwrBejADApnaZGtU5n4Ic9VjRmKRRUY7mNtqjQlBwaR40dMFePndYLRNe7gSqkHwNpQNrSr50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=y+901lgb; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21683192bf9so19917125ad.3
        for <linux-omap@vger.kernel.org>; Fri, 13 Dec 2024 08:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734108304; x=1734713104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qj059QNAy2kL/ZdSBcjvPNmyNAKgw00EKL6UseZCU10=;
        b=y+901lgb5DHirR39aO7fApA0QGWWCrOo8H8j6VM9MMpuHAjy/4j3jyZpzc2gr0ab9m
         h5Nl97z23MjomrSGidluvszuPpfpcgXQY+u60zZiWxOq0H3AFv/B45+9JHcPIHJe4+fQ
         cBM4xqFxAHO/S3vYWIrJXtEMdsH1kaRWKZIQ5colXqFH1aQWu/J8pyY25Mbl+iXFAZ4z
         ZT1no3zxGuhmCWIE4lQxOA4VH8Sp8P9cI3Xvzwg7zYVhh5sFlDU9IoIxjFZjjcyqEg/e
         MvTFrngDECyWUjTzsH1vYhxz0wmFqtSemMw3diyryBessbnlK41aFerY/DshDiYSrwQO
         2PMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734108304; x=1734713104;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qj059QNAy2kL/ZdSBcjvPNmyNAKgw00EKL6UseZCU10=;
        b=vLXgkcr6qH57TiGfda59OxVomUpJ1OL28K5TYlQ2qBH9FiUM6f0o8udXee7ziLbx3N
         GIw+1lor+BPfc3d1vTEtOKWqM/7m4pOEqv94qWtHs60Y7JOtnHDBixsX0OypKq3oKkEa
         fq7qUvuBEqRZ06WxQ2ExqjKS69fNytJjHDzNFCgq0AhtTn7naqOQU8sw9vN3+4ItbZeb
         xXf/09sBUgFnBke2v9221WQrEF/2KG00AF4iaZtp6WeK0qLbHgFqNNECTonKHZ92ePp+
         Eb8GMRff6PEDrOovy/AtV9r4x8NLC0sJQ7M7ec7DL9QVihv5EVUfTZYID2Y7W0mAoVa8
         l5+g==
X-Gm-Message-State: AOJu0Yy2A3QkDKehoZYi48x56yACGnUsTIdQ5rOAx/94yKYEJkn2euHq
	JA8jGMLz+uuYG8F355Tn2Xe7uG73I7SNXkAzZMcAvuOlEJU5NcS6x1Pz50IPYDs=
X-Gm-Gg: ASbGncs9SmLsjMJ2YZXC4VfDxCC0jzlnRzXcHbhual2l/6XP/Ekw0KFpNPDGHjT4HWi
	7ujIVRxn1lwZhVfRDZelihkbHDsRamZF8HrO+ZAiZr2IJQYcDHDEo68xxMhapYV51075lwpunlQ
	ti4z6aZbHzjV2Fl/hyukmpcqy3aZLgryFfvaMHCSFM8HFkOO0+P9VGiigcFj2DK25MFv9a3qH16
	llnPN0X7/ct/rGXor4gyoRHkxDTrz39hMquE7fXu9zqiUcfYMVcQy8=
X-Google-Smtp-Source: AGHT+IGnLdKdpE/QYD952czjZlkXlMjWgso2ZS4RMAZDJZtkXDd4A3mxRp2mElniWLwu/q4tdGMNaQ==
X-Received: by 2002:a17:903:2445:b0:216:5e6e:68ae with SMTP id d9443c01a7336-21892a028a8mr48630185ad.31.1734108303961;
        Fri, 13 Dec 2024 08:45:03 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21653b0d4f5sm85404995ad.70.2024.12.13.08.45.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 08:45:03 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: rogerq@kernel.org, tony@atomide.com, krzk@kernel.org, linux@treblig.org
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241211214227.107980-1-linux@treblig.org>
References: <20241211214227.107980-1-linux@treblig.org>
Subject: Re: [PATCH v2] memory: omap-gpmc: deadcode a pair of functions
Message-Id: <173410830317.3067997.3764368773601763146.b4-ty@baylibre.com>
Date: Fri, 13 Dec 2024 08:45:03 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-355e8


On Wed, 11 Dec 2024 21:42:27 +0000, linux@treblig.org wrote:
> gpmc_get_client_irq() last use was removed by
> commit ac28e47ccc3f ("ARM: OMAP2+: Remove legacy gpmc-nand.c")
> 
> gpmc_ticks_to_ns() last use was removed by
> commit 2514830b8b8c ("ARM: OMAP2+: Remove gpmc-onenand")
> 
> Remove them.
> 
> [...]

Applied, thanks!

[1/1] memory: omap-gpmc: deadcode a pair of functions
      commit: 56d96fc5539003a95b8ab631a4ebb5d1b0a24885

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


