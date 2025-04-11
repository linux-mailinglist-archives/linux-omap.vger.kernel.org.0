Return-Path: <linux-omap+bounces-3579-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE6DA850BD
	for <lists+linux-omap@lfdr.de>; Fri, 11 Apr 2025 02:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AF801BA51BC
	for <lists+linux-omap@lfdr.de>; Fri, 11 Apr 2025 00:44:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99E1235BE1;
	Fri, 11 Apr 2025 00:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nOoXGtMI"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31B123372A
	for <linux-omap@vger.kernel.org>; Fri, 11 Apr 2025 00:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744332275; cv=none; b=i+G076JpzrYnPFxP3pM+/oo4eAWxFVqDMrXKMho0K4QWHl/ba9bTWvfS54AVPkWlNfmxzLQZUbWBdbQhUouNbgkU5cz8LSQ3YAqgT2q6TRfsrIErben6km+SSZP7KcMOg9m/qnD9JkuEM2fn6GXsouWP7FRuIliF9QIKRZzygf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744332275; c=relaxed/simple;
	bh=1ZEPH7TmFUPnTJrhe0atIMbdcdbraXRklkxsYKwkU/s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fcNjLmBuW+SlVsf4XS5v+uqnlBtxtN3R4cikJaBGPvkBYNuo2H2qJYQJNgiTNUDwZdjVhrSDgJ17EHZuG7uMFZx9925Lx5F3HmsGugeTcCg9Ys6UI3+EO7zf22bnTYUePAPM6IO7sW5m/OqxCx9YdduPbbz0MHHsExZSuRSAtDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nOoXGtMI; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30155bbbed9so1173298a91.1
        for <linux-omap@vger.kernel.org>; Thu, 10 Apr 2025 17:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744332273; x=1744937073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vsdZTMwIykwxFZW7XdBDDBQTHYKFUKUO10UneP5f6Co=;
        b=nOoXGtMIFe6EhxQrTSlvKfccPlUzmFf130pwUKHAYPfwouDrIO4/ZLXFsFz6W7/jnn
         ERqXrmA1IZ5eagU7uMdH3/1ILpEF6xci/B4m644AOLov23Z3lBzsKZEJddySyEQFJxMX
         baGMCgNzTSkLcm0luawYBqd30kj/dCQ2gl1L4wMn59zFn8Prt+Tvy6G9csn2ZZS7Oumn
         FAM/irLz6SRHY/QAFqrbPz8Z5Vx7Kahxx2MnUR2dZ9+GpZRU3zSkTVT0Pml83KMJPyw+
         QX+z2D+k5iNMNl3sGMUZFdZECWdlpdbWzK9lLdHou4bcoUm9Cks9F51hvGdeK8uA7DKv
         XiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744332273; x=1744937073;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsdZTMwIykwxFZW7XdBDDBQTHYKFUKUO10UneP5f6Co=;
        b=ro7SWNweBcIw5icL7S0rGrYrm/Dxe5PG8NlXwZqLBpf/enhugri9LAnHmv/7uuI9Xd
         huIpCoBRlX912j4un8BcDvMeM3JelUalfmRSpwwod9IkwnhsqekRNaY2zMWxYRAzXdFe
         CkQXBxJgBJYJcDqcrtuLsNx2b3KjnS6jgN3DenFYB7mRR+RExk+g6cv15taX0HB4UQAs
         wIvX1Zs2FNDWuqd+7yAm9yZDllwJTElM3UTRk9tfa1qs+rDnkygLt3JfWdriYS7YU1PM
         RYaW7Zv4DqxjXG7ny8ZvdyoKOIDKRvNBuEnHGv+8pvTCXN+0gVaiVveLHkbFR5ApcgYG
         Eymw==
X-Forwarded-Encrypted: i=1; AJvYcCVMo9nU+JzRwfCJF34iYG51VCEK8Pw/eQcWwS2f56wYIiSdT2KbN9RY5bHhkJFLMC0WKH/7taHEmdT7@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn3wsdvX4/9ghmPn1sGbVK6jRUXo/dGgG7p4bTsFq/A4FVo65P
	qdw02zYGaE/fQTMeROCInnJYskBsNc5WWbK26UMKt50s/6Uiy8Fn80NRozrWULI=
X-Gm-Gg: ASbGncsv7KdkgObLuYQuzDWiXpfTJ8x1aDFphihxlywgGppRh1mVmLmanv6H9sNWZYZ
	lDzbooopG5rjbNS2vkVOv01plINva6nWEwCVWRAbSjbEtrv8CHdfFB5ReWxQMOoYObKXLIrDJld
	NFtNfDBJ131UdXLh+Otbhnhvx+RurJyT2MuQ/dAW7DewNnSQ1mZYjpoVUNwnZIGHVEafYDiDnsW
	Dy3cRHgIcdoNo7FYVF8SdwHp/rLXLV/jnSkGtoeohrwRodEG80Hc4mW5nn2Skm6mdb9h4pi1usA
	lLC/WEvD1Nr1oLjrdUwdb4sDCP5UIB+DiA5oIgY=
X-Google-Smtp-Source: AGHT+IGkKIOCVVDwPQC40Jos5ojyeCmRImM+y0qVGUmSsNBURG1P7WKROT7Lbtkb6eCO6oUjraoobA==
X-Received: by 2002:a17:90b:2752:b0:2ff:5e4e:861 with SMTP id 98e67ed59e1d1-308237b52c1mr1313845a91.24.1744332273039;
        Thu, 10 Apr 2025 17:44:33 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e996sm4406937a91.20.2025.04.10.17.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 17:44:32 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: khilman@kernel.org, aaro.koskinen@iki.fi, rogerq@kernel.org, 
 tony@atomide.com, linux@armlinux.org.uk, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sre@kernel.org, Andreas Kemnade <andreas@kemnade.info>
Cc: stable@vger.kernel.org
In-Reply-To: <20250331144439.769697-1-andreas@kemnade.info>
References: <20250331144439.769697-1-andreas@kemnade.info>
Subject: Re: [PATCH] ARM: omap: pmic-cpcap: do not mess around without
 CPCAP or OMAP4
Message-Id: <174433227218.2416322.15261895858877666275.b4-ty@baylibre.com>
Date: Thu, 10 Apr 2025 17:44:32 -0700
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79


On Mon, 31 Mar 2025 16:44:39 +0200, Andreas Kemnade wrote:
> The late init call just writes to omap4 registers as soon as
> CONFIG_MFD_CPCAP is enabled without checking whether the
> cpcap driver is actually there or the SoC is indeed an
> OMAP4.
> Rather do these things only with the right device combination.
> 
> Fixes booting the BT200 with said configuration enabled and non-factory
> X-Loader and probably also some surprising behavior on other devices.
> 
> [...]

Applied, thanks!

[1/1] ARM: omap: pmic-cpcap: do not mess around without CPCAP or OMAP4
      commit: 7397daf1029d5bfd3415ec8622f5179603d5702d

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


