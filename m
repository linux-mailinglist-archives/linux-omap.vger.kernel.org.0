Return-Path: <linux-omap+bounces-3268-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2ADA29DEA
	for <lists+linux-omap@lfdr.de>; Thu,  6 Feb 2025 01:37:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFDB91888DCF
	for <lists+linux-omap@lfdr.de>; Thu,  6 Feb 2025 00:37:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA2961EB2A;
	Thu,  6 Feb 2025 00:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PMVMFhuI"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA53D531
	for <linux-omap@vger.kernel.org>; Thu,  6 Feb 2025 00:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738802234; cv=none; b=iOLi9ZXKwRKp04fKgiX7cycqLpipexNb1WWXUujrxor7MYtu8xrHRwLiQcGkKmiHNzf85hekfn50LBYwHNOF/F03v52SK6wjlVDRFtDECNrDlA4WGt8rwMGQHwpXN1BY4b2z4lA1bpep+IrSse9dOWxLp2psH6bQ+irZexCMTPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738802234; c=relaxed/simple;
	bh=5Z4xMKpZQ3lBAbdfQ2sL0DdNJuiXEH98wodMhJutk1U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qyBXNyGSxX+BCXeDq4IxNk6NHBj0CgPHUlbo2DVdJNX4P6BKvkvfjh1NxgqIdnooMT884cMPQVL61NnWOxMmwvbk063OwX19s6Le6mPuaVZgy9ACgPr4ZysOfk9tafsb1EbLf9Ce3wXIseRY0T57oiAIXcydwjoCJYlcIOpRMfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PMVMFhuI; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21f1d4111d4so5921175ad.0
        for <linux-omap@vger.kernel.org>; Wed, 05 Feb 2025 16:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738802232; x=1739407032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Mf9gALaToI+NxAqQsASvA6CATgLa2Ir66Qnk8eDUTg=;
        b=PMVMFhuIU97J3ZIggnkETkyzyh1Fv57cJhMdbq5seCOs9qhNfAjcDZHH+bkK3e3Q2v
         bWim9nc6WUIusWSq+leg94IgP7fM7jq1uvUz2L4l1RMdqVhkYABIYDMudInUrRGI1ruq
         rdwKaFAvXcQ7afQsCxq0RZL5bj5DMnbRjE+4iPZSBUNkb7wat/o3F/ZTvlOPLm6hkTg8
         fFQawJamKsk9v3OegHkb85FYTB5cwjPZJ/9FCvvFfh4tdHTEIAISkETNWdaXEY/r+sOm
         6yCc+18jzm/w0GQNOx9FLWL+yG1ygF/sL6DMm4DXuo9aHtJfnN5qZQ5rmhPZv+iPM0oW
         iPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738802232; x=1739407032;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Mf9gALaToI+NxAqQsASvA6CATgLa2Ir66Qnk8eDUTg=;
        b=hvemwvcGhq8Gk44RZUF3+puG5RL0U3NWruRyU3qkn1oEXZqMaqZpZ4F+pkrIsxmhs9
         6iawpHElrhvU0M3XXr4vtww9eDsjU0BLWS/OKkcnme7+wHZlAiKINCZeSjOaDM+KxUMz
         xKgGVb0PDlXcIeQj45E0ZaBSn51ZL67Sum0uHSj1jYOavO+bQr8zFFKKFV8XehBIrN/G
         EHkozHeLly3qqezAd1TpcCmUhW6ZTssXGULUNW+1qDkg1rw5AsOirzz88GZt4WZfEkn8
         4S5ogOVKvgDNX88qSqN33aGiNv9bI2Nl07pMdaXkgvk9VQ3qE3ara1thnTQPaK3mcEy3
         twoA==
X-Forwarded-Encrypted: i=1; AJvYcCV2TN7MNtZ+b+nyJpVj9YwmAhgxuYzRmRh64AAuGEZ6ymovrbD41bbYnOcjqQzdPe0csg1l5rtKqyGi@vger.kernel.org
X-Gm-Message-State: AOJu0YxfqgfYhH9ERYttetXLxhMnYa1BhHtBDPfg19xHsyAhR4PmTm9y
	iGbG7gfUAm6ihbIoWJIm9jsC3/8qoM3jrEQz+o/ePboAiH4uFxRQPRZ2l1d5auCkGoKb4yrLz7l
	I
X-Gm-Gg: ASbGncv2V91u29gob+DGtaA5YEBCHzDZxK51jkQf4ICn+/FYVL17ZHQMbi1HJwwgxiI
	ERXZyuIoYlauZXECXVaq2yAVKF1dE3z2I4gWduVCouqK4ufG5TzdTb73fTJjZG+cjhTgUjwb504
	kcB3PGAnT/ECmjbNy+FoLA1B6vy8HKmS2/aQh/SGZJ5Zy/NpQwUl767UrFQO1hw/mspPdC4tG6k
	Vv7kAZ+uEwmShmBfBSuR0iWP01GILyEE0ExiptlcZdcSreGhSxsBt9n7C3+WCMzZ1QXjKNzO6cU
	whDvZVdqt9HsPQ==
X-Google-Smtp-Source: AGHT+IEB+PtnOUiRYqtGHWqMCkWeS4QmJz+ymWa/TmAkHEsEUp3fEiBQDPHMWYpJX0ZEQ4SEeQ7CWQ==
X-Received: by 2002:a17:902:d581:b0:21a:5501:938 with SMTP id d9443c01a7336-21f17ee3df7mr79414935ad.52.1738802231724;
        Wed, 05 Feb 2025 16:37:11 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653ca1csm107735ad.58.2025.02.05.16.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 16:37:11 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-kernel@vger.kernel.org, Tom Rini <trini@konsulko.com>
Cc: Nishanth Menon <nm@ti.com>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20250121200749.4131923-1-trini@konsulko.com>
References: <20250121200749.4131923-1-trini@konsulko.com>
Subject: Re: [PATCH] ARM: dts: omap4-panda-a4: Add missing model and
 compatible properties
Message-Id: <173880223103.2488567.7048498989184670189.b4-ty@baylibre.com>
Date: Wed, 05 Feb 2025 16:37:11 -0800
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79


On Tue, 21 Jan 2025 14:07:49 -0600, Tom Rini wrote:
> When moving the model and compatible properties out of the common
> Pandaboard files and in to the specific boards, the omap4-panda-a4
> file wasn't updated as well and so has lacked a model and compatible
> entry ever since.
> 
> 

Applied, thanks!

[1/1] ARM: dts: omap4-panda-a4: Add missing model and compatible properties
      commit: ea07a4775df03852c353514b5b7646a17bd425be

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


